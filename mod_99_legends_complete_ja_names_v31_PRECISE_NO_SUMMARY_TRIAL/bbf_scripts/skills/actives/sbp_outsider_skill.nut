this.sbp_outsider_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_outsider_skill";
		this.m.Name = "99. アウトサイダー";
		this.m.Icon = "ui/xxp21.png";
		this.m.Description = "2マス以内に味方がいない場合、近接攻撃スキル・遠隔攻撃スキル・近接防御・遠隔防御・意思に+9のボーナスを得る。";
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

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			return;
		}
		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local isAlone = true;
		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getTile().getDistanceTo(myTile) <= 2)
			{
				isAlone = false;
				break;
			}
		}
		if (isAlone)
		{
			local rr = 9;
			_properties.MeleeSkill += rr;
			_properties.RangedSkill += rr;
			_properties.MeleeDefense += rr;
			_properties.RangedDefense += rr;
			_properties.Bravery += rr;
		}
	}

});

