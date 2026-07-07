// Master-tier active. "One strike that shakes the battlefield."
// A single, devastating melee attack: +80% damage, half its damage cuts
// straight through armour, the target is hurled back a tile, every enemy
// next to the target is left dazed, and if the blow kills, the warrior
// recovers 30 fatigue from the surge of aura.
//
// Once per battle. Charges reset on combat end.
this.aura_heavenbreaker_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Charges = 2,           // 2 uses per battle
		MaxCharges = 2,
		Cooldown = 0,          // turns remaining before next use
		CooldownReset = 6      // turns to wait after each use
	},
	function create()
	{
		this.m.ID = "actives.aura_heavenbreaker";
		this.m.Name = "Heavenbreaker";
		this.m.Description = "One strike that shakes the battlefield. A column of aura crashes down on a single foe - devastating, half-piercing armour, knocking them a tile back, and leaving everyone next to them dazed. Slaying the target floods the warrior with 30 stamina.";
		this.m.Icon = "ui/aura/heavenbreaker.png";
		this.m.IconDisabled = "ui/aura/heavenbreaker_sw.png";
		// Overlay = the small icon BB pops up above the user's head when the
		// skill is used. "active_17" is a vanilla heavy-strike overlay that
		// reads as a "powerful blow" - close enough until the custom 12.png
		// brush can be reliably re-registered.
		this.m.Overlay = "active_17";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 240;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsAttack = true;
		this.m.IsWeaponSkill = true;
		this.m.IsRanged = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		// MUST be excluded from attacks-of-opportunity. Without this the engine's
		// getAttackOfOpportunity() can pick Heavenbreaker as the free swing when an
		// adjacent enemy flees - spending a charge + 40 fatigue on a free attack the
		// player never chose (confirmed in-game 2026-06-13, log: Heavenbreaker fired
		// on the ENEMY's turn vs a fleeing Footman). Every other aura active sets this.
		this.m.IsIgnoredAsAOO = true;
		// InjuriesOnBody / InjuriesOnHead intentionally omitted so the
		// equipped weapon's natural injury types apply.
		this.m.DirectDamageMult = 0.5;       // 50% of damage bypasses armour
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 40;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.HitChanceBonus = 10;
		// SoundOnUse / SoundOnHitHitpoints intentionally omitted - because
		// IsWeaponSkill = true the engine plays the equipped weapon's own
		// swing and hit sounds.
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		// Vanilla weapon-skill tooltips show TWO damage lines (regular HP +
		// armour-damage). Their `id` values are not stable across BB versions,
		// so we remove by ICON PATH instead - that's robust.
		for (local i = ret.len() - 1; i >= 0; i = --i)
		{
			local entry = ret[i];
			if (!("icon" in entry)) continue;
			if (entry.icon == "ui/icons/regular_damage.png"
				|| entry.icon == "ui/icons/armor_damage.png")
				ret.remove(i);
		}

		local pos = this.Const.UI.Color.PositiveValue;
		local minD = 0, maxD = 0, directMin = 0, directMax = 0;
		try
		{
			local p = this.getContainer().buildPropertiesForUse(this, null);
			minD = this.Math.floor(p.DamageRegularMin * p.DamageRegularMult * p.DamageTotalMult * p.MeleeDamageMult);
			maxD = this.Math.floor(p.DamageRegularMax * p.DamageRegularMult * p.DamageTotalMult * p.MeleeDamageMult);
			local directFrac = this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd;
			directMin = this.Math.floor(minD * directFrac);
			directMax = this.Math.floor(maxD * directFrac);
		}
		catch (e) {}

		// One combined damage line that already includes the +80% mult, the
		// +15 flat min/max, and the 50% armour-piercing portion.
		ret.push({
			id = 3,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + pos + "]" + minD + "[/color] - [color=" + pos + "]" + maxD + "[/color] damage, of which [color=" + pos + "]" + directMin + "[/color] - [color=" + pos + "]" + directMax + "[/color] ignores armour"
		});
		ret.push({
			id = 12, type = "text", icon = "ui/icons/special.png",
			text = "Knocks the target back [color=" + pos + "]1[/color] tile if possible"
		});
		ret.push({
			id = 13, type = "text", icon = "ui/icons/special.png",
			text = "Dazes every enemy next to the target"
		});
		ret.push({
			id = 14, type = "text", icon = "ui/icons/fatigue.png",
			text = "If the strike kills, recover [color=" + pos + "]30[/color] Fatigue"
		});

		// Charges + cooldown.
		local chargeText = "Charges left this battle: [color=" + pos + "]" + this.m.Charges + "[/color] / " + this.m.MaxCharges;
		if (this.m.Cooldown > 0)
			chargeText += "  [color=" + this.Const.UI.Color.NegativeValue + "]("
				+ this.m.Cooldown + " turn" + (this.m.Cooldown > 1 ? "s" : "") + " until ready)[/color]";
		else
			chargeText += "  [color=" + pos + "](ready - " + this.m.CooldownReset + "-turn cooldown after use)[/color]";
		ret.push({
			id = 15, type = "text", icon = "ui/icons/special.png",
			text = chargeText
		});
		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable()) return false;
		if (this.m.Charges <= 0) return false;
		if (this.m.Cooldown > 0) return false;
		return true;
	}

	function isHidden()
	{
		// Stay visible while on cooldown so the player can see the timer.
		return this.m.Charges <= 0;
	}

	// Tick the cooldown down at the start of the wielder's turn.
	function onTurnStart()
	{
		if (this.m.Cooldown > 0)
			this.m.Cooldown = this.m.Cooldown - 1;
	}

	// Damage modifiers stack ON TOP of whatever the equipped weapon hits for:
	//   - +80% total damage (multiplicative on weapon damage)
	//   - +15 flat min/max regular damage
	//   - +15 Melee Skill so the swing actually lands
	// onAnySkillUsed fires on every skill while the actor is using ANY skill,
	// so we gate by skill ID (more robust than reference equality across MSU's
	// hook chain, which can wrap or rebind the skill object).
	// Damage modifiers. Crucially we do NOT gate on _targetEntity != null:
	// the tooltip preview also calls buildPropertiesForUse which fires this
	// callback with _targetEntity=null, and gating there would print the raw
	// weapon damage instead of the boosted Heavenbreaker number.
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill != null && _skill.getID() == this.m.ID)
		{
			_properties.MeleeSkill += 15;
			_properties.DamageRegularMin += 15;
			_properties.DamageRegularMax += 15;
			// +80% total damage (multiplicative on weapon damage). Combined with
			// the 50% armour-ignore (skill m.DirectDamageMult) it still bites
			// through heavy armour. (Was 3.24x from a doubled 1.8*1.8 mult -
			// dialed back to a single 1.8x for balance, v1.0.2.)
			_properties.DamageTotalMult *= 1.8;
		}
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		if (target == null) return false;

		local wasAlive = target.isAlive();

		// The blue aura column drops onto the target, and the built-in
		// "split" attack effect plays on impact. The icon above the user is
		// handled by the engine via m.Overlay - no manual spawn needed.
		this.playStrikeVFX(_targetTile);
		try { this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSplit); } catch (e) {}

		// Fire the actual attack through the engine pipeline so hit chance,
		// crit, weapon damage, armour, injuries etc all behave normally.
		local hit = this.attackEntity(_user, target);

		// Always burn a charge and start the cooldown regardless of hit/miss.
		this.m.Charges = this.m.Charges - 1;
		this.m.Cooldown = this.m.CooldownReset;

		if (!hit) return true;

		// Post-attack effects only apply if the target is still on the field.
		if (target != null && target.isAlive() && target.isPlacedOnMap())
		{
			this.applyKnockback(_user, target);
			this.dazeAdjacent(_user, target.getTile());
		}
		else if (wasAlive && (target == null || !target.isAlive()))
		{
			// We just killed them - daze whoever stood next to where they were.
			this.dazeAdjacent(_user, _targetTile);
			local fat = _user.getFatigue() - 30;
			if (fat < 0) fat = 0;
			_user.setFatigue(fat);
		}

		return true;
	}

	function applyKnockback( _user, _target )
	{
		try
		{
			if (_target.getCurrentProperties().IsImmuneToKnockBackAndGrab) return;
			local userTile = _user.getTile();
			local tTile = _target.getTile();
			local dir = userTile.getDirectionTo(tTile);
			if (!tTile.hasNextTile(dir)) return;
			local back = tTile.getNextTile(dir);
			if (back == null) return;
			if (back.IsOccupiedByActor) return;
			if (back.Type == this.Const.Tactical.TerrainType.Impassable) return;
			// Use the engine's proper knockback handoff, NOT a raw setTile.
			// A raw setTile desyncs the tile<->actor/selection bookkeeping and
			// leaves the target on the map but unselectable/un-hittable until an
			// AOE re-touches it (worst on undead). Mirror vanilla push/knock_back.
			_target.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
			this.Tactical.getNavigator().teleport(_target, back, null, null, true);
		}
		catch (error)
		{
			::logError("Aura Power: Heavenbreaker knockback failed - " + error);
		}
	}

	function dazeAdjacent( _user, _aroundTile )
	{
		try
		{
			for (local i = 0; i < 6; i = ++i)
			{
				if (!_aroundTile.hasNextTile(i)) continue;
				local adj = _aroundTile.getNextTile(i);
				if (!adj.IsOccupiedByActor) continue;
				local e = adj.getEntity();
				if (e == null || !e.isAlive()) continue;
				if (e == _user) continue;
				if (e.isAlliedWith(_user)) continue;
				if (!e.getSkills().hasSkill("effects.dazed"))
					e.getSkills().add(::new("scripts/skills/effects/dazed_effect"));
			}
		}
		catch (error)
		{
			::logError("Aura Power: Heavenbreaker daze failed - " + error);
		}
	}

	// Spawn a tile-attached blue-aura column that descends onto the target.
	// Two phases:
	//   1. Big sprite high above the tile, quick flash (impression of a
	//      descent from the sky).
	//   2. After ~140 ms, an even bigger sprite at the target with a slow
	//      fade so the effect lingers even if the target died on impact.
	// Tile-attached sprites survive when the target actor is removed, so the
	// effect does NOT vanish when the strike kills.
	function playStrikeVFX( _targetTile )
	{
		try
		{
			// Brush selection. The dedicated 84.png brush is preferred;
			// fallback brushes are tinted bigger to read as a powerful blast.
			local brush = null;
			local scaleP1 = [1.4, 1.6];   // [start, end] scale of phase 1
			local scaleP2 = [1.7, 2.1];   // [start, end] scale of phase 2 (impact, bigger)
			local picked = "(none)";
			if (this.doesBrushExist("heavenbreaker_strike"))
			{
				brush = "heavenbreaker_strike";
				scaleP1 = [1.3, 1.5];
				scaleP2 = [1.6, 1.9];
				picked = "heavenbreaker_strike (84.png)";
			}
			else if (this.doesBrushExist("aura_body_glow"))
			{
				brush = "aura_body_glow";
				// body_glow sprite is smaller (256x288) - scale UP a lot.
				scaleP1 = [2.0, 2.3];
				scaleP2 = [2.5, 3.0];
				picked = "aura_body_glow (fallback)";
			}
			::logInfo("Aura Power: Heavenbreaker VFX brush = " + picked);
			if (brush == null) return;

			local tile = _targetTile;
			local color = this.createColor("#ffffff");

			// Phase 1: high above the target - quick flash.
			// Args: (brush, color, tile, offX, offY, scaleStart, scaleEnd,
			//        stayMs, fadeInMs, fadeOutMs)
			this.Tactical.spawnSpriteEffect(brush, color, tile,
				0, 220, scaleP1[0], scaleP1[1], 0, 60, 180);

			// Phase 2 (after a short beat): at the target with slow fade.
			// Inside scheduled callbacks `this` is bound to the timer/root
			// table, NOT the skill - so `self.Tactical` and `self.createColor`
			// fail with "the index does not exist". Capture everything we
			// need by reference into the context table and use the root-
			// namespace ::Tactical instead.
			local ctx = {
				brush = brush,
				tile = _targetTile,
				color = this.createColor("#ffffff"),
				s0 = scaleP2[0],
				s1 = scaleP2[1]
			};
			::Time.scheduleEvent(::TimeUnit.Real, 140, function ( _ctx )
			{
				try
				{
					::Tactical.spawnSpriteEffect(_ctx.brush, _ctx.color, _ctx.tile,
						0, 60, _ctx.s0, _ctx.s1, 400, 80, 700);
				}
				catch (e)
				{
					::logError("Aura Power: Heavenbreaker VFX phase 2 - " + e);
				}
			}, ctx);
		}
		catch (error)
		{
			::logError("Aura Power: Heavenbreaker VFX init failed - " + error);
		}
	}

	function onCombatFinished()
	{
		this.m.Charges = this.m.MaxCharges;
		this.m.Cooldown = 0;
	}

});
