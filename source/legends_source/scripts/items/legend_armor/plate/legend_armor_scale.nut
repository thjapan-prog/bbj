this.legend_armor_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_scale";
		this.m.Name = "Scale Armor";
		this.m.Description = "A sturdy body vest made of overlapping metal scales.";
		this.m.ArmorDescription = "Includes a body vest of overlapping metal scales.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 2250;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -12;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "scale" + "_" + variant;
		this.m.SpriteDamagedBack = "scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_scale" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_scale" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_scale" + "_" + variant + ".png";
	}
});