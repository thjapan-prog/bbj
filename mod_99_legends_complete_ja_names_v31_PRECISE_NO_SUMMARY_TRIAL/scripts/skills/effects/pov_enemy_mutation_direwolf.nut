this.pov_enemy_mutation_direwolf <- this.inherit("scripts/skills/skill", {
	m = {
		//TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_enemy_mutation_direwolf";
		this.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "] Beastly Endurance [/color]";
		this.m.Description = "This enemy has some properties of a Direwolf! They show vastly increased stamina in battle, as well as increased night vision, but are more hindered by armor.";
		this.m.Icon = "skills/pov_direwolf_mutant.png";
		this.m.IconMini = "pov_mini_direwolf_mutant";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "They show vastly increased stamina in battle, as well as increased night vision, but are more hindered by armor.";
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
		local penalty = totalPen * 0.30;
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
				icon = "ui/icons/fatigue.png",
				text = "移動の疲労コストが[color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]減少する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "スキルの疲労コストが[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]減少し、最大疲労度が[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_time_of_day.png",
				text = "夜間ペナルティが[color=" + this.Const.UI.Color.PositiveValue + "]半減[/color]する。"
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
			}
		];
		return ret;
	}

	function onAdded() 
	{
		local actor = this.getContainer().getActor();
		if (!::MSU.isKindOf(actor, "player")) 
		{
			::TLW.MutagenDrop.addMutagenDrop(actor, ::TLW.Mutation.Direwolf);
	  	}
	}

	/*
	// Look at the onUpdate!!!
	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/effects/pov_adrenaline_rush_effect"));
	}*/

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local actor = this.getContainer().getActor();

		if (actor.getCurrentProperties().YrdenTrapped)
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

		//local bleed = _targetEntity.getSkills().getSkillByID("effects.bleeding");
		local bleedAdd = this.new("scripts/skills/effects/bleeding_effect");
		bleedAdd.m.Damage = 4 + _damageInflictedHitpoints * 0.1;
		_targetEntity.getSkills().add(bleedAdd);
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		if (!actor.getSkills().hasSkill("effects.pov_adrenaline_rush"))
		{
			actor.getSkills().add(this.new("scripts/skills/effects/pov_adrenaline_rush_effect"));
		}

		// Buffs
		_properties.IsAffectedByRain = false;
		_properties.MovementFatigueCostMult *= 0.5;
		_properties.FatigueEffectMult *= 0.75;
		_properties.StaminaMult *= 1.15;
		_properties.MeleeSkillMult *= 1.06;
		_properties.MeleeSkill += 4;
		_properties.InitiativeMult *= 1.10;
		_properties.IsImmuneToBleeding = true; // Too Op On Light Enemies? (Idc)
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

});
