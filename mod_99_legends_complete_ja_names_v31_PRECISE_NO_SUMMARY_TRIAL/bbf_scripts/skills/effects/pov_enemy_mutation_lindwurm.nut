this.pov_enemy_mutation_lindwurm <- this.inherit("scripts/skills/skill", {
	m = {
		//TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_enemy_mutation_lindwurm";
		this.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "] Wurm\'s Acid [/color]";
		this.m.Description = "This enemy has some properties of an Wurm! Their blood boils with acid, coating enemies that attack from close.";
		this.m.Icon = "skills/pov_lindwurm_mutant.png";
		this.m.IconMini = "pov_mini_lindwurm_mutant";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This enemy has some properties of an Wurm! Their blood boils with acid, coating enemies that attack from close.";
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
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_poison.png",
				text = "このキャラクターは[color=" + this.Const.UI.Color.PositiveValue + "]酸に免疫[/color]を持つ。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/pov_poison.png",
				text = "このキャラクターの血は[color=" + this.Const.UI.Color.PositiveValue + "]酸[/color]で燃え、ヒットポイントダメージを与えるたびに隣接した攻撃者の装甲にダメージを与える。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "近接防御が-[color=" + this.Const.UI.Color.NegativeValue + "]10[/color]低下する。"
			}

		];
		return ret;
	}

	function onAdded() 
	{
		local actor = this.getContainer().getActor();
		if (!::MSU.isKindOf(actor, "player")) 
		{
			::TLW.MutagenDrop.addMutagenDrop(actor, ::TLW.Mutation.Lindwurm);
	  	}
        actor.getFlags().add("body_immune_to_acid");
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.DamageArmorMult *= 1.25;
		// Debuffs
		_properties.MeleeDefense += -10;
		_properties.RangedDefense += -5;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		local actor = this.getContainer().getActor();

		if (actor.getCurrentProperties().YrdenTrapped)
		{
			return;
		}

		if (_damageHitpoints <= 0)
		{
			return;
		}

		if (_attacker == null || !_attacker.isAlive())
		{
			return;
		}

		if (_attacker.getID() == this.getContainer().getActor().getID())
		{
			return;
		}

		if (_attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) > 1)
		{
			return;
		}

		if (_attacker.getFlags().has("lindwurm"))
		{
			return;
		}

		if ((_attacker.getFlags().has("body_immune_to_acid") || _attacker.getArmor(this.Const.BodyPart.Body) <= 0) && (_attacker.getFlags().has("head_immune_to_acid") || _attacker.getArmor(this.Const.BodyPart.Head) <= 0))
		{
			return;
		}

		local poison = _attacker.getSkills().getSkillByID("effects.acid");

		if (poison == null)
		{
			local acid = this.new("scripts/skills/effects/acid_effect");
			_attacker.getSkills().add(acid);
		}
		else
		{
			poison.resetTime();
		}

		this.spawnIcon("status_effect_78", _attacker.getTile());
	}

});
