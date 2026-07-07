this.legend_double_tongued_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = ::Legends.Traits.getID(::Legends.Trait.LegendDoubleTongued);
		this.m.Name = "二枚舌";
		this.m.Icon = "ui/traits/trait_double_tongued.png";
		this.m.Description = "The nature of humanity brings out the destructive side in many, however this one appears to be worse than the usual.";
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.Optimist),
			::Legends.Traits.getID(::Legends.Trait.Teamplayer),
			::Legends.Traits.getID(::Legends.Trait.Determined),
			::Legends.Traits.getID(::Legends.Trait.LegendGiftOfPeople)
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
				icon = "ui/icons/morale.png",
				text = "戦闘開始時、[color=%negative%]5%[/color]の確率でエントロピーの必然性についてまくしたて、部隊の士気を下げる"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "悲観的、迷信深い、偏執的、心的外傷を負った、または死にたがりの傭兵は、こうした陰鬱な演説に奇妙にも鼓舞され、[color=%positive%]+2[/color] 行動力を得る"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "死は避けられないものと考え、仲間が死んでも士気チェックを受けない"
			}
		];
	}

	function onCombatStarted()
	{
		this.skill.onCombatStarted();

		if (this.Math.rand(1, 20) <= 1)
		{
			local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());
			local ownID = this.getContainer().getActor().getID();

			foreach( ally in allies )
			{

				if (ally.getID() == ownID)
				{
					continue;
				}
				if (ally.getSkills().hasTrait(::Legends.Trait.LegendDoubleTongued) || ally.getSkills().hasTrait(::Legends.Trait.Deathwish) || ally.getSkills().hasTrait(::Legends.Trait.Superstitious) || ally.getSkills().hasTrait(::Legends.Trait.Paranoid) || ally.getSkills().hasTrait(::Legends.Trait.Pessimist) || ally.getSkills().hasSkill("injury.traumatized"))
				{
					::Legends.Effects.grant(ally, ::Legends.Effect.LegendCheeredOn);

					continue;
				}

				local ally_morale = ally.getMoraleState();

				if (ally_morale > this.Const.MoraleState.Fleeing && ally_morale < ::Const.MoraleState.Ignore)
				{
					ally.setMoraleState(ally_morale - 1);
				}
			}
		}


	}
	function onUpdate( _properties )
	{
		_properties.IsAffectedByDyingAllies = false;
	}
});

