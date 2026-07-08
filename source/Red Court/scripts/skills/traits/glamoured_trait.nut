this.glamoured_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.glamoured";
		this.m.Name = "Bewitched";
		this.m.Icon = "ui/traits/glamour_trait.png";
		this.m.Description = "Being in the presence of a powerful glamour for an extended period of time has caused this mortal to disconnect from reality somewhat. While loyal, there have been a few... side effects.";
		this.m.Order = this.Const.SkillOrder.Trait - 1;	// back of the line, buddy
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
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] Melee Damage"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+12[/color] Resolve"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Initiative"
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color] Vision"
			},
			{
				id = 15,
				type = "text",
				icon = "ui/icons/money2.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]-10%[/color] Daily Wage"
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Experience Gain"
			}
		];
	}

	function onUpdate( _properties ) // in order
	{
		_properties.MeleeDamageMult *= 0.95; //was 0.99?
		_properties.Bravery += 12;
		_properties.Initiative -= 15;
		_properties.Vision -= 1;
		_properties.DailyWage *= 0.90;
		_properties.XPGainMult *= 0.90;
	}

});

