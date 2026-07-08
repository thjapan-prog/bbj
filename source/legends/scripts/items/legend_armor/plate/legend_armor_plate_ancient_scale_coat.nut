this.legend_armor_plate_ancient_scale_coat <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_ancient_scale_coat";
		this.m.Name = "Ancient Plated Scale Coat";
		this.m.Description = "A heavy coat of scales, partly reinforced with a layer of plated metal on top. It's a massive armor of ancient origin that didn't age well.";
		this.m.ArmorDescription = "Includes an ancient, heavy, reinforced scale coat.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2000;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -24;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "plate_ancient_scale_coat" + "_" + variant;
		this.m.SpriteDamagedBack = "plate_ancient_scale_coat" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "plate_ancient_scale_coat" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_plate_ancient_scale_coat" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_plate_ancient_scale_coat" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_plate_ancient_scale_coat" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_plate_ancient_scale_coat" + "_" + variant + ".png";
	}
});