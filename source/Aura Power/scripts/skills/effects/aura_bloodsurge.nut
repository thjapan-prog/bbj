// Tier III passive. Each enemy kill: -15 fatigue, +1 surge stack (capped at
// 3). Each stack adds 10% total damage. Stacks reset at end of combat.
//
// On every kill that bumps the stack, a brief blue-aura flash is wrapped
// around the warrior. The visual hijacks the actor's "miniboss" sprite
// layer with the dedicated 84.png-derived brush, then a scheduled tick
// clears it after a short fade.
this.aura_bloodsurge <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 0,
		MaxStacks = 3,
		PulseToken = 0    // bumped to invalidate stale VFX-clear ticks
	},
	function create()
	{
		this.m.ID = "effects.aura_bloodsurge";
		this.m.Name = "Blood Surge";
		this.m.Description = "Each enemy this warrior cuts down feeds the aura: -15 fatigue immediately, and a stacking +10% damage that builds up to three stacks. The stacks burn off when the battle ends.";
		this.m.Icon = "ui/aura/aura_bloodsurge.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		local pos = this.Const.UI.Color.PositiveValue;
		local lines = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/fatigue.png",
			  text = "[color=" + pos + "]-15[/color] Fatigue on every kill" },
			{ id = 4, type = "text", icon = "ui/icons/special.png",
			  text = "[color=" + pos + "]+10%[/color] damage per stack, up to [color=" + pos + "]" + this.m.MaxStacks + "[/color] stacks" }
		];
		if (this.m.Stacks > 0)
		{
			lines.push({
				id = 5, type = "text", icon = "ui/icons/special.png",
				text = "Current surge: [color=" + pos + "]" + this.m.Stacks + "[/color] / " + this.m.MaxStacks
				     + "  ([color=" + pos + "]+" + (this.m.Stacks * 10) + "%[/color] damage)"
			});
		}
		return lines;
	}

	// Damage bonus while at >=1 stack. Must live in onUpdate so it lands in
	// the actor's CurrentProperties: that is what the character screen's
	// damage stat displays, and what the real damage calc reads. The old
	// onAnySkillUsed version edited a per-use properties copy instead -
	// players saw Killing Frenzy / Weapon Coating move the stat while
	// Blood Surge stacks visibly did nothing. Additive on DamageTotalMult,
	// the same idiom those two use, so all three combine consistently.
	function onUpdate( _properties )
	{
		if (this.m.Stacks > 0)
			_properties.DamageTotalMult += 0.10 * this.m.Stacks;
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		try
		{
			local actor = this.getContainer().getActor();
			if (actor == null) return;

			// Refund stamina.
			local newFat = actor.getFatigue() - 15;
			if (newFat < 0) newFat = 0;
			actor.setFatigue(newFat);

			// Bump the stack counter.
			if (this.m.Stacks < this.m.MaxStacks)
				this.m.Stacks = this.m.Stacks + 1;

			// Trigger the body-attached blue-aura flash.
			this.playSurgeAura(actor);
		}
		catch (error)
		{
			::logError("Aura Power: Blood Surge onTargetKilled - " + error);
		}
	}

	// Apply the 84.png aura on the actor's miniboss layer for ~1 second.
	function playSurgeAura( _actor )
	{
		if (_actor == null || !_actor.hasSprite("miniboss")) return;

		local brush = null;
		if (this.doesBrushExist("aura_blood_surge"))     brush = "aura_blood_surge";
		else if (this.doesBrushExist("heavenbreaker_strike")) brush = "heavenbreaker_strike";
		else if (this.doesBrushExist("aura_body_glow"))  brush = "aura_body_glow";
		if (brush == null) return;

		local glow = _actor.getSprite("miniboss");
		glow.setBrush(brush);
		glow.Color = this.createColor("#5fb0ff");
		glow.Saturation = 3.0;
		glow.Alpha = 255;
		glow.Scale = 1.0;
		glow.Visible = true;
		_actor.setSpriteOffset("miniboss", this.createVec(0, 40));

		// Cancel any previous fade-out chain and start a new one.
		this.m.PulseToken = this.m.PulseToken + 1;
		local ctx = { skill = this, actor = _actor, token = this.m.PulseToken, step = 0, total = 30 };
		::Time.scheduleEvent(::TimeUnit.Real, 28, this.surgeAuraTick.bindenv(this), ctx);
	}

	function surgeAuraTick( _ctx )
	{
		try
		{
			if (_ctx.skill.m.PulseToken != _ctx.token) return;   // stale
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

			// Hold for first 50%, fade for last 50%.
			local prog = _ctx.step.tofloat() / _ctx.total.tofloat();
			local alpha = 1.0;
			if (prog > 0.5)
				alpha = 1.0 - (prog - 0.5) / 0.5;
			glow.Alpha = (alpha * 255.0).tointeger();

			::Time.scheduleEvent(::TimeUnit.Real, 28, this.surgeAuraTick.bindenv(this), _ctx);
		}
		catch (e) {}
	}

	function onCombatFinished()
	{
		this.m.Stacks = 0;
		// Invalidate any in-flight VFX tick chain NOW. onCombatFinished runs
		// before the tactical entities are torn down; the battle's FINAL kill
		// otherwise leaves a ~840ms Real-timer chain that keeps firing through
		// the battle-end loading screen and pokes a destroyed actor sprite -
		// a native crash Squirrel try/catch cannot intercept.
		this.m.PulseToken = this.m.PulseToken + 1;
	}
});
