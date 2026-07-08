this.legend_armor_diviner_tabard <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_diviner_tabard";
		this.m.Name = "Diviner's Sash";
		this.m.Description = "A decorated sash and belt previously worn by the Diviner.";
		this.m.ArmorDescription = "Includes a decorated sash and belt previously worn by the Diviner.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 200;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "diviner_tabard" + "_" + variant;
		this.m.SpriteDamagedBack = "diviner_tabard" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "diviner_tabard" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_diviner_tabard" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_diviner_tabard" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_diviner_tabard" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_diviner_tabard" + "_" + variant + ".png";
	}
});