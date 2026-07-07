this.sbp_counter_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_counter_skill";
		this.m.Name = "86. Adaptive Counter (passive)";
		this.m.Icon = "ui/xxp15.png";
		this.m.Description = "Gain a bonus to Max Fatigue, Melee Skill, and Ranged Skill in proportion to Ranged Defense.";
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

	function onUpdate( _properties )
	{
		local q = this.Math.floor(this.getContainer().getActor().getBaseProperties().RangedDefense * 0.6);
		if (q >= 1)
		{
			_properties.Stamina += q;
			_properties.MeleeSkill += q;
			_properties.RangedSkill += q;
		}
	}

});

