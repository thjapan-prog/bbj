this.legend_armor_cloak_noble <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_noble";
		this.m.Name = "Noble Cloak";
		this.m.Description = "A fine, flowing cloak made of light foreign silk that provides protection while looking exceptionally grand.";
		this.m.ArmorDescription = "Includes a fine, flowing cloak of light foreign silk.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 3000;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_noble" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_noble" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_noble" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_noble" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_noble" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_noble" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_noble" + "_" + variant + ".png";
	}
});