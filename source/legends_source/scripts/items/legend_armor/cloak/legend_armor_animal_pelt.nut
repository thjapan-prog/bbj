this.legend_armor_animal_pelt <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_animal_pelt";
		this.m.Name = "Animal Pelt";
		this.m.Description = "A pelt of spotted fur that wraps around the shoulders.";
		this.m.ArmorDescription = "Includes a pelt of spotted fur.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "animal_pelt" + "_" + variant;
		this.m.SpriteDamagedBack = "animal_pelt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "animal_pelt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_animal_pelt" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_animal_pelt" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_animal_pelt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_animal_pelt" + "_" + variant + ".png";
	}
});