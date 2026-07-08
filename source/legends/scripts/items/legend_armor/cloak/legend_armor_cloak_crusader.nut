this.legend_armor_cloak_crusader <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_crusader";
		this.m.Name = "Crusader's Cloak";
		this.m.Description = "A holy cloak of thick, layered, warm wool that provides some protection, but is quite hefty.";
		this.m.ArmorDescription = "Includes a holy cloak of thick, layered wool.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -5;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_crusader" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_crusader" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_crusader" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_crusader" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_crusader" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_crusader" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_crusader" + "_" + variant + ".png";
	}
});