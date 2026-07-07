this.sb_judo_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 3,
		Skillcool = 3,
		Sklevel = 0
	},
	function create()
	{
		this.m.ID = "actives.sb_judo_skill";
		this.m.Name = "36. 柔道投げ";
		this.m.Description = "対象を詠唱者の後ろへ投げ飛ばし、ダメージを与える。";
		this.m.Icon = "ui/xx52.png";
		this.m.IconDisabled = "ui/xx52_sw.png";
		this.m.Overlay = "active_rand";
		this.m.SoundOnUse = [
			"sounds/combat/indomitable_01.wav",
			"sounds/combat/indomitable_02.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/smash_hit_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.4;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "フリングバック（26）スキルを持つ場合: このスキルが強化される"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "ラインブレイカー（38）スキルを持つ場合: このスキルが強化される"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "クールダウン: 3 ターン\n残りクールダウン: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] ターン"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		local rr = 0;
		if (this.getContainer().getActor().getSkills().hasSkill("actives.sb_linebreaker_skill"))
		{
			rr = rr + 2;
		}
		if (this.getContainer().getActor().getSkills().hasSkill("actives.sb_flingback_skill"))
		{
			rr = rr + 3;
		}
		this.m.Sklevel = rr;
		if (this.m.Sklevel == 2)
		{
			this.m.Name = "36. Tempest Throw";
			this.m.Description = "対象を詠唱者の後ろへ投げ飛ばし、ダメージを与える。命中率は常に100%。命中時、対象をよろめかせ、シールドウォール/スピアウォール/リポストを解除する。";
			this.m.MaxRange = 1;
			this.m.SoundOnUse = [
				"sounds/combat/rage_01.wav",
				"sounds/combat/rage_02.wav"
			];
		}
		else if (this.m.Sklevel == 3)
		{
			this.m.Name = "36. Titan Throw";
			this.m.Description = "対象を詠唱者の後ろへ投げ飛ばし、ダメージを与える。命中率は常に65%。命中時、対象をよろめかせ、シールドウォール/スピアウォール/リポストを解除する。";
			this.m.MaxRange = 2;
			this.m.SoundOnUse = [
				"sounds/combat/rage_01.wav",
				"sounds/combat/rage_02.wav"
			];
		}
		else if (this.m.Sklevel == 5)
		{
			this.m.Name = "36. Ultimate Throw";
			this.m.Description = "対象を詠唱者の後ろへ投げ飛ばし、ダメージを与える。命中率は常に100%。命中時、対象をよろめかせ、シールドウォール/スピアウォール/リポストを解除する。";
			this.m.MaxRange = 2;
			this.m.SoundOnUse = [
				"sounds/combat/rage_01.wav",
				"sounds/combat/rage_02.wav"
			];
		}
		else
		{
			this.m.Name = "36. 柔道投げ";
			this.m.Description = "対象を詠唱者の後ろへ投げ飛ばし、ダメージを与える。命中率は常に65%。命中時、対象をよろめかせ、シールドウォール/スピアウォール/リポストを解除する。";
			this.m.MaxRange = 1;
			this.m.SoundOnUse = [
				"sounds/combat/indomitable_01.wav",
				"sounds/combat/indomitable_02.wav"
			];
		}
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		local target = _targetTile.getEntity();
		local rr = 65;
		if (this.m.Sklevel == 2 || this.m.Sklevel == 5)
		{
			rr = 100;
		}
		if (this.Math.rand(1, 99) > rr)
		{
			this.Tactical.getShaker().shake(_targetTile.getEntity(), _user.getTile(), 4);
			local overwhelm = this.getContainer().getSkillByID("perk.overwhelm");
			if (overwhelm != null)
			{
				overwhelm.onTargetMissed(this, target);
			}
			return false;
		}

		local knockToTile = this.findTileToKnockBackTo(_user.getTile(), _targetTile);

		if (knockToTile == null)
		{
			return false;
		}

		if (target.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return false;
		}

		if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " moved " + this.Const.UI.getColorizedEntityName(target));
		}

		if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has staggered " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
		}
		target.getSkills().add(this.new("scripts/skills/effects/staggered_effect"));

		if (this.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
		}

		if (this.m.Sklevel >= 2)
		{
			this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[0].Brushes, _targetTile, this.Const.Tactical.DustParticles[0].Delay, this.Const.Tactical.DustParticles[0].Quantity, this.Const.Tactical.DustParticles[0].LifeTimeQuantity, this.Const.Tactical.DustParticles[0].SpawnRate, this.Const.Tactical.DustParticles[0].Stages);
		}

		local skills = target.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");
		local tag = {
			Attacker = _user,
			TargetTile = _targetTile,
			Skill = this
		};
		target.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
		this.Tactical.getNavigator().teleport(target, knockToTile, this.onKnockedDown, tag, true);
		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.HitChanceMult[this.Const.BodyPart.Head] = 0;
			_properties.HitChanceMult[this.Const.BodyPart.Body] = 1;
			_properties.DamageDirectAdd = 0;
			_properties.DamageDirectMeleeAdd = 0;
			_properties.DamageDirectRangedAdd = 0;
			_properties.DamageDirectMult = 1;
			local actor = this.getContainer().getActor();
			local mainh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			local offh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			if (mainh != null && offh == null && mainh.isDoubleGrippable())
			{
				_properties.DamageTotalMult /= 1.25;
			}
			if (this.m.Sklevel == 2 || this.m.Sklevel == 5)
			{
				_properties.DamageRegularMin = 70;
			}
			else
			{
				_properties.DamageRegularMin = 30;
			}
			_properties.DamageRegularMax = this.m.Sklevel >= 3 ? 170 : 100;
			_properties.DamageArmorMult = 1.5;
		}
	}

	function onKnockedDown( _entity, _tag )
	{
		if (_tag.Attacker.isAlive() && !_tag.Attacker.isDying() && _entity.isAlive() && !_entity.isDying() && _entity.isAttackable())
		{
			if (_tag.Skill.m.Sklevel >= 2)
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[0].Brushes, _entity.getTile(), this.Const.Tactical.DustParticles[0].Delay, this.Const.Tactical.DustParticles[0].Quantity, this.Const.Tactical.DustParticles[0].LifeTimeQuantity, this.Const.Tactical.DustParticles[0].SpawnRate, this.Const.Tactical.DustParticles[0].Stages);
			}
			_tag.Attacker.getCurrentProperties().MeleeSkill += 500;
			_tag.Skill.attackEntity(_tag.Attacker, _entity, false)
		}
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _targetTile.getDirectionTo(_userTile);

		if (_userTile.hasNextTile(dir))
		{
			local flingToTile = _userTile.getNextTile(dir);

			if (flingToTile.IsEmpty && this.Math.abs(flingToTile.Level - _userTile.Level) <= 1)
			{
				return flingToTile;
			}
		}

		local altdir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_userTile.hasNextTile(altdir))
		{
			local flingToTile = _userTile.getNextTile(altdir);

			if (flingToTile.IsEmpty && this.Math.abs(flingToTile.Level - _userTile.Level) <= 1)
			{
				return flingToTile;
			}
		}

		altdir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_userTile.hasNextTile(altdir))
		{
			local flingToTile = _userTile.getNextTile(altdir);

			if (flingToTile.IsEmpty && this.Math.abs(flingToTile.Level - _userTile.Level) <= 1)
			{
				return flingToTile;
			}
		}

		return null;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return this.skill.onVerifyTarget(_originTile, _targetTile) && !_targetTile.getEntity().getCurrentProperties().IsRooted && !_targetTile.getEntity().getCurrentProperties().IsImmuneToKnockBackAndGrab && this.findTileToKnockBackTo(_originTile, _targetTile) != null;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else
		if (this.m.Skillcool < this.m.Cooldown)
		{
			return false;
		}

		return true;
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
