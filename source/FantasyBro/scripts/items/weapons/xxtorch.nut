this.xxtorch <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.xxtorch";
		this.m.Name = "Torch";
		this.m.Description = "Effective at night. Can be thrown to set a target tile on fire.";
		this.m.IconLarge = "xx_weapon_25.png";
		this.m.Icon = "xx_weapon_25_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Tool;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_xx_weapon_25";
		this.m.Value = 100;
		this.m.RangeMax = 2;
		this.m.StaminaModifier = 0;
		this.m.IsDroppedAsLoot = false;
	}

	function getTooltip()
	{
		local result = [
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

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});
		result.push({
			id = 64,
			type = "text",
			text = "Worn in Offhand"
		});
		result.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Active: Throws the torch to ignite the target area. (Success Chance: 71%, Range: 2 tiles, Consumed on use.)"
		});
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Passive (Night only): Melee and Ranged Skill +10. Melee and Ranged Defense -15. Night penalties are removed."
		});
		return result;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill = this.new("scripts/skills/actives/xxitem_torch_skill");
		skill.setItem(this);
		this.addSkill(skill);
	}

});

