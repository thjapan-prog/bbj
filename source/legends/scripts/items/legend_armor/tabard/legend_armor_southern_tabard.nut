this.legend_armor_southern_tabard <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_tabard";
		this.m.Name = "Southern Tabard";
		this.m.Description = "A flowing cloth covering for armor that displays some colors or heraldry cut in the southern style. It provides a layer of protection and a sense of belonging.";
		this.m.ArmorDescription = "Includes a flowing cloth tabard.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 200;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_tabard" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_tabard" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_tabard" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_tabard" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_tabard" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_tabard" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_tabard" + "_" + variant + ".png";
	}
});