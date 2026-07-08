// Hidden Potential character-sheet indicator (v1.15.0 redesign).
//
// Reflects the brother's 5-tier potential roll (Dormant / Ember / Chosen
// / Gifted / Sovereign Seed). Potential is NOT a cap any more - it is a
// success-rate modifier for the Trial of Steel. Tooltip surfaces the
// data the player needs to decide whether to attempt / postpone / reject:
//   - current tier
//   - hidden potential
//   - next trial + required level (gate)
//   - if already at gate: success chance, failure consequence, postpone
//     bonus, cooldown remaining, rejection state
//   - if not yet at gate: just the gate hint
//
// Five vanilla perk icons - all confirmed present in the Reforged stack
// (grep over _reforged_extract). Order picks visually distinct ones so
// the indicator is glanceable.
this.aura_potential <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_potential";
		this.m.Name = "Hidden Potential: Unrevealed";
		this.m.Description = "Some warriors carry a hidden ember within. The Trial of Steel reveals how readily that ember answers the call.";
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	// The container actor on the character sheet IS the persistent
	// brother in vanilla / Reforged stacks. No bridging required for
	// the indicator (different from the kill-tracking bridge we needed
	// for tactical hooks). We just go through ::AuraPower.getPotentialV2.
	function _getBro()
	{
		try
		{
			local a = this.getContainer().getActor();
			return a;
		}
		catch (e) {}
		return null;
	}

	function _pot()
	{
		local bro = this._getBro();
		if (bro == null) return -1;
		try { return ::AuraPower.getPotentialV2(bro); } catch (e) {}
		return -1;
	}

	function getName()
	{
		local p = ::AuraPower.Potential;
		switch (this._pot())
		{
			case p.Dormant:       return "Hidden Potential: Dormant";
			case p.Ember:         return "Hidden Potential: Ember";
			case p.Chosen:        return "Hidden Potential: Chosen";
			case p.Gifted:        return "Hidden Potential: Gifted";
			case p.SovereignSeed: return "Hidden Potential: Sovereign Seed";
		}
		return "Hidden Potential: Unrevealed";
	}

	function getIcon()
	{
		local p = ::AuraPower.Potential;
		switch (this._pot())
		{
			case p.Dormant:       return "ui/perks/perk_21.png";
			case p.Ember:         return "ui/perks/perk_56.png";
			case p.Chosen:        return "ui/perks/perk_42.png";
			case p.Gifted:        return "ui/perks/perk_28.png";
			case p.SovereignSeed: return "ui/perks/perk_60.png";
		}
		return this.m.Icon;
	}

	function getDescription()
	{
		local p = ::AuraPower.Potential;
		switch (this._pot())
		{
			case p.Dormant:
				return "There is barely a spark in this one. The Trial of Steel will reach for the aura and most likely come away empty - but persistence pays.";
			case p.Ember:
				return "A faint ember sits beneath the ribs - real, if quiet. With the right trial it can be coaxed up the path of aura, though the road is long.";
			case p.Chosen:
				return "Chosen by something - bloodline, providence, raw will. The aura answers more readily here than in most.";
			case p.Gifted:
				return "A genuine gift. The aura runs through this one like fire through dry grass; trials at every tier come noticeably easier.";
			case p.SovereignSeed:
				return "A Sovereign Seed - the rarest answer the Trial of Steel ever returns. Even the path to Aura King is open to this warrior with little resistance.";
		}
		return this.m.Description;
	}

	function getTooltip()
	{
		local bro = this._getBro();
		local pot = this._pot();
		local pos = this.Const.UI.Color.PositiveValue;
		local neg = this.Const.UI.Color.NegativeValue;
		local mute = "#a99777";

		local ret = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() }
		];

		if (bro == null) return ret;

		// Current tier line. Tier names are deliberately NOT wrapped in
		// [color=...] markup - the user's mod stack includes
		// mod_nested_tooltips, which auto-converts "Aura Awakening /
		// Warrior / Master / King" into hover-link chips. A [color]
		// block around such a chip produces broken HTML that scrambles
		// the line and can wrap text into illegible overlapping spans
		// (per user-supplied 452.png). Same rule below for Next Trial.
		local currentTier = ::AuraPower.getTier(bro);
		local currentTierLabel = (currentTier == ::AuraPower.Tier.None)
			? "Unawakened"
			: ::AuraPower.getTierName(currentTier);
		ret.push({
			id = 3, type = "text", icon = "ui/icons/special.png",
			text = "Current Tier: " + currentTierLabel
		});

		// Trial Record: surface the brother's history with the Trial of
		// Steel. Shown for any brother who has attempted at least once, in
		// every tier state (including a finished King below), so the scars
		// of the climb stay visible. Plain text - no tier names here, so no
		// nested_tooltips colour conflict to worry about.
		local trialsAttempted = ::AuraPower.getProof(bro, "trials_attempted", 0);
		local trialsFailed    = ::AuraPower.getProof(bro, "trials_failed", 0);
		local judgmentsBorne  = ::AuraPower.getProof(bro, "judgments_taken", 0);
		if (trialsAttempted > 0)
		{
			ret.push({
				id = 20, type = "text", icon = "ui/icons/special.png",
				text = "Trial Record:  Attempted " + trialsAttempted
					+ "  |  Failed " + trialsFailed
					+ "  |  Judgments borne " + judgmentsBorne
			});
			if (judgmentsBorne >= 2)
			{
				ret.push({
					id = 21, type = "text", icon = "ui/icons/special.png",
					text = "The crown has already drawn blood. Each scar is a lesson it did not need to teach twice."
				});
			}
		}

		if (currentTier >= ::AuraPower.Tier.King)
		{
			ret.push({
				id = 4, type = "text", icon = "ui/icons/special.png",
				text = "The path is complete."
			});
			return ret;
		}

		::AuraPower.clearRejectionIfDue(bro);
		local rejectedTier = ::AuraPower.getRejectedTier(bro);
		local headingTier = currentTier + 1;
		if (rejectedTier >= 0 && rejectedTier + 1 <= ::AuraPower.Tier.King)
			headingTier = rejectedTier + 1;
		if (headingTier > ::AuraPower.Tier.King)
		{
			return ret;
		}

		local requiredLevel = ::AuraPower.getLevelGateForTier(headingTier);
		local curLevel = bro.getLevel();
		local levelsAway = requiredLevel - curLevel;
		local headingTierLabel = ::AuraPower.getTierName(headingTier);

		// Next-trial line (plain text - no color around the tier name).
		ret.push({
			id = 4, type = "text", icon = "ui/icons/special.png",
			text = "Next Trial: " + headingTierLabel
		});

		// Pre-unlock: terse hint, no chance / failure info.
		if (curLevel < requiredLevel)
		{
			ret.push({
				id = 5, type = "text", icon = "ui/icons/special.png",
				text = "Required Level: " + requiredLevel
					+ "  ([color=" + neg + "]" + levelsAway + " away[/color])"
			});
			return ret;
		}

		// Post-unlock: full block.
		ret.push({
			id = 5, type = "text", icon = "ui/icons/special.png",
			text = "Required Level: " + requiredLevel + "  (met)"
		});

		// King uniqueness gate. If this brother is queueing for the T4
		// trial but somebody else already wears the crown, the trial
		// will not fire. Show that plainly so the player isn't waiting
		// on an event that can't trigger.
		if (headingTier == ::AuraPower.Tier.King
			&& ::AuraPower.hasLivingKing(bro))
		{
			ret.push({
				id = 6, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + neg + "]A king already walks among the company.[/color]  The throne must be empty before this one may claim it."
			});
			return ret;
		}

		local chance = ::AuraPower.getTrialSuccessChance(bro, headingTier);
		local chanceColor = (chance >= 70) ? pos : (chance >= 40 ? mute : neg);
		ret.push({
			id = 6, type = "text", icon = "ui/icons/special.png",
			text = "Success Chance: [color=" + chanceColor + "][b]" + chance + "%[/b][/color]"
		});

		// Failure consequence on its own line, plain text (no color
		// wrapper - the consequence text is long and we don't want a
		// wrap-inside-color rendering bug repeating).
		ret.push({
			id = 7, type = "text", icon = "ui/icons/special.png",
			text = "If you fail: " + ::AuraPower.getFailureConsequenceText(headingTier)
		});

		local bonus = ::AuraPower.getPostponeBonus(bro);
		if (bonus > 0)
		{
			ret.push({
				id = 8, type = "text", icon = "ui/icons/special.png",
				text = "Postponement Bonus: [color=" + pos + "]+" + bonus + "%[/color]"
			});
		}

		// State overlays - plain text, no embedded tier names that
		// could trip nested_tooltips.
		if (::AuraPower.isOnCooldown(bro))
		{
			local d = ::AuraPower.getCooldownDaysRemaining(bro);
			ret.push({
				id = 9, type = "text", icon = "ui/icons/special.png",
				text = "Recovering from a failed trial. "
					+ "[color=" + neg + "]" + d + " day(s)[/color] until next attempt."
			});
		}
		else if (::AuraPower.isPostponed(bro))
		{
			local d = ::AuraPower.getPostponeUntilDay(bro) - ::AuraPower.getCurrentDay();
			if (d < 0) d = 0;
			ret.push({
				id = 9, type = "text", icon = "ui/icons/special.png",
				text = "Postponed. Next attempt in " + d + " day(s)."
			});
		}
		else if (rejectedTier >= 0)
		{
			local nextGate = ::AuraPower.getLevelGateForTier(rejectedTier + 1);
			ret.push({
				id = 9, type = "text", icon = "ui/icons/special.png",
				text = "Rejected the previous tier. "
					+ "Next chance opens at Level " + nextGate + "."
			});
		}

		return ret;
	}
});
