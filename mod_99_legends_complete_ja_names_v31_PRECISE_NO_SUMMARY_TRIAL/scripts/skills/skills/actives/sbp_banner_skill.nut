this.sbp_banner_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_banner_skill";
		this.m.Name = "81. 旗主";
		this.m.Icon = "ui/xxp16.png";
		this.m.Description = "戦闘軍旗（バナーアイテム）を装備中：ダメージ+20、近接攻撃スキル+7、近接防御+7、遠隔防御+7を得る。";
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
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null)
		{
			if (item.getID() == "weapon.player_banner")
			{
				_properties.DamageRegularMin += 20;
				_properties.DamageRegularMax += 20;
				_properties.MeleeSkill += 7;
				_properties.MeleeDefense += 7;
				_properties.RangedDefense += 7;
			}
		}
	}

});

