this.ai_noteamkill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.ai_noteamkill";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsSerialized = false;
		this.m.IsActive = false;
		this.m.IsHidden = true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack() && _targetEntity != null && this.getContainer().getActor().isPlacedOnMap())
		{
			local actor = this.getContainer().getActor();
			local actors = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
			local r = 0;
			foreach( a in actors )
			{
				if (a.getID() == actor.getID())
				{
					continue;
				}
				if (_targetEntity.getTile().getDistanceTo(a.getTile()) > 1)
				{
					continue;
				}
				if (a.getFaction() == actor.getFaction())
				{
					r = 1;
					break;
				}
			}
			if (r == 1)
			{
				_properties.RangedAttackBlockedChanceMult *= 0;
			}
			if (_targetEntity.getID() != actor.getID() && actor.isAlliedWith(_targetEntity))
			{
				_properties.MeleeSkillMult *= 0;
				_properties.RangedSkillMult *= 0;
				_properties.DamageTotalMult *= 0;
			}
		}
	}

});

