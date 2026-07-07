this.pov_sandgolem_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {
		HeadArmorBoost = 100,
		HeadDamageTaken = 0,
		BodyArmorBoost = 100,
		BodyDamageTaken = 0
	},
	function create()
	{
		this.m.ID = "effects.pov_sandgolem_mutagen";
		this.m.Name = "変異：イフリート";
		this.m.Icon = "skills/pov_ifrit.png";
		this.m.IconMini = "";
		this.m.Overlay = "ifrit";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Stone Skin[/color]: This character\'s skin has mutated and now forms hard, rock-like patches that are much hardier and difficult to puncture. The now sandy pores of the skin allow the character to propel some sand into enemy eyes, to disorient them.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Uncomfortable [/color]: The changes on this character\'s skin make the skin itchy, heavier and harder to sweat, causing problems with the caracter\'s speed and stamina.";
	}

	function getTooltip()
	{
		local ret = [
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
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]「土を投げる」[/color]スキルを獲得する（射程3マス）。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "このキャラクターの皮膚は岩のように硬く、[color=" + this.Const.UI.Color.PositiveValue + "]100[/color]ポイントの天然装甲を付与する（PoVの装甲リワークの影響を受ける）"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "このキャラクターはさらに、あらゆるダメージソースからの[color=" + this.Const.UI.Color.PositiveValue + "]12%[/color]の全体ダメージ軽減を得る。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "イニシアチブが[color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "全スキルの疲労コストが[color=" + this.Const.UI.Color.NegativeValue + "]5%[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "疲労回復が[color=" + this.Const.UI.Color.NegativeValue + "]1[/color]ポイント減少する。"
			}

		];
		return ret;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_throw_dirt"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_throw_dirt_skill"));
		}
	}


	function onCombatStarted()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
	}

	function onCombatFinished()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
	}

	function onUpdate( _properties )
	{	
		// Buffs
		_properties.Armor[this.Const.BodyPart.Head] += this.Math.max(0.0, this.m.HeadArmorBoost - this.m.HeadDamageTaken);
		_properties.Armor[this.Const.BodyPart.Body] += this.Math.max(0.0, this.m.BodyArmorBoost - this.m.BodyDamageTaken);
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.HeadArmorBoost;
		_properties.ArmorMax[this.Const.BodyPart.Body] += this.m.BodyArmorBoost;
		// Debuffs
		_properties.Initiative *= 0.75;
		_properties.FatigueEffectMult *= 1.05;
		_properties.FatigueRecoveryRate += -1;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{	
		_properties.DamageReceivedTotalMult *= 0.88;

		if (_hitInfo.BodyPart == this.Const.BodyPart.Head)
		{
			if (this.m.HeadDamageTaken >= this.m.HeadArmorBoost)
			{
				return;
			}

			// weird fix to weird issue
			local cap = this.m.HeadArmorBoost - this.m.HeadDamageTaken;
			if (cap > this.m.HeadArmorBoost/2)
			{
				cap = this.m.HeadArmorBoost/2;
			}
			_properties.DamageArmorReduction += cap;
			this.m.HeadDamageTaken += _hitInfo.DamageArmor;
		}
		else if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			if (this.m.BodyDamageTaken >= this.m.BodyArmorBoost)
			{
				return;
			}

			// weird fix to weird issue
			local cap = this.m.BodyArmorBoost - this.m.BodyDamageTaken;
			if (cap > this.m.BodyArmorBoost/2)
			{
				cap = this.m.BodyArmorBoost/2;
			}
			_properties.DamageArmorReduction += cap;
			this.m.BodyDamageTaken += _hitInfo.DamageArmor;
		}
	}

	function isHidden()
	{
		return this.inBattleHiddenCheck();
	}

	function inBattleHiddenCheck()
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null)
		{
			return false;
		}

		return true;
	}

});

