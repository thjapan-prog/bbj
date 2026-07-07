this.sbp_maso_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_maso_skill";
		this.m.Name = "96. 被虐嗜好";
		this.m.Icon = "ui/xxp11.png";
		this.m.Description = "このキャラクターは自らの痛みを楽しみ、受けたダメージが多いほど強くなる。";
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
			id = 3,
			type = "text",
			icon = "ui/icons/special.png",
			text = "失ったHPに比例してダメージが最大120%増加する。"
		});
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "出血状態：近接・遠隔攻撃スキル+5"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "出身が\'Flagellant\'：近接・遠隔攻撃スキル+5"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local rr = 1 - actor.getHitpointsPct();
		rr = rr * 1.2;
		if (rr > 0)
		{
			_properties.DamageTotalMult += rr;
		}
		if (actor.getSkills().hasSkill("effects.bleeding"))
		{
			_properties.MeleeSkill += 5;
			_properties.RangedSkill += 5;
		}
		if (actor.getSkills().hasSkill("background.flagellant"))
		{
			_properties.MeleeSkill += 5;
			_properties.RangedSkill += 5;
		}
	}

});

