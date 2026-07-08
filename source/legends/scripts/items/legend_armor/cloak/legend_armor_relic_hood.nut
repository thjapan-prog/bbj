this.legend_armor_relic_hood <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_relic_hood";
		this.m.Name = "Relic Hood and Belts";
		this.m.Description = "A set of straps, bags, a hooded cowl and a relic of a knightly order that offer physical and spiritual protection.";
		this.m.ArmorDescription = "Includes a set of leather straps, bags, a hooded cowl and a relic of a knightly order.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "relic_hood" + "_" + variant;
		this.m.SpriteDamagedBack = "relic_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "relic_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_relic_hood" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_relic_hood" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_relic_hood" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_relic_hood" + "_" + variant + ".png";
	}
});