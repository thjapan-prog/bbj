this.sb2_chokentoss_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sb2_chokentoss_skill";
		this.m.Name = "12. Brute Toss (Toss)";
		this.m.Description = "Throws the selected target onto a designated empty tile to inflict damage.";
		this.m.Icon = "ui/xx0.png";
		this.m.IconDisabled = "ui/xx0_sw.png";
		this.m.Overlay = "active_rand";
		this.m.SoundOnUse = [
			"sounds/combat/round_swing_01.wav",
			"sounds/combat/round_swing_02.wav",
			"sounds/combat/round_swing_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/thresh_hit_01.wav",
			"sounds/combat/thresh_hit_02.wav",
			"sounds/combat/thresh_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 229;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of " + this.getMaxRange() + " tiles (After Level 10: +2 Max Range)"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Inflicts 15 fatigue. Removes Shieldwall/Spearwall/Riposte. 30~150 Fall damage (150% damage to armor)"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]WARNING:[/color] This skill is removed at the end of the turn or when waiting. If there are no selected targets within 1 tile, the skill is wasted."
		});
		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!_targetTile.IsEmpty)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target;
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getAllInstances();
		this.removeSelf();
		this.spawnAttackEffect(myTile, this.Const.Tactical.AttackEffectThresh2);
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getID() == _user.getID())
				{
					continue;
				}
				if (myTile.getDistanceTo(a.getTile()) > 1)
				{
					if (a.getSkills().hasSkill("effects.sb_chokentoss_effect"))
					{
						a.getSkills().removeByID("effects.sb_chokentoss_effect");
					}
					continue;
				}
				if (a.getSkills().hasSkill("effects.sb_chokentoss_effect"))
				{
					a.getSkills().removeByID("effects.sb_chokentoss_effect");
					if (a.getSkills().hasSkill("effects.sleeping"))
					{
						a.getSkills().removeByID("effects.sleeping");
					}
					target = a;
					break;
				}
			}
		}

		if (target == null || !_targetTile.IsEmpty)
		{
			return false;
		}

		if (!_user.isHiddenToPlayer() && (_targetTile.IsVisibleForPlayer || _targetTile.IsVisibleForPlayer))
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " threw " + this.Const.UI.getColorizedEntityName(target));
		}

		local overwhelm = this.getContainer().getSkillByID("perk.overwhelm");
		if (overwhelm != null)
		{
			overwhelm.onTargetHit(this, target, this.Const.BodyPart.Body, 0, 0);
		}

		local skills = target.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");
		this.applyFatigueDamage(target, 15);
		local damage = this.Math.rand(30, 150);
		local tag = {
			Attacker = _user,
			Skill = this,
			HitInfo = clone this.Const.Tactical.HitInfo
		};
		tag.HitInfo.DamageRegular = damage;
		tag.HitInfo.DamageArmor = damage * 1.5;
		tag.HitInfo.DamageFatigue = 5;
		tag.HitInfo.DamageDirect = 0.5;
		tag.HitInfo.BodyPart = this.Const.BodyPart.Body;
		tag.HitInfo.BodyDamageMult = 1.0;
		tag.HitInfo.FatalityChanceMult = 0.0;
		target.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
		this.Tactical.getNavigator().teleport(target, _targetTile, this.onKnockedDown, tag, true);
		return true;
	}

	function onKnockedDown( _entity, _tag )
	{
		if (_tag.Attacker.isAlive() && _entity.isAlive() && _entity.isAttackable())
		{
			if (_tag.Skill.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(_tag.Skill.m.SoundOnHit[this.Math.rand(0, _tag.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _entity.getPos());
			}
			_entity.onDamageReceived(_tag.Attacker, _tag.Skill, _tag.HitInfo);
		}
	}

	function onTurnEnd()
	{
		this.removeSelf();
		local actors = this.Tactical.Entities.getAllInstances();
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getSkills().hasSkill("effects.sb_chokentoss_effect"))
				{
					a.getSkills().removeByID("effects.sb_chokentoss_effect");
				}
			}
		}
	}

	function onWaitTurn()
	{
		this.removeSelf();
		local actors = this.Tactical.Entities.getAllInstances();
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getSkills().hasSkill("effects.sb_chokentoss_effect"))
				{
					a.getSkills().removeByID("effects.sb_chokentoss_effect");
				}
			}
		}
	}

	function isUsable()
	{
		local xxcan = false;
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap())
		{
			return false;
		}
		else
		if (!this.skill.isUsable())
		{
			return false;
		}
		else
		{
			local myTile = actor.getTile();
			local actors = this.Tactical.Entities.getAllInstances();
			foreach( i in actors )
			{
				foreach( a in i )
				{
					if (a.getID() == actor.getID())
					{
							continue;
					}
					if (myTile.getDistanceTo(a.getTile()) > 1)
					{
						continue;
					}
					if (a.getSkills().hasSkill("effects.sb_chokentoss_effect"))
					{
						xxcan = true;
						break;
					}
				}
			}
		}
		if (!xxcan)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.MaxRange = 2 + (this.getContainer().getActor().getLevel() >= 10 ? 2 : 0);
	}

});

