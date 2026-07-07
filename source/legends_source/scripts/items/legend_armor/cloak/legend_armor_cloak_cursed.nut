this.legend_armor_cloak_cursed <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_cursed";
		this.m.Name = "Cursed Cloak";
		this.m.Description = "A cloak of the feathers of a strange creature of the abyss. ";
		this.m.ArmorDescription = "Includes a cloak of the feathers of a strange creature of the abyss.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_cursed" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_cursed" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_cursed" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_cursed" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_cursed" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_cursed" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_cursed" + "_" + variant + ".png";
	}
});