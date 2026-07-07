this.pov_hyena_pack_mentality_effect <- this.inherit("scripts/skills/skill", {
	m = {
		//AllyAmount = 0
		MaxBuff = 25
	},
	function create()
	{
		this.m.ID = "effects.pov_hyena_pack_mentality";
		this.m.Name = "[color="+ ::Const.UI.Color.povEnemyEffect + "]Pack Mentality[/color]";
		this.m.Description = "This entity has a furious bond with their pack! So long as the others still breathe, it fights with the tenacity of a cornered beast—every ally standing feeds his will to live and kill.";
		this.m.Icon = "skills/pov_hyena.png";
		this.m.IconMini = "pov_mini_hyena";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This entity has a furious bond with their pack! So long as the others still breathe, it fights with the tenacity of a cornered beast—every ally standing feeds his will to live and kill.";
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
			    icon = "ui/icons/melee_skill.png",
			    text = "生存している仲間1体ごとに近接技量と意思が+[color=" + this.Const.UI.Color.PositiveValue + "] 1 [/color]増加する。このボーナスは最大"+ this.m.MaxBuff +"体の味方まで累積する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/initiative.png",
			    text = "上記ボーナスの[color=" + this.Const.UI.Color.PositiveValue + "]半分[/color]をイニシアチブにも得る。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/warning.png",
			    text = "生存している仲間が[color=" + this.Const.UI.Color.NegativeValue + "]5[/color]体未満の場合、意思とイニシアチブが[color=" + this.Const.UI.Color.NegativeValue + "]10[/color]、近接技量が[color=" + this.Const.UI.Color.NegativeValue + "]5[/color]低下し、上記のバフも失う。"
			},
		];
		return ret;
	}
	function calculateBonus()
	{
		local actor = this.getContainer().getActor();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local allyCount = 0;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			allyCount += 1;
		}
		return allyCount;
	}
	

	function onTurnStart()
	{
		::TLW.Mod.Debug.printLog("Hyenas Ally Count:" + calculateBonus());
	}

	function onUpdate( _properties )
	{
		local allies = calculateBonus();
		if(allies >= 5)
		{
			this.m.Name = "[color=#5c3a01]Pack Mentality (x"+ allies +")[/color]";
			_properties.MeleeSkill += allies;
			_properties.Bravery += allies + (allies * 0.5);
			_properties.Initiative += allies;
			_properties.SurroundedBonus += 2;
		}
		else if(allies >= 25)
		{
			this.m.Name = "[color=#5c3a01]Pack Mentality (x25)(Max)[/color]";
			_properties.MeleeSkill += 25;
			_properties.Bravery += 37;
			_properties.Initiative += 25;
			_properties.SurroundedBonus += 4;
		}
		else if (allies < 5)
		{
			this.m.Name = "[color=#5c3a01]Pack Mentality (Losing)[/color]";
			_properties.MeleeSkill -= 5;
			_properties.Bravery -= 10;
			_properties.Initiative -= 10;
		}
	}

});
