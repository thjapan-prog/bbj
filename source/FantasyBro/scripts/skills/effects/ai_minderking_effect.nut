this.ai_minderking_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.ai_minderking_effect";
		this.m.Name = "Corrupted Mind";
		this.m.Description = "";
		this.m.Icon = "skills/status_effect_108.png";
		this.m.IconMini = "status_effect_108_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.First;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.ChanceDisembowel = 0;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (!actor.hasSprite("minderking_injury") && this.m.ChanceDisembowel != 1)
		{
			local mj = actor.addSprite("minderking_injury");
			mj.setBrush("bust_mind_buff");
			if (actor.hasSprite("arms_icon"))
			{
				actor.removeSprite("arms_icon");
				actor.addSprite("arms_icon")
				local flip = !actor.isAlliedWithPlayer();
				actor.getSprite("arms_icon").setHorizontalFlipping(flip);
				actor.getItems().updateAppearance();
			}
		}
		if (actor.getMoraleState() != this.Const.MoraleState.Ignore && actor.getMoraleState() < this.Const.MoraleState.Steady)
		{
			actor.setMoraleState(this.Const.MoraleState.Steady);
		}
	}


	function onUpdate( _properties )
	{
		_properties.DamageTotalMult += 0.2;
		_properties.Hitpoints += 100;
		_properties.MeleeSkill += 10;
		_properties.RangedSkill += 10;
		_properties.MeleeDefense += 5;
		_properties.RangedDefense += 5;
	}

	function onDeath( _fatalityType )
	{
		local actor = this.getContainer().getActor();
		local instances = this.Tactical.Entities.getAllInstances();
		local finders = [];
		foreach( instance in instances )
		{
			foreach( a in instance )
			{
				if (a.getFaction() == actor.getFaction() && a.getID() != actor.getID() && a.isAlive() && !a.getSkills().hasSkill("effects.ai_minderking_effect") && !a.isNonCombatant() && a.getHitpointsMax() > 1)
				{
					finders.push(a);
				}
			}
		}
		if (finders.len() != 0)
		{
			local target = finders[this.Math.rand(0, finders.len() - 1)];
			target.getSkills().add(this.new("scripts/skills/actives/ai_fakebuff"));
			target.getSkills().add(this.new("scripts/skills/effects/ai_minderking_effect"));
			local flip = !this.m.IsProjectileRotated && target.getPos().X > actor.getPos().X;
			this.Tactical.spawnProjectileEffect("effect_impale_N", actor.getTile(), target.getTile(), 2, 1.1, true, flip);
		}
	}

});

