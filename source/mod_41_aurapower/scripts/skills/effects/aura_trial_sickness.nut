// Sickness inflicted on a brother who fails the Trial of Steel.
// Mechanical effect: -10% Max Fatigue while active.
// Expires when the world day reaches m.UntilDay (set when the effect is
// added by the event flow). Pruning happens in refreshAuraSkills.
this.aura_trial_sickness <- this.inherit("scripts/skills/skill", {
	m = {
		UntilDay = 0      // serialized via the m table
	},
	function create()
	{
		this.m.ID = "effects.aura_trial_sickness";
		this.m.Name = "Aura Rejection";
		this.m.Description = "The aura inside has rebelled. The body feels heavy, breath comes short - rest is needed before the trial can be attempted again.";
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function isActive()
	{
		try
		{
			return ::AuraPower.getCurrentDay() < this.m.UntilDay;
		}
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
				id = 3, type = "text", icon = "ui/icons/fatigue.png",
				text = "[color=" + neg + "]-10%[/color] Maximum Fatigue while sick"
			},
			{
				id = 4, type = "text", icon = "ui/icons/special.png",
				text = "Recovers in [color=" + neg + "]" + daysLeft + "[/color] day(s)"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.isActive()) return;
		// -10% Max Fatigue. Use StaminaMult so it composes with other
		// fatigue modifiers cleanly.
		_properties.StaminaMult *= 0.9;
	}
});
