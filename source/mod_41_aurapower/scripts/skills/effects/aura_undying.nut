// Tier IV passive. Once per battle, the moment the warrior would drop to
// 1 HP (the would-be-fatal hit) the aura refuses it: HP snaps right back
// up to 25% Max, fatigue resets to 0, every negative status (stun, daze,
// bleed, poison, disarm, stagger) is wiped, and every enemy within two
// tiles is shoved into Fleeing.
//
// The HP snap itself is done by the actor.kill / actor.setHitpoints hooks
// in mod_aurapower.nut. This skill only handles the *secondary* effects
// (fatigue reset, status cleanup, fleeing aura, crown VFX).
this.aura_undying <- this.inherit("scripts/skills/skill", {
	m = {
		HasFiredThisBattle = false,
		PulseToken = 0
	},
	function create()
	{
		this.m.ID = "effects.aura_undying";
		this.m.Name = "Undying Will";
		this.m.Description = "The will of a king does not break. Once per battle, the moment this warrior's HP would drop to 1 the aura snaps them back up to 25% Max - fatigue clears, stun, daze, bleeding and poison fade, and the kingly aura sends every enemy within two tiles fleeing.";
		this.m.Icon = "ui/aura/aura_undying.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		local pos = this.Const.UI.Color.PositiveValue;
		local neg = this.Const.UI.Color.NegativeValue;
		local lines = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/health.png",
			  text = "At the killing blow: HP snaps to [color=" + pos + "]25%[/color] Max" },
			{ id = 4, type = "text", icon = "ui/icons/fatigue.png",
			  text = "Fatigue resets to [color=" + pos + "]0[/color]" },
			{ id = 5, type = "text", icon = "ui/icons/special.png",
			  text = "Clears stun, daze, bleed, poison" },
			{ id = 6, type = "text", icon = "ui/icons/bravery.png",
			  text = "Every enemy within 2 tiles is forced into Fleeing" }
		];
		if (this.m.HasFiredThisBattle)
		{
			lines.push({
				id = 7, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + neg + "]Already triggered this battle[/color]"
			});
		}
		else
		{
			lines.push({
				id = 7, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + pos + "]Ready[/color] - 1 use per battle"
			});
		}
		return lines;
	}

	// Called by the actor hooks in mod_aurapower.nut the moment a player
	// brother's HP would drop to 0 (or kill() is invoked directly on them).
	// The HOOK is responsible for:
	//   - flipping HasFiredThisBattle BEFORE calling this function
	//   - writing the 1% HP value directly to m.Hitpoints
	// We do NOT re-check the flag here on purpose - the hook gates it -
	// and we do NOT touch HP. We only run the secondary effects: fatigue
	// reset, status cleanup, fleeing aura, crown VFX.
	function triggerReviveEffects()
	{
		local actor = this.getContainer().getActor();
		if (actor == null) return;

		try
		{
			actor.setFatigue(0);
			try { actor.setDirty(true); } catch (e2) {}
		}
		catch (e)
		{
			::logError("Aura Power: Undying reset fatigue - " + e);
		}

		// Strip negative status effects.
		try
		{
			local container = actor.getSkills();
			foreach (id in ["effects.stunned", "effects.dazed", "effects.bleeding",
				"effects.poisoned", "effects.disarmed", "effects.staggered",
				"effects.net", "effects.web", "effects.rooted",
				"effects.aura_ember"])
			{
				if (container.hasSkill(id))
					container.removeByID(id);
			}
		}
		catch (e) {}

		// Note: NO toggle-coating reset here. With the new setHitpoints
		// clamp, the brother never dies and BB's death cleanup never runs,
		// so the toggle effects (Weapon Coating, Body Coating, Sense, etc.)
		// stay perfectly coherent.

		// The king's aura erupts: every enemy within 2 tiles is hurled into
		// Fleeing. RESTORED 2026-06-13 (user wants the morale-shatter back). This
		// is now safe to do again because (a) survival is engine-native via Nine
		// Lives so the AI stays online, and (b) the Abyssal Crown rally-BLOCK was
		// removed - so fled enemies break, then rally their nerve and re-engage,
		// exactly the "before" feel, instead of cowering forever.
		try
		{
			local origin = actor.getTile();
			local seen = {};
			seen[origin.ID] <- true;
			local frontier = [origin];
			for (local depth = 0; depth < 2; depth = ++depth)
			{
				local next_frontier = [];
				foreach (t in frontier)
				{
					for (local i = 0; i < 6; i = ++i)
					{
						if (!t.hasNextTile(i)) continue;
						local nt = t.getNextTile(i);
						if (nt.ID in seen) continue;
						seen[nt.ID] <- true;
						next_frontier.push(nt);
						if (nt.IsOccupiedByActor)
						{
							local e = nt.getEntity();
							if (e != null && e.isAlive() && !e.isAlliedWith(actor))
							{
								try { e.setMoraleState(this.Const.MoraleState.Fleeing); } catch (e2) {}
							}
						}
					}
				}
				frontier = next_frontier;
			}
		}
		catch (e) {}

		// Crown VFX above the actor's head.
		this.playCrownAura(actor);
	}

	function playCrownAura( _actor )
	{
		if (_actor == null || !_actor.hasSprite("miniboss")) return;

		local brush = null;
		if (this.doesBrushExist("aura_undying_crown"))     brush = "aura_undying_crown";
		else if (this.doesBrushExist("aura_blood_surge"))  brush = "aura_blood_surge";
		else if (this.doesBrushExist("aura_body_glow"))    brush = "aura_body_glow";
		if (brush == null) return;

		local glow = _actor.getSprite("miniboss");
		glow.setBrush(brush);
		glow.Color = this.createColor("#7ec8ff");
		glow.Saturation = 3.5;
		glow.Alpha = 255;
		glow.Scale = 1.2;
		glow.Visible = true;
		_actor.setSpriteOffset("miniboss", this.createVec(0, 120));

		this.m.PulseToken = this.m.PulseToken + 1;
		local ctx = { skill = this, actor = _actor, token = this.m.PulseToken, step = 0, total = 50 };
		::Time.scheduleEvent(::TimeUnit.Real, 30, this.crownAuraTick.bindenv(this), ctx);
	}

	function crownAuraTick( _ctx )
	{
		try
		{
			if (_ctx.skill.m.PulseToken != _ctx.token) return;
			local actor = _ctx.actor;
			if (actor == null || !actor.hasSprite("miniboss")) return;
			local glow = actor.getSprite("miniboss");

			_ctx.step = _ctx.step + 1;
			if (_ctx.step >= _ctx.total)
			{
				glow.Visible = false;
				glow.Alpha = 255;
				glow.Scale = 1.0;
				glow.Saturation = 1.0;
				glow.Color = this.createColor("#ffffff");
				actor.setSpriteOffset("miniboss", this.createVec(0, 0));
				return;
			}

			local prog = _ctx.step.tofloat() / _ctx.total.tofloat();
			local alpha = 1.0;
			if (prog > 0.65)
				alpha = 1.0 - (prog - 0.65) / 0.35;
			glow.Alpha = (alpha * 255.0).tointeger();

			::Time.scheduleEvent(::TimeUnit.Real, 30, this.crownAuraTick.bindenv(this), _ctx);
		}
		catch (e) {}
	}

	function onCombatFinished()
	{
		this.m.HasFiredThisBattle = false;
		// Invalidate any in-flight crown-VFX tick chain (~1.5s) so no
		// Real-timer tick outlives the battle and touches a torn-down actor
		// sprite during the world transition - a native crash try/catch
		// cannot intercept.
		this.m.PulseToken = this.m.PulseToken + 1;
	}
});
