// Tier II active. The warrior launches in a single aura-fed dash, sliding
// past every Zone of Control on the way, and lands a strike with bonus
// damage. Any enemy whose tile the warrior crossed mid-dash is left dazed.
this.aura_dash_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.aura_dash";
		this.m.Name = "Aura: Dash";
		this.m.Description = "Dash to a foe up to two tiles away, ignoring Zone of Control, and finish the move with a strike doing +20% damage. Any enemy the warrior crossed mid-dash is left dazed.";
		this.m.Icon = "ui/aura/aura_dash.png";
		this.m.IconDisabled = "ui/aura/aura_dash_sw.png";
		// Overlay = the small icon BB pops above the user's head on use.
		// "active_04" is the vanilla "lunge" overlay - a forward-thrust read
		// that suits a dash. We do NOT build a brand-new aura_dash brush here:
		// this mod stack refuses to register fresh brush IDs (proven over 7
		// controlled tests), so the dash VFX instead REUSES two already-
		// registered aura brushes via spawnSpriteEffect in onUse:
		//   - "aura_body_lightning" : blue lightning ring -> departure flash +
		//     mid-path afterimage streak (the dash trail).
		//   - "heavenbreaker_strike": blue aura column/blast -> landing impact.
		// Both fall back to the universal "aura_body_glow" if missing.
		this.m.Overlay = "active_04";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 235;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsAttack = true;
		this.m.IsWeaponSkill = true;
		this.m.IsRanged = false;
		this.m.IsDoingForwardMove = true;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		// Exclude from attacks-of-opportunity - this is a 6-AP charge-and-strike
		// active, never a free swing on a fleeing enemy (same fix as Heavenbreaker,
		// 2026-06-13).
		this.m.IsIgnoredAsAOO = true;
		this.m.DirectDamageMult = 0.2;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.HitChanceBonus = 5;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		// Replace vanilla damage lines with the +20% combined value.
		for (local i = ret.len() - 1; i >= 0; i = --i)
		{
			local entry = ret[i];
			if (!("icon" in entry)) continue;
			if (entry.icon == "ui/icons/regular_damage.png"
				|| entry.icon == "ui/icons/armor_damage.png")
				ret.remove(i);
		}
		local pos = this.Const.UI.Color.PositiveValue;
		local minD = 0, maxD = 0;
		try
		{
			local p = this.getContainer().buildPropertiesForUse(this, null);
			minD = this.Math.floor(p.DamageRegularMin * p.DamageRegularMult * p.DamageTotalMult * p.MeleeDamageMult);
			maxD = this.Math.floor(p.DamageRegularMax * p.DamageRegularMult * p.DamageTotalMult * p.MeleeDamageMult);
		}
		catch (e) {}
		ret.push({
			id = 10, type = "text", icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + pos + "]" + minD + "[/color] - [color=" + pos + "]" + maxD + "[/color] damage on landing"
		});
		ret.push({
			id = 11, type = "text", icon = "ui/icons/special.png",
			text = "Ignores Zones of Control while dashing"
		});
		ret.push({
			id = 12, type = "text", icon = "ui/icons/special.png",
			text = "Dazes any enemy the warrior crossed mid-dash"
		});
		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
			return false;
		local target = _targetTile.getEntity();
		if (target == null) return false;
		local actor = this.m.Container.getActor();
		if (target.isAlliedWith(actor)) return false;
		return true;
	}

	// +20% damage on the dash strike itself. Applied whenever properties are
	// built for THIS skill - including the tooltip preview - so the displayed
	// damage range matches what the strike will actually inflict.
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill != null && _skill.getID() == this.m.ID)
		{
			_properties.DamageTotalMult *= 1.2;
		}
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		if (target == null) return false;

		local userTile = _user.getTile();

		// Land on a tile adjacent to the target, in the direction from the user.
		local landingTile = null;
		try
		{
			local dirToTarget = userTile.getDirectionTo(_targetTile);
			// Walk one tile back from the target along the dir we came from.
			local oppositeDir = (dirToTarget + 3) % 6;
			if (_targetTile.hasNextTile(oppositeDir))
			{
				local cand = _targetTile.getNextTile(oppositeDir);
				if (cand != null
					&& !cand.IsOccupiedByActor
					&& cand.Type != this.Const.Tactical.TerrainType.Impassable)
					landingTile = cand;
			}
		}
		catch (e) {}

		// Daze every enemy the dash passes through (the tile we would have
		// stepped THROUGH if landingTile != userTile's neighbour).
		try
		{
			if (landingTile != null && landingTile.ID != userTile.ID)
			{
				// In a 2-range dash, the brother crosses ONE intermediate tile
				// between userTile and landingTile.
				local dist = userTile.getDistanceTo(landingTile);
				if (dist >= 2)
				{
					local midDir = userTile.getDirectionTo(landingTile);
					if (userTile.hasNextTile(midDir))
					{
						local mid = userTile.getNextTile(midDir);
						if (mid != null && mid.IsOccupiedByActor)
						{
							local e = mid.getEntity();
							if (e != null && e.isAlive() && !e.isAlliedWith(_user))
							{
								if (!e.getSkills().hasSkill("effects.dazed"))
									e.getSkills().add(::new("scripts/skills/effects/dazed_effect"));
							}
						}
					}
				}
			}
		}
		catch (error)
		{
			::logError("Aura Power: Aura Dash daze pass-through - " + error);
		}

		// Aura streak/afterimage along the dash path + landing burst. Spawned
		// BEFORE we teleport so the departure flash reads at the tile we leave
		// and the landing burst at the tile we arrive on. All sprites are
		// tile-attached, so they survive the actor move and any kill on the
		// strike that follows.
		try { this.playDashVFX(userTile, landingTile); } catch (e) {}

		// Move the warrior to the landing tile (ignoring ZoC simply means we
		// teleport into place rather than walking and triggering Attacks of
		// Opportunity along the way).
		if (landingTile != null)
		{
			try { _user.setTile(landingTile); } catch (e) {}
		}

		// Strike. attackEntity reads our DamageTotalMult bump and the weapon's
		// own damage / hit chance.
		this.attackEntity(_user, target);
		return true;
	}

	// Dash VFX. Three beats, all using EXISTING already-registered aura
	// brushes (no new brush IDs - this stack won't register them):
	//   Phase 1 (t=0)    departure flash at the tile we leave - a blue
	//                    lightning ring snapping outward.
	//   Phase 2 (t~70ms) afterimage streak on the tile crossed mid-dash
	//                    (only on a true 2-tile dash), a quicker, fainter ring.
	//   Phase 3 (t~120ms) landing burst at the destination - the heavenbreaker
	//                    aura column flashes as the warrior slams down.
	// Scheduled callbacks rebind `this` to the timer/root table, so each
	// captures everything it needs into a context table and uses ::Tactical.
	function playDashVFX( _fromTile, _landingTile )
	{
		// Pick the streak brush (lightning ring) with a glow fallback.
		local streakBrush = null;
		if (this.doesBrushExist("aura_body_lightning"))      streakBrush = "aura_body_lightning";
		else if (this.doesBrushExist("aura_body_glow"))      streakBrush = "aura_body_glow";

		// Pick the impact brush (aura column) with the same glow fallback.
		local burstBrush = null;
		if (this.doesBrushExist("heavenbreaker_strike"))     burstBrush = "heavenbreaker_strike";
		else if (this.doesBrushExist("aura_body_glow"))      burstBrush = "aura_body_glow";

		if (streakBrush == null && burstBrush == null) return;

		local blue = "#5fb0ff";   // the mod's aura-blue, matches Pulse/Coating

		// --- Phase 1: departure flash at the tile we leave ---
		// Args: (brush, color, tile, offX, offY, scaleStart, scaleEnd,
		//        stayMs, fadeInMs, fadeOutMs)
		if (streakBrush != null && _fromTile != null)
		{
			try
			{
				this.Tactical.spawnSpriteEffect(streakBrush,
					this.createColor(blue), _fromTile,
					0, 25, 1.6, 0.7, 0, 30, 200);
			}
			catch (e) { ::logError("Aura Power: Aura Dash VFX phase 1 - " + e); }
		}

		// --- Phase 2: mid-path afterimage (only on a real 2-tile dash) ---
		local midTile = null;
		try
		{
			if (_fromTile != null && _landingTile != null
				&& _landingTile.ID != _fromTile.ID
				&& _fromTile.getDistanceTo(_landingTile) >= 2)
			{
				local midDir = _fromTile.getDirectionTo(_landingTile);
				if (_fromTile.hasNextTile(midDir))
					midTile = _fromTile.getNextTile(midDir);
			}
		}
		catch (e) { midTile = null; }

		if (streakBrush != null && midTile != null)
		{
			local ctxMid = {
				brush = streakBrush,
				tile  = midTile,
				color = this.createColor(blue)
			};
			::Time.scheduleEvent(::TimeUnit.Real, 70, function ( _ctx )
			{
				try
				{
					::Tactical.spawnSpriteEffect(_ctx.brush, _ctx.color, _ctx.tile,
						0, 25, 1.3, 0.6, 0, 20, 160);
				}
				catch (e) { ::logError("Aura Power: Aura Dash VFX phase 2 - " + e); }
			}, ctxMid);
		}

		// --- Phase 3: landing impact burst at the destination ---
		if (burstBrush != null && _landingTile != null)
		{
			// body_glow is a smaller sprite than the dedicated column, so it
			// needs scaling up to read as an impact.
			local s0 = 1.5, s1 = 2.0;
			if (burstBrush == "aura_body_glow") { s0 = 2.0; s1 = 2.6; }
			local ctxLand = {
				brush = burstBrush,
				tile  = _landingTile,
				color = this.createColor("#ffffff"),
				s0 = s0,
				s1 = s1
			};
			::Time.scheduleEvent(::TimeUnit.Real, 120, function ( _ctx )
			{
				try
				{
					::Tactical.spawnSpriteEffect(_ctx.brush, _ctx.color, _ctx.tile,
						0, 40, _ctx.s0, _ctx.s1, 120, 40, 360);
				}
				catch (e) { ::logError("Aura Power: Aura Dash VFX phase 3 - " + e); }
			}, ctxLand);
		}
	}
});
