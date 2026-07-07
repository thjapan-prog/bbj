// Tier III passive (Master). The deliberate counterpart to the King's
// Cataclysm Heart: the Master fights FROM wholeness. While the body is still
// strong (HP >= 70% of Max), the remade form is exact - blade finds the gap,
// guard does not yield: +8 Melee Skill, +4 Melee Defence. The instant the
// flesh gives way (HP < 70%) the bonus collapses entirely - which is also the
// exact threshold where the King's Cataclysm Heart wakes, so at Tier IV the
// theme inverts cleanly (whole vs ruined) instead of stacking. No dead band,
// no overlap.
//
// onUpdate-only: no hooks, no timers, no VFX, no serialized state. The bonus
// appears/disappears naturally as HP crosses 70% on each property recalc -
// the same pattern as aura_cataclysm_heart, with the condition reversed.
this.aura_unbroken_form <- this.inherit("scripts/skills/skill", {
	m = {
		Threshold         = 0.70,
		BonusMeleeSkill   = 8,
		BonusMeleeDefense = 4
	},
	function create()
	{
		this.m.ID = "effects.aura_unbroken_form";
		this.m.Name = "Unbroken Form";
		this.m.Description = "The Master who came through the trial did not emerge undamaged - they emerged remade. While that remade body holds, every movement is exact: blade finds the gap, guard does not yield. Let the flesh break, and the form breaks with it.";
		this.m.Icon = "ui/aura/aura_unbroken_form.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	// True while the warrior is still at fighting strength (HP >= threshold).
	// Mirrors the null / hpMax guards in aura_cataclysm_heart.getCurrentBonus.
	function isFormUnbroken()
	{
		local actor = this.getContainer().getActor();
		if (actor == null) return false;
		local hpMax = actor.getHitpointsMax();
		if (hpMax <= 0) return false;
		local frac = actor.getHitpoints().tofloat() / hpMax.tofloat();
		return frac >= this.m.Threshold;
	}

	function getTooltip()
	{
		local pos = this.Const.UI.Color.PositiveValue;
		local neg = this.Const.UI.Color.NegativeValue;
		local pct = (this.m.Threshold * 100.0).tointeger();
		local lines = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/melee_skill.png",
			  text = "While above [color=" + pos + "]" + pct + "%[/color] HP: [color=" + pos + "]+" + this.m.BonusMeleeSkill + "[/color] Melee Skill" },
			{ id = 4, type = "text", icon = "ui/icons/melee_defense.png",
			  text = "While above [color=" + pos + "]" + pct + "%[/color] HP: [color=" + pos + "]+" + this.m.BonusMeleeDefense + "[/color] Melee Defence" },
			{ id = 5, type = "text", icon = "ui/icons/health.png",
			  text = "Below [color=" + neg + "]" + pct + "%[/color] HP: bonuses collapse entirely" }
		];
		if (this.isFormUnbroken())
		{
			lines.push({
				id = 6, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + pos + "]Form is unbroken - bonuses active[/color]"
			});
		}
		else
		{
			lines.push({
				id = 6, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + neg + "]Wounded - form has collapsed[/color]"
			});
		}
		return lines;
	}

	function onUpdate( _properties )
	{
		if (!this.isFormUnbroken()) return;
		_properties.MeleeSkill   += this.m.BonusMeleeSkill;
		_properties.MeleeDefense += this.m.BonusMeleeDefense;
	}
});
