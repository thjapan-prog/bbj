this.legend_armor_plate_ancient_chest <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_ancient_chest";
		this.m.Name = "Ancient Breastplate";
		this.m.Description = "A heavy tarnished thick breastplate of ancient origin that offers some protection.";
		this.m.ArmorDescription = "Includes a heavy tarnished thick breastplate of ancient origin.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 750;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -18;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "plate_ancient_chest" + "_" + variant;
		this.m.SpriteDamagedBack = "plate_ancient_chest" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "plate_ancient_chest" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_plate_ancient_chest" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_plate_ancient_chest" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_plate_ancient_chest" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_plate_ancient_chest" + "_" + variant + ".png";
	}
});