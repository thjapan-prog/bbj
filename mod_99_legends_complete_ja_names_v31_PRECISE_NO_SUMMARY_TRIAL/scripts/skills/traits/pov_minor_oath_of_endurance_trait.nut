this.pov_minor_oath_of_endurance_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_endurance";
		this.m.Name = "小誓約：忍耐";
		this.m.Icon = "ui/traits/trait_icon_84.png";
		this.m.Description = "This character has taken the Minor Oath of Endurance, and is sworn to endure!";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
		this.m.Excluded = [];
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "すべての行動で消費する疲労が[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]少なくなる。"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.FatigueEffectMult *= 0.90;
	}

});

