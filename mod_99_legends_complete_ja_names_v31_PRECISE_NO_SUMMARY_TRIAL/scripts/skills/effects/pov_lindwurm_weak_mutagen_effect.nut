this.pov_lindwurm_weak_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_lindwurm_weak_mutagen";
		this.m.Name = "リンドヴルムの酸";
		this.m.Icon = "skills/pov_lindwurm_mutant.png";
		this.m.IconMini = "pov_mini_lindwurm_mutant";
		this.m.Overlay = "lindwurm";
		this.m.Type = this.Const.SkillType.Trait;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
		this.m.Order = this.Const.SkillOrder.Background + 1;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Acidic blood[/color]: This character\'s blood is highly pressurized and burns upon prolonged exposure to air. Attackers who break skin will find themselves unpleasantly surprised by the resultant spray. This same acid slighlty reduces healing speed.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Acidic Reinforcement[/color]: By slightly infusing their weapons with their own acid, the Vatt\'ghern does extra damage to enemy armor. During combat, they can also strengthen this infusion. \n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Draconic Cockiness[/color]: The Vatt\'ghern is full of himself with an unnatural assurance and ego, disregarding his own defense, and demanding even more pay than usual.";
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
				text = "このキャラクターは[color=" + this.Const.UI.Color.povTooltipBlue + "]「酸のコーティング」[/color]スキルを獲得する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_poison.png",
				text = "このキャラクターの血は[color=" + this.Const.UI.Color.PositiveValue + "]酸[/color]で燃え、ヒットポイントダメージを与えるたびに隣接した攻撃者の装甲にダメージを与える。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_poison.png",
				text = "このキャラクターは[color=" + this.Const.UI.Color.PositiveValue + "]酸への免疫[/color]を持つ。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "装甲への有効性が[color=" + this.Const.UI.Color.PositiveValue + "]15%[/color]上昇し、追加でフラットボーナス[color=" + this.Const.UI.Color.PositiveValue + "]15[/color]が加算される"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "このキャラクターの失ったヒットポイントの回復が[color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]遅くなる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "このキャラクターの近接防御が[color=" + this.Const.UI.Color.NegativeValue + "]15% + 5[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+40[/color]% 日給増加"
			}
			
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.DamageArmorMult *= 1.15;
		_properties.DamageArmorMult += 0.15;
		// Also causes acid effect on attackers
		// Also gets coat with acid skill

		// Debuffs
		_properties.DailyWageMult *= 1.40;
		_properties.HitpointsRecoveryRateMult *= 0.75;
		_properties.MeleeDefenseMult *= 0.85;
		_properties.MeleeDefense += -5;
	}

	function onAdded()
	{
		this.m.Container.getActor().getFlags().add("body_immune_to_acid");
		this.m.Container.getActor().getFlags().add("head_immune_to_acid");
	
		if (!this.m.Container.hasSkill("actives.pov_coat_with_acid"))
		{
			local acidCoat = this.new("scripts/skills/actives/pov_coat_with_acid_skill");
			this.m.Container.add(acidCoat);
		}
	
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_damageHitpoints <= 0)
		{
			return;
		}

		if (_attacker == null || !_attacker.isAlive())
		{
			return;
		}

		if (_attacker.getID() == this.getContainer().getActor().getID())
		{
			return;
		}

		if (_attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) > 1)
		{
			return;
		}

		if (_attacker.getFlags().has("lindwurm"))
		{
			return;
		}

		if ((_attacker.getFlags().has("body_immune_to_acid") || _attacker.getArmor(this.Const.BodyPart.Body) <= 0) && (_attacker.getFlags().has("head_immune_to_acid") || _attacker.getArmor(this.Const.BodyPart.Head) <= 0))
		{
			return;
		}

		local poison = _attacker.getSkills().getSkillByID("effects.acid");

		if (poison == null)
		{
			_attacker.getSkills().add(this.new("scripts/skills/effects/acid_effect"));
		}
		else
		{
			poison.resetTime();
		}

		this.spawnIcon("status_effect_78", _attacker.getTile());
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

