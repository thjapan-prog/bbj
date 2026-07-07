// Branded foe of Aura: Ember. Saps stamina at the start of each of the
// target's turns and dulls their swing. Vanishes when its timer runs out.
this.aura_ember_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		FatiguePerTurn = 8
	},
	function create()
	{
		this.m.ID = "effects.aura_ember";
		this.m.Name = "Aura: Ember";
		this.m.Description = "A clinging ember of aura saps stamina and dulls the strikes of whoever it touches.";
		this.m.Icon = "ui/aura/aura_ember.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local neg = this.Const.UI.Color.NegativeValue;
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/fatigue.png",
			  text = "[color=" + neg + "]+" + this.m.FatiguePerTurn + "[/color] Fatigue at the start of each turn" },
			{ id = 4, type = "text", icon = "ui/icons/melee_skill.png",
			  text = "[color=" + neg + "]-10[/color] Melee Skill" },
			{ id = 5, type = "text", icon = "ui/icons/special.png",
			  text = "Turns remaining: [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color]" }
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkill -= 10;
	}

	// Helper: spawn three fire bursts on the target so the ember reads as
	// a real, sustained blaze instead of a single flicker. Uses the same
	// vanilla effect_fire_01/02/03 brushes that oil flasks ignite with.
	function _aura_burnTile( _tile )
	{
		try
		{
			foreach (b in ["effect_fire_01", "effect_fire_02", "effect_fire_03"])
			{
				if (!this.doesBrushExist(b)) continue;
				this.Tactical.spawnSpriteEffect(b,
					this.createColor("#ffffff"), _tile,
					0, 20, 1.0, 1.4, 500, 80, 600);
			}
		}
		catch (e)
		{
			::logError("Aura Power: Ember fire VFX - " + e);
		}
	}

	// Re-light the flames immediately when the brand is applied so the
	// player sees fire on the very turn they cast it.
	function onAdded()
	{
		try
		{
			local actor = this.getContainer().getActor();
			if (actor != null && actor.isAlive())
				this._aura_burnTile(actor.getTile());
		}
		catch (e) {}
	}

	function onTurnStart()
	{
		try
		{
			local actor = this.getContainer().getActor();
			if (actor != null && actor.isAlive())
			{
				local newFat = actor.getFatigue() + this.m.FatiguePerTurn;
				if (newFat > actor.getFatigueMax())
					newFat = actor.getFatigueMax();
				actor.setFatigue(newFat);
				this._aura_burnTile(actor.getTile());
			}
		}
		catch (e) {}
	}

	function onTurnEnd()
	{
		this.m.TurnsLeft = this.m.TurnsLeft - 1;
		if (this.m.TurnsLeft <= 0)
			this.removeSelf();
	}
});
