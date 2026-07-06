this.sbq9_domi_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 1
	},
	function create()
	{
		this.m.ID = "actives.sbq9_domi_skill";
		this.m.Name = "116. 戦場支配";
		this.m.Description = "Applies a negative effect to enemies with specific states on the battlefield, reducing damage dealt by 30% and increasing damage received by 30%.";
		this.m.Icon = "ui/xx83.png";
		this.m.IconDisabled = "ui/xx83_sw.png";
		this.m.Overlay = "active_117";
		this.m.SoundOnUse = [
			"sounds/combat/perfect_focus_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsAttack = true;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 25;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Targets enemies in the following states: Staggered, Distracted, Expose Weakness, Spent fatigue greater than 50%"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can be used [color=#8f1e1e]" + this.m.Skillcharge + "[/color] more times in this battle"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcharge = this.m.Skillcharge - 1;
		local actor = this.getContainer().getActor();
		local atile = actor.getTile();
		local everyone = this.Tactical.Entities.getAllInstances();
		foreach( ever in everyone )
		{
			foreach( e in ever )
			{
				if (actor.isAlive() && e.isAlive() && !actor.isAlliedWith(e))
				{
					local ek = e.getSkills();
					if (ek.hasSkill("effects.staggered") || ek.hasSkill("effects.distracted") || ek.hasSkill("effects.ai_weak_effect") || e.getFatiguePct() >= 0.5)
					{
						ek.add(this.new("scripts/skills/effects/sbq8_domi_effect"));
						local fakeb = this.new("scripts/skills/actives/ai_fakebuff");
						fakeb.m.Overlay = "";
						ek.add(fakeb);
					}
				}
			}
		}
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.m.Skillcharge <= 0)
		{
			return false;
		}
		return true;
	}

	function isHidden()
	{
		if (this.m.Skillcharge > 0)
		{
			return false;
		}

		return true;
	}

	function onCombatFinished()
	{
		this.m.Skillcharge = 1;
	}

});

