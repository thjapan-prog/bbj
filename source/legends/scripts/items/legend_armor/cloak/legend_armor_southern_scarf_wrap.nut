this.legend_armor_southern_scarf_wrap <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_scarf_wrap";
		this.m.Name = "Southern Scarf Wrap";
		this.m.Description = "A simple scarf that wraps around the neck and shoulders.";
		this.m.ArmorDescription = "Includes a simple scarf.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_scarf_wrap" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_scarf_wrap" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_scarf_wrap" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_scarf_wrap" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_scarf_wrap" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_scarf_wrap" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_scarf_wrap" + "_" + variant + ".png";
	}
});