this.pov_schrat_mutagen_upgraded_effect <- this.inherit("scripts/skills/skill", {
	m = {
		HeadArmorBoost = 40,
		HeadDamageTaken = 0,
		BodyArmorBoost = 40,
		BodyDamageTaken = 0,
		Spawned = 0
	},
	function create()
	{
		this.m.ID = "effects.pov_schrat_mutagen_upgraded";
		this.m.Name = "[color="+ ::Const.UI.Color.povMutationUpgrade + "]Reinforced Mutation: Greenwood Schrat[/color]";
		this.m.Icon = "skills/pov_schrat_greenwood.png";
		this.m.IconMini = "";
		this.m.Overlay = "schrat";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Flexile Ligaments[/color]: This character\'s legs have mutated to respond with unnatural force and stability, allowing them to resist any attempt to be displaced. Their stance remains firm, even against powerful external forces.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Barkskin[/color]: This character\'s skin has become incredibly rigid, forming a natural armor that absorbs a portion of incoming damage. When bearing a shield, their defensive instincts sharpen further, providing them the best resilience. If damaged substantially by an attack, a sapling takes root to defend them.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Encumbered Frame[/color]: The weight of their altered form makes movement far more taxing, causing them to tire slightly quicker when repositioning. Without a shield to balance their hardened structure, they become weaker to incoming attacks.\n\n [color=" + this.Const.UI.Color.povPerkBlue + "]Flammable Carapace[/color]: The mutation has an unfortunate drawback..while their body is tougher than normal, it is also highly susceptible to fire, causing them to suffer extreme burns when exposed to flames, though the body has adapted, and is not as reactive as it used to be.";
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
				text = "移動させられることへの免疫を持つ。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "最大HPの[color=" + this.Const.UI.Color.PositiveValue + "]5%[/color]を超えるダメージを受けた場合、空きマスがあれば[color=" + this.Const.UI.Color.PositiveValue + "]苗木を生成する[/color]。[color=" + this.Const.UI.Color.NegativeValue + "]1戦闘中6回[/color]まで。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "このキャラクターの皮膚は硬く、[color=" + this.Const.UI.Color.PositiveValue + "]40[/color]ポイントの天然装甲を付与する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/shield_damage.png",
				text = "盾を装備している時、全防御に[color=" + this.Const.UI.Color.PositiveValue + "]+16[/color]、ダメージ軽減に[color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color]のボーナスを得る"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "盾による攻撃のダメージが[color=" + this.Const.UI.Color.PositiveValue + "]+50%[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "移動の疲労コストが[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_fire.png",
				text = "このキャラクターは炎攻撃から[color=" + this.Const.UI.Color.NegativeValue + "]125%[/color]多くダメージを受ける。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/shield_damage.png",
				text = "盾を使用していない時、このキャラクターが受けるダメージが[color=" + this.Const.UI.Color.NegativeValue + "]+14%[/color]増加する。"
			}
			
		];
		return ret;
	}

	function onUpdate( _properties )
	{	
		// Buffs
		_properties.IsImmuneToKnockBackAndGrab = true;
		_properties.Armor[this.Const.BodyPart.Head] += this.Math.max(0.0, this.m.HeadArmorBoost - this.m.HeadDamageTaken);
		_properties.Armor[this.Const.BodyPart.Body] += this.Math.max(0.0, this.m.BodyArmorBoost - this.m.BodyDamageTaken);
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.HeadArmorBoost;
		_properties.ArmorMax[this.Const.BodyPart.Body] += this.m.BodyArmorBoost;
		// Debuffs
		_properties.MovementFatigueCostMult *= 1.15;
		// No shield Effect

		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			_properties.DamageReceivedRegularMult *= 0.70;
			_properties.MeleeDefense += 16;
			_properties.RangedDefense += 16;
		}else{
			_properties.DamageReceivedRegularMult *= 1.14;
			if (!actor.getSkills().hasSkill("scripts/skills/effects/pov_schrat_no_shield_effect"))
			{
				actor.getSkills().add(this.new("scripts/skills/effects/pov_schrat_no_shield_effect"));
			}
		}
	}
	
	function onCombatStarted()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
		this.m.Spawned = 0;
	}

	function onCombatFinished()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
        this.m.Spawned = 0;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local item = _skill.getItem();
		if (item != null)
		{
			if (_skill.isAttack() && item.isItemType(this.Const.Items.ItemType.Shield))
			{
				_properties.DamageTotalMult *= 1.50;
			}
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
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

		if (_hitInfo.DamageType == this.Const.Damage.DamageType.Burning)
		{
			_properties.DamageReceivedRegularMult *= 1.25;
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		local actor = this.getContainer().getActor();

		// Max 5 Spawn per battle
		if (_damageHitpoints >= actor.getHitpointsMax() * 0.05 && this.m.Spawned < 6)
		{
			local candidates = [];
			local myTile = actor.getTile();

			for( local i = 0; i < 6; i = ++i )
			{
				if (!myTile.hasNextTile(i))
				{
				}
				else
				{
					local nextTile = myTile.getNextTile(i);

					if (nextTile.IsEmpty && this.Math.abs(myTile.Level - nextTile.Level) <= 1)
					{
						candidates.push(nextTile);
					}
				}
			}

			if (candidates.len() != 0)
			{
				local spawnTile = candidates[this.Math.rand(0, candidates.len() - 1)];
				local sapling = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/schrat_small", spawnTile.Coords);
				sapling.setFaction(actor.getFaction());
				sapling.riseFromGround();
				this.m.Spawned += 1;
			}
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


