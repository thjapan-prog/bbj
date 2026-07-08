this.legend_armor_southern_wrap <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_wrap";
		this.m.Name = "Southern Cloth Wrap";
		this.m.Description = "A simple cloth wrap with a studded leather belt and pouches.";
		this.m.ArmorDescription = "Includes a simple cloth wrap.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_wrap" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_wrap" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_wrap" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_wrap" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_wrap" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_wrap" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_wrap" + "_" + variant + ".png";
	}
});