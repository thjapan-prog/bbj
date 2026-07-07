this.legend_armor_cloak_fur <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_fur";
		this.m.Name = "Fur Cloak";
		this.m.Description = "A cloak made of rough chain and the thick fur of a beast.";
		this.m.ArmorDescription = "Includes a thick fur cloak.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 120;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -6;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_fur" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_fur" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_fur" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_fur" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_fur" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_fur" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_fur" + "_" + variant + ".png";
	}
});