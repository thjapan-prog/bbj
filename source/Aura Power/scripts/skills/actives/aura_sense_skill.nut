// Tier I active. Channels aura outward to sharpen the senses for 2 turns:
// the warrior reads incoming blows easier (+15 Melee Defence), reacts
// faster (+10 Initiative), is unaffected by being surrounded, and can pick
// out hidden enemies within a couple tiles.
this.aura_sense_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.aura_sense";
		this.m.Name = "Aura: Sense";
		this.m.Description = "Push aura outward to read the battlefield. For two turns the warrior gains +15 Melee Defence and +10 Initiative, is immune to the surround penalty, and can sense hidden enemies within two tiles.";
		this.m.Icon = "ui/aura/aura_sense.png";
		this.m.IconDisabled = "ui/aura/aura_sense_sw.png";
		this.m.Overlay = "active_06";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 220;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsAttack = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local pos = this.Const.UI.Color.PositiveValue;
		ret.push({
			id = 10, type = "text", icon = "ui/icons/melee_defense.png",
			text = "[color=" + pos + "]+15[/color] Melee Defence for 2 turns"
		});
		ret.push({
			id = 11, type = "text", icon = "ui/icons/initiative.png",
			text = "[color=" + pos + "]+10[/color] Initiative for 2 turns"
		});
		ret.push({
			id = 12, type = "text", icon = "ui/icons/special.png",
			text = "Immune to the surround penalty"
		});
		ret.push({
			id = 13, type = "text", icon = "ui/icons/vision.png",
			text = "Senses hidden enemies within 2 tiles"
		});
		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable()) return false;
		// Don't stack with itself.
		if (this.getContainer().hasSkill("effects.aura_sense")) return false;
		return true;
	}

	// Leaked-VFX cleanup. The eye is painted on the shared "miniboss" sprite
	// layer by effects.aura_sense (and the body-wrap glow by
	// effects.aura_body_coating). Both effects are IsSerialized=false, so a
	// save/load drops the buff - but the Arena AUTOSAVES & RELOADS between
	// fights (confirmed in-game 2026-06-13, log "Load campaign: autosave"),
	// and the miniboss layer's Visible flag rides along on the brother's
	// appearance. Result: a floating eye with no actual buff on the next fight.
	//
	// This active skill is permanent on the brother (survives the load) and
	// reliably receives onCombatStarted AFTER the actor's sprites are set up,
	// so it is the right place to scrub the orphaned layer. We only hide it
	// when NEITHER aura effect is genuinely active - if one is, it owns the
	// layer and will manage its own visibility. Player roster brothers never
	// legitimately use the miniboss (champion-glow) layer, so hiding it here
	// is safe.
	function onCombatStarted()
	{
		try
		{
			local c = this.getContainer();
			if (c == null) return;
			if (c.hasSkill("effects.aura_sense")) return;
			if (c.hasSkill("effects.aura_body_coating")) return;

			local actor = c.getActor();
			if (actor == null || !actor.hasSprite("miniboss")) return;

			local glow = actor.getSprite("miniboss");
			if (glow.Visible)
			{
				glow.Visible = false;
				::logInfo("Aura Sense VFX: scrubbed orphaned miniboss eye on "
					+ actor.getName() + " at combat start (no active aura effect).");
			}
		}
		catch (e)
		{
			::logError("Aura Power: Aura Sense leak-cleanup - " + e);
		}
	}

	function onUse( _user, _targetTile )
	{
		local c = this.getContainer();
		if (!c.hasSkill("effects.aura_sense"))
			c.add(this.new("scripts/skills/effects/aura_sense_effect"));

		// Reveal hidden enemies in a 2-tile radius around the user.
		try
		{
			local origin = _user.getTile();
			local seen = {};
			seen[origin.ID] <- true;
			local frontier = [origin];
			for (local depth = 0; depth < 2; depth = ++depth)
			{
				local next_frontier = [];
				foreach (t in frontier)
				{
					for (local i = 0; i < 6; i = ++i)
					{
						if (!t.hasNextTile(i)) continue;
						local nt = t.getNextTile(i);
						if (nt.ID in seen) continue;
						seen[nt.ID] <- true;
						next_frontier.push(nt);
						if (nt.IsOccupiedByActor)
						{
							local e = nt.getEntity();
							if (e != null && !e.isAlliedWith(_user))
								e.setDiscovered(true);   // reveal: the vanilla method (setHiddenToPlayer never existed - it threw and aborted the whole sweep)
						}
					}
				}
				frontier = next_frontier;
			}
		}
		catch (error)
		{
			::logError("Aura Power: Aura Sense reveal failed - " + error);
		}
		return true;
	}
});
