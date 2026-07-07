this.pov_enemy_mutation_serpent <- this.inherit("scripts/skills/skill", {
	m = {
		//TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_enemy_mutation_serpent";
		this.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "]Serpent\'s Finesse[/color]";
		this.m.Description = "Great agility allows one to excel at dodgeing attacks, especially when focuesed against one enemy.\n\n On the other hand, focus against multiple opponents becomes harder, leading to the diminishing of these affects, as well as the creation of openings during combat.";
		this.m.Icon = "skills/pov_serpent_mutant.png"; 
		this.m.IconMini = "pov_mini_serpent_mutant"; 
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Great agility allows one to excel at dodgeing attacks, especially when focuesed against one enemy.\n\n On the other hand, focus against multiple opponents becomes harder, leading to the diminishing of these affects, as well as the creation of openings during combat.";
	}

	function getPenalty()
	{
		local actor = this.m.Container.getActor();
		local surroundedAmount = actor.getSurroundedCount();
		local penalty = surroundedAmount * 4;
		return penalty;
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();
		if (actor == null)
		{
			return 0;
		}

		if (actor.getCurrentProperties().YrdenTrapped)
		{
			return 0;
		}
		
		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local myFaction = actor.getFaction();
		local nearbyEnemies = 0;

		if (myTile == null)
		{
			return 0;
		}

		if (!("Entities" in this.Tactical))
		{
			return 0;
		}

		if (this.Tactical.Entities == null)
		{
			return 0;
		}

		if (this.Tactical.State.isAutoRetreat())
		{
			return 0;
		}

		if (!this.Tactical.isActive())
		{
			return 0;
		}

		local actors = this.Tactical.Entities.getAllInstancesAsArray();
		local bonus = 0;
		foreach( a in actors )
		{
			if (a == null)
			{
				continue;
			}

			if(!a.isPlacedOnMap())
			{
				continue;
			}

			if (a.getFaction() == myFaction)
			{
				continue;
			}

			if (a.getTile() == null)
			{
				continue;
			}

			if (a.getTile().getDistanceTo(myTile) != 1)
			{
				continue;
			}
			++nearbyEnemies;
		}

		if (nearbyEnemies > 1)
		{
			return 0;
		}
		if (nearbyEnemies == 1)
		{
			return 14;
		}
		else
		{
			return 0;
		}
	}

	function getTooltip()
	{
		local initiative = this.Math.floor(this.getContainer().getActor().getInitiative() * 0.17);
		if (initiative < 0) {initiative = 0;}
		local bonus = this.getBonus();
		local surrAmount = this.getPenalty();
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
			    icon = "ui/icons/ranged_skill.png",
			    text = "現在、近接防御が+[color=" + this.Const.UI.Color.PositiveValue + "]"+bonus+"[/color]、遠隔防御が+[color=" + this.Const.UI.Color.PositiveValue + "]"+bonus/2+"[/color]増加している（敵がちょうど[color=" + this.Const.UI.Color.NegativeValue + "]1体[/color]の時にボーナスが有効）。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/initiative.png",
			    text = "現在、イニシアチブにより全防御が+[color=" + this.Const.UI.Color.PositiveValue + "]"+initiative+"[/color]増加している。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/melee_defense.png",
			    text = "現在、包囲されているため近接防御が[color=" + this.Const.UI.Color.NegativeValue + "]"+surrAmount+"[/color]低下している。"
			}
		];
		return ret;
	}

	function onAdded() 
	{
		local actor = this.getContainer().getActor();
		if (!::MSU.isKindOf(actor, "player")) 
		{
			::TLW.MutagenDrop.addMutagenDrop(actor, ::TLW.Mutation.Serpent);
	  	}

	  	if (!this.m.Container.hasSkill("actives.pov_serpent_hook"))
		{
			local feast = this.new("scripts/skills/actives/pov_serpent_hook_skill");
			feast.m.ActionPointCost = 5;
			//feast.m.FatigueCost = 30;
			//feast.m.MaxRange = 3;
			this.m.Container.add(feast);

			if (actor.getAIAgent().findBehavior(::Const.AI.Behavior.ID.PovKnockBack) == null)
			{
				actor.m.AIAgent.addBehavior(this.new("scripts/ai/tactical/behaviors/pov_ai_defend_knock_back"));
				actor.getAIAgent().finalizeBehaviors();
			}
		}
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBonus();
		_properties.MeleeDefense += bonus;
		_properties.RangedDefense += bonus / 2;
		//_properties.SurroundedDefense -= 3;
		local surrAmount = this.getPenalty();
		_properties.MeleeDefense += - surrAmount;
		_properties.InitiativeMult *= 1.15;
		_properties.Initiative += 5;
	}

	function onAfterUpdate( _properties )
	{
		local initiative = this.Math.floor(this.getContainer().getActor().getInitiative() * 0.17);
		_properties.MeleeDefense += this.Math.max(0, initiative);
		_properties.RangedDefense += this.Math.max(0, initiative);
	}

});
