this.sbp_goblin_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 0
	},
	function create()
	{
		this.m.ID = "actives.sbp_goblin_skill";
		this.m.Name = "89. Goblin Weaponology (passive)";
		this.m.Icon = "ui/xxp2.png";
		this.m.Description = "When using the Goblin\'s named weapon: 50% chance to gain +100% Armor Penetration and +5 Melee Defense at the start of the turn (lasts 1 turn)";
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

