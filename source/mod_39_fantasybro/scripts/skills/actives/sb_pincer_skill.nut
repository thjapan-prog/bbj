this.sb_pincer_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 3,
		Skillcool = 3
	},
	function create()
	{
		this.m.ID = "actives.sb_pincer_skill";
		this.m.Name = "47. Pincer Thrust";
		this.m.Description = "Attack the target along with any allies with spears within 2 tile of the target. (Melee Skill)\n[color=#8f1e1e]Requirements:[/color] Spear";
		this.m.Icon = "ui/xx62.png";
		this.m.IconDisabled = "ui/xx62_sw.png";
		this.m.SoundOnUse = [
			"sounds/combat/thrust_01.wav",
			"sounds/combat/thrust_02.wav",
			"sounds/combat/thrust_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/thrust_hit_01.wav",
			"sounds/combat/thrust_hit_02.wav",
			"sounds/combat/thrust_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 227;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.5;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "All allies with a spear within 2 tile of the target also participate in the attack, dealing +40 additional damage per ally. (Base Damage 80, Max Damage 280)"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Cooldown: 3 turn \nCooldown left: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] turn"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());
		local target = _targetTile.getEntity();
		local flip;
		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}
			if (_targetTile.getDistanceTo(a.getTile()) > 2)
			{
				continue;
			}
			if (!a.getSkills().hasSkill("actives.thrust") && !a.getSkills().hasSkill("actives.prong"))
			{
				continue;
			}
			if (a.getFaction() == _user.getFaction())
			{
				flip = !this.m.IsProjectileRotated && target.getPos().X > a.getPos().X;
				this.Tactical.spawnProjectileEffect("effect_impale_N", a.getTile(), _targetTile, 2, 1.1, true, flip);
				this.Tactical.spawnProjectileEffect("effect_impale_N", a.getTile(), _targetTile, 2, 1.5, true, flip);
			}
		}
		flip = !this.m.IsProjectileRotated && target.getPos().X > _user.getPos().X;
		this.Tactical.spawnProjectileEffect("effect_impale_N", myTile, _targetTile, 2, 1.1, true, flip);
		this.Tactical.spawnProjectileEffect("effect_impale_N", myTile, _targetTile, 2, 1.5, true, flip);
		return this.attackEntity(_user, target, false);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageDirectAdd = 0;
			_properties.DamageDirectMeleeAdd = 0;
			_properties.DamageDirectRangedAdd = 0;
			_properties.DamageDirectMult = 1;
			local actor = this.getContainer().getActor();
			local mainh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			local offh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			local rr = 80;
			if (_targetEntity != null && actor.isPlacedOnMap())
			{
				local actors = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
				foreach( a in actors )
				{
					if (a.getID() == actor.getID())
					{
						continue;
					}
					if (_targetEntity.getTile().getDistanceTo(a.getTile()) > 2)
					{
						continue;
					}
					if (!a.getSkills().hasSkill("actives.thrust") && !a.getSkills().hasSkill("actives.prong"))
					{
						continue;
					}
					if (a.getFaction() == actor.getFaction())
					{
						rr = rr + 40;
					}
				}
			}
			if (mainh != null && offh == null && mainh.isDoubleGrippable())
			{
				_properties.DamageTotalMult /= 1.25;
			}
			_properties.DamageRegularMin = this.Math.min(rr, 280);
			_properties.DamageRegularMax = this.Math.min(rr, 280);
			_properties.DamageArmorMult = 1.0;
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSpears ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function isHidden()
	{
		if (this.m.Container.getActor().isPlacedOnMap() && !this.getContainer().hasSkill("actives.thrust") && !this.getContainer().hasSkill("actives.prong"))
		{
			return true;
		}
		return false;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.m.Skillcool < this.m.Cooldown)
		{
			return false;
		}

		local actor = this.getContainer().getActor();
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (!actor.isAlive())
		{
			return false;
		}
		else if (this.getContainer().hasSkill("actives.thrust") || this.getContainer().hasSkill("actives.prong"))
		{
			return true;
		}

		return false;
	}

	function onTurnStart()
	{
		this.m.Skillcool = this.m.Skillcool + 1;
	}

	function onCombatFinished()
	{
		this.m.Skillcool = this.m.Cooldown;
	}

});

