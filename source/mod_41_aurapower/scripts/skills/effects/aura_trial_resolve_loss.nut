// Temporary Resolve debuff from a T3 (Master) trial failure - "Soul
// Collapse". -10 Resolve while active. Expires when world day reaches
// m.UntilDay.
this.aura_trial_resolve_loss <- this.inherit("scripts/skills/skill", {
	m = {
		UntilDay = 0
	},
	function create()
	{
		this.m.ID = "effects.aura_trial_resolve_loss";
		this.m.Name = "Soul Collapse";
		this.m.Description = "The aura turned inward and the spirit cracked. Confidence shaken, will brittle - until the rift mends.";
		this.m.Icon = "ui/perks/perk_42.png";
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

	function getTooltip()
	{
		local neg = this.Const.UI.Color.NegativeValue;
		local daysLeft = this.m.UntilDay - ::AuraPower.getCurrentDay();
		if (daysLeft < 0) daysLeft = 0;
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{
				id = 3, type = "text", icon = "ui/icons/bravery.png",
				text = "[color=" + neg + "]-10[/color] Resolve"
			},
			{
				id = 4, type = "text", icon = "ui/icons/special.png",
				text = "Mends in [color=" + neg + "]" + daysLeft + "[/color] day(s)"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.isActive()) return;
		_properties.Bravery -= 10;
	}
});
