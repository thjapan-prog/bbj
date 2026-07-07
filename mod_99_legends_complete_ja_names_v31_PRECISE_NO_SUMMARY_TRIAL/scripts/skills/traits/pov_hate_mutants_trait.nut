this.pov_hate_mutants_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_hate_mutants";
		this.m.Name = "変異体嫌い";
		this.m.Icon = "ui/traits/pov_hate_mutants.png";
		this.m.Description = "\"They\'re completely unnatural… Just a mistake that should never have existed.\"";
		this.m.Excluded = [
			"trait.weasel",
			"trait.craven",
			"trait.dastard",
			"trait.fainthearted",
			"trait.pov_fear_mutants",
			"trait.legend_peaceful"
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
				icon = "ui/icons/bravery.png",
				text = "変異体との戦闘時、[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] 意思"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_skill.png",
				text = "変異体との戦闘時、[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] 近接技量と遠隔技量"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "変異体に対する[color=" + this.Const.UI.Color.PositiveValue + "]+8%[/color] ダメージ"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		local fightingMutants = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (enemy.getFlags().has("mutant"))
			{
				fightingMutants = true;
				break;
			}
		}

		if (fightingMutants)
		{
			_properties.Bravery += 8;
			_properties.MeleeSkill += 5;
			_properties.RangedSkill += 5;
			// Make this a status effect so it will be visible for the battle
			this.m.Type = ::Const.SkillType.StatusEffect;
		} else {
			// Make this a trait so it will not be visible for the battle
			this.m.Type = ::Const.SkillType.Trait;
		}

	}

	function onAnySkillUsed( _skill, _targetEntity, _properties)
	{
		if (_targetEntity != null)
		{
			if(_targetEntity.getFlags().has("mutant"))
			{
				_properties.DamageTotalMult *= 1.08;
			}
		}
	}

});
