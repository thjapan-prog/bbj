this.legend_armor_leather_lamellar_harness_reinforced <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_lamellar_harness_reinforced";
		this.m.Name = "Reinforced Lamellar Harness";
		this.m.Description = "A body armor made of thick overlapping metal plates that cover most of the upper body.";
		this.m.ArmorDescription = "Includes body armor made of thick overlapping metal plates that cover most of the upper body.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 350;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -7;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_lamellar_harness_reinforced" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_lamellar_harness_reinforced" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_lamellar_harness_reinforced" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_lamellar_harness_reinforced" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_lamellar_harness_reinforced" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_lamellar_harness_reinforced" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_lamellar_harness_reinforced" + "_" + variant + ".png";
	}
});