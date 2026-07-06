this.sb_chokentoss_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 3,
		Skillcool = 3
	},
	function create()
	{
		this.m.ID = "actives.sb_chokentoss_skill";
		this.m.Name = "12-1. 怪力投げ（目標指定）";
		this.m.Description = "Select a target to throw. Always a 77% chance of success. If the target selection fails, the throw skill cannot be used.";
		this.m.Icon = "ui/xx45.png";
		this.m.IconDisabled = "ui/xx45_sw.png";
		this.m.Overlay = "perk_38_active";
		this.m.SoundOnUse = [
			"sounds/combat/hand_01.wav",
			"sounds/combat/hand_02.wav",
			"sounds/combat/hand_03.wav"
		];
		this.m.SoundVolume = 1.5;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Cooldown : 3 turn \nCooldown left: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] turn"
		});
		return ret;
	}
	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}
		local target = _targetTile.getEntity();
		if (target.getCurrentProperties().IsRooted)
		{
			return false;
		}
		if (target.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return false;
		}
		if (target.isAlliedWith(this.getContainer().getActor()))
		{
			return false;
		}
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		local target = _targetTile.getEntity();
		this.Tactical.getShaker().shake(target, _user.getTile(), 4);
		if (this.Math.rand(1, 99) > 77)
		{
			local overwhelm = this.getContainer().getSkillByID("perk.overwhelm");
			if (overwhelm != null)
			{
				overwhelm.onTargetMissed(this, target);
			}
			return false;
		}
		this.m.Container.add(this.new("scripts/skills/actives/sb2_chokentoss_skill"));
		target.getSkills().add(this.new("scripts/skills/effects/sb_chokentoss_effect"));
		return true;
	}

	function isHidden()
	{
		local actor = this.getContainer().getActor();
		if (!actor.getSkills().hasSkill("actives.sb2_chokentoss_skill"))
		{
			return false;
		}
		return true;
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();
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

