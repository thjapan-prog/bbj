this.legend_armor_tabard_noble <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_tabard_noble";
		this.m.Name = "Noble Tabard";
		this.m.Description = "A fine, flowing cloth covering for armor that displays noble colors or heraldry. It provides a layer of protection and a sense of belonging.";
		this.m.ArmorDescription = "Includes a fine, flowing cloth tabard.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 1000;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "tabard_noble" + "_" + variant;
		this.m.SpriteDamagedBack = "tabard_noble" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "tabard_noble" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_tabard_noble" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_tabard_noble" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_tabard_noble" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_tabard_noble" + "_" + variant + ".png";
	}
});