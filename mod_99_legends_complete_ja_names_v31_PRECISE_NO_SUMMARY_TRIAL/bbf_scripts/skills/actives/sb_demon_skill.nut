this.sb_demon_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 1
	},
	function create()
	{
		this.m.ID = "actives.sb_demon_skill";
		this.m.Name = "17. 悪魔化";
		this.m.Description = "邪悪な魔術で大いなる力を得る。しかし大いなる力には大いなる責任が伴う。";
		this.m.Icon = "ui/xx27.png";
		this.m.IconDisabled = "ui/xx27_sw.png";
		this.m.SoundOnUse = [
			"sounds/enemies/orc_charge_01.wav",
			"sounds/enemies/orc_charge_02.wav",
			"sounds/enemies/orc_charge_03.wav",
			"sounds/enemies/orc_charge_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 1;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 3,
			type = "text",
			icon = "ui/icons/special.png",
			text = "ヒットポイント+100。ダメージ+50%。完全状態になる。防具と兜が落下または破壊され、残耐久値が生きた防具を形成する。"
		});
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "戦争犯罪（73）スキルを持つ場合: このスキルのダメージをさらに増加させる。"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "このスキルは自身を対象として選択して使用する。[color=" + this.Const.UI.Color.NegativeValue + "]このキャラクターに戦闘後に恐ろしいことが起こる可能性がある[/color]"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcharge = this.m.Skillcharge - 1
		local actor = this.getContainer().getActor();
		local myTile = _user.getTile();
		local helmet = _user.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local armor = _user.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local headr = 0;
		local bodyr = 0;
		if (helmet != null)
		{
			if (helmet.getCondition() > 0)
			{
				headr = helmet.getCondition();
				helmet.setCondition(1);
			}
			if (this.Math.rand(1, 100) <= 80 && armor.m.IsDroppedAsLoot)
			{
				myTile.Items.push(helmet);
				myTile.IsContainingItems = true;
				helmet.onDrop(myTile);
			}
			_user.getItems().unequip(helmet);
		}
		if (armor != null)
		{
			if (armor.getCondition() > 0)
			{
				bodyr = armor.getCondition();
				armor.setCondition(1);
			}
			if (this.Math.rand(1, 100) <= 80 && armor.m.IsDroppedAsLoot)
			{
				myTile.Items.push(armor);
				myTile.IsContainingItems = true;
				armor.onDrop(myTile);
			}
			_user.getItems().unequip(armor);
		}
		actor.getBaseProperties().Armor[this.Const.BodyPart.Head] += headr;
		actor.getBaseProperties().Armor[this.Const.BodyPart.Body] += bodyr;
		actor.getBaseProperties().ArmorMax[this.Const.BodyPart.Head] += headr;
		actor.getBaseProperties().ArmorMax[this.Const.BodyPart.Body] += bodyr;
		_user.setHitpoints(_user.getHitpointsMax());
		_user.setMoraleState(this.Const.MoraleState.Confident);
		_user.setFatigue(0);
		_user.getSkills().removeByType(this.Const.SkillType.TemporaryInjury);
		_user.getSprite("permanent_injury_1").Visible = false;
		_user.getSprite("permanent_injury_2").Visible = false;
		_user.getSprite("permanent_injury_3").Visible = false;
		_user.getSprite("permanent_injury_4").Visible = false;
		_user.setDirty(true);
		_user.onUpdateInjuryLayer();
		for( local i = 0; i < this.Const.Tactical.RaiseUndeadParticles.len(); i = ++i )
		{
			this.Tactical.spawnParticleEffect(false, this.Const.Tactical.RaiseUndeadParticles[i].Brushes, _user.getTile(), this.Const.Tactical.RaiseUndeadParticles[i].Delay, this.Const.Tactical.RaiseUndeadParticles[i].Quantity, this.Const.Tactical.RaiseUndeadParticles[i].LifeTimeQuantity, this.Const.Tactical.RaiseUndeadParticles[i].SpawnRate, this.Const.Tactical.RaiseUndeadParticles[i].Stages);
		}
		this.m.Container.add(this.new("scripts/skills/effects/sb_demon_effect"));
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.m.Skillcharge <= 0)
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
