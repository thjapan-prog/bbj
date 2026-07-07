this.sbp_agile_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_agile_skill";
		this.m.Name = "79. 機敏な殺し屋";
		this.m.Icon = "ui/xxp28.png";
		this.m.Description = "攻撃時に対象よりイニシアチブが高い場合、近接・遠隔攻撃スキルが+9増加する。攻撃された際に攻撃者よりイニシアチブが高い場合、近接・遠隔防御が+9増加する。";
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
		return ret;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity != null && _skill.isAttack())
		{
			if (this.getContainer().getActor().getInitiative() > _targetEntity.getInitiative())
			{
				_properties.MeleeSkill += 9;
				_properties.RangedSkill += 9;
			}
		}
	}

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if (_skill.isAttack() && this.getContainer().getActor().getInitiative() > _attacker.getInitiative())
		{
			_properties.MeleeDefense += 9;
			_properties.RangedDefense += 9;
		}
	}

});

