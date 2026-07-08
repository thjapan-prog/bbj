this.legend_armor_plate_full_greaves_painted <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_full_greaves_painted";
		this.m.Name = "";
        this.m.NameList = ["Ward", "Death", "Barrier", "Plate Armor", "Dark Plated Armor", "Life Stealer"];
		this.m.Description = "A masterfully crafted harness of solid, plated steel, finished with a layer of decorative paint.";
		this.m.ArmorDescription = "Includes a masterfully crafted set of painted, solid plated steel with matching greaves.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 10000;
		this.m.Condition = 170;
		this.m.ConditionMax = 170;
		this.m.StaminaModifier = -26;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "plate_full_greaves_painted" + "_" + variant;
		this.m.SpriteDamagedBack = "plate_full_greaves_painted" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "plate_full_greaves_painted" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_plate_full_greaves_painted" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_plate_full_greaves_painted" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_plate_full_greaves_painted" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_plate_full_greaves_painted" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(23, 25) * -1;
		this.m.Condition = this.Math.rand(185, 225);
		this.m.ConditionMax = this.m.Condition;
	}
});