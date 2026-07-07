this.pov_necromancy_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_necromancy_mutagen";
		this.m.Name = "変異：死霊術";
		this.m.Icon = "skills/pov_necro.png";
		this.m.IconMini = "";
		this.m.Overlay = "necro";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Dark Visions[/color]: This character has strange visions of things that have been and things to come.  It gives them a certain ability to connect and internalize new experiences faster. On the other hand, these same visions cause extreme distress to the Vatt\'ghern\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Reactive Muscle Tissue[/color]: This character\'s body reacts to physical trauma, secreting a calciferous substance that causes their muscles to reflexively sieze and contract at points of impact to minimize muscle damage, reducing the chances of injury in battle. But, this reactivity works against the character when attacked with fire.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Necromantic Ritual[/color]: This character also gets the ability to raise the dead, giving humans good use even after their lives expire...";
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
				text = "戦闘中に[color=" + this.Const.UI.Color.povTooltipBlue + "]「死者を蘇らせる」[/color]スキルを獲得し、死んだ人間を蘇生できる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "このキャラクターは敵の攻撃から[color=" + this.Const.UI.Color.PositiveValue + "]疲労を受けない[/color]"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] 経験値取得"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "被弾時の負傷閾値が[color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]上昇する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "意思が[color=" + this.Const.UI.Color.NegativeValue + "]30%[/color]に加えてフラット[color=" + this.Const.UI.Color.NegativeValue + "]10[/color]低下する。"
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

	/*function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/effects/pov_unbearable_stench_passive_effect"));
	}*/

	function onUpdate( _properties )
	{
		// Buffs
		_properties.XPGainMult *= 1.30;
		_properties.FatigueLossOnAnyAttackMult = 0.0;
		_properties.ThresholdToReceiveInjuryMult *= 1.50;
		// Debuffs
		_properties.BraveryMult *= 0.70;
		_properties.Bravery += -10;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.DamageType == this.Const.Damage.DamageType.Burning)
		{
			_properties.DamageReceivedRegularMult *= 1.4;
		}
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_raise_undead"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_raise_undead_skill"));
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

