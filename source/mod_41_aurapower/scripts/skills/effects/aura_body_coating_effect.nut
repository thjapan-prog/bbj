// The active half of Aura: Body Coating. Reduces incoming damage and drains
// stamina each turn. It is a toggle - it stays on until the player switches
// it off, the warrior runs out of stamina, or the battle ends.
//
// Visually it wraps the warrior in a golden energy aura. This is done by
// hijacking the "miniboss" sprite layer - the glow champions have - which
// every actor owns but ordinary warriors never use. We point it at the
// baked "aura_body_glow" sprite. If that layer is unavailable, it falls
// back to a gold tint on the body sprites.
this.aura_body_coating_effect <- this.inherit("scripts/skills/skill", {
	m = {
		// True if onAdded used the miniboss-layer glow (false = tint fallback).
		UsedGlow = false,
		// Pulse animation state - a "breathing" sine wave on the glow's Alpha.
		// PulseToken is bumped on every onAdded / onRemoved so that any tick
		// callback still in flight from a previous activation aborts itself
		// when it sees a stale token. This is the standard pattern in the
		// game because Time.scheduleEvent has no cancel API.
		PulseToken = 0,
		PulseStartMs = 0,
		// Tunables for the breathing pulse. Period ~1.2s, baseline 0.85,
		// amplitude 0.15 -> alpha swings 0.70..1.00 (never goes dark),
		// matching the reference clip 44.mp4 (brightness 23..34, ~30% delta).
		PulsePeriodMs = 1200,
		PulseBaseline = 0.85,
		PulseAmplitude = 0.15,
		PulseTickMs = 60
	},
	function create()
	{
		this.m.ID = "effects.aura_body_coating";
		this.m.Name = "Aura: Body Coating";
		this.m.Description = "The body is sheathed in aura, blunting incoming blows.";
		this.m.Icon = "ui/aura/body_coating.png";
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
	// off for free, (3,20) once gone so it must be paid for to switch on.
	function setSkillCost( _ap, _fat )
	{
		local s = this.getContainer().getSkillByID("actives.aura_body_coating");
		if (s != null)
		{
			s.m.ActionPointCost = _ap;
			s.m.FatigueCost = _fat;
		}
	}

	// Wrap the warrior in a lightning aura by hijacking the unused "miniboss"
	// glow layer. Prefers the new "aura_body_lightning" brush (11.png-derived
	// crackling-lightning overlay); falls back to the original blue-flame
	// "aura_body_glow" if the lightning brush is not registered.
	// Returns true on success.
	function showGlow()
	{
		local actor = this.getContainer().getActor();
		if (!actor.hasSprite("miniboss")) return false;

		local brush = null;
		local scale = 0.9;
		if (this.doesBrushExist("aura_body_lightning"))
		{
			brush = "aura_body_lightning";
			scale = 1.0;
		}
		else if (this.doesBrushExist("aura_body_glow"))
		{
			brush = "aura_body_glow";
			scale = 0.9;
		}
		if (brush == null) return false;

		local glow = actor.getSprite("miniboss");
		glow.setBrush(brush);
		glow.Color = this.createColor("#ffffff");
		glow.Scale = scale;
		glow.Visible = true;
		// Start at full brightness; the pulse tick modulates from here.
		glow.Alpha = 255;
		// Shift the aura up so it frames the bust, not the legs.
		actor.setSpriteOffset("miniboss", this.createVec(0, 60));
		return true;
	}

	function hideGlow()
	{
		local actor = this.getContainer().getActor();
		if (actor.hasSprite("miniboss"))
		{
			local glow = actor.getSprite("miniboss");
			glow.Visible = false;
			glow.Alpha = 255; // restore default so other code paths see it clean
		}
	}

	// Compute one pulse step and schedule the next, as long as our token is
	// still the live one. The token guards against stale callbacks firing
	// after the effect has been removed and re-added.
	function pulseTick( _ctx )
	{
		// _ctx = { token, skill }. We deliberately keep no closure refs.
		local skill = _ctx.skill;
		if (skill == null) return;
		if (skill.m.PulseToken != _ctx.token) return; // stale - abort
		if (!skill.m.UsedGlow) return;

		local container = skill.getContainer();
		if (container == null) return;
		local actor = container.getActor();
		if (actor == null || !actor.isAlive() || !actor.hasSprite("miniboss")) return;

		local glow = actor.getSprite("miniboss");
		if (!glow.Visible)
		{
			// Effect is being torn down or sprite was hidden externally - bail.
			return;
		}

		local now = ::Time.getRealTime() * 1000.0;
		local elapsed = now - skill.m.PulseStartMs;
		// fmod via floor: phase = (elapsed / period) - floor(elapsed / period)
		local periodF = skill.m.PulsePeriodMs.tofloat();
		local cycles = elapsed / periodF;
		local phase = cycles - ::Math.floor(cycles); // 0..1
		// We avoid Math.sin (not consistently available in BB Squirrel).
		// Build a smoothed wave from a triangle: tri in [0,1], then apply the
		// cubic smoothstep 3t^2 - 2t^3, then remap to [-1,1]. This produces
		// a curve visually indistinguishable from a sine for breathing FX.
		local tri = phase < 0.5 ? phase * 2.0 : (1.0 - phase) * 2.0; // 0..1..0
		local sm = tri * tri * (3.0 - 2.0 * tri);                    // smoothstep
		local s = sm * 2.0 - 1.0;                                    // -1..1
		local alpha01 = skill.m.PulseBaseline + skill.m.PulseAmplitude * s;
		if (alpha01 < 0.0) alpha01 = 0.0;
		if (alpha01 > 1.0) alpha01 = 1.0;
		glow.Alpha = (alpha01 * 255.0).tointeger();

		// Re-arm the next tick. Pass the same context object by reference;
		// the token check at the top guarantees old chains die off.
		::Time.scheduleEvent(::TimeUnit.Real, skill.m.PulseTickMs,
			skill.pulseTick.bindenv(skill), _ctx);
	}

	function startPulse()
	{
		this.m.PulseToken += 1;
		this.m.PulseStartMs = ::Time.getRealTime() * 1000.0;
		local ctx = { token = this.m.PulseToken, skill = this };
		::Time.scheduleEvent(::TimeUnit.Real, this.m.PulseTickMs,
			this.pulseTick.bindenv(this), ctx);
	}

	function stopPulse()
	{
		// Invalidate any in-flight callback by bumping the token.
		this.m.PulseToken += 1;
	}

	// Fallback: gold tint on the body sprites.
	function tintBody( _on )
	{
		local actor = this.getContainer().getActor();
		foreach (name in ["body", "head", "hair", "beard", "tattoo_body", "tattoo_head"])
		{
			if (!actor.hasSprite(name))
				continue;
			local spr = actor.getSprite(name);
			spr.Color = this.createColor(_on ? "#ffd24a" : "#ffffff");
			spr.Saturation = _on ? 2.5 : 1.0;
		}
	}

	function onAdded()
	{
		try
		{
			this.m.UsedGlow = this.showGlow();
			if (!this.m.UsedGlow)
				this.tintBody(true);
			else
				this.startPulse(); // breathing glow only when the layer is live
		}
		catch (error)
		{
			::logError("Aura Power: body aura onAdded error - " + error);
		}
		// While the coating is on, switching it off is free.
		this.setSkillCost(0, 0);
	}

	function onRemoved()
	{
		try
		{
			// Stop the pulse FIRST so no tick races against sprite teardown.
			this.stopPulse();
			if (this.m.UsedGlow)
				this.hideGlow();
			else
				this.tintBody(false);
		}
		catch (error)
		{
			::logError("Aura Power: body aura onRemoved error - " + error);
		}
		// Restore the activation cost so the skill can be switched on again.
		this.setSkillCost(3, 20);
	}

	function onUpdate( _properties )
	{
		local mult = ::AuraPower.Tunables.PowerMult;
		local red = this.Math.minf(0.6, 0.18 * mult);
		_properties.DamageReceivedTotalMult *= (1.0 - red);
		_properties.MeleeDefense += 5;
		_properties.RangedDefense += 5;
	}

	// Guaranteed carry-over purge - shares the city Arena bug that aura_sense
	// already patches. The Arena's back-to-back round flow can SKIP the
	// after-battle sweep, so a coating left toggled ON at the end of one bout
	// survives into the next (drain keeps ticking, the glow lingers, and the
	// toggle active reads "on" so it can't be re-cast cleanly).
	//
	// A freshly toggled-on coating is ALWAYS added mid-combat, i.e. AFTER
	// onCombatStarted has already fired for that fight. Therefore any instance
	// that RECEIVES onCombatStarted is by definition a stale leftover from a
	// previous battle and must strip itself before the player's first turn.
	// removeSelf -> onRemoved stops the pulse, hides the glow, and restores the
	// activation cost.
	function onCombatStarted()
	{
		try { this.removeSelf(); }
		catch (e) { ::logError("Aura Power: body coating stale-purge failed - " + e); }
	}

	// IsRemovedAfterBattle does call onRemoved/stopPulse during cleanup, but
	// onCombatFinished fires EARLIER - before actor teardown - so the 60ms
	// breathing tick is guaranteed dead before the battle-end transition can
	// destroy the sprite it writes to.
	function onCombatFinished()
	{
		this.stopPulse();
	}

	// Upkeep at the end of the wearer's turn. Wrapped in try/catch so a
	// single failed call can never freeze the turn sequence.
	function onTurnEnd()
	{
		try
		{
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
			::logError("Aura Power: body coating upkeep failed, dropping it - " + error);
			this.removeSelf();
		}
	}

});
