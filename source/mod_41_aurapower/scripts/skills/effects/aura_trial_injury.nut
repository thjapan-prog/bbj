// Combat injury inflicted by a failed Trial of Steel. Two severities:
//   m.Severity = 1 -> Medium  (T2 fail "Spiritual Fracture")
//   m.Severity = 2 -> Severe  (T3 fail "Soul Collapse")
// Expires when the world day reaches m.UntilDay. The trial event sets
// both fields when adding the effect.
this.aura_trial_injury <- this.inherit("scripts/skills/skill", {
	m = {
		UntilDay = 0,
		Severity = 1
	},
	function create()
	{
		this.m.ID = "effects.aura_trial_injury";
		this.m.Name = "Trial Wound";
		this.m.Description = "The Trial of Steel left more than scars - body and will are both still mending.";
		this.m.Icon = "ui/perks/perk_22.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function isActive()
	{
		try { return ::AuraPower.getCurrentDay() < this.m.UntilDay; }
		catch (e) {}
		return false;
	}

	function getName()
	{
		if (this.m.Severity >= 2) return "Spiritual Wound (Severe)";
		return "Spiritual Wound (Medium)";
	}

	function getTooltip()
	{
		local neg = this.Const.UI.Color.NegativeValue;
		local daysLeft = this.m.UntilDay - ::AuraPower.getCurrentDay();
		if (daysLeft < 0) daysLeft = 0;
		local ret = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() }
		];
		if (this.m.Severity >= 2)
		{
			ret.push({
				id = 3, type = "text", icon = "ui/icons/melee_skill.png",
				text = "[color=" + neg + "]-10[/color] Melee Skill, [color=" + neg + "]-10[/color] Ranged Skill"
			});
			ret.push({
				id = 4, type = "text", icon = "ui/icons/initiative.png",
				text = "[color=" + neg + "]-15[/color] Initiative"
			});
		}
		else
		{
			ret.push({
				id = 3, type = "text", icon = "ui/icons/melee_skill.png",
				text = "[color=" + neg + "]-5[/color] Melee Skill, [color=" + neg + "]-5[/color] Ranged Skill"
			});
			ret.push({
				id = 4, type = "text", icon = "ui/icons/initiative.png",
				text = "[color=" + neg + "]-8[/color] Initiative"
			});
		}
		ret.push({
			id = 5, type = "text", icon = "ui/icons/special.png",
			text = "Heals in [color=" + neg + "]" + daysLeft + "[/color] day(s)"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		if (!this.isActive()) return;
		if (this.m.Severity >= 2)
		{
			_properties.MeleeSkill -= 10;
			_properties.RangedSkill -= 10;
			_properties.Initiative -= 15;
		}
		else
		{
			_properties.MeleeSkill -= 5;
			_properties.RangedSkill -= 5;
			_properties.Initiative -= 8;
		}
	}
});
