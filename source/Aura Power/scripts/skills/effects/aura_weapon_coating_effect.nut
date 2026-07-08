// The active half of Aura: Weapon Coating. Boosts damage and armour
// penetration, shows the aura on the held weapon, and drains stamina each
// turn. It is a toggle - it stays on until the player switches it off, the
// warrior runs out of stamina, or the battle ends.
//
// The aura sprite is applied by reading getItems().getAppearance().Weapon
// (the exact field the game draws the weapon from) and swapping it to the
// "_aura" variant. Because hitting an enemy turns the weapon bloodied -
// which overwrites that field - the swap is re-applied on every turn and
// after every hit, so the aura never falls off mid-fight.
this.aura_weapon_coating_effect <- this.inherit("scripts/skills/skill", {
	m = {
		// True once onAdded did the real sprite swap (false = tint fallback).
		UsedSwap = false,
		// The weapon sprite name before the swap, restored on removal.
		SavedWeapon = ""
	},
	function create()
	{
		this.m.ID = "effects.aura_weapon_coating";
		this.m.Name = "Aura: Weapon Coating";
		this.m.Description = "The weapon is sheathed in aura, biting deeper with every strike.";
		this.m.Icon = "ui/aura/weapon_coating.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDrain()
	{
		return this.Math.max(1, (5 * ::AuraPower.Tunables.FatigueDrainMult).tointeger());
	}

	// Set the toggle skill's cost: (0,0) while active so it can be switched
	// off for free, (2,15) once gone so it must be paid for to switch on.
	function setSkillCost( _ap, _fat )
	{
		local s = this.getContainer().getSkillByID("actives.aura_weapon_coating");
		if (s != null)
		{
			s.m.ActionPointCost = _ap;
			s.m.FatigueCost = _fat;
		}
	}

	// Swap the held weapon sprite to its baked aura version. Re-applies
	// itself harmlessly - if the weapon already shows the aura it does
	// nothing; if it turned bloodied it swaps again.
	function applyAura()
	{
		try
		{
			local actor = this.getContainer().getActor();
			local items = actor.getItems();
			local appearance = items.getAppearance();
			local cur = ("Weapon" in appearance) ? appearance.Weapon : null;
			if (typeof cur != "string" || cur == "")
				return;
			if (cur.len() >= 5 && cur.slice(cur.len() - 5) == "_aura")
				return;   // already showing the aura sprite

			local baseIcon = cur;
			if (baseIcon.len() >= 9 && baseIcon.slice(baseIcon.len() - 9) == "_bloodied")
				baseIcon = baseIcon.slice(0, baseIcon.len() - 9);

			if (this.doesBrushExist(baseIcon + "_aura"))
			{
				this.m.SavedWeapon = cur;
				appearance.Weapon = baseIcon + "_aura";
				items.updateAppearance();
				this.m.UsedSwap = true;
			}
		}
		catch (error)
		{
			::logError("Aura Power: applyAura error - " + error);
		}
	}

	// Fallback path: when we can't find a pre-baked "_aura" sprite for the
	// equipped weapon (e.g. Reforged adds 200+ custom weapons that don't have
	// matching aura variants in our atlas), we tint the visible weapon
	// sprites with a strong blue glow. Plus a tile-attached aura sprite
	// effect that loops, so the player has an unmistakable visual cue even
	// if the weapon-sprite tint isn't sitting on a layer we recognise.
	function tintWeapon( _on )
	{
		local actor = this.getContainer().getActor();
		// Cast a wide net of sprite layer names - vanilla, Legends, Reforged
		// all use slightly different conventions for where the weapon icon
		// lives. Tinting a non-weapon layer is harmless.
		local layers = [
			"arms_icon", "weapon", "weapon_icon", "offhand_icon",
			"weapon_two_handed", "weapon_main", "weapon_off",
			"arms", "shield", "shield_icon"
		];
		foreach (name in layers)
		{
			if (!actor.hasSprite(name)) continue;
			try
			{
				local spr = actor.getSprite(name);
				spr.Color = this.createColor(_on ? "#4ba0ff" : "#ffffff");
				spr.Saturation = _on ? 8.0 : 1.0;
			}
			catch (e) {}
		}
		try { actor.setDirty(true); } catch (e) {}
	}

	// Brief blue pulse around the actor on activation - guaranteed visible
	// regardless of weapon sprite tint reliability.
	function playActivateBurst()
	{
		try
		{
			local actor = this.getContainer().getActor();
			if (actor == null || !actor.isPlacedOnMap()) return;
			local tile = actor.getTile();
			if (this.doesBrushExist("aura_body_glow"))
			{
				this.Tactical.spawnSpriteEffect("aura_body_glow",
					this.createColor("#4ba0ff"), tile,
					0, 30, 0.7, 1.3, 150, 60, 350);
			}
		}
		catch (e) {}
	}

	function onAdded()
	{
		this.applyAura();
		if (!this.m.UsedSwap)
		{
			// No baked "_aura" variant (common for other mods' weapons). Leave
			// the weapon sprite UNTOUCHED rather than the old Saturation-8.0 blue
			// tint that mangled modded weapon art - the activation burst + the
			// buff icon are cue enough. (Option A, v1.0.2.)
			try
			{
				local actor = this.getContainer().getActor();
				local cur = actor.getItems().getAppearance().Weapon;
				::logInfo("Aura Power: WC - no _aura variant for weapon=" + cur
					+ ", leaving its sprite untouched (burst only)");
			}
			catch (e) {}
		}
		else
		{
			::logInfo("Aura Power: WC sprite swap applied");
		}
		this.playActivateBurst();
		// While the coating is on, switching it off is free.
		this.setSkillCost(0, 0);
	}

	function onRemoved()
	{
		try
		{
			if (this.m.UsedSwap)
			{
				local actor = this.getContainer().getActor();
				local items = actor.getItems();
				local appearance = items.getAppearance();
				appearance.Weapon = this.m.SavedWeapon;
				items.updateAppearance();
			}
			// else: no _aura variant - we never touched the weapon sprite, so
			// there is nothing to restore.
		}
		catch (error)
		{
			::logError("Aura Power: weapon aura onRemoved error - " + error);
		}
		// Restore the activation cost so the skill can be switched on again.
		this.setSkillCost(2, 15);
	}

	// Guaranteed carry-over purge - shares the city Arena bug that aura_sense
	// already patches. The Arena's back-to-back round flow can SKIP the
	// after-battle sweep, so a coating left toggled ON at the end of one bout
	// survives into the next (drain keeps ticking, the weapon sprite stays
	// swapped, and the toggle active reads "on" so it can't be re-cast cleanly).
	//
	// A freshly toggled-on coating is ALWAYS added mid-combat, i.e. AFTER
	// onCombatStarted has already fired for that fight. Therefore any instance
	// that RECEIVES onCombatStarted is by definition a stale leftover from a
	// previous battle and must strip itself before the player's first turn.
	// removeSelf -> onRemoved restores the weapon sprite and the activation cost.
	function onCombatStarted()
	{
		try { this.removeSelf(); }
		catch (e) { ::logError("Aura Power: weapon coating stale-purge failed - " + e); }
	}

	// Re-apply the aura after the weapon may have turned bloodied.
	function onTurnStart()
	{
		this.applyAura();
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.applyAura();
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		this.applyAura();
	}

	// onUpdate runs constantly during stat calculation - lightweight maths only.
	function onUpdate( _properties )
	{
		local mult = ::AuraPower.Tunables.PowerMult;
		_properties.DamageTotalMult += 0.20 * mult;
		_properties.DamageDirectAdd += 0.15 * mult;
		_properties.MeleeSkill += (5 * mult).tointeger();
	}

	// Upkeep at the end of the wearer's turn. Wrapped in try/catch so a
	// single failed call can never freeze the turn sequence.
	function onTurnEnd()
	{
		try
		{
			this.applyAura();

			local actor = this.getContainer().getActor();
			local drain = this.getDrain();

			if (actor.getFatigue() + drain >= actor.getFatigueMax())
			{
				// Too exhausted to sustain the coating - it collapses.
				this.removeSelf();
				return;
			}

			actor.setFatigue(actor.getFatigue() + drain);
		}
		catch (error)
		{
			::logError("Aura Power: weapon coating upkeep failed, dropping it - " + error);
			this.removeSelf();
		}
	}

});
