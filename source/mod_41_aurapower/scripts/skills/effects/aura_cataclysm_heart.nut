// Tier IV passive (King). The lower the King's flesh sinks, the louder
// the cataclysm in his heart roars. The threshold is HP < 70% Max - the
// instant the wound crosses that line, raw stat bonuses bloom across
// the warrior's sheet (melee skill, melee defence, resolve, damage),
// and morale-lowering effects bounce off entirely.
//
// The scaling is tiered so the player can read it at a glance:
//   <70% HP: +20 Melee Skill, +20 Melee Def, +20 Resolve, +20 Damage
//   <50% HP: +30 / +30 / +30 / +30
//   <30% HP: +40 / +40 / +40 / +40
//
// onUpdate runs every time the character sheet recalculates, so the
// bonuses appear/disappear naturally when HP crosses each threshold.
// Damage flat bonus is applied via onAnySkillUsed on attacks. The
// "immune to morale drop" half is enforced by the setMoraleState hook
// in mod_aurapower.nut, which reads m.IsActiveNow off this skill.
this.aura_cataclysm_heart <- this.inherit("scripts/skills/skill", {
	m = {
		// HP fraction thresholds, descending. Each row: [hpFrac, bonus].
		Tiers = [
			[0.30, 40],
			[0.50, 30],
			[0.70, 20]
		],
		// Updated by onUpdate so the morale-immunity hook can check the
		// state cheaply without recomputing HP fractions.
		IsActiveNow = false
	},
	function create()
	{
		this.m.ID = "effects.aura_cataclysm_heart";
		this.m.Name = "Cataclysm Heart";
		this.m.Description = "The wounded king is the dangerous king. As the warrior's flesh fails, the aura inside his chest answers in fury - blade, will, and guard all sharpen as the lifeblood ebbs, and no terror can shake him.";
		this.m.Icon = "ui/aura/aura_cataclysm_heart.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	// Returns the current flat bonus value based on the carrier's HP
	// fraction. 0 if HP is above the highest threshold (70%).
	function getCurrentBonus()
	{
		local actor = this.getContainer().getActor();
		if (actor == null) return 0;
		local hpMax = actor.getHitpointsMax();
		if (hpMax <= 0) return 0;
		local frac = actor.getHitpoints().tofloat() / hpMax.tofloat();
		foreach (row in this.m.Tiers)
		{
			if (frac < row[0]) return row[1];
		}
		return 0;
	}

	function getTooltip()
	{
		local pos = this.Const.UI.Color.PositiveValue;
		local cur = this.getCurrentBonus();
		local lines = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/health.png",
			  text = "Below [color=" + pos + "]70%[/color] HP: [color=" + pos + "]+20[/color] Melee Skill, [color=" + pos + "]+20[/color] Melee Def, [color=" + pos + "]+20[/color] Resolve, [color=" + pos + "]+20[/color] Damage" },
			{ id = 4, type = "text", icon = "ui/icons/health.png",
			  text = "Below [color=" + pos + "]50%[/color] HP: bonuses rise to [color=" + pos + "]+30[/color]" },
			{ id = 5, type = "text", icon = "ui/icons/health.png",
			  text = "Below [color=" + pos + "]30%[/color] HP: bonuses peak at [color=" + pos + "]+40[/color]" },
			{ id = 6, type = "text", icon = "ui/icons/bravery.png",
			  text = "While active, immune to enemy morale-lowering effects" }
		];
		if (cur > 0)
		{
			lines.push({
				id = 7, type = "text", icon = "ui/icons/special.png",
				text = "Now active: [color=" + pos + "]+" + cur + "[/color] to all"
			});
		}
		return lines;
	}

	function onUpdate( _properties )
	{
		local bonus = this.getCurrentBonus();
		this.m.IsActiveNow = (bonus > 0);
		if (bonus <= 0) return;
		_properties.MeleeSkill    += bonus;
		_properties.MeleeDefense  += bonus;
		_properties.Bravery       += bonus;
		_properties.DamageRegularMin += bonus;
		_properties.DamageRegularMax += bonus;
	}
});
