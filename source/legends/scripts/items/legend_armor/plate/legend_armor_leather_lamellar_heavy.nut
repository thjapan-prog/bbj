this.legend_armor_leather_lamellar_heavy <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_lamellar_heavy";
		this.m.Name = "Heavy Lamellar Armor";
		this.m.Description = "A heavy lamellar armor that covers most parts of the body with thick, overlapping metal plates for maximum protection.";
		this.m.ArmorDescription = "Includes heavy lamellar armor that covers most parts of the body with thick, overlapping metal plates.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4750;
		this.m.Condition = 165;
		this.m.ConditionMax = 165;
		this.m.StaminaModifier = -24;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_lamellar_heavy" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_lamellar_heavy" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_lamellar_heavy" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_lamellar_heavy" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_lamellar_heavy" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_lamellar_heavy" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_lamellar_heavy" + "_" + variant + ".png";
	}
});