this.sb_sguard_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 5,
		Skillcool = 5
	},
	function create()
	{
		this.m.ID = "actives.sb_sguard_skill";
		this.m.Name = "56. 盾の守護";
		this.m.Description = "このターンのAPをすべて使用し、次のターンまで詠唱者と対象が受けるダメージを99%減少させる。詠唱者は盾の耐久値の40%を失う。このスキルは自身にも使用可能。\n[color=#8f1e1e]必要条件：[/color] 盾";
		this.m.Icon = "ui/xx67.png";
		this.m.IconDisabled = "ui/xx67_sw.png";
		this.m.SoundOnUse = [
			"sounds/combat/shieldwall_01.wav",
			"sounds/combat/shieldwall_02.wav",
			"sounds/combat/shieldwall_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 25;
		this.m.MinRange = 0;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "盾の耐久値が5以下の場合は使用不可"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "「シールドウォール」を使用中の対象には使用不可"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "クールダウン: 5ターン\n残りクールダウン: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] ターン"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		local offh = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local qq = offh.m.Condition - (offh.m.ConditionMax * 0.4);
		if (qq <= 1)
		{
			offh.m.Condition = 1;
		}
		else
		{
			offh.m.Condition = qq;
		}
		if (_targetTile.ID != _user.getTile().ID)
		{
			_targetTile.getEntity().getSkills().add(this.new("scripts/skills/effects/sb_sguard_effect_target"));
		}
		_user.getSkills().add(this.new("scripts/skills/effects/sb_sguard_effect_caster"));
		_user.setActionPoints(0);
		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}
		if (!this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))
		{
			return false;
		}
		if (_targetTile.getEntity().getSkills().hasSkill("effects.shieldwall"))
		{
			return false;
		}
		if (_targetTile.getEntity().getSkills().hasSkill("effects.xxdefbb_effect_target"))
		{
			return false;
		}
		return true;
	}

	function isHidden()
	{
		if (this.m.Container.getActor().isPlacedOnMap())
		{
			local actorsk = this.getContainer();
			if (!actorsk.hasSkill("actives.knock_back") && !actorsk.hasSkill("actives.shieldwall"))
			{
				return true;
			}
			return false;
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
		local offh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		if (offh == null)
		{
			return false;
		}
		else if (!offh.isItemType(this.Const.Items.ItemType.Shield))
		{
			return false;
		}
		else if (offh.m.Condition <= 5)
		{
			return false;
		}
		else if (this.getContainer().hasSkill("effects.shieldwall"))
		{
			return false;
		}
		else if (this.getContainer().hasSkill("actives.knock_back"))
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
