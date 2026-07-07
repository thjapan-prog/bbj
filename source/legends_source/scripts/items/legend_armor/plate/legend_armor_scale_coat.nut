this.legend_armor_scale_coat <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_scale_coat";
		this.m.Name = "Coat of Scales";
		this.m.Description = "A heavy coat of thick, overlapping metal scales, which cover most of the body.";
		this.m.ArmorDescription = "Includes a heavy coat of thick, overlapping metal scales.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 2500;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -15;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "scale_coat" + "_" + variant;
		this.m.SpriteDamagedBack = "scale_coat" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "scale_coat" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_scale_coat" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_scale_coat" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_scale_coat" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_scale_coat" + "_" + variant + ".png";
	}
});