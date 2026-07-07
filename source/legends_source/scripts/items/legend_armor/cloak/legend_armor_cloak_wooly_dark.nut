this.legend_armor_cloak_wooly_dark <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_wooly_dark";
		this.m.Name = "Dark Wooly Cloak";
		this.m.Description = "A cloak of dark wool that wraps around the shoulders.";
		this.m.ArmorDescription = "Includes a cloak of dark wool.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 120;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_wooly_dark" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_wooly_dark" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_wooly_dark" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_wooly_dark" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_wooly_dark" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_wooly_dark" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_wooly_dark" + "_" + variant + ".png";
	}
});