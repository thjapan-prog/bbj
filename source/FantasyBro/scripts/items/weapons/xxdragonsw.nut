this.xxdragonsw <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.xxdragonsw";
		this.m.Name = "Dragon Slayer";
		this.m.Description = "It was too big to be called a sword. Massive, thick, heavy, and far too rough. Indeed, it was a heap of raw iron. This weapon ignores the bonus to Melee Defense granted by shields.";
		this.m.Categories = "Weapon, Two-Handed";
		this.m.IconLarge = "xx_weapon_08.png";
		this.m.Icon = "xx_weapon_08_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_xx_weapon_08";
		this.m.Value = 7000;
		this.m.ShieldDamage = 0;
		this.m.Condition = 200;
		this.m.ConditionMax = 200;
		this.m.StaminaModifier = -40;
		this.m.RegularDamage = 170;
		this.m.RegularDamageMax = 200;
		this.m.ArmorDamageMult = 1.5;
		this.m.DirectDamageMult = 0.5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/xxitem_dragonswaa_skill"));
		this.addSkill(this.new("scripts/skills/actives/xxitem_dragonswbb_skill"));
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

