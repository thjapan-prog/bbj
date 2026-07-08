this.legend_armor_decorative_hood <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_decorative_hood";
		this.m.Name = "Decorative Cowl";
		this.m.Description = "A hooded cowl with decorated, scalloped edges that provides a quite dashing appearance.";
		this.m.ArmorDescription = "Includes a hooded cowl with decorated, scalloped edges.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "decorative_hood" + "_" + variant;
		this.m.SpriteDamagedBack = "decorative_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "decorative_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_decorative_hood" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_decorative_hood" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_decorative_hood" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_decorative_hood" + "_" + variant + ".png";
	}
});