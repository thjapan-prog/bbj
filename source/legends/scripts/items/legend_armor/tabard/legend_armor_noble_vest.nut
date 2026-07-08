this.legend_armor_noble_vest <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	m = {},
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_armor_noble_vest";
		this.m.Name = "Noble Vest";
		this.m.Description = "A studded leather vest with decorative metallic fasteners popular among the southern nobles.";
		this.m.ArmorDescription = "Includes a studded leather vest.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "noble_vest" + "_" + variant;
		this.m.SpriteDamagedBack = "noble_vest" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "noble_vest" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_noble_vest" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_noble_vest" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_noble_vest" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_noble_vest" + "_" + variant + ".png";
	}
});