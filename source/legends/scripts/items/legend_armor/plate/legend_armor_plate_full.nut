this.legend_armor_plate_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_full";
		this.m.Name = "Full Coat of Plate Armor";
		this.m.Description = "A full set of solid, plated steel armor.";
		this.m.ArmorDescription = "Includes a full set of solid, plated steel armor.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4500;
		this.m.Condition = 160;
		this.m.ConditionMax = 160;
		this.m.StaminaModifier = -22;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "plate_full" + "_" + variant;
		this.m.SpriteDamagedBack = "plate_full" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "plate_full" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_plate_full" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_plate_full" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_plate_full" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_plate_full" + "_" + variant + ".png";
	}
});