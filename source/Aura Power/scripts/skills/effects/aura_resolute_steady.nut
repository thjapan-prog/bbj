// Short-lived "steady hand" buff layered by Resolute Aura the instant the
// passive triggers. +10 Melee Skill for 2 turns, then collapses.
this.aura_resolute_steady <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.aura_resolute_steady";
		this.m.Name = "Resolute Aura: Steady Hand";
		this.m.Description = "The aura, refusing to break, sharpens this warrior's swing for a moment.";
		this.m.Icon = "ui/aura/aura_resolute.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local pos = this.Const.UI.Color.PositiveValue;
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/melee_skill.png",
			  text = "[color=" + pos + "]+10[/color] Melee Skill" },
			{ id = 4, type = "text", icon = "ui/icons/special.png",
			  text = "Turns remaining: [color=" + pos + "]" + this.m.TurnsLeft + "[/color]" }
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkill += 10;
	}

	function onTurnEnd()
	{
		this.m.TurnsLeft = this.m.TurnsLeft - 1;
		if (this.m.TurnsLeft <= 0)
			this.removeSelf();
	}
});
