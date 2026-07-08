// Permanent mark left on a brother whose Trial of Steel revealed a Dormant
// core. They can never awaken, and the failed ritual costs them a sliver of
// their stamina. This skill is intentionally visible so the player learns
// the outcome of the trial.
this.aura_scar <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_scar";
		this.m.Name = "Hollow Core";
		this.m.Description = "This warrior endured the Trial of Steel, but no aura answered the call. The core within is hollow - their path will be one of mortal skill alone. The ordeal left them a touch more easily winded.";
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function onUpdate( _properties )
	{
		_properties.Stamina -= 3;
	}

});
