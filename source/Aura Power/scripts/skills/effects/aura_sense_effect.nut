// Temporary status effect from Aura: Sense. Grants the defensive / initiative
// boost for 2 of the wearer's turns, then collapses.
//
// VFX (1.15.3+): a floating blue lightning eye hovers above the warrior's
// head per source artwork 441.png / 442.png. The eye is rendered on the
// "miniboss" sprite layer (champion-glow layer that ordinary warriors do
// not use). Aura Body Coating uses the SAME layer for its blue lightning
// body-wrap, so if both effects are active simultaneously Aura Sense
// takes the layer for its 2-turn duration and onRemoved hands it back to
// Body Coating's showGlow / startPulse if that effect is still around.
//
// Gentle breathing pulse (alpha 0.80..1.00, ~1s cycle) - calmer than the
// body coating's pulse to match the "watchful eye" feel.
this.aura_sense_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		UsedGlow = false,
		// Pulse animation state. Token-invalidation pattern - same as
		// aura_body_coating_effect - because Time.scheduleEvent has no
		// cancel API. See memory note battle-brothers-body-aura-vfx-recipe.
		PulseToken = 0,
		PulseStartMs = 0,
		// Brighter pulse range (v1.15.12): baseline 0.95 / amplitude 0.05
		// gives an alpha sweep of 0.90..1.00 - the eye sits at 90-100%
		// opacity throughout, much more visible than the previous 0.80..1.00
		// sweep. Combined with the source PNG's 0.95 bake-time opacity
		// this lands at roughly 85-95% on-screen.
		PulsePeriodMs = 1000,
		PulseBaseline = 0.95,
		PulseAmplitude = 0.05,
		PulseTickMs = 60
	},
	function create()
	{
		this.m.ID = "effects.aura_sense";
		this.m.Name = "Aura: Sense";
		this.m.Description = "The warrior\'s aura is fanned outward into perception. Defence and initiative are sharpened, the press of nearby enemies does not weigh on them, and hidden foes flicker into view.";
		this.m.Icon = "ui/aura/aura_sense.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/special.png",
			  text = "Turns remaining: [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color]" }
		];
	}

	function onUpdate( _properties )
	{
		// Plain bonuses only - assigning unknown slots on the typed
		// properties object can silently abort onUpdate and the buff would
		// then never visibly take hold. We compensate for the missing
		// "ignore surround penalty" effect with a generous Ranged Defence
		// bump so the warrior reads the field equally well from any angle.
		_properties.MeleeDefense += 15;
		_properties.RangedDefense += 15;
		_properties.Initiative += 10;
	}

	// Paint the floating lightning eye via the miniboss layer hijack.
	// Returns true on success so onAdded can decide whether to start the
	// pulse tick.
	//
	// TEMPORARY for v1.15.4: scale cranked to 2.0 and offset zeroed so the
	// eye is unmissably large and centred on the brother - this is the
	// "find the VFX" pass. Once the user confirms it appears, we tune
	// back to scale ~0.65 and offset (0, 180) to match 442.png.
	function showEye()
	{
		local actor = this.getContainer().getActor();
		if (actor == null)
		{
			::logInfo("Aura Sense VFX: actor is null, cannot show");
			return false;
		}
		local hasMb = actor.hasSprite("miniboss");
		local hasBrush = this.doesBrushExist("aura_sense_eye");
		::logInfo("Aura Sense VFX: showEye for " + actor.getName()
			+ " - hasSprite(miniboss)=" + hasMb
			+ ", doesBrushExist(aura_sense_eye)=" + hasBrush);

		if (!hasMb) return false;

		// v1.15.10: HIJACK the existing brush ID "icon_lute_aura"
		// (jester's lute weapon icon - extremely rare). The art in
		// the atlas at the lute slot has been REPLACED with the eye
		// (441.png-derived), but the brush ID is unchanged so BB
		// already has it registered. Trying NEW brush IDs in this
		// stack repeatedly failed across v1.15.3..v1.15.9 - the
		// engine silently rejects any brush ID it didn't see at
		// initial scan. Hijacking an existing ID is the only path
		// that works.
		local useBrush = "icon_lute_aura";
		local primaryExists = this.doesBrushExist("icon_lute_aura");
		::logInfo("Aura Sense VFX: doesBrushExist(icon_lute_aura)=" + primaryExists);
		if (!primaryExists)
		{
			::logInfo("Aura Sense VFX: icon_lute_aura unexpectedly missing - "
				+ "falling back to aura_body_glow.");
			if (this.doesBrushExist("aura_body_glow"))
				useBrush = "aura_body_glow";
			else return false;
		}

		local glow = actor.getSprite("miniboss");
		glow.setBrush(useBrush);
		glow.Color = this.createColor("#ffffff");
		glow.Scale = 0.7;
		glow.Visible = true;
		glow.Alpha = 255;
		// Lift the eye above the head per reference 442.png. Y positive = up.
		actor.setSpriteOffset("miniboss", this.createVec(0, 180));
		::logInfo("Aura Sense VFX: setBrush(" + useBrush + ") on miniboss layer "
			+ "(scale=0.7, offset(0,180)).");

		::logInfo("Aura Sense VFX: applied to " + actor.getName()
			+ " - Scale=" + glow.Scale
			+ ", Visible=" + glow.Visible
			+ ", Alpha=" + glow.Alpha);
		return true;
	}

	function hideEye()
	{
		local actor = this.getContainer().getActor();
		if (!actor.hasSprite("miniboss")) return;
		local glow = actor.getSprite("miniboss");
		glow.Visible = false;
		glow.Alpha = 255;

		// Hand the miniboss layer back to Aura: Body Coating if it is
		// still active on this brother. Body Coating's showGlow rebinds
		// the brush, scale, offset etc., and startPulse re-arms the
		// breathing tick (bumping its own PulseToken to invalidate any
		// stale callbacks that might still be in flight).
		local c = this.getContainer();
		if (c != null && c.hasSkill("effects.aura_body_coating"))
		{
			try
			{
				local bc = c.getSkillByID("effects.aura_body_coating");
				if (bc != null && ("UsedGlow" in bc.m) && bc.m.UsedGlow)
				{
					bc.showGlow();
					bc.startPulse();
				}
			}
			catch (e) {}
		}
	}

	// Smoothstep-driven breathing pulse - same algorithm as
	// aura_body_coating_effect.pulseTick. We don't depend on Math.sin
	// (not consistently available in BB Squirrel).
	function pulseTick( _ctx )
	{
		local skill = _ctx.skill;
		if (skill == null) return;
		if (skill.m.PulseToken != _ctx.token) return;   // stale - abort
		if (!skill.m.UsedGlow) return;

		local container = skill.getContainer();
		if (container == null) return;
		local actor = container.getActor();
		if (actor == null || !actor.isAlive() || !actor.hasSprite("miniboss")) return;

		local glow = actor.getSprite("miniboss");
		if (!glow.Visible) return;

		local now = ::Time.getRealTime() * 1000.0;
		local elapsed = now - skill.m.PulseStartMs;
		local periodF = skill.m.PulsePeriodMs.tofloat();
		local cycles = elapsed / periodF;
		local phase = cycles - ::Math.floor(cycles);
		local tri = phase < 0.5 ? phase * 2.0 : (1.0 - phase) * 2.0;
		local sm = tri * tri * (3.0 - 2.0 * tri);
		local s = sm * 2.0 - 1.0;
		local alpha01 = skill.m.PulseBaseline + skill.m.PulseAmplitude * s;
		if (alpha01 < 0.0) alpha01 = 0.0;
		if (alpha01 > 1.0) alpha01 = 1.0;
		glow.Alpha = (alpha01 * 255.0).tointeger();

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
		this.m.PulseToken += 1;
	}

	function onAdded()
	{
		::logInfo("Aura Sense VFX: onAdded fired");
		try
		{
			local c = this.getContainer();
			if (c != null && c.hasSkill("effects.aura_body_coating"))
			{
				::logInfo("Aura Sense VFX: Body Coating active, halting its pulse");
				try
				{
					local bc = c.getSkillByID("effects.aura_body_coating");
					if (bc != null) bc.stopPulse();
				}
				catch (e) {}
			}

			this.m.UsedGlow = this.showEye();
			::logInfo("Aura Sense VFX: showEye returned " + this.m.UsedGlow);
			if (this.m.UsedGlow) this.startPulse();
		}
		catch (e)
		{
			::logError("Aura Power: Aura Sense onAdded - " + e);
		}
	}

	function onRemoved()
	{
		try
		{
			this.stopPulse();
			if (this.m.UsedGlow) this.hideEye();
		}
		catch (e)
		{
			::logError("Aura Power: Aura Sense onRemoved - " + e);
		}
	}

	// Wrapped in try/catch so a single failed call can never freeze the turn
	// sequence (matches the sibling coating effects).
	function onTurnEnd()
	{
		try
		{
			this.m.TurnsLeft = this.m.TurnsLeft - 1;
			if (this.m.TurnsLeft <= 0)
				this.removeSelf();
		}
		catch (error)
		{
			::logError("Aura Power: Aura Sense upkeep failed, dropping it - " + error);
			try { this.removeSelf(); } catch (e) {}
		}
	}

	// Guaranteed carry-over purge. IsRemovedAfterBattle is the intended
	// cleanup, but the city Arena's back-to-back round flow can SKIP that
	// after-battle sweep (confirmed in-game 2026-06-13: a Sense cast on the
	// last round of one Arena bout survived into the next bout - the active's
	// isUsable() blocks while effects.aura_sense is present, so the button
	// went permanently grey and Sense could never be recast).
	//
	// A freshly cast Sense is ALWAYS added mid-combat, i.e. AFTER
	// onCombatStarted has already fired for that fight. Therefore any effect
	// instance that receives onCombatStarted is by definition a stale leftover
	// from a previous battle and must be stripped before the player's first
	// turn. onCombatStarted is a reliable hook in this stack (Reforged's own
	// temporary effects use it). removeSelf -> onRemoved also clears the eye
	// VFX and hands the miniboss layer back to Body Coating if needed.
	function onCombatStarted()
	{
		try { this.removeSelf(); }
		catch (e) { ::logError("Aura Power: Aura Sense stale-purge failed - " + e); }
	}

	// IsRemovedAfterBattle does call onRemoved/stopPulse during cleanup, but
	// onCombatFinished fires EARLIER - before actor teardown - so the 60ms
	// eye-pulse tick is guaranteed dead before the battle-end transition can
	// destroy the sprite it writes to.
	function onCombatFinished()
	{
		this.stopPulse();
	}
});
