this.pov_ghoul_mutagen_upgraded_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_ghoul_mutagen_upgraded";
		this.m.Name = "[color="+ ::Const.UI.Color.povMutationUpgrade + "]Reinforced Mutation: Skin Ghoul[/color]";
		this.m.Icon = "skills/pov_ghoul_skin.png";
		this.m.IconMini = "";
		//this.m.Overlay = "status_effect_149";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Hyperactive Tissue Growth[/color]: This character\'s body has mutated to regrow skin and muscle tissue at an unnatural pace, vastly increasing regeneration. This, without any serious strain to the user\'s body.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Frenzied Attacks[/color]: The more entities die in a battle, this character\'s movements become increasingly eratic and blidingly fast, vastly increasing ther combat capabilities. This also renders the user almost unable to properly use ranged weapons though, while also slightly lowering their damage output.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Horrifying Presence[/color]: Gets the ability to consume corpses for recovery, to the horror of their company. Only the bravest can stand against this character\'s terror.";
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
				text = "戦闘中に死亡した存在が増えるほど強化されるスタッキング[color=" + this.Const.UI.Color.PositiveValue + "]ボーナス[/color]を獲得し、さらに近接技量、近接防御、イニシアチブが[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]増加する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]「グリュームフィースト」[/color]スキルを獲得し、死体を消費してヒットポイントや負傷を回復できる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/days_wounded.png",
				text = "失ったヒットポイントが通常より[color=" + this.Const.UI.Color.PositiveValue + "]5x[/color]速く回復する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "近接戦闘中の対戦相手の意思を[color=" + this.Const.UI.Color.PositiveValue + "]-18[/color]低下させる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "遠隔技量が[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "近接ダメージが[color=" + this.Const.UI.Color.NegativeValue + "]-4%[/color]低下する。"
			}
		];
		return ret;
	}

	function onAdded()
	{

		if (!this.m.Container.hasSkill("actives.pov_gruesome_feast"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_gruesome_feast_skill"));
		}
	}
	
	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/effects/pov_vattghern_corpse_rush_effect"));
	}

	function onUpdate( _properties )
	{
		// Buffs
		//_properties.InitiativeMult *= 1.2;
		_properties.Threat += 18;
		_properties.HitpointsRecoveryRateMult *= 5.0;
		_properties.MeleeSkill += 5.0;
		_properties.MeleeDefense += 5.0;
		_properties.Initiative += 5.0;
		// Debuffs
		_properties.RangedSkillMult *= 0.90;
		_properties.MeleeDamageMult *= 0.96;
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

