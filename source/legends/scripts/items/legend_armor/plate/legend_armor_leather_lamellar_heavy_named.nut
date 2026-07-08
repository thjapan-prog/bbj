this.legend_armor_leather_lamellar_heavy_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_lamellar_heavy_named";
		this.m.Name = "";
        this.m.NameList = ["Harness", "Ward", "Defense", "Splendor", "Golden Lamellar"];
		this.m.Description = "An extraordinarily well-crafted piece of lamellar armor. It is overlaid with beaten gold, which makes it truly stand out.";
		this.m.ArmorDescription = "Includes an extraordinarily well-crafted gold plated lamellar harness.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 7500;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -23;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_lamellar_heavy_named" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_lamellar_heavy_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_lamellar_heavy_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_lamellar_heavy_named" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_lamellar_heavy_named" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_lamellar_heavy_named" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_lamellar_heavy_named" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(19, 23) * -1;
		this.m.Condition = this.Math.rand(175, 195);
		this.m.ConditionMax = this.m.Condition;
	}
});