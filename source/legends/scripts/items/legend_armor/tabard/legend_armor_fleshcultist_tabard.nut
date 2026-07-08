this.legend_armor_fleshcultist_tabard <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_fleshcultist_tabard";
		this.m.Name = "Fleshcultist's Sash";
		this.m.Description = "A linen sash and belt previously worn by followers of the Diviner.";
		this.m.ArmorDescription = "Includes a linen sash and belt previously worn by followers of the Diviner.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 200;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "fleshcultist_tabard" + "_" + variant;
		this.m.SpriteDamagedBack = "fleshcultist_tabard" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "fleshcultist_tabard" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_fleshcultist_tabard" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_fleshcultist_tabard" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_fleshcultist_tabard" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_fleshcultist_tabard" + "_" + variant + ".png";
	}
});