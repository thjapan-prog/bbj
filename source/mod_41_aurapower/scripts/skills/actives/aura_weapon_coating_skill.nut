// Mantle-tier active. A TOGGLE: press to sheathe the weapon in aura, press
// again to drop it. Activating costs 2 AP and 15 fatigue; switching it off
// is free (0 AP, 0 fatigue). While active it drains stamina every turn.
//
// The cost flips between "activation" (2/15) and "free" (0/0) automatically:
// the effect's onAdded sets it to free, its onRemoved restores activation.
// The game deducts the cost BEFORE onUse runs, so the cost shown is always
// the correct one for the press about to happen.
this.aura_weapon_coating_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.aura_weapon_coating";
		this.m.Name = "Aura: Weapon Coating";
		this.m.Description = "Sheathe your weapon in aura. A toggle - press to switch on, press again to switch off. While active, your attacks hit harder, are more accurate, and a portion of every blow cuts straight past armour. It drains stamina every turn; switching it off costs nothing.";
		this.m.Icon = "ui/aura/weapon_coating.png";
		this.m.IconDisabled = "ui/aura/weapon_coating_sw.png";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 231;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsAttack = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function isActiveNow()
	{
		return this.getContainer() != null && this.getContainer().hasSkill("effects.aura_weapon_coating");
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local mult = ::AuraPower.Tunables.PowerMult;
		if (this.isActiveNow())
		{
			ret.push({
				id = 6, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Currently active[/color] - press again to switch off (free)"
			});
		}
		ret.push({
			id = 7, type = "text", icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + (20 * mult).tointeger() + "%[/color] total damage"
		});
		ret.push({
			id = 8, type = "text", icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + (15 * mult).tointeger() + "%[/color] of damage ignores armour"
		});
		ret.push({
			id = 9, type = "text", icon = "ui/icons/melee_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee Skill"
		});
		ret.push({
			id = 10, type = "text", icon = "ui/icons/fatigue.png",
			text = "Upkeep: [color=" + this.Const.UI.Color.NegativeValue + "]" + (5 * ::AuraPower.Tunables.FatigueDrainMult).tointeger() + "[/color] fatigue per turn"
		});
		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onUse( _user, _targetTile )
	{
		local c = this.getContainer();
		if (c.hasSkill("effects.aura_weapon_coating"))
			c.removeByID("effects.aura_weapon_coating");        // toggle OFF
		else
			c.add(this.new("scripts/skills/effects/aura_weapon_coating_effect"));  // toggle ON
		return true;
	}

});
