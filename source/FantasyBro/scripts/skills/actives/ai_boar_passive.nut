this.ai_boar_passive <- this.inherit("scripts/skills/skill", {
	m = {
		Rage = 0
	},
	function create()
	{
		this.m.ID = "effects.ai_boar_passive";
		this.m.Name = "Boar Passive";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsSerialized = false;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (this.m.Rage < 5 && _damageHitpoints > 4 && _attacker != null && this.getContainer().getActor() != null)
		{
			local at = _attacker;
			local ac = this.getContainer().getActor();
			local d = at.getTile().getDistanceTo(ac.getTile());
			if (at.isAlive() && ac.isAlive() && at.getID() != ac.getID() && at.getHitpoints() > 0 && d == 1 && !at.getCurrentProperties().IsImmuneToDamageReflection && !at.getCurrentProperties().IsImmuneToDamageReflection)
			{
				this.m.Rage = this.m.Rage + 1;
				local effect = this.new("scripts/skills/effects/bleeding_effect");
				effect.setDamage(this.Math.rand(1, 4));
				_attacker.getSkills().add(effect);
			}
		}
	}

	function onNewRound()
	{
		this.m.Rage = 0;
	}

});

