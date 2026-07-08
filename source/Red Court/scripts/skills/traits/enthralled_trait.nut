this.enthralled_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.enthralled"; //— 
		this.m.Name = "Enthralled";
		this.m.Icon = "ui/traits/enthralled_trait.png"; 
		this.m.Description = "Older vampires know precisely what mortals want — and how to turn those wants into reality.";
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
				id = 12,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "Not affected by allies fleeing, dying or resolve checks. Has additional resistance to mental attacks"
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Vision"
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Experience Gain"
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]-10%[/color] Daily Upkeep"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MoraleEffectMult *= 0.1;
		_properties.IsAffectedByFleeingAllies = false;
		_properties.IsAffectedByDyingAllies = false;
		_properties.Vision += 1;
		_properties.XPGainMult *= 0.90;
		_properties.MoraleCheckBravery[1] += 20;
		_properties.DailyWageMult *= 0.90;
	}

});

