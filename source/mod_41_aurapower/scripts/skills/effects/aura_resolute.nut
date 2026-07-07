// Tier II passive. Carried at all times. The first time the warrior's
// morale would drop into Wavering during a battle, the aura swells back to
// stop it: their resolve snaps back, their fatigue eases, and their swing
// sharpens for two turns. Only triggers once per battle.
this.aura_resolute <- this.inherit("scripts/skills/skill", {
	m = {
		HasFiredThisBattle = false
	},
	function create()
	{
		this.m.ID = "effects.aura_resolute";
		this.m.Name = "Resolute Aura";
		this.m.Description = "A warrior whose aura has been forged through trial does not break easily. Once per battle, the first time their morale would falter, the aura answers - resolve floods back, fatigue eases, and their swing sharpens.";
		this.m.Icon = "ui/aura/aura_resolute.png";
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
			{ id = 3, type = "text", icon = "ui/icons/bravery.png",
			  text = "On first wavering: snap back to Steady" },
			{ id = 4, type = "text", icon = "ui/icons/fatigue.png",
			  text = "Recover [color=" + pos + "]15[/color] Fatigue" },
			{ id = 5, type = "text", icon = "ui/icons/melee_skill.png",
			  text = "[color=" + pos + "]+10[/color] Melee Skill for 2 turns" }
		];
		if (this.m.HasFiredThisBattle)
		{
			lines.push({
				id = 6, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Already triggered this battle[/color]"
			});
		}
		return lines;
	}

	// Called by the actor.setMoraleState hook in mod_aurapower.nut the
	// instant a brother carrying this passive drops into Wavering+. Snaps
	// morale back to Steady, refunds 15 fatigue, layers the short-lived
	// +10 Melee Skill buff, and plays a small visual cue. The
	// HasFiredThisBattle flag must be flipped BEFORE we call setMoraleState
	// or we recurse forever through the actor hook.
	function triggerResoluteAura( _actor )
	{
		if (this.m.HasFiredThisBattle) return;
		this.m.HasFiredThisBattle = true;

		local actor = _actor;
		if (actor == null)
			actor = this.getContainer().getActor();
		if (actor == null) return;

		// Reset morale to Steady (the headline of this passive).
		try { actor.setMoraleState(this.Const.MoraleState.Steady); } catch (e) {}

		// Snap fatigue down by 15.
		try
		{
			local f = actor.getFatigue() - 15;
			if (f < 0) f = 0;
			actor.setFatigue(f);
		}
		catch (e) {}

		// Layer the temporary +10 Melee Skill buff for 2 turns.
		try
		{
			if (!actor.getSkills().hasSkill("effects.aura_resolute_steady"))
				actor.getSkills().add(::new("scripts/skills/effects/aura_resolute_steady"));
		}
		catch (e) {}

		// Visual cue. The spawnSpriteEffect call reaches into the tactical
		// sprite layer, which the engine TEARS DOWN during onCombatFinished -
		// and the post-battle morale sweep calls setMoraleState (our hook),
		// which can re-enter this trigger. At that point this.Tactical is a
		// dying native object and the call faults at the engine level, which
		// a Squirrel try/catch CANNOT catch (real player crash, Legends/lewd
		// stack). this.Tactical.isActive() is false the instant teardown
		// begins, so it is the load-bearing guard; the rest is insurance.
		try
		{
			if (this.Tactical != null && this.Tactical.isActive()
				&& actor.isPlacedOnMap()
				&& this.doesBrushExist("aura_body_glow"))
			{
				this.Tactical.spawnSpriteEffect("aura_body_glow",
					this.createColor("#7ec8ff"), actor.getTile(),
					0, 50, 0.8, 1.5, 200, 80, 500);
			}
		}
		catch (e) {}
	}

	function onCombatFinished()
	{
		this.m.HasFiredThisBattle = false;
	}
});
