this.xxzzlimitpotion_skill <- this.inherit("scripts/skills/skill", {
	m = {	},
	function create()
	{
		this.m.ID = "effects.xxzzlimitpotion_skill";
		this.m.Name = "Limit Break Potion";
		this.m.Description = "The max number of skills this character can learn through skill books is 3.";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Icon = "ui/perks/perk_56.png";
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

});

