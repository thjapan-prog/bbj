this.pov_psychopath_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {
		//KillsSatisfied = false,
		//KillsToSatisfy = 100,
		HumanKills = 0
	},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_psychopath";
		this.m.Name = "サイコパス";
		this.m.Icon = "ui/traits/pov_psychopath.png";
		this.m.Description = "%name% is calm when men scream. Cold when they beg. %name% doesn\'t fight for coin, cause, or comrades, he fights to watch the light leave a man\'s eyes. Against humans, [color=" + this.Const.UI.Color.NegativeValue + "] he’s a butcher [/color], grinning through the blood! \n\n But monsters? They don’t plead. They don’t cry. And without fear in their faces, the thrill just... isn’t there";
		this.m.IsSerialized = true;
	}



	function getTooltip()
	{
		local result = [
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] 人間との戦闘中、意思"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+8[/color] 人間との戦闘中、近接技量と遠隔技量"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "人間との戦闘中、[color=" + this.Const.UI.Color.PositiveValue + "]+8%[/color] ダメージ"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "人間との戦闘中、近接戦闘中の対戦相手の意思を[color=" + this.Const.UI.Color.PositiveValue + "]-6[/color]低下させる。"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-8[/color] 人間との戦闘中でない場合、意思"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-4[/color] 人間との戦闘中でない場合、近接技量と遠隔技量"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "人間との戦闘中でない場合、[color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] ダメージ"
			}
		];

		//local kills = this.getContainer().getActor().getLifetimeStats().Kills;
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/kills.png",
			text = "このキャラクターは個人的に「収集した」[color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.HumanKills + "[/color]人の命を持つ。"
		});

		return result;

	}


	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}
		
		local fightingHumans = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (enemy.getFlags().has("human"))
			{
				fightingHumans = true;
				break;
			}
		}

		if (fightingHumans)
		{
			// Buffs
			_properties.Bravery += 15;
			_properties.MeleeSkill += 8;
			_properties.RangedSkill += 8;
			_properties.DamageTotalMult *= 1.08;
			_properties.Threat += 5;
			// Make this a status effect so it will be visible for the battle
			this.m.Type = ::Const.SkillType.StatusEffect;
		} else {
			//Debuffs
			_properties.Bravery -= 8;
			_properties.MeleeSkill -= 4;
			_properties.RangedSkill -= 4;
			_properties.DamageTotalMult *= 0.95;
			// Make this a status effect so it will be visible for the battle
			this.m.Type = ::Const.SkillType.StatusEffect;

			// Make this a trait so it will not be visible for the battle
			//this.m.Type = ::Const.SkillType.Trait;
		}
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		if (_targetEntity.getXPValue() > 0 && _targetEntity.getFlags().has("human"))
		{
			this.m.HumanKills += 1;
			// Make a chance for a cool manic laughter sound effect to play. (need to make that first)
		}
	}

	/*function onCombatFinished()
	{
		
	}*/

	function onSerialize( _out )
	{
		this.character_trait.onSerialize(_out);
		_out.writeU16(this.m.HumanKills);
	}

	function onDeserialize( _in )
	{
		this.character_trait.onDeserialize(_in);
		this.m.HumanKills = _in.readU16();
	}


});

