this.xxuquiver <- this.inherit("scripts/items/ammo/ammo", {
	m = {	},
	function create()
	{
		this.ammo.create();
		this.m.ID = "ammo.arrows";
		this.m.Name = "Nightshade Quiver";
		this.m.Description = "This mysterious projectile quiver is imbued with elven magic. It acts as arrows, bolts, and gunpowder depending on the ranged weapon.";
		this.m.Icon = "xx_weapon_22.png";
		this.m.IconEmpty = "xx_weapon_22_empty.png";
		this.m.SlotType = this.Const.ItemSlot.Ammo;
		this.m.ItemType = this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Legendary;
		this.m.AmmoType = this.Const.Items.AmmoType.Arrows;
		this.m.ShowOnCharacter = true;
		this.m.ShowQuiver = true;
		this.m.Sprite = "bust_quiver_01";
		this.m.Value = 1000;
		this.m.Ammo = 12;
		this.m.AmmoMax = 12;
		this.m.IsDroppedAsLoot = true;
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

		if (this.m.Ammo != 0)
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ammo.png",
				text = "Contains [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Ammo + "[/color] projectiles"
			});
		}
		else
		{
			result.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Is empty and useless[/color]"
			});
		}

		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+7[/color] Ranged Skill"
		});
		result.push({
			id = 8,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Inflicts 10 Pain Damage when these projectiles are used on Undead. (Inflicts damage that ignores armor but does not kill)"
		});
		return result;
	}

	function onEquip()
	{
		this.ammo.onEquip();
		this.addSkill(this.new("scripts/skills/actives/xxitem_xxuquiveraa_skill"));
	}

});

