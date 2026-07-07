// Mantle-tier active. A TOGGLE: press to sheathe the body in aura, press
// again to drop it. Activating costs 3 AP and 20 fatigue; switching it off
// is free. While active it drains stamina every turn.
this.aura_body_coating_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.aura_body_coating";
		this.m.Name = "Aura: Body Coating";
		this.m.Description = "Wrap your body in aura. A toggle - press to switch on, press again to switch off. While active, you take noticeably less damage and your defence rises. It drains stamina every turn; switching it off costs nothing.";
		this.m.Icon = "ui/aura/body_coating.png";
		this.m.IconDisabled = "ui/aura/body_coating_sw.png";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 230;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsAttack = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function isActiveNow()
	{
		return this.getContainer() != null && this.getContainer().hasSkill("effects.aura_body_coating");
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local mult = ::AuraPower.Tunables.PowerMult;
		local red = this.Math.min(60, (18 * mult).tointeger());
		if (this.isActiveNow())
		{
			ret.push({
				id = 5, type = "text", icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Currently active[/color] - press again to switch off (free)"
			});
		}
		ret.push({
			id = 6, type = "text", icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]-" + red + "%[/color] damage received"
		});
		ret.push({
			id = 7, type = "text", icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee and Ranged Defence"
		});
		ret.push({
			id = 8, type = "text", icon = "ui/icons/fatigue.png",
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
		if (c.hasSkill("effects.aura_body_coating"))
			c.removeByID("effects.aura_body_coating");        // toggle OFF
		else
			c.add(this.new("scripts/skills/effects/aura_body_coating_effect"));  // toggle ON
		return true;
	}

	// Leaked-VFX cleanup, mirror of aura_sense_skill.onCombatStarted. The body
	// glow is painted on the shared "miniboss" sprite layer (showGlow sets
	// Visible=true). effects.aura_body_coating is IsSerialized=false, so the
	// buff is dropped on load - but the Arena AUTOSAVES & RELOADS between fights
	// (confirmed in-game 2026-06-13, log "Load campaign: autosave"), and the
	// miniboss layer's Visible flag rides along on the brother's appearance,
	// leaving a floating glow with no actual buff next fight - the same symptom
	// the player hit on Aura: Sense.
	//
	// This active skill is permanent on the brother (survives the load) and
	// reliably receives onCombatStarted AFTER the actor's sprites are set up.
	// We scrub the miniboss layer only when NEITHER aura effect is genuinely
	// active (identical guard to the Sense scrub, so the two never stomp each
	// other's legitimately-active layer). Player roster brothers never
	// legitimately use the miniboss/champion-glow layer, so hiding it is safe.
	function onCombatStarted()
	{
		try
		{
			local c = this.getContainer();
			if (c == null) return;
			if (c.hasSkill("effects.aura_body_coating")) return;
			if (c.hasSkill("effects.aura_sense")) return;

			local actor = c.getActor();
			if (actor == null || !actor.hasSprite("miniboss")) return;

			local glow = actor.getSprite("miniboss");
			if (glow.Visible)
			{
				glow.Visible = false;
				glow.Alpha = 255; // restore default so other code paths see it clean
				::logInfo("Aura Body Coating VFX: scrubbed orphaned miniboss glow on "
					+ actor.getName() + " at combat start (no active aura effect).");
			}
		}
		catch (e)
		{
			::logError("Aura Power: Aura Body Coating leak-cleanup - " + e);
		}
	}

});
