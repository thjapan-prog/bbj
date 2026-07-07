this.legend_aggressive_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = ::Legends.Traits.getID(::Legends.Trait.LegendAggressive);
		this.m.Name = "攻撃的";
		this.m.Icon = "ui/traits/aggressive_trait.png";
		this.m.Description = "This character is pretty aggressive, even to their own detriment.";
		this.m.Titles = [
			"the Boar",
			"the Fire",
			"the Crazy"
		];
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.Clumsy),
			::Legends.Traits.getID(::Legends.Trait.Pessimist),
			::Legends.Traits.getID(::Legends.Trait.Weasel),
			::Legends.Traits.getID(::Legends.Trait.Insecure),
			::Legends.Traits.getID(::Legends.Trait.Craven),
			::Legends.Traits.getID(::Legends.Trait.Hesistant),
			::Legends.Traits.getID(::Legends.Trait.Dastard),
			::Legends.Traits.getID(::Legends.Trait.Fainthearted),
			::Legends.Traits.getID(::Legends.Trait.FearBeasts),
			::Legends.Traits.getID(::Legends.Trait.FearUndead),
			::Legends.Traits.getID(::Legends.Trait.FearGreenskins),
			::Legends.Traits.getID(::Legends.Trait.LegendFearNobles),
			::Legends.Traits.getID(::Legends.Trait.LegendSlack),
			::Legends.Traits.getID(::Legends.Trait.LegendPragmatic)
		];
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
				id = 10,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=%positive%]+15%[/color] 近接ダメージ"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "周囲の敵1体につき[color=%negative%]-5[/color] 防御"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "士気が揺らいだ状態で戦闘を開始することはない"
			},
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDamageMult *= 1.15;
		_properties.SurroundedDefense -= 5;
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();

		if (actor.getMoraleState() < this.Const.MoraleState.Steady)
		{
			actor.setMoraleState(this.Const.MoraleState.Steady);
		}
	}

});
