this.pov_serpent_weak_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
		},
	function create()
	{
		this.m.ID = "effects.pov_serpent_weak_mutagen";
		this.m.Name = "大蛇の身のこなし";
		this.m.Icon = "skills/pov_serpent_mutant.png"; 
		this.m.IconMini = "pov_mini_serpent_mutant"; 
		this.m.Overlay = "serpent";
		this.m.Type = this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Pack Instinct[/color]: The vatt\'ghern excels when fighting alongside allies, feeding off their presence to strike with greater precision. When surrounded themselves though, this inctinct can turn to panic, reducing the Vatt\'ghern\'s defense.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Endurance Boost[/color]: Enhanced stamina allows the vatt'ghern to recover fatigue more quickly each turn, keeping them in the fight longer.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Singular Focus[/color]: When facing a single opponent, the vatt\'ghern gains a significant boost to melee and ranged defense. This defensive edge diminishes in chaotic skirmishes with multiple enemies.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Reflexive Defense[/color]: The vatt\'ghern\'s quick reflexes grant them additional melee and ranged defense based on their current initiative.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Frail Frame[/color]: The mutation weakens their overall health, reducing their maximum vitality and making them more vulnerable to damage.";
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
				text = "戦闘中に[color=" + this.Const.UI.Color.povTooltipBlue + "]「蛇の敏捷」[/color]効果を獲得し、現在のイニシアチブの10%分防御が増加する。敵がちょうど[color=" + this.Const.UI.Color.PositiveValue + "]1[/color]体の時は追加ボーナスがある。また、周囲の敵1体につき近接防御が[color=" + this.Const.UI.Color.NegativeValue + "]-4[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "目標に隣接している仲間1体につき、近接命中率が追加で[color=" + this.Const.UI.Color.PositiveValue + "]+2%[/color]上昇する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "毎ターン、疲労回復が[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "受けるダメージが[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]増加する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "最大ヒットポイントが[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]減少する"
			}
		];
		return ret;
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		// ADD SERPENTINE AGILITY EFFECT - REMOVED AFTER BATTLE
		actor.getSkills().add(this.new("scripts/skills/effects/pov_serpentine_agility_effect"));
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.SurroundedBonus += 2;
		_properties.FatigueRecoveryRate += 1;

		// Debuffs
		// ADDED VIA SERPENTINE EFFECT
		//_properties.SurroundedDefense -= 4;
		_properties.HitpointsMult *= 0.90;
		// Takes 10% More dmg
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		_properties.DamageReceivedRegularMult *= 1.10;
	}

	function isHidden()
	{
        //return this.getBonus() == 0;
		return this.inBattleHiddenCheck();
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
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

