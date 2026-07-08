this.legend_armor_noble_padded <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_noble_padded";
		this.m.Name = "Padded Noble Vest";
		this.m.Description = "An expensive padded vest with thick leather strapping, tailored for high-society protection.";
		this.m.ArmorDescription = "Includes an expensive padded vest with thick leather strapping.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 2800;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -6;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "noble_padded" + "_" + variant;
		this.m.SpriteDamagedBack = "noble_padded" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "noble_padded" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_noble_padded" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_noble_padded" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_noble_padded" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_noble_padded" + "_" + variant + ".png";
	}
});