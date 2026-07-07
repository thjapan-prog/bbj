// King's Judgment, outcome 2: -2 Maximum Fatigue (permanent).
this.aura_judgment_fatigue <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_judgment_fatigue";
		this.m.Name = "Crown\'s Weariness";
		this.m.Description = "The King's Judgment drew the wind from this warrior's lungs. The body never fully recovers its old endurance.";
		this.m.Icon = "ui/perks/perk_22.png";
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
				id = 3, type = "text", icon = "ui/icons/fatigue.png",
				text = "[color=" + neg + "]-2[/color] Maximum Fatigue (permanent)"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Stamina -= 2;
	}
});
