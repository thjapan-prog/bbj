this.legend_armor_cloak_cowl_ragged <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_cowl_ragged";
		this.m.Name = "Ragged Cowl";
		this.m.Description = "A ragged cowl weathered by the elements throughout the years.";
		this.m.ArmorDescription = "Includes a ragged cowl.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 20;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_cowl_ragged" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_cowl_ragged" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_cowl_ragged" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_cowl_ragged" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_cowl_ragged" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_cowl_ragged" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_cowl_ragged" + "_" + variant + ".png";
	}
});