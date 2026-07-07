this.sbq6_bigfire_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 1
	},
	function create()
	{
		this.m.ID = "actives.sbq6_bigfire_skill";
		this.m.Name = "113. Armageddon";
		this.m.Description = "Deals damage to all allies and enemies, including yourself. After casting the skill, you will be unable to act for 4 turns. This skill can only be used while engaged in melee. \n[color=#8f1e1e]Requirements:[/color] 299 Crowns";
		this.m.Icon = "ui/xx80.png";
		this.m.IconDisabled = "ui/xx80_sw.png";
		this.m.Overlay = "status_effect_116";
		this.m.SoundOnUse = [
			"sounds/enemies/lindwurm_tail_slam_hit_01.wav",
			"sounds/enemies/lindwurm_tail_slam_hit_02.wav",
			"sounds/enemies/lindwurm_tail_slam_hit_03.wav",
			"sounds/enemies/lindwurm_tail_slam_hit_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsAttack = true;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 35;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Damage: [color=" + this.Const.UI.Color.PositiveValue + "]10 ~ 50[/color] (150% damage to armor)"
		});
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Target with Resilient (perk) : 70% chance to not take damage from this skill"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can be used [color=#8f1e1e]" + this.m.Skillcharge + "[/color] more times in this battle"
		});
		if (this.Tactical.isActive())
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "Own [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
			});
		}
		if (this.Tactical.isActive() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This skill can only be used while engaged in melee.[/color]"
			});
		}
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcharge = this.m.Skillcharge - 1;
		this.World.Assets.addMoney(-299);
		local actor = this.getContainer().getActor();
		local atile = actor.getTile();
		local tiles = this.fakeAffectedTiles();
		local rantile;
		local everyone = this.Tactical.Entities.getAllInstances();
		local dmg = this.Math.rand(10, 50);
		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = dmg;
		hitInfo.DamageArmor = dmg * 1.5;
		hitInfo.DamageFatigue = 5;
		hitInfo.DamageDirect = 0.5;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		this.Sound.play("sounds/combat/poison_applied_0" + this.Math.rand(1, 2) + ".wav", this.Const.Sound.Volume.Skill * 1.2, atile.Pos);
		this.Tactical.getCamera().quake(this.createVec(0, -1.0), 6.0, 0.16, 0.35);
		foreach( t in tiles )
		{
			for( local i = 0; i < this.Const.Tactical.MortarImpactParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.MortarImpactParticles[i].Brushes, t, this.Const.Tactical.MortarImpactParticles[i].Delay, this.Const.Tactical.MortarImpactParticles[i].Quantity * 0.3, this.Const.Tactical.MortarImpactParticles[i].LifeTimeQuantity * 0.3, this.Const.Tactical.MortarImpactParticles[i].SpawnRate * 0.3, this.Const.Tactical.MortarImpactParticles[i].Stages, this.createVec(0, -30));
			}
		}
		for( local z = 0; z < tiles.len(); z = ++z )
		{
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 0 + (z * this.Math.rand(10, 30)), function ( _skill )
			{
				rantile = tiles.remove(this.Math.rand(0, tiles.len() - 1));
				for( local i = 0; i < this.Const.Tactical.BurnParticles.len(); i = ++i )
				{
					this.Tactical.spawnParticleEffect(false, this.Const.Tactical.MortarImpactParticles[i].Brushes, rantile, this.Const.Tactical.BurnParticles[i].Delay, this.Const.Tactical.BurnParticles[i].Quantity * 0.8, this.Const.Tactical.BurnParticles[i].LifeTimeQuantity * 0.8, this.Const.Tactical.BurnParticles[i].SpawnRate * 0.8, this.Const.Tactical.BurnParticles[i].Stages, this.createVec(0, -10));
				}
			}.bindenv(this), this);
		}
		foreach( ever in everyone )
		{
			foreach( e in ever )
			{
				if (actor.isAlive() && e.isAlive() && actor.getID() != e.getID())
				{
					if (e.getSkills().hasSkill("perk.hold_out") && this.Math.rand(1, 100) <= 70)
					{} else
					{
						e.onDamageReceived(actor, this, hitInfo);
					}
				}
			}
		}
		local stun = this.new("scripts/skills/effects/ai_stun_effect");
		_user.getSkills().add(stun);
		stun.setTurns(4);
		if (_user.getSkills().hasSkill("perk.hold_out") && this.Math.rand(1, 100) <= 70)
		{} else
		{
			_user.onDamageReceived(_user, this, hitInfo);
		}
		return true;
	}

	function fakeAffectedTiles()
	{
		local atile = this.getContainer().getActor().getTile();
		local ret = [
			atile
		];
		local size = this.Tactical.getMapSize();
		for( local x = 0; x < size.X; x = ++x )
		{
			for( local y = 0; y < size.Y; y = ++y )
			{
				if (atile.getDistanceTo(this.Tactical.getTileSquare(x, y)) <= 14 && this.Tactical.getTileSquare(x, y) != atile && this.Math.rand(1, 7) == 1)
				{
					if (atile.getDistanceTo(this.Tactical.getTileSquare(x, y)) >= 7)
					{
						if (this.Math.rand(1, 3) == 1)
						{
							ret.push(this.Tactical.getTileSquare(x, y));
						}
					}
					else
					{
						ret.push(this.Tactical.getTileSquare(x, y));
					}
				}
			}
		}
		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		if (this.World.Assets.getMoney() < 299)
		{
			return false;
		}
		else if (this.m.Skillcharge <= 0)
		{
			return false;
		}
		else if (!this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			return false;
		}
		return true;
	}

	function isHidden()
	{
		if (this.m.Skillcharge > 0)
		{
			return false;
		}
		return true;
	}

	function onCombatFinished()
	{
		this.m.Skillcharge = 1;
	}

});

