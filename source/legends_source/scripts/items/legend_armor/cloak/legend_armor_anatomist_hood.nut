this.legend_armor_anatomist_hood <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_anatomist_hood";
		this.m.Name = "Anatomist Hood";
		this.m.Description = "A dark hood with reinforced edges popular with those working with filth and entrails.";
		this.m.ArmorDescription = "Includes a dark hood with reinforced edges.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "anatomist_hood" + "_" + variant;
		this.m.SpriteDamagedBack = "anatomist_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "anatomist_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_anatomist_hood" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_anatomist_hood" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_anatomist_hood" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_anatomist_hood" + "_" + variant + ".png";
	}
});