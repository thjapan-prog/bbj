this.sbp_kensei_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_kensei_skill";
		this.m.Name = "93. Kensei (passive)";
		this.m.Icon = "ui/xxp7.png";
		this.m.Description = "Enhances the basic attack skill when using a sword. +20% Damage, +10% Armor Piercing.";
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
		if (_skill.getID() == "actives.slash" || _skill.getID() == "actives.overhead_strike")
		{
			_properties.DamageTotalMult += 0.2;
			_properties.DamageDirectAdd += 0.1;
		}
	}

});

