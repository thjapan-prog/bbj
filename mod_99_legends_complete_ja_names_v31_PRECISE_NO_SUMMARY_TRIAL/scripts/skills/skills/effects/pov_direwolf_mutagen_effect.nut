this.pov_direwolf_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {
		SkillsUsed = {},
		ArmorPenalty = 0
	},
	function create()
	{
		this.m.ID = "effects.pov_direwolf_mutagen";
		this.m.Name = "変異：獣";
		this.m.Icon = "skills/pov_direwolf.png";
		this.m.IconMini = "";
		this.m.Overlay = "werewolf";
		//this.m.Type = this.Const.SkillType.Trait;
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
		//this.m.Order = this.Const.SkillOrder.Background + 1;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Elasticized Sinew[/color]: This character\'s muscles have mutated to become highly efficient, increasing the character\'s stamina while moving and fighting. This also helps them perform better under the effects of adrenaline, making the vattghern fight better in dire conditions.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Enhanced Vision[/color]: This character\'s eyes have mutated to adapt rapidly to low light conditions, halving nighttime penalties.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Rend the flesh[/color]: All attacks can cause bleeding. Also, a powerful clotting agent in the skin makes this character immune to bleeding effects.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Maladaptive Exoskeleton[/color]: Due to structural mutations in the character's body, effectively using body armor, especially the heavier kinds, is much more difficult.";
	}

	function getPenalty()
	{
		local actor = this.getContainer().getActor();

		local bodyitem = actor.getBodyItem();

		if (bodyitem == null)
		{
			return 0;
		}

		local armorFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Body);
		local helmetFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Head);
		local totalPen = armorFatPen + helmetFatPen;
		local penalty = totalPen * 0.3;
		return penalty;
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]「アドレナリン・ラッシュ」[/color]パッシブを獲得し、ヒットポイントが少ない時にダメージとイニシアチブが増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "全ての攻撃が、与えたヒットポイントダメージの[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]に相当する[color=" + this.Const.UI.Color.PositiveValue + "]出血[/color]を与える可能性がある。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "移動の疲労コストが[color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]減少する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "スキルの疲労コストが[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]減少する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_time_of_day.png",
				text = "夜間ペナルティが[color=" + this.Const.UI.Color.PositiveValue + "]半減[/color]する。"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/pov_rain.png",
				text = "厳しい天候デバフへの[color=" + this.Const.UI.Color.PositiveValue + "]免疫[/color]を得る。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "このキャラクターは[color=" + this.Const.UI.Color.PositiveValue + "]出血効果に免疫[/color]を持つ。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "装甲着用による疲労とイニシアチブのペナルティが[color=" + this.Const.UI.Color.NegativeValue + "]30%[/color]増加する。"
			},
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.IsAffectedByRain = false;
		_properties.MovementFatigueCostMult *= 0.5;
		_properties.FatigueEffectMult *= 0.80;
		_properties.IsImmuneToBleeding = true;

		if (this.getContainer().hasSkill("special.night") && _properties.IsAffectedByNight)
		{
			_properties.Vision += 1;
			_properties.RangedSkillMult *= 1.15;
			_properties.RangedDefenseMult *= 1.15;
		}
		
		// Debuffs
		_properties.Stamina += this.getPenalty();
		_properties.Initiative += this.getPenalty();
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/effects/pov_adrenaline_rush_effect"));
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local actor = this.getContainer().getActor();
		// Fallback for a weird error
		if (::MSU.isKindOf(_targetEntity, "lindwurm_tail")) 
		{
			return;
		}

		if (_targetEntity.getCurrentProperties().IsImmuneToBleeding || _damageInflictedHitpoints <= this.Const.Combat.MinDamageToApplyBleeding || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}

		if (!_targetEntity.isAlive())
		{
			return;
		}


		if (!_targetEntity.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " is bleeding");
		}

		//local bleedDamage = ((actor.getCurrentProperties().DamageRegularMin + actor.getCurrentProperties().DamageRegularMaxn) / 2) * 0.10;

		//this.spawnIcon("status_effect_54", _targetEntity.getTile());

		local bleed = _targetEntity.getSkills().getSkillByID("effects.bleeding");
		local bleedAdd = this.new("scripts/skills/effects/bleeding_effect");

		if (bleed != null && bleed.m.Damage < _damageInflictedHitpoints * 0.2)
		{
			bleedAdd.m.Damage = _damageInflictedHitpoints * 0.2;
		}else if (bleed == null)
		{
			bleedAdd.m.Damage = 1 + _damageInflictedHitpoints * 0.2;
		}
		_targetEntity.getSkills().add(bleedAdd);
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

