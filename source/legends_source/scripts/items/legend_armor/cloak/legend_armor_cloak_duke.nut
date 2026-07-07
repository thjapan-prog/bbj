this.legend_armor_cloak_duke <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_duke";
		this.m.Name = "Duke's Cloak";
		this.m.Description = "A refined cloak of fine, lightweight silk that marks the wearer as a distinguished figure of the highest circles.";
		this.m.ArmorDescription = "Includes a refined cloak of fine, lightweight silk.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 2000;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cloak_duke" + "_" + variant;
		this.m.SpriteDamagedBack = "cloak_duke" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cloak_duke" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak_duke" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cloak_duke" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cloak_duke" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak_duke" + "_" + variant + ".png";
	}
});