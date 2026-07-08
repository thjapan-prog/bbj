this.legend_armor_southern_leather_jacket <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_leather_jacket";
		this.m.Name = "Nomad Leather Jacket";
		this.m.Description = "A jacket of patched southern leather that is light enough for long journeys through the desert.";
		this.m.ArmorDescription = "Includes a jacket of patched southern leather.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 110;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_leather_jacket" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_leather_jacket" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_leather_jacket" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_leather_jacket" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_leather_jacket" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_leather_jacket" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_leather_jacket" + "_" + variant + ".png";
	}
});