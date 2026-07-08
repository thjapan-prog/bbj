this.legend_armor_cloak_heavy <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_heavy";
		this.m.Name = "Heavy Cloak";
		this.m.Description = "A rustic cloak of thick, layered, warm wool that provides some protection, but is quite hefty. ";
		this.m.ArmorDescription = "Includes a heavy wool cloak.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -4;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_heavy" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_heavy" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_heavy" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_heavy" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_heavy" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_heavy" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_heavy" + "_" + variant + ".png";
	}
});