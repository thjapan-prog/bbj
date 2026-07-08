this.xxitem_meteoraa_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.xx_a";
		this.m.Name = "Meteor Whip";
		this.m.Description = "Strikes the enemy with an iron ball attached to a rope. Hitting the head has an additional effect.";
		this.m.KilledString = "Smashed";
		this.m.Icon = "skills/active_39.png";
		this.m.IconDisabled = "skills/active_39_sw.png";
		this.m.Overlay = "active_39";
		this.m.SoundOnUse = [
			"sounds/combat/pound_01.wav",
			"sounds/combat/pound_02.wav",
			"sounds/combat/pound_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/pound_hit_01.wav",
			"sounds/combat/pound_hit_02.wav",
			"sounds/combat/pound_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.2;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 55;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of " + this.getMaxRange() + " tiles"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "When hitting the head: 30 Piercing damage, Daze"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Flail/Mace/Hammer weapons mastery effect: +30 Piercing damage when hitting the head"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectChop);
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this && _targetEntity.isAlive() && !_targetEntity.isDying())
		{
			if (_bodyPart == this.Const.BodyPart.Head)
			{
				local user = this.getContainer().getActor();
				local rr = 30;
				local rrbonus = 30;
				if (!_targetEntity.getCurrentProperties().IsImmuneToDaze)
				{
					_targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));
					if (!user.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " struck a hit that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed");
					}
				}
				if (user.getCurrentProperties().IsSpecializedInFlails)
				{
					rr = rr + rrbonus;
				}
				if (user.getCurrentProperties().IsSpecializedInHammers)
				{
					rr = rr + rrbonus;
				}
				if (user.getCurrentProperties().IsSpecializedInMaces)
				{
					rr = rr + rrbonus;
				}
				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = rr;
				hitInfo.DamageDirect = 1;
				hitInfo.BodyPart = this.Const.BodyPart.Body;
				hitInfo.BodyDamageMult = 1;
				_targetEntity.onDamageReceived(this.getContainer().getActor(), this, hitInfo);
				return true;
			}
		}
	}

});

