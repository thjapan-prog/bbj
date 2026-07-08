this.legend_armor_cloak <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak";
		this.m.Name = "Simple Cloak";
		this.m.Description = "A rustic cloak of strong, warm wool that provides protection from the weather if nothing else.";
		this.m.ArmorDescription = "Includes a rustic wool cloak.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak" + "_" + variant + ".png";
	}
});