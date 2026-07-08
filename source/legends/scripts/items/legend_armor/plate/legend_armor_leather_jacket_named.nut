this.legend_armor_leather_jacket_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_jacket_named";
		this.m.Name = "";
        this.m.NameList = ["Leather Cuirass", "Leather Armor", "Skin", "Peel", "Guard", "Coat", "Nightcloak", "Black Leather", "Dark Omen", "Toadskin", "Ogreskin"];
		this.m.Description = "A well-crafted, hardened leather armor. Light to wear, yet exceptionally sturdy.";
		this.m.ArmorDescription = "Includes a masterwork hardened leather jacket.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 750;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_jacket_named" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_jacket_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_jacket_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_jacket_named" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_jacket_named" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_jacket_named" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_jacket_named" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(1, 2) * -1;
		this.m.Condition = this.Math.rand(35, 45);
		this.m.ConditionMax = this.m.Condition;
	}
});