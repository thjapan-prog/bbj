this.sb_frenzy_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 1
	},
	function create()
	{
		this.m.ID = "actives.sb_frenzy_skill";
		this.m.Name = "28. 邪悪な狂乱";
		this.m.Description = "味方の力を奪い、自身を強化する。この効果は戦闘終了まで持続する。";
		this.m.Icon = "ui/xx73.png";
		this.m.IconDisabled = "ui/xx73_sw.png";
		this.m.SoundOnUse = [
			"sounds/enemies/goblin_roots_01.wav",
			"sounds/enemies/goblin_roots_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 1;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "射程" + this.getMaxRange() + "マス"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=#8f1e1e]対象の味方[/color]: 全能力値-50%。士気状態が「崩壊寸前」になる。"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=#135213]自身[/color]: 全能力値+15%。1マス以内の敵を攻撃する際ダメージ+30%。"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "この戦闘でさらに[color=#8f1e1e]" + this.m.Skillcharge + "[/color]回使用可能"
		});
		return ret;
	}

	function getCursorForTile( _tile )
	{
		return this.Const.UI.Cursor.Drink;
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
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcharge = this.m.Skillcharge - 1
		_user.getSkills().add(this.new("scripts/skills/effects/sb_frenzy_caster_effect"));
		_targetTile.getEntity().getSkills().add(this.new("scripts/skills/effects/sb_frenzy_target_effect"));
		_targetTile.getEntity().setMoraleState(this.Const.MoraleState.Breaking);
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
