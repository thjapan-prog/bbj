this.sbp_spear_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_spear_skill";
		this.m.Name = "106. Steel Thorn (passive)";
		this.m.Icon = "ui/xxp4.png";
		this.m.Description = "+11 Melee Skill and Defense when the you have the \'Spear Wall\' or \'Riposte\' buff";
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
		local k = this.getContainer().getActor().getSkills();
		if (k.hasSkill("effects.spearwall") || k.hasSkill("effects.riposte"))
		{
			_properties.MeleeSkill += 11;
			_properties.MeleeDefense += 11;
		}
	}

});

