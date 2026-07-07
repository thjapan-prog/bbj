// Tier I active. Brands a single foe with a clinging ember of aura. For
// two turns the target gathers fatigue and swings less accurately. If the
// target was already running an active buff, the brand lasts one turn longer.
this.aura_ember_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.aura_ember";
		this.m.Name = "Aura: Ember";
		this.m.Description = "Plant a clinging ember of aura on a single foe. For two turns they accumulate fatigue and swing less accurately. The ember lingers an extra turn on any enemy already empowered by an active buff.";
		this.m.Icon = "ui/aura/aura_ember.png";
		this.m.IconDisabled = "ui/aura/aura_ember_sw.png";
		this.m.Overlay = "active_10";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 222;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsAttack = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		this.m.IsUsingHitchance = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		local pos = this.Const.UI.Color.PositiveValue;
		local neg = this.Const.UI.Color.NegativeValue;
		ret.push({
			id = 10, type = "text", icon = "ui/icons/fatigue.png",
			text = "Target takes [color=" + neg + "]+8[/color] Fatigue at the start of each of its turns"
		});
		ret.push({
			id = 11, type = "text", icon = "ui/icons/melee_skill.png",
			text = "Target loses [color=" + neg + "]-10[/color] Melee Skill"
		});
		ret.push({
			id = 12, type = "text", icon = "ui/icons/special.png",
			text = "Lasts [color=" + pos + "]2[/color] turns (3 if the target carries an active buff)"
		});
		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
			return false;
		local target = _targetTile.getEntity();
		if (target == null) return false;
		local actor = this.m.Container.getActor();
		if (target.isAlliedWith(actor)) return false;
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		if (target == null) return false;

		// Strip any prior ember so we always (re)set a clean duration.
		if (target.getSkills().hasSkill("effects.aura_ember"))
			target.getSkills().removeByID("effects.aura_ember");

		local ember = this.new("scripts/skills/effects/aura_ember_effect");

		// Extra turn if the target already has an "active" buff skill.
		// We treat any non-hidden non-attack active/effect skill that came
		// from a buff source as eligible. Simplest check: any other effect
		// skill on the target counts as a buff for these purposes.
		local extra = 0;
		try
		{
			foreach (s in target.getSkills().getAllSkillsOfType(this.Const.SkillType.StatusEffect))
			{
				if (s == null) continue;
				if (s.getID() == "effects.aura_ember") continue;
				// Don't count vanilla "Injured"/"Bleeding"/"Dazed" debuffs as buffs.
				local id = s.getID();
				if (id == "effects.bleeding" || id == "effects.dazed"
					|| id == "effects.stunned" || id == "effects.staggered"
					|| id == "effects.poisoned" || id == "effects.injured"
					|| id == "effects.net" || id == "effects.web"
					|| id == "effects.disarmed" || id == "effects.rooted"
					|| id == "effects.morale_check" || id == "effects.special")
					continue;
				extra = 1;
				break;
			}
		}
		catch (e) {}

		ember.m.TurnsLeft = 2 + extra;
		target.getSkills().add(ember);

		// Visual: ignite the target tile with the vanilla fire sprite -
		// the same brush oil-flask fires use when they catch alight. Spawn
		// a couple of staggered bursts so it reads as a clinging blaze.
		try
		{
			local fireBrush = null;
			foreach (b in ["effect_fire_01", "effect_fire_02", "effect_fire_03"])
			{
				if (this.doesBrushExist(b)) { fireBrush = b; break; }
			}
			if (fireBrush != null)
			{
				this.Tactical.spawnSpriteEffect(fireBrush,
					this.createColor("#ffffff"), _targetTile,
					0, 20, 0.8, 1.3, 250, 80, 500);
				// Scheduled callbacks lose `this` binding - capture refs
				// in a context table and use the root ::Tactical namespace.
				local ctx = {
					brush = fireBrush,
					tile = _targetTile,
					color = this.createColor("#ffffff")
				};
				::Time.scheduleEvent(::TimeUnit.Real, 180, function ( _ctx )
				{
					try {
						::Tactical.spawnSpriteEffect(_ctx.brush, _ctx.color, _ctx.tile,
							20, 30, 0.7, 1.1, 200, 60, 450);
					} catch (e) {}
				}, ctx);
			}
		}
		catch (e) {}

		return true;
	}
});
