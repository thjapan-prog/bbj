// Mantle-tier active. Channels aura into flesh to knit wounds shut - on the
// warrior themselves or an adjacent ally. Limited charges per battle.
this.aura_mending_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Charges = 2,
		MaxCharges = 2
	},
	function create()
	{
		this.m.ID = "actives.aura_mending";
		this.m.Name = "Aura: Mending";
		this.m.Description = "Pour aura into a wounded body to close its hurts. Usable on yourself or an adjacent ally.";
		this.m.Icon = "ui/aura/mending.png";
		this.m.IconDisabled = "ui/aura/mending_sw.png";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 232;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsAttack = false;
		this.m.IsSerialized = true;
		this.m.IsStacking = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 1;
	}

	function getHealAmount( _user )
	{
		local mult = ::AuraPower.Tunables.PowerMult;
		return this.Math.floor((30 + _user.getCurrentProperties().Bravery * 0.4) * mult);
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Restores [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getHealAmount(this.getContainer().getActor()) + "[/color] Hitpoints"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Charges left this battle: [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Charges + "[/color] / " + this.m.MaxCharges
		});
		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
			return false;
		local target = _targetTile.getEntity();
		if (target == null)
			return false;
		local actor = this.m.Container.getActor();
		if (target != actor && !actor.isAlliedWith(target))
			return false;
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
			return false;
		if (this.m.Charges <= 0)
			return false;
		return true;
	}

	function isHidden()
	{
		return this.m.Charges <= 0;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		if (target == null)
			return false;

		local heal = this.getHealAmount(_user);
		target.setHitpoints(this.Math.min(target.getHitpointsMax(), target.getHitpoints() + heal));
		target.setDirty(true);
		this.m.Charges = this.m.Charges - 1;
		return true;
	}

	function onCombatFinished()
	{
		this.m.Charges = this.m.MaxCharges;
	}

});
