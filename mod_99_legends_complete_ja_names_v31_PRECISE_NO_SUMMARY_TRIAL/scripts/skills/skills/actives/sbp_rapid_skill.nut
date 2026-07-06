this.sbp_rapid_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_rapid_skill";
		this.m.Name = "102. 高速反射";
		this.m.Icon = "ui/xxp12.png";
		this.m.Description = "+20 initiative. 20% Less damage taken";
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
		_properties.Initiative += 20;
		_properties.DamageReceivedTotalMult *= 0.8;
	}

});

