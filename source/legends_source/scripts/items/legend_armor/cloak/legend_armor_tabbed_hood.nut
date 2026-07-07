this.legend_armor_tabbed_hood <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_tabbed_hood";
		this.m.Name = "Tabbed Cowl";
		this.m.Description = "A hooded cowl with dour, tabbed edges that helps one stay unremarkable and unassuming.";
		this.m.ArmorDescription = "Includes a hooded cowl with dour, tabbed edges.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 40;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "tabbed_hood" + "_" + variant;
		this.m.SpriteDamagedBack = "tabbed_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "tabbed_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_tabbed_hood" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_tabbed_hood" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_tabbed_hood" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_tabbed_hood" + "_" + variant + ".png";
	}
});