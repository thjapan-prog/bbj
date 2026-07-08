// King's Judgment, outcome 3: -2 Resolve (permanent).
this.aura_judgment_resolve <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_judgment_resolve";
		this.m.Name = "Crown\'s Doubt";
		this.m.Description = "Once a warrior reaches for the throne and is cast down, the steady hand never returns to its old certainty.";
		this.m.Icon = "ui/perks/perk_42.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		local neg = this.Const.UI.Color.NegativeValue;
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{
				id = 3, type = "text", icon = "ui/icons/bravery.png",
				text = "[color=" + neg + "]-2[/color] Resolve (permanent)"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery -= 2;
	}
});
