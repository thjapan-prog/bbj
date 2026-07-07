this.legend_armor_southern_wide_belt <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_wide_belt";
		this.m.Name = "Southern Wide Belt";
		this.m.Description = "A simple wide belt that wraps around the waist.";
		this.m.ArmorDescription = "Includes a simple wide belt.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 2;
		this.m.ConditionMax = 2;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_wide_belt" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_wide_belt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_wide_belt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_wide_belt" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_wide_belt" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_wide_belt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_wide_belt" + "_" + variant + ".png";
	}
});