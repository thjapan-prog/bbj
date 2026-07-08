this.sbp_lifestealer_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_lifestealer_skill";
		this.m.Name = "95. Lifestealer (passive)";
		this.m.Icon = "ui/xxp18.png";
		this.m.Description = "When attacking, 30% damage lifesteal on hit";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 100;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "When you have Drain Blood(19) skill : +20 Health"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().getSkills().hasSkill("actives.sb_drainblood_skill"))
		{
			_properties.Hitpoints += 20;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_damageInflictedHitpoints <= 0)
		{
			return;
		}
		local actor = this.m.Container.getActor();
		if (actor.getHitpoints() == actor.getHitpointsMax())
		{
			return;
		}
		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + this.Math.round(_damageInflictedHitpoints * 0.3)));
		actor.onUpdateInjuryLayer();
	}

});

