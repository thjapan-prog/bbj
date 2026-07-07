this.sbp_goblin_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 0
	},
	function create()
	{
		this.m.ID = "actives.sbp_goblin_skill";
		this.m.Name = "89. ゴブリン武器学";
		this.m.Icon = "ui/xxp2.png";
		this.m.Description = "ゴブリンの固有武器を使用中：ターン開始時に50%の確率で防具貫通+100%・近接防御+5を得る（1ターン持続）。";
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

	function onNewRound()
	{
		if (this.getContainer().getActor().isPlacedOnMap() && this.getContainer().getActor().isAlive() && this.Math.rand(1, 100) <= 50)
		{
			this.m.Skillcharge = 1;
			this.spawnIcon("status_effect_34", this.getContainer().getActor().getTile());
		}
		else
		{
			this.m.Skillcharge = 0;
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && this.m.Skillcharge == 1)
		{
			if (item.getID() == "weapon.named_goblin_falchion" || item.getID() == "weapon.named_goblin_heavy_bow" || item.getID() == "weapon.named_goblin_pike" || item.getID() == "weapon.named_goblin_spear")
			{
				_properties.DamageDirectAdd += 1;
				_properties.MeleeDefense += 5;
			}
		}
	}

});

