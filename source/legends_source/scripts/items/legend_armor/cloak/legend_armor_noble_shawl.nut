this.legend_armor_noble_shawl <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_noble_shawl";
		this.m.Name = "Noble Shawl";
		this.m.Description = "A shawl of exquisite material that wraps around the shoulders, signifying high status and wealth.";
		this.m.ArmorDescription = "Includes a fine noble shawl.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "noble_shawl" + "_" + variant;
		this.m.SpriteDamagedBack = "noble_shawl" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "noble_shawl" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_noble_shawl" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_noble_shawl" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_noble_shawl" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_noble_shawl" + "_" + variant + ".png";
	}
});