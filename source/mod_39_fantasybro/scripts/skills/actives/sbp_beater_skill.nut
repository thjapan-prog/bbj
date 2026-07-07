this.sbp_beater_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "actives.sbp_beater_skill";
		this.m.Name = "83. Vengeance (passive)";
		this.m.Icon = "ui/xxp25.png";
		this.m.Description = "Once per turn, when this character successfully attacks or dodges, deals 5 damage. (This damage cannot kill the target)";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 100;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		return ret;
	}

	function onMissed( _attacker, _skill )
	{
		if (this.m.IsSpent || !_skill.isAttack() || !_attacker.isAlive() || _attacker.isDying() || _attacker.getFaction() == this.Const.Faction.Player)
		{
			return false;
		}

		this.m.IsSpent = true;
		this.spawnIcon("status_effect_01", _attacker.getTile());
		_attacker.setHitpoints(this.Math.max(_attacker.getHitpoints() - 5, 1));
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_attacker) + " takes 5 damage");
		return true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.m.IsSpent || !_skill.isAttack() || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.getFaction() == this.Const.Faction.Player)
		{
			return false;
		}

		this.m.IsSpent = true;
		this.spawnIcon("status_effect_01", _targetEntity.getTile());
		_targetEntity.setHitpoints(this.Math.max(_targetEntity.getHitpoints() - 5, 1));
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " takes 5 damage");
		return true;
	}

	function onNewRound()
	{
		this.m.IsSpent = false;
	}

});

