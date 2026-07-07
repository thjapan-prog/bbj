this.pov_rot_weak_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_rot_weak_mutagen";
		this.m.Name = "腐敗のオーラ";
		this.m.Icon = "skills/pov_flesh_golem_mutant.png";
		this.m.IconMini = "pov_mini_flesh_golem_mutant";
		this.m.Overlay = "necro";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Rotten Stench[/color]: This character is embraced by rot, allowing them to poison, debuff and test the resolve of any enemy that dares approach them, while also benefitting from increased constitution.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Compromised Reflexes[/color]: Rot is all about entropy, thus weakening this character\'s speed and reflexes, making them more vulnerable in battle.";
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
			}
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "戦闘中に[color=" + this.Const.UI.Color.povTooltipBlue + "]「耐え難い悪臭」[/color]パッシブ効果を獲得し、[color=" + this.Const.UI.Color.PositiveValue + "]腐敗への免疫[/color]を得る。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "最大HPが[color=" + this.Const.UI.Color.PositiveValue + "]12%[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "近接戦闘中の対戦相手の意思を[color=" + this.Const.UI.Color.PositiveValue + "]-4[/color]低下させる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "イニシアチブが[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]低下する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_melee_ranged_defense.png",
				text = "防御が[color=" + this.Const.UI.Color.NegativeValue + "]12%[/color]低下する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_fire.png",
				text = "このキャラクターは炎攻撃から[color=" + this.Const.UI.Color.NegativeValue + "]40%[/color]多くダメージを受ける。"
			}
		];
		return ret;
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/effects/pov_unbearable_stench_passive_effect"));
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.HitpointsMult *= 1.12;
		_properties.Threat += 4;
		// Debuffs
		_properties.MeleeDefenseMult *= 0.88;
		_properties.RangedDefenseMult *= 0.88;
		_properties.InitiativeMult *= 0.75;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.DamageType == this.Const.Damage.DamageType.Burning)
		{
			_properties.DamageReceivedRegularMult *= 1.40;
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

