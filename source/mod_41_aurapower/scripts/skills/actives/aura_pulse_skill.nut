// Tier I active. Releases the warrior's aura in a single concussive pulse
// that washes over every adjacent tile. Each enemy caught in it must steel
// their nerve - those who fail begin to waver - and is shoved back a tile
// if there is room behind them.
//
// Once per battle.
this.aura_pulse_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Charges = 1,
		MaxCharges = 1
	},
	function create()
	{
		this.m.ID = "actives.aura_pulse";
		this.m.Name = "Aura: Pulse";
		this.m.Description = "Release a concussive pulse of aura. Every adjacent enemy must check their resolve or begin wavering, and is shoved one tile away from the warrior.";
		this.m.Icon = "ui/aura/aura_pulse.png";
		this.m.IconDisabled = "ui/aura/aura_pulse_sw.png";
		this.m.Overlay = "active_22";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 221;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsAttack = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 25;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local pos = this.Const.UI.Color.PositiveValue;
		ret.push({
			id = 10, type = "text", icon = "ui/icons/bravery.png",
			text = "Every adjacent enemy makes a Resolve check; failure begins [color=" + this.Const.UI.Color.NegativeValue + "]Wavering[/color]"
		});
		ret.push({
			id = 11, type = "text", icon = "ui/icons/special.png",
			text = "Pushes every adjacent enemy [color=" + pos + "]1[/color] tile away from the warrior"
		});
		ret.push({
			id = 12, type = "text", icon = "ui/icons/special.png",
			text = "Charges left this battle: [color=" + pos + "]" + this.m.Charges + "[/color] / " + this.m.MaxCharges
		});
		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable()) return false;
		if (this.m.Charges <= 0) return false;
		return true;
	}

	function isHidden()
	{
		return this.m.Charges <= 0;
	}

	function onUse( _user, _targetTile )
	{
		local userTile = _user.getTile();

		// Visual cue: a wide aura burst centred on the user.
		try
		{
			if (this.doesBrushExist("aura_body_glow"))
			{
				this.Tactical.spawnSpriteEffect("aura_body_glow",
					this.createColor("#5fb0ff"), userTile,
					0, 30, 1.4, 2.4, 100, 60, 400);
			}
		}
		catch (e) {}

		// Apply morale check + knockback to each adjacent enemy.
		for (local i = 0; i < 6; i = ++i)
		{
			if (!userTile.hasNextTile(i)) continue;
			local adj = userTile.getNextTile(i);
			if (!adj.IsOccupiedByActor) continue;
			local enemy = adj.getEntity();
			if (enemy == null || !enemy.isAlive()) continue;
			if (enemy.isAlliedWith(_user)) continue;

			// Resolve check - on failure, drop their morale one step toward Fleeing.
			try
			{
				// Undead (non-ghoul) are fearless and have no "morale" sprite - forcing
				// a morale change crashes vanilla's morale-icon render (setBrush). Skip
				// morale for them; the knockback below still applies. (crash fix 2026-06-29)
				if (!(enemy.getFlags().has("undead") && !enemy.getFlags().has("ghoul")))
				{
					local passed = enemy.checkMorale(-1, 0,
						this.Const.MoraleCheckType.MentalAttack);
					if (!passed)
					{
						local cur = enemy.getMoraleState();
						if (cur < this.Const.MoraleState.Wavering)
							enemy.setMoraleState(this.Const.MoraleState.Wavering);
					}
				}
			}
			catch (error)
			{
				::logError("Aura Power: Aura Pulse morale check failed - " + error);
			}

			// Knock back one tile directly away from the user.
			//
			// CRITICAL (undead-unhittable fix): NEVER move a knocked actor with a
			// raw enemy.setTile(). That sets the entity's tile but bypasses the
			// engine's tile<->actor / selection / occupancy bookkeeping, leaving
			// the actor ON the map but unselectable and un-hittable until some AOE
			// re-touches its tile and resyncs it. Undead show it worst (they get
			// shoved constantly and carry extra tile-state from Rise Again /
			// phasing). EVERY vanilla knockback (push / knock_back / repel / charge)
			// instead uses Tactical.getNavigator().teleport, which does the full
			// handoff. Mirror the vanilla no-fall-damage push exactly.
			try
			{
				if (enemy.getCurrentProperties().IsImmuneToKnockBackAndGrab)
					continue;
				if (!adj.hasNextTile(i)) continue;
				local back = adj.getNextTile(i);
				if (back == null) continue;
				if (back.IsOccupiedByActor) continue;
				if (back.Type == this.Const.Tactical.TerrainType.Impassable) continue;
				enemy.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
				this.Tactical.getNavigator().teleport(enemy, back, null, null, true);
			}
			catch (error)
			{
				::logError("Aura Power: Aura Pulse knockback failed - " + error);
			}
		}

		this.m.Charges = this.m.Charges - 1;
		return true;
	}

	function onCombatFinished()
	{
		this.m.Charges = this.m.MaxCharges;
	}
});
