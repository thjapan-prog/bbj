this.legend_armor_plate_ancient_scale_harness <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_ancient_scale_harness";
		this.m.Name = "Ancient Scale Harness";
		this.m.Description = "A sturdy, but heavy and partly decayed ancient scale harness.";
		this.m.ArmorDescription = "Includes a heavy and partly decayed ancient scale harness.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 500;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -12;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "plate_ancient_scale_harness" + "_" + variant;
		this.m.SpriteDamagedBack = "plate_ancient_scale_harness" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "plate_ancient_scale_harness" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_plate_ancient_scale_harness" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_plate_ancient_scale_harness" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_plate_ancient_scale_harness" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_plate_ancient_scale_harness" + "_" + variant + ".png";
	}
});