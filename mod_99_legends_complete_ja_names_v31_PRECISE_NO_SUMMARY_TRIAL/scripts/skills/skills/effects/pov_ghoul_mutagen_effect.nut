this.pov_ghoul_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_ghoul_mutagen";
		this.m.Name = "Mutation: Nachzehrer";
		this.m.Icon = "skills/pov_ghoul.png";
		this.m.IconMini = "";
		//this.m.Overlay = "status_effect_149";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Hyperactive Tissue Growth[/color]: This character\'s body has mutated to regrow skin and muscle tissue much more quickly than normal, vastly increasing regeneration. On the other hand, the user becomes more prone to injuries thanks to cellular instability.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Frenzied Attacks[/color]: The more entities die in a battle, this character\'s movements become increasingly eratic and blidingly fast, vastly increasing ther combat capabilities. This also renders the user almost unable to properly use ranged weapons though, while also slightly lowering their damage output.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Terrifying Presence[/color]: Gets the ability to consume corpses for recovery, to the horror of their company. Any opponent engaged in battle with the user will have their resolve truly tested. ";
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
				text = "戦闘中に死亡した存在が増えるほど強化されるスタッキング[color=" + this.Const.UI.Color.PositiveValue + "]ボーナス[/color]を獲得する。"
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
				text = "失ったヒットポイントが通常より[color=" + this.Const.UI.Color.PositiveValue + "]3x[/color]速く回復する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "近接戦闘中の対戦相手の意思を[color=" + this.Const.UI.Color.PositiveValue + "]-12[/color]低下させる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "遠隔技量が[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "近接ダメージが[color=" + this.Const.UI.Color.NegativeValue + "]-8%[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/days_wounded.png",
				text = "負傷閾値が[color=" + this.Const.UI.Color.NegativeValue + "]20%[/color]低下する。"
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
		_properties.Threat += 12;
		_properties.HitpointsRecoveryRateMult *= 3.0;
		// Debuffs
		_properties.ThresholdToReceiveInjuryMult *= 0.80;
		_properties.RangedSkillMult *= 0.75;
		_properties.MeleeDamageMult *= 0.92;
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

