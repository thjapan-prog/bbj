// Permanent carrier skill granted the moment a brother awakens. It applies
// the passive aura bonuses that scale with the brother's tier. The headline
// bonus is Fatigue and Fatigue Recovery (per the Ascension spec); a reduced
// suite of legacy combat buffs (Initiative, Defence, HP, Resolve) is layered
// on top so higher tiers still feel meaningful in combat.
//
// Serialized, so it persists across saves on its own.
this.aura_power <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.aura_power";
		this.m.Name = "Aura";
		this.m.Description = "This warrior has awakened the aura sleeping within. Their senses are sharpened, their body is wrapped in a faint, steady glow, and their will outlasts ordinary flesh.";
		this.m.Icon = "ui/aura/aura_power.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	// Returns the totals [fatigue, fatigueRecovery, initiative, meleeDef,
	// rangedDef, hitpoints, bravery] for the given tier.
	function getTierBonus( _tier )
	{
		// Per-tier cumulative totals. Order matches spec.
		// Tier I (Awakening): +5 Fat, +1 FatRec.
		// Tier II (Warrior):  +10 Fat, +2 FatRec.
		// Tier III (Master):  +15 Fat, +3 FatRec.
		// Tier IV (King):     +20 Fat, +4 FatRec.
		//
		// Legacy combat buffs are scaled down to roughly half of the original
		// mod's numbers so the new Fatigue/FatRec headline isn't drowned out.
		if (_tier >= ::AuraPower.Tier.King)
			return [20, 4, 10, 6, 6, 15, 10];
		if (_tier >= ::AuraPower.Tier.Master)
			return [15, 3,  8, 5, 5, 10,  5];
		if (_tier >= ::AuraPower.Tier.Warrior)
			return [10, 2,  5, 3, 3,  5,  0];
		if (_tier >= ::AuraPower.Tier.Awakening)
			return [ 5, 1,  3, 2, 2,  0,  0];
		return [0, 0, 0, 0, 0, 0, 0];
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
		local tier = ::AuraPower.getTier(actor);
		local bonus = this.getTierBonus(tier);
		local mult = ::AuraPower.Tunables.PowerMult;
		local pos = this.Const.UI.Color.PositiveValue;

		local ret = [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Aura tier: [color=" + pos + "]" + ::AuraPower.getTierName(tier) + "[/color]"
			}
		];

		local tagline = ::AuraPower.getTierTagline(tier);
		if (tagline.len() > 0)
		{
			ret.push({
				id = 4, type = "text", icon = "ui/icons/special.png",
				text = "[i]" + tagline + "[/i]"
			});
		}

		if (bonus[0] > 0)
		{
			ret.push({
				id = 5, type = "text", icon = "ui/icons/fatigue.png",
				text = "[color=" + pos + "]+" + (bonus[0] * mult).tointeger() + "[/color] Maximum Fatigue"
			});
			ret.push({
				id = 6, type = "text", icon = "ui/icons/fatigue.png",
				text = "[color=" + pos + "]+" + bonus[1] + "[/color] Fatigue Recovery per turn"
			});
		}
		if (bonus[2] > 0)
		{
			ret.push({
				id = 7, type = "text", icon = "ui/icons/initiative.png",
				text = "[color=" + pos + "]+" + (bonus[2] * mult).tointeger() + "[/color] Initiative"
			});
		}
		if (bonus[3] > 0)
		{
			ret.push({
				id = 8, type = "text", icon = "ui/icons/melee_defense.png",
				text = "[color=" + pos + "]+" + bonus[3] + "[/color] Melee Defence, [color=" + pos + "]+" + bonus[4] + "[/color] Ranged Defence"
			});
		}
		if (bonus[5] > 0)
		{
			ret.push({
				id = 9, type = "text", icon = "ui/icons/health.png",
				text = "[color=" + pos + "]+" + (bonus[5] * mult).tointeger() + "[/color] Hitpoints"
			});
		}
		if (bonus[6] > 0)
		{
			ret.push({
				id = 10, type = "text", icon = "ui/icons/bravery.png",
				text = "[color=" + pos + "]+" + bonus[6] + "[/color] Resolve"
			});
		}

		// Potential King Bonus - shown only at King tier and only when the
		// potential actually grants something (Dormant grants nothing), so the
		// extra stats are clearly attributed to the brother's birthright rather
		// than looking like a discrepancy against the base King numbers above.
		if (tier >= ::AuraPower.Tier.King)
		{
			local potential = ::AuraPower.getPotentialV2(actor);
			local kb = this.getKingPotentialBonus(actor, tier);
			local kbTotal = kb[0] + kb[1] + kb[2] + kb[3] + kb[4] + kb[5] + kb[6];
			if (kbTotal > 0)
			{
				ret.push({
					id = 20, type = "text", icon = "ui/icons/special.png",
					text = "[color=" + pos + "][b]" + ::AuraPower.getPotentialName(potential) + "'s Birthright[/b][/color]"
				});
				local parts = [];
				if (kb[0] > 0) parts.push("+" + (kb[0] * mult).tointeger() + " Max Fatigue");
				if (kb[1] > 0) parts.push("+" + kb[1] + " Fatigue Recovery");
				if (kb[2] > 0) parts.push("+" + (kb[2] * mult).tointeger() + " Initiative");
				if (kb[3] > 0) parts.push("+" + kb[3] + " Melee Def");
				if (kb[4] > 0) parts.push("+" + kb[4] + " Ranged Def");
				if (kb[5] > 0) parts.push("+" + (kb[5] * mult).tointeger() + " Hitpoints");
				if (kb[6] > 0) parts.push("+" + kb[6] + " Resolve");
				local line = "";
				for (local i = 0; i < parts.len(); i = i + 1)
				{
					if (i > 0) line += ", ";
					line += parts[i];
				}
				ret.push({
					id = 21, type = "text", icon = "ui/icons/special.png",
					text = "[color=" + pos + "]" + line + "[/color]"
				});
			}
		}
		return ret;
	}

	// NOTE: the active skills are added when the brother awakens and are
	// serialized, so they persist on their own. We deliberately do NOT
	// re-add skills during onCombatStarted - modifying the skill container
	// while it is being iterated can break the turn/combat sequence.

	// Potential King Bonus lookup. Returns the 7-slot additive array for the
	// brother's hidden potential when they are King tier, or all-zero when they
	// are below King or the potential is out of range. Kept here so onUpdate
	// and getTooltip read from exactly one place.
	function getKingPotentialBonus( _actor, _tier )
	{
		if (_tier < ::AuraPower.Tier.King) return [0, 0, 0, 0, 0, 0, 0];
		local p = ::AuraPower.getPotentialV2(_actor);
		if (p < 0 || p > 4) return [0, 0, 0, 0, 0, 0, 0];
		return ::AuraPower.KingBonusTable[p];
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local tier = ::AuraPower.getTier(actor);
		local bonus = this.getTierBonus(tier);
		local mult = ::AuraPower.Tunables.PowerMult;

		_properties.Stamina += (bonus[0] * mult).tointeger();
		_properties.FatigueRecoveryRate += bonus[1];
		_properties.Initiative += (bonus[2] * mult).tointeger();
		_properties.MeleeDefense += bonus[3];
		_properties.RangedDefense += bonus[4];
		_properties.Hitpoints += (bonus[5] * mult).tointeger();
		_properties.Bravery += bonus[6];

		// Potential King Bonus: hidden potential pays a flat-stat dividend on
		// top of the base King kit (Dormant = nothing; Sovereign Seed = most).
		local kb = this.getKingPotentialBonus(actor, tier);
		_properties.Stamina += (kb[0] * mult).tointeger();
		_properties.FatigueRecoveryRate += kb[1];
		_properties.Initiative += (kb[2] * mult).tointeger();
		_properties.MeleeDefense += kb[3];
		_properties.RangedDefense += kb[4];
		_properties.Hitpoints += (kb[5] * mult).tointeger();
		_properties.Bravery += kb[6];
	}
});
