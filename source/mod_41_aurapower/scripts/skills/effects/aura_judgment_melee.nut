// King's Judgment, outcome 4: -1 Melee Skill (permanent).
// Vanilla BB stores melee skill as an integer attribute mod via
// MeleeSkill; we apply -1 in onUpdate. (T4 fail spec said "-1 Melee
// Skill ถาวร" - this is the percent-chance-to-hit stat used by the
// engine's vanilla melee accuracy calculation.)
this.aura_judgment_melee <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_judgment_melee";
		this.m.Name = "Crown\'s Tremor";
		this.m.Description = "The hand that reached for a king's burden cannot quite hold its old steel. A faint tremor lingers under every swing.";
		this.m.Icon = "ui/perks/perk_22.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		local neg = this.Const.UI.Color.NegativeValue;
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{
				id = 3, type = "text", icon = "ui/icons/melee_skill.png",
				text = "[color=" + neg + "]-1[/color] Melee Skill (permanent)"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkill -= 1;
	}
});
