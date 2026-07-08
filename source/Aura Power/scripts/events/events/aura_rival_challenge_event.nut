// =====================================================================
//  Aura Power - World event: "The Crown's Hunt"
//
//  The northern kingdom that razed the heir's house never stops hunting. Every
//  ~20 days (Last Heir origin only) this event warns the company that a force is
//  marching on them, with text that escalates across the 6 army tiers. Choosing
//  to brace spawns that tier's noble party a few tiles away, so the warning buys
//  real preparation time before the battle is joined. Tier climbs a LADDER -
//  one rung per beaten wave (aura_hunt_next_tier, bumped by updateHuntTracking) -
//  never by company strength, so the player always faces tier N+1 only after
//  beating tier N.
//
//  ID is kept as "event.aura_rival_challenge" so the existing MSU test toggle
//  (fireRivalChallengeNow) still fires it.
// =====================================================================
this.aura_rival_challenge_event <- ::inherit("scripts/events/event", {
	m = {
		Tier = 1,
		// Day number of the last "now bidding" diagnostic, so the eligible
		// branch of onUpdateScore (polled many times a day) logs once per day.
		LastBidLogDay = -1
	},

	// Escalating warning text, indexed by tier 1..6. Written in the Last Heir
	// origin's voice: the kingdom that burned your house realising, by degrees,
	// that they did not finish the work - and being afraid of it.
	HuntText = [
		"",
		// 1
		"It begins the way it ended, last time: with riders in the north's colours, and a silence where a name used to be. A patrol, no more - footmen moving down the roads with the unhurried confidence of men who do not yet believe what they have been sent to confirm. Somewhere in a high stone room a rumour was heard, that the old blood did not all burn, and could not quite be believed. So they sent a few servants to check whether the fire was truly out.[p]They will find that it is not. And then the rumour will stop being a rumour.[/p]",
		// 2
		"The rumour has a shape now. Somewhere your face was described to the wrong person, or your blade was recognised, or you only stood too long in the light - and word climbed, the way water finds the low door, until it reached someone with the authority to be afraid. A royal patrol works the roads in earnest this time, and a sergeant rides at its head asking after your company by the very name they believed they had burned away.[p]Let them look. Let them find what survived the fire.[/p]",
		// 3
		"They have stopped pretending this is the ordinary business of keeping roads quiet. The north has put hunters on you - a column under the king's banner, a greatsword swinging at the head of it - and they march in a straight grim line that bends toward you and nothing else. The man who gave an order, years ago, has been told the order did not take. He is not a patient man tonight.[p]Good. Patience was always the thing that made him dangerous.[/p]",
		// 4
		"Now the knights come, and you can read the kingdom's mind in the make of the force it sends. This one remembers what your bloodline was - that three generations back a son of your house stood before an empty throne and rose, and did not break, and became the kind of thing kingdoms are built to prevent. Hedge knights ride heavy in the column. A patrol is what they send for a man. This is what they send for an heir.[p]They are right to be afraid. They were always right to be afraid. That is why they used fire.[/p]",
		// 5
		"They are done being careful. A full war detachment marches under the royal standard - plate and warhorses, a master archer to open your line from afar, and at its head a named blade the heralds will call Sir before he tries to put it through you. These are the men a crown sends when it wants a bloodline ended and witnessed, so the story can be told correctly this time. They did the work poorly once.[p]They have come to do it properly. So have you.[/p]",
		// 6
		"This is the shape of their fear, grown at last to its full height. The Crown's Vanguard rides for you - sworn knights, a swordmaster's bright and patient steel, the king's own named champions beneath the great banner - sent for the single purpose of burying you, and the aura you carry, so deep that nothing can ever rise from it again. It is the same thoroughness that took your house. The same certainty. The same fire, only wearing better armour.[p]They came to end the last of the line. Stand, and show them what the last of the line became.[/p]"
	],

	function create()
	{
		this.m.ID = "event.aura_rival_challenge";
		this.m.Title = "The Crown's Hunt";

		// ~20 day spacing between hunts.
		local secondsPerDay = 7200;
		try { secondsPerDay = this.World.getTime().SecondsPerDay; } catch (e) {}
		this.m.Cooldown = 20.0 * secondsPerDay;

		this.m.Screens.push({
			ID = "A",
			Text = "",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Brace yourselves.",
					function getResult( _event )
					{
						try
						{
							if ("AuraPower" in ::getroottable()
								&& "spawnKingdomHuntersTier" in ::AuraPower)
							{
								::AuraPower.spawnKingdomHuntersTier(_event.m.Tier);
								// Record cadence + advance the wave count.
								if ("World" in ::getroottable() && ::World != null
									&& "Flags" in ::World && ::World.Flags != null)
								{
									local wf = ::World.Flags;
									wf.set("aura_hunt_last_day", ::AuraPower.getCurrentDay());
									local wave = wf.has("aura_hunt_wave") ? wf.get("aura_hunt_wave") : 0;
									wf.set("aura_hunt_wave", wave + 1);
									// Consume any pressure relief once it has shaped this wave.
									wf.set("aura_hunt_relief", 0);
								}
							}
						}
						catch (e) { ::logError("Aura Power: Crown's Hunt spawn - " + e); }
						return 0;
					}
				}
			],
			function start( _event )
			{
				local t = _event.m.Tier;
				if (t < 1) t = 1;
				if (t > 6) t = 6;
				// NOTE: 'this' here is the SCREEN, which has Text/Image/Options
				// but NO 'Title' slot - setting this.Title throws "the index
				// 'Title' does not exist" and aborts the screen. The event title
				// is set on the event (m.Title) in onPrepare instead.
				this.Text = "[img]gfx/ui/events/event_183.png[/img]" + _event.HuntText[t];
			}
		});
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	// Decide the tier on every actual fire (lottery AND the direct test fire,
	// which skips onUpdateScore).
	//
	// LADDER RULE (player demand, 2026-06-12): the hunt climbs ONE tier per
	// beaten wave, read from the aura_hunt_next_tier flag that
	// updateHuntTracking bumps on each win. The old computeHuntTier
	// (avg level + days) could jump several tiers between waves - a company
	// that beat only the tier-1 patrol met a tier-5 war detachment next.
	function onPrepare()
	{
		// Test override: the merged MSU button sets a forced tier so the warning
		// AND the spawned army both use the slider's tier. Consumed once.
		local forced = 0;
		try { if ("TestForcedTier" in ::AuraPower) forced = ::AuraPower.TestForcedTier; } catch (e) {}
		if (forced > 0)
		{
			this.m.Tier = forced;
			try { ::AuraPower.TestForcedTier = 0; } catch (e) {}
		}
		else
		{
			local tier = 1;
			try
			{
				if ("World" in ::getroottable() && ::World != null
					&& "Flags" in ::World && ::World.Flags != null)
				{
					local wf = ::World.Flags;
					if (wf.has("aura_hunt_next_tier"))
					{
						tier = wf.get("aura_hunt_next_tier");
					}
					else
					{
						// One-time migration for saves from the computeHuntTier
						// era: aura_hunt_wave counts hunts that already arrived,
						// so a company N waves in resumes the ladder at tier N.
						local wave = wf.has("aura_hunt_wave") ? wf.get("aura_hunt_wave") : 0;
						tier = (wave > 0) ? wave : 1;
						wf.set("aura_hunt_next_tier", tier);
					}
					// Pressure relief eases the tier after a loss (inert plumbing
					// unless something sets aura_hunt_relief > 0).
					if (wf.has("aura_hunt_relief"))
						tier = tier - wf.get("aura_hunt_relief");
				}
			}
			catch (e) { tier = 1; }
			if (tier < 1) tier = 1;
			if (tier > 6) tier = 6;
			this.m.Tier = tier;
		}

		// Dynamic title showing the tier band (set here on the EVENT, where
		// m.Title is valid - never in the screen's start()).
		local t = this.m.Tier;
		if (t < 1) t = 1;
		if (t > 6) t = 6;
		try { this.m.Title = "The Crown's Hunt - " + ::AuraPower.HuntTierData[t].Label; }
		catch (e) { this.m.Title = "The Crown's Hunt"; }
	}

	function onUpdateScore()
	{
		this.m.Score = 0;
		try
		{
			if (!::AuraPower.Tunables.EnableTrialEvent) return;   // shared master toggle
			if (!::AuraPower.Tunables.EnableCrownsHunt) return;   // separate Crown's Hunt toggle
			if (!("World" in ::getroottable()) || ::World == null) return;
			if (!("Flags" in ::World) || ::World.Flags == null) return;

			local wf = ::World.Flags;

			// The hunt is over for good once the player has beaten the tier-6
			// Vanguard - the kingdom no longer dares to march.
			if (wf.has("aura_hunt_concluded") && wf.get("aura_hunt_concluded")) return;

			// Don't stack: a hunt party is still out there (unbeaten / chasing).
			if (wf.has("aura_hunt_party_id") && wf.get("aura_hunt_party_id") != 0)
			{
				local active = null;
				try { active = ::World.getEntityByID(wf.get("aura_hunt_party_id")); } catch (e) { active = null; }
				if (active != null) return;
			}

			// Last Heir origin only. getOrigin/getID are class methods - the old
			// `("getOrigin" in Assets)` guard was ALWAYS false (the `in` operator
			// can't see class methods), which starved this lottery bid on every
			// tick. Use the shared helper that calls getOrigin() directly.
			if (::AuraPower.getActiveOriginID() != "scenario.aura_inheritor") return;

			// Grace period at the start of the campaign.
			local day = ::AuraPower.getCurrentDay();
			if (day < 20) return;

			// ~20-day cadence (backs up the engine Cooldown).
			if (wf.has("aura_hunt_last_day") && (day - wf.get("aura_hunt_last_day")) < 20) return;

			// MUST outbid everything once eligible. Real-save evidence
			// (day 35->46, 2026-06-12): the deterministic world_state.onShow
			// path never ran because the player loaded once and then played 11
			// straight days with no battle (onShow fires only on load and on
			// the tactical->world return), while in the SAME session our own
			// Trial of Steel won lottery draws twice at score 5000 - so the
			// lottery ticks fine, the hunt simply lost every draw at 2500.
			// 99999 is the value the trial's TestMode uses to take the very
			// next draw; the engine fires us as soon as it is ready, with no
			// event-readiness race and no double-fire (getResult stamps
			// aura_hunt_last_day, zeroing this score on the next tick).
			this.m.Score = 99999;
			// A stale test-slider override must not leak into a lottery-won
			// fire either; only an actively-retrying test chain may keep it.
			try
			{
				local chainActive = ("RivalFireChainActive" in ::AuraPower) && ::AuraPower.RivalFireChainActive;
				if (("TestForcedTier" in ::AuraPower) && ::AuraPower.TestForcedTier != 0 && !chainActive)
					::AuraPower.TestForcedTier = 0;
			}
			catch (e) {}
			if (this.m.LastBidLogDay != day)
			{
				this.m.LastBidLogDay = day;
				::logInfo("Aura Power: Crown's Hunt eligible - bidding 99999 in the event lottery (day " + day + ").");
			}
		}
		catch (e) { ::logError("Aura Power: Crown's Hunt onUpdateScore - " + e); }
	}

	function onClear()
	{
		this.m.Tier = 1;
	}
});
