this.sbq7_bug_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 2
	},
	function create()
	{
		this.m.ID = "actives.sbq7_bug_skill";
		this.m.Name = "114. 虫の群れ";
		this.m.Description = "虫の群れを召喚して対象を弱体化させる。";
		this.m.Icon = "ui/xx81.png";
		this.m.IconDisabled = "ui/xx81_sw.png";
		this.m.Overlay = "active_69";
		this.m.SoundOnUse = [
			"sounds/enemies/swarm_of_insects_01.wav",
			"sounds/enemies/swarm_of_insects_02.wav",
			"sounds/enemies/swarm_of_insects_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/status/insect_swarm_effect_01.wav",
			"sounds/status/insect_swarm_effect_02.wav",
			"sounds/status/insect_swarm_effect_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "対象の近接攻撃スキル・遠隔攻撃スキル・近接防御・遠隔防御・イニシアチブが3ターン間-50%。"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "このバトルであと[color=#8f1e1e]" + this.m.Skillcharge + "[/color]回使用可能。"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcharge = this.m.Skillcharge - 1;
		if (this.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
		}
		local target = _targetTile.getEntity();
		local effect = target.getSkills().getSkillByID("effects.insect_swarm");
		if (effect != null)
		{
			effect.resetTime();
			this.spawnIcon("status_effect_57", _targetTile);
		}
		else
		{
			target.getSkills().add(this.new("scripts/skills/effects/insect_swarm_effect"));
		}
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
		this.m.Skillcharge = 2;
	}

});

