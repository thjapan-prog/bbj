this.legend_armor_plate_ancient_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_ancient_scale";
		this.m.Name = "Ancient Scale Coat";
		this.m.Description = "A heavy, tarnished scale coat of ancient design, which belongs in a collection rather than on the battlefield.";
		this.m.ArmorDescription = "Includes an ancient, heavy, tarnished scale coat.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1000;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -17;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "plate_ancient_scale" + "_" + variant;
		this.m.SpriteDamagedBack = "plate_ancient_scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "plate_ancient_scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_plate_ancient_scale" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_plate_ancient_scale" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_plate_ancient_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_plate_ancient_scale" + "_" + variant + ".png";
	}
});