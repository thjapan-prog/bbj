this.pov_minor_oath_of_distinction_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_minor_oath_of_distinction";
		this.m.Name = "小誓約：卓越";
		this.m.Icon = "ui/traits/trait_icon_88.png";
		this.m.Description = "This character has taken the Minor Oath of Distinction, and is sworn to seek power in solace.";
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
				icon = "ui/icons/xp_received.png",
				text = "全般的に経験値を[color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]多く得る..."
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "...ただし、味方による撃破からの経験値は[color=" + this.Const.UI.Color.NegativeValue + "]0%[/color]になる"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.5;
		_properties.IsAllyXPBlocked = true;
	}

});

