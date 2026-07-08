// King's Judgment, outcome 1: Permanent Scar.
// One of the five permanent debuffs randomly inflicted on a brother who
// fails the Tier IV trial. Pure narrative mark plus -1 Resolve (a thin
// stat penalty so the scar isn't just cosmetic).
this.aura_judgment_scar <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_judgment_scar";
		this.m.Name = "Crown\'s Scar";
		this.m.Description = "Touched by the King's Judgment and marked forever. The wound on the soul never fully closes; a faint chill lingers behind every act of courage.";
		this.m.Icon = "ui/perks/perk_21.png";
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
				text = "[color=" + neg + "]-1[/color] Resolve (permanent)"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery -= 1;
	}
});
