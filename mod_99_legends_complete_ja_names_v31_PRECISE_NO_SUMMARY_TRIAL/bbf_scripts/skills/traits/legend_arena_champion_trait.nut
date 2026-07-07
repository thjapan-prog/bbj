this.legend_arena_champion_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = ::Legends.Traits.getID(::Legends.Trait.LegendArenaChampion);
		this.m.Name = "闘技場の王者";
		this.m.Description = "Every man and woman in the area stand secretly wants to be %fullname%, children play in streets dressed and fighting like %they% does. As they should.";
		this.m.Icon = "ui/traits/trait_arena_champion.png";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
	}

	function getTooltip()
	{
		local matches = this.getContainer().getActor().getFlags().getAsInt("ArenaFights");
		local won = this.getContainer().getActor().getFlags().getAsInt("ArenaFightsWon");

		if (won == matches)
		{
			won = "all";
		}

		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription() + " So far, this character has fought in " + matches + " matches and won " + won + " of them."
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=%positive%]+15[/color] 意思"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=%positive%]+5[/color] ヒットポイント"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=%positive%]+5%[/color] ダメージ"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "即死攻撃でなければ、倒された時に[color=%positive%]50%[/color]の確率で生存する"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += 15;
		_properties.Hitpoints += 5;
		_properties.DamageTotalMult *= 1.05;
		_properties.SurviveWithInjuryChanceMult *= 1.51;
	}

});

