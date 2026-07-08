this.legend_armor_leather_padded <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_padded";
		this.m.Name = "Padded Leather Armor";
		this.m.Description = "A suit of padded leather reinforced with metal studs for added protection.";
		this.m.ArmorDescription = "Includes a suit of reinforced padded leather armor.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 175;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -5;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_padded" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_padded" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_padded" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_padded" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_padded" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_padded" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_padded" + "_" + variant + ".png";
	}
});