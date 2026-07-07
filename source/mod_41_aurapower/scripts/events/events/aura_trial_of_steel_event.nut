// =====================================================================
//  The Trial of Steel (v1.15.0 redesign)
//
//  Trial fires from the world-event lottery when at least one roster
//  brother is eligible. Eligibility = level >= tier gate, not on
//  cooldown, not currently postponed, not rejected at this tier.
//
//  The player picks one of three options:
//    1. Attempt - rolls vs success%, success promotes the tier, failure
//       applies tier-appropriate sickness + injury + debuffs and sets a
//       per-brother cooldown.
//    2. Postpone - delays by PostponeDelayDays and adds +PostponeBonus
//       per stack (cap PostponeBonusMax) to the next success roll.
//    3. Reject - skips this tier entirely; next chance opens at the
//       gate of the tier above.
//
//  Success / failure flavour text uses three special variants per user
//  spec (Dormant fail T4, Sovereign fail T4, Chosen success T4); every
//  other case uses default lines.
// =====================================================================
this.aura_trial_of_steel_event <- ::inherit("scripts/events/event", {
	m = {
		Target = null,
		TargetTier = 0,
		LastSuccess = false,
		LastRoll = 0,
		LastChance = 0,
		// Eligible brothers drawn for THIS trial (user feedback item 2).
		// Drawn without replacement in onUpdateScore. When len > 1 the
		// player picks one on the "Candidates" screen; len == 1 goes
		// straight to Intro on the single default Target.
		Candidates = []
	},
	function create()
	{
		this.m.ID = "event.aura_trial_of_steel";
		this.m.Title = "The Trial of Steel";

		// World-event lottery cooldown (separate from per-brother trial
		// cooldown set on failure). Defensive read because Tunables may
		// not be fully wired yet at event-instantiation time.
		local cdDays = 14.0;
		try
		{
			if ("AuraPower" in ::getroottable() && ::AuraPower.Tunables != null)
			{
				cdDays = ::AuraPower.Tunables.TrialCooldownDays.tofloat();
				if (::AuraPower.Tunables.TestMode) cdDays = 1.0;
			}
		}
		catch (e) {}
		local secondsPerDay = 7200;
		try { secondsPerDay = this.World.getTime().SecondsPerDay; } catch (e) {}
		this.m.Cooldown = cdDays * secondsPerDay;

		// ===== Screen: Candidates - pick which brother attempts =====
		// CLOSURE-CAPTURE SAFETY: Squirrel closures created inside a loop do
		// NOT reliably capture a per-iteration brother/index (the mod has been
		// bitten by this before - every option would point at the last one).
		// So the per-candidate options are HARDCODED by index here: slot 0's
		// getResult reads m.Candidates[0], slot 1 reads [1], slot 2 reads [2].
		// No loop variable is ever captured. start() simply rebuilds
		// this.Options from this fixed set, sized to the real candidate count,
		// then appends the static "leave" option.
		this.m.Screens.push({
			ID = "Candidates",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			// Filled in start(). The hardcoded-by-index option tables live in
			// start() as locals so each getResult closes over a literal index.
			Options = [],
			function start( _event )
			{
				local cands = _event.m.Candidates;

				this.Characters = [];
				foreach (bro in cands)
					this.Characters.push(bro.getImagePath());

				// Build one descriptive line per candidate. Potential is
				// deliberately HIDDEN here - it is revealed only on the Intro
				// screen once a brother is chosen.
				local lines = "";
				foreach (bro in cands)
				{
					local tier = ::AuraPower.getNextTrialTier(bro);
					local chance = ::AuraPower.getTrialSuccessChance(bro, tier);
					local bonus = ::AuraPower.getPostponeBonus(bro);
					lines += "\n[color=#a99777]" + bro.getName() + "[/color] - "
						+ "trial for " + ::AuraPower.getTierName(tier)
						+ ", success [color=#1e468f]" + chance + "%[/color]";
					if (bonus > 0)
						lines += " (includes [color=#1e468f]+" + bonus + "%[/color] postponement bonus)";
				}

				this.Text = "More than one of your number stands at the threshold of the Trial of Steel tonight. Only one may sit the long night now. The rest must wait for their own time.\n"
					+ lines
					+ "\n\nWho will face the trial?";

				// Hardcoded-by-index option tables. Each getResult reads a
				// LITERAL index off m.Candidates - never a captured loop var.
				local pick0 = {
					Text = (cands.len() > 0 ? "Send " + cands[0].getName() + " to the trial." : ""),
					function getResult( _event )
					{
						_event.m.Target = _event.m.Candidates[0];
						_event.m.TargetTier = ::AuraPower.getNextTrialTier(_event.m.Candidates[0]);
						return "Intro";
					}
				};
				local pick1 = {
					Text = (cands.len() > 1 ? "Send " + cands[1].getName() + " to the trial." : ""),
					function getResult( _event )
					{
						_event.m.Target = _event.m.Candidates[1];
						_event.m.TargetTier = ::AuraPower.getNextTrialTier(_event.m.Candidates[1]);
						return "Intro";
					}
				};
				local pick2 = {
					Text = (cands.len() > 2 ? "Send " + cands[2].getName() + " to the trial." : ""),
					function getResult( _event )
					{
						_event.m.Target = _event.m.Candidates[2];
						_event.m.TargetTier = ::AuraPower.getNextTrialTier(_event.m.Candidates[2]);
						return "Intro";
					}
				};
				// Close the event with NO side effect - no cooldown, no
				// postpone, no bonus. The trial simply does not happen tonight.
				local leave = {
					Text = "Leave them to their own time.",
					function getResult( _event )
					{
						return 0;
					}
				};

				// Rebuild this.Options sized to the real candidate count.
				local opts = [];
				if (cands.len() > 0) opts.push(pick0);
				if (cands.len() > 1) opts.push(pick1);
				if (cands.len() > 2) opts.push(pick2);
				opts.push(leave);
				this.Options = opts;
			}
		});

		// ===== Screen: Intro - the 3-option choice =====
		this.m.Screens.push({
			ID = "Intro",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Attempt the trial.",
					function getResult( _event )
					{
						local bro = _event.m.Target;
						local tier = _event.m.TargetTier;

						// Trial Record: count this attempt. attempted is only
						// ever incremented here (the one place a trial is
						// actually attempted), so attempted >= failed always
						// holds. Stored as flag "aura_proof_trials_attempted".
						::AuraPower.incProof(bro, "trials_attempted");

						local chance = ::AuraPower.getTrialSuccessChance(bro, tier);
						local roll = ::Math.rand(1, 100);
						local success = roll <= chance;
						if (::AuraPower.Tunables.TestMode) success = true;

						_event.m.LastChance = chance;
						_event.m.LastRoll   = roll;
						_event.m.LastSuccess = success;

						::logInfo("Aura Power Trial: " + bro.getName()
							+ " attempted Tier " + tier
							+ " (potential=" + ::AuraPower.getPotentialName(::AuraPower.getPotentialV2(bro))
							+ ", chance=" + chance + "%, rolled " + roll
							+ ") -> " + (success ? "SUCCESS" : "FAILURE"));

						return success ? "ResSuccess" : "ResFailure";
					}
				},
				{
					Text = "Postpone for now.",
					function getResult( _event )
					{
						local bro = _event.m.Target;
						::AuraPower.applyTrialPostpone(bro);
						local bonus = ::AuraPower.getPostponeBonus(bro);
						::logInfo("Aura Power Trial: " + bro.getName()
							+ " postponed - bonus now +" + bonus + "%, "
							+ "next attempt in " + ::AuraPower.Tunables.PostponeDelayDays + " day(s).");
						return 0;
					}
				},
				{
					Text = "Reject the trial entirely.",
					function getResult( _event )
					{
						local bro = _event.m.Target;
						local tier = _event.m.TargetTier;
						::AuraPower.applyTrialReject(bro, tier);
						::logInfo("Aura Power Trial: " + bro.getName()
							+ " rejected the " + ::AuraPower.getTierName(tier)
							+ " trial - skipped until the next tier gate.");
						return 0;
					}
				}
			],
			function start( _event )
			{
				local bro = _event.m.Target;
				local tier = _event.m.TargetTier;
				local pot = ::AuraPower.getPotentialV2(bro);
				local chance = ::AuraPower.getTrialSuccessChance(bro, tier);
				local bonus = ::AuraPower.getPostponeBonus(bro);

				this.Characters = [bro.getImagePath()];

				local intro;
				if (tier == ::AuraPower.Tier.Awakening)
					intro = "Lately %broname% has felt something they cannot name - a pressure behind the ribs, a warmth that stirs when blood runs hot and the ground is slick with it. It is not pain. It is not courage. The old hands around the fire call it the Trial of Steel: sit through a long night and reach inward, and either something answers... or nothing does. The choice rests with %broname% now.";
				else if (tier == ::AuraPower.Tier.Warrior)
					intro = "%broname% has paid in full. Brothers buried, wounds healed crooked, seasons of cold ground and worse food. Through all of it the aura kindled at the first trial did not go quiet - it pressed harder every time a blade found its mark and death looked away. Now it strains at its old limits, asking to wrap flesh as well as steel. Another long night waits. So does the cost of saying yes.";
				else if (tier == ::AuraPower.Tier.Master)
					intro = "There is no peace in what %broname% is about to do. This is not the long night of early awakening, sitting still and listening. To break through to mastery is to turn the aura against itself - to force it past the shape it has settled into, past every limit %broname% has come to rely on. It will feel like tearing. The Trial of Steel does not ask for serenity at this threshold. It asks whether they are willing to be unmade and stand up from it.";
				else if (tier == ::AuraPower.Tier.King)
					intro = "No fire. No brothers nearby. %broname% knows better than to ask anyone to sit with them through this. The trial ahead is not a test of strength or will in any measure others could witness and name - it is the oldest silence, the one that has swallowed every man and woman who reached this far and found themselves unequal to what looked back. The throne does not come to those who seek it. Tonight %broname% will find out if it was ever theirs to begin with.\n\nAt the last camp before this, someone had scratched two lines into the bark of a dead elm - deep enough that the rot could not take them. A name %broname% did not recognise, and under it: [i]The crown chose me too. I was not ready. Perhaps you are.[/i] No date. No company mark. The tree had been dead a long time.";
				else
					intro = "%broname% feels the call of the Trial of Steel.";

					// A1 - "A Name in the Old Tongue": on the FIRST trial
					// (Awakening), the rolled potential reveals itself with a
					// line of weight rather than a bare label.
					if (tier == ::AuraPower.Tier.Awakening)
					{
						local pl = "";
						switch (pot)
						{
							case ::AuraPower.Potential.Dormant:
								pl = "Most men carry nothing. They swing iron until the iron breaks them, and the world does not mourn the difference. That is not cruelty - it is the plain truth of what most auras amount to. If %broname% holds something worth naming, it has not yet shown itself. The long night will settle the question."; break;
							case ::AuraPower.Potential.Ember:
								pl = "Something stirs in %broname% that does not have a name in any tongue used around campfires. It is not strength - they have met stronger men who died ordinary deaths. It is closer to stubbornness worn so deep it has become something else. Whether that is enough to light a fire or merely enough to smell like smoke, the long night will say."; break;
							case ::AuraPower.Potential.Chosen:
								pl = "Certain men are touched by something older than ambition. Not blessed - the word blessing implies a hand that cares. What %broname% carries feels more like a debt placed on them by the world, something owed and not yet collected. The trial ahead is less a question than a reckoning."; break;
							case ::AuraPower.Potential.Gifted:
								pl = "There is a phrase in an old tongue - four syllables that scholars argue over, that soldiers never bother to learn. It names the ones who were shaped for this work before they ever knew the work existed. Whisper it to no one. The aura in %broname% does not need the word to know what it is."; break;
							case ::AuraPower.Potential.SovereignSeed:
								pl = "There are names for what sits inside %broname%. Not titles - older than titles. The kind of word that belongs to bloodlines and cataclysms, spoken in rooms that have since burned down. The men who had it before were not all good men, and not all of them survived what it demanded. What %broname% does with it is still unwritten."; break;
						}
						if (pl != "") intro = intro + "\n\n" + pl;
					}
					// A2 - "Voices Before the Crown": at the King trial the night
					// reads differently by how the warrior came to it - born to the
					// weight, dragged to it by stubbornness, or chosen by something
					// that never explained itself.
					else if (tier == ::AuraPower.Tier.King)
					{
						local kp;
						if (pot == ::AuraPower.Potential.Gifted || pot == ::AuraPower.Potential.SovereignSeed)
							kp = "The crown has been waiting for %broname% since before %broname% knew it existed. Not in any mystical sense - not fate, not prophecy. Something simpler and less comfortable: the aura in them was always this size. Every trial was a door they were built to fit. The long night ahead is not a question about whether they are worthy. It is a question about whether they are willing to carry the weight of something that was always going to be theirs.";
						else if (pot == ::AuraPower.Potential.Chosen)
							kp = "%broname% was not born to this, and yet something chose them for it - not a god, not a bloodline, something older and less legible than either. The kind of choosing that reads more like pressure than favour: a weight placed on certain shoulders for reasons that were never explained and will not be. The men who carry that weight either break under it or arrive somewhere no one expected. Tonight is where %broname% finds out which.";
						else
							kp = "There is no prophecy attached to %broname%. No one inscribed their name. The throne was built for someone else, probably - for the kind of man or woman who arrives in stories with a birthright and a clean sword. %broname% arrived with neither. What they have instead is every mile of road between the first trial and this one, every door that should have been the last one and was not. That is not a lesser path to the crown. It is the longer one.";
						intro = intro + "\n\n" + kp;
					}

				local stats = "\n\n[color=#a99777]Potential:[/color] " + ::AuraPower.getPotentialName(pot)
					+ "\n[color=#a99777]Success chance:[/color] " + chance + "%"
					+ (bonus > 0 ? "  (includes [color=#1e468f]+" + bonus + "%[/color] postponement bonus)" : "")
					+ "\n[color=#a99777]Failure consequence:[/color] " + ::AuraPower.getFailureConsequenceText(tier);

				this.Text = intro + stats;
			}
		});

		// ===== Screen: ResSuccess - tier promotion + popup =====
		this.m.Screens.push({
			ID = "ResSuccess",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Bear witness.",
					function getResult( _event )
					{
						// In TestMode, chain straight to the next tier so a
						// single event walks a fresh brother all the way up.
						if (::AuraPower.Tunables.TestMode)
						{
							local bro = _event.m.Target;
							local nextTier = ::AuraPower.getNextTrialTier(bro);
							if (nextTier != ::AuraPower.Tier.None)
							{
								_event.m.TargetTier = nextTier;
								local chance = ::AuraPower.getTrialSuccessChance(bro, nextTier);
								_event.m.LastChance = chance;
								_event.m.LastRoll = 1;
								_event.m.LastSuccess = true;
								return "ResSuccess";
							}
						}
						return 0;
					}
				}
			],
			function start( _event )
			{
				local bro = _event.m.Target;
				local tier = _event.m.TargetTier;
				local pot = ::AuraPower.getPotentialV2(bro);

				this.Characters = [bro.getImagePath()];
				::AuraPower.applyTrialSuccess(bro, tier);

				local popup;
				// Default popups per user spec.
				if (tier == ::AuraPower.Tier.Awakening) popup = "The ember ignites.";
				else if (tier == ::AuraPower.Tier.Warrior)   popup = "Steel bends to awakened will.";
				else if (tier == ::AuraPower.Tier.Master)    popup = "A master walks among lesser men.";
				else if (tier == ::AuraPower.Tier.King)      popup = "The battlefield kneels before a king.";
				else popup = "%broname% rises a step higher.";

				// Special flavour: Chosen success T4
				if (tier == ::AuraPower.Tier.King && pot == ::AuraPower.Potential.Chosen)
					popup = "Against all fate, he seized the crown.";

				// IMPORTANT: do not wrap the bare Aura tier name in [color=]
				// markup - mod_nested_tooltips auto-wraps those names as
				// concept-link chips and a [color] block around the chip
				// scrambles the rendered text (user-reported 452.png).
				// Tier name goes through plain.
				this.Text = "[color=#1e468f][b]" + popup + "[/b][/color]\n\n"
					+ "%broname% is now " + ::AuraPower.getTierName(tier) + ".  "
					+ "The success roll: [color=#1e468f]" + _event.m.LastRoll + " of "
					+ _event.m.LastChance + "[/color].";
			}
		});

		// ===== Screen: ResFailure - sickness + injury + cooldown =====
		this.m.Screens.push({
			ID = "ResFailure",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "So be it.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				local bro = _event.m.Target;
				local tier = _event.m.TargetTier;
				local pot = ::AuraPower.getPotentialV2(bro);

				this.Characters = [bro.getImagePath()];
				::AuraPower.applyTrialFailure(bro, tier);

				local cdDays = (tier >= 1 && tier <= 4) ? ::AuraPower.FailCooldownDays[tier] : 2;
				if (::AuraPower.Tunables.TestMode) cdDays = 1;

				local popup;
				// Default failure flavour per tier.
				if (tier == ::AuraPower.Tier.Awakening)
					popup = "The aura rebelled. %broname% sinks into a fevered sleep, body too tired for steel.";
				else if (tier == ::AuraPower.Tier.Warrior)
					popup = "Something inside %them_broname% fractured tonight. The wound is real and the road back is slow.";
				else if (tier == ::AuraPower.Tier.Master)
					popup = "%broname% reached too far and the spirit collapsed back into itself. The fall left more than wounds.";
				else if (tier == ::AuraPower.Tier.King)
					popup = "%broname% reached for the crown and the long night refused them. The cost is written into them now.";
				else
					popup = "The trial turned %them_broname% aside.";

				// Special flavour overrides (user spec - only these three).
				if (tier == ::AuraPower.Tier.King && pot == ::AuraPower.Potential.Dormant)
					popup = "He reached for the throne of kings, and the throne cast him down.";
				else if (tier == ::AuraPower.Tier.King && pot == ::AuraPower.Potential.SovereignSeed)
					popup = "Even kings may bleed before ascension.";

				// Build a tier-specific breakdown of what was actually
				// applied to the brother - so the player sees a clear
				// list of consequences instead of one summary line.
				local consequences;
				if (tier == ::AuraPower.Tier.Awakening)
				{
					consequences = "- Sickness for 2 days\n- -10% Maximum Fatigue while sick";
				}
				else if (tier == ::AuraPower.Tier.Warrior)
				{
					consequences = "- Sickness for 3 days\n- Medium spiritual wound (-5 Melee/Ranged Skill, -8 Initiative for 3 days)";
				}
				else if (tier == ::AuraPower.Tier.Master)
				{
					consequences = "- Sickness for 5 days\n- Severe spiritual wound (-10 Melee/Ranged Skill, -15 Initiative for 5 days)\n- -10 Resolve for 5 days";
				}
				else if (tier == ::AuraPower.Tier.King)
				{
					local f = bro.getFlags();
					local jr = f.has("aura_last_judgment") ? f.get("aura_last_judgment") : 0;
					if      (jr == 1) consequences = "- Crown's Scar - PERMANENT -1 Resolve";
					else if (jr == 2) consequences = "- Crown's Weariness - PERMANENT -2 Maximum Fatigue";
					else if (jr == 3) consequences = "- Crown's Doubt - PERMANENT -2 Resolve";
					else if (jr == 4) consequences = "- Crown's Tremor - PERMANENT -1 Melee Skill";
					else if (jr == 5) consequences = "- Sickness for 7 days";
					else              consequences = "- King's Judgment fell";
				}
				else
				{
					consequences = "- The trial turned them aside";
				}

				// Plain text body - no [color] around long text blocks
				// to avoid the nested_tooltips / line-wrap conflicts that
				// hit 1.15.0. Headline + day count are coloured; the
				// consequence list is plain.
				this.Text = "[color=#8f1e1e][b]" + popup + "[/b][/color]\n\n"
					+ "What this attempt cost " + bro.getName() + ":\n"
					+ consequences + "\n\n"
					+ "No more trials for this brother for [color=#8f1e1e]"
					+ cdDays + " day(s)[/color].";
			}
		});
	}

	function onDetermineStartScreen()
	{
		// More than one eligible brother -> show the picker. A single
		// eligible brother (or a stale/empty list) goes straight to the
		// Intro reveal on the default Target set in onUpdateScore.
		if (this.m.Candidates.len() > 1)
			return "Candidates";
		return "Intro";
	}

	function onUpdateScore()
	{
		this.m.Score = 0;

		// Dynamic cooldown read - lets MSU changes take effect immediately.
		try
		{
			local cdDays = ::AuraPower.Tunables.TrialCooldownDays.tofloat();
			if (::AuraPower.Tunables.TestMode) cdDays = 1.0;
			this.m.Cooldown = cdDays * this.World.getTime().SecondsPerDay;
		}
		catch (e) {}

		if (!::AuraPower.Tunables.EnableTrialEvent) return;

		// Respect the world-level cadence the deterministic trigger stamps in
		// onPrepare, so the lottery (if it ever polls) cannot bypass the
		// "Days Between Trials" setting and double-fire alongside the direct path.
		try
		{
			local cDay = ::AuraPower.getCurrentDay();
			local cLast = ::World.Flags.has("aura_trial_last_day") ? ::World.Flags.get("aura_trial_last_day") : -999;
			local cGap = ::AuraPower.Tunables.TestMode ? 1 : ::AuraPower.Tunables.TrialCooldownDays;
			if (cLast > -999 && (cDay - cLast) < cGap) return;
		}
		catch (e) {}

		// Draw up to TrialCandidateCount distinct eligible brothers.
		this.m.Candidates = ::AuraPower.findTrialCandidates(::AuraPower.Tunables.TrialCandidateCount);
		if (this.m.Candidates.len() == 0) return;

		// Default Target = the first drawn brother. If a Candidates picker
		// screen runs, its option overwrites this; if only one was drawn we
		// go straight to Intro on this default.
		this.m.Target = this.m.Candidates[0];
		this.m.TargetTier = ::AuraPower.getNextTrialTier(this.m.Target);
		// Lottery is now only a fallback (the deterministic direct-fire is the
		// primary trigger); the score is still set so the trial can win the rare
		// lottery poll if one happens between deterministic fires.
		this.m.Score = ::AuraPower.Tunables.TestMode ? 99999 : (5000.0 * ::AuraPower.Tunables.TrialScoreMult).tointeger();
	}

	function onPrepare()
	{
		// Draw candidates HERE (not only in onUpdateScore) so the event works
		// when fired by the deterministic trigger: a World.Events.fire() does
		// NOT run onUpdateScore. Always redraw for freshness - the lottery path's
		// onUpdateScore draw is only ever used for its score.
		this.m.Candidates = ::AuraPower.findTrialCandidates(::AuraPower.Tunables.TrialCandidateCount);
		if (this.m.Candidates.len() > 0)
		{
			this.m.Target = this.m.Candidates[0];
			this.m.TargetTier = ::AuraPower.getNextTrialTier(this.m.Target);
		}

		// Stamp the world-level cadence so the deterministic trigger (and the
		// lottery) cannot re-pop the trial faster than the "Days Between Trials"
		// setting. Only reached when the event actually fires - a swallowed fire
		// never gets here, so the next tick simply retries.
		try
		{
			if ("World" in ::getroottable() && ::World != null
				&& "Flags" in ::World && ::World.Flags != null)
				::World.Flags.set("aura_trial_last_day", ::AuraPower.getCurrentDay());
		}
		catch (e) {}
	}

	function onPrepareVariables( _vars )
	{
		if (this.m.Target != null)
		{
			_vars.push(["broname", this.m.Target.getName()]);
			_vars.push(["them_broname", "them"]);
		}
	}

	function onClear()
	{
		this.m.Target = null;
		this.m.TargetTier = 0;
		this.m.LastSuccess = false;
		this.m.LastRoll = 0;
		this.m.LastChance = 0;
		this.m.Candidates = [];
	}
});
