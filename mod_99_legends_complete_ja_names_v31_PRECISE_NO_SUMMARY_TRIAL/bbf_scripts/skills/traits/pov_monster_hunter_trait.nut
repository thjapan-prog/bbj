this.pov_monster_hunter_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_monster_hunter";
		this.m.Name = "怪物狩り";
		this.m.Icon = "ui/traits/pov_monster_hunter.png";
		this.m.Description = "This character has all the right skills and passion to fight against all kinds of monsters, yet they do not show the same effectiveness against humans...";
		this.m.Titles = [
			"the Monster Hunter",
			"the Beast Slayer"
		];
		this.m.Excluded = [
			"trait.fear_beasts",
			"trait.fear_undead",
			"trait.pov_fear_mutants",
			"trait.pov_nyctophobia"
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
				icon = "ui/icons/damage_dealt.png",
				text = "敵の獣と霊体に対して[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]のダメージを与える。変異体とアンデッドに対してはこのボーナスの[color=" + this.Const.UI.Color.PositiveValue + "]半分[/color]を得る。"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "敵の人間やその他の人型種に対して[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color]のダメージを与える。"
			}
		];
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties, )
	{

		if (_targetEntity != null)
		{
			if(this.Const.EntityType.getDefaultFaction(_targetEntity.getType()) == this.Const.FactionType.Beasts || _targetEntity.getFlags().has("ghost"))
			{
				_properties.DamageTotalMult *= 1.10;
			}else if(_targetEntity.getFlags().has("undead") || _targetEntity.getFlags().has("mutant"))
			{
				_properties.DamageTotalMult *= 1.05;
			}else
			{
				_properties.DamageTotalMult *= 0.95;
			}
		}
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		this.m.Type = ::Const.SkillType.StatusEffect;
	}

});
