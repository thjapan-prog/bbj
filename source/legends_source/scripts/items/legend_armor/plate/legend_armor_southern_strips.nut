this.legend_armor_southern_strips <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_strips";
		this.m.Name = "Linothorax";
		this.m.Description = "A breastplate made of several layers of linen that provides basic protection.";
		this.m.ArmorDescription = "Includes a light breastplate made of several layers of linen.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 275;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -4;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_strips" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_strips" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_strips" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_strips" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_strips" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_strips" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_strips" + "_" + variant + ".png";
	}
});