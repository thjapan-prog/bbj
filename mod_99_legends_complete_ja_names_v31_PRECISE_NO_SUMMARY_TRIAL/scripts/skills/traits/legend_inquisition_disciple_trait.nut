this.legend_inquisition_disciple_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = ::Legends.Traits.getID(::Legends.Trait.LegendInquisitionDisciple);
		this.m.Name = "異端審問の弟子";
		this.m.Icon = "ui/traits/trait_icon_67.png";
		this.m.Description = "This character is a disciple of the Old Gods, an individual with unquestionable loyalty to the faith. They embrace physical pain and peril as bringing them closer to salvation.";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
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
				icon = "ui/icons/health.png",
				text = "[color=%positive%]+20[/color] ヒットポイント"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=%positive%]+10[/color] 意思"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "ヒットポイントを失っても士気チェックは発生しない"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "現在の戦闘で受けた戦闘中の新たな負傷の影響を受けない"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Hitpoints += 20;
		_properties.Bravery += 10;
		_properties.IsAffectedByFreshInjuries = false;
		_properties.IsAffectedByLosingHitpoints = false;
	}

});

