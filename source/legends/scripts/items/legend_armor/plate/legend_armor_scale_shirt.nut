this.legend_armor_scale_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_scale_shirt";
		this.m.Name = "Light Scale Armor";
		this.m.Description = "A sturdy yet flexible shirt of small, overlapping metal scales.";
		this.m.ArmorDescription = "Includes body vest with small overlapping metal scales.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1750;
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -10;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "scale_shirt" + "_" + variant;
		this.m.SpriteDamagedBack = "scale_shirt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "scale_shirt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_scale_shirt" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_scale_shirt" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_scale_shirt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_scale_shirt" + "_" + variant + ".png";
	}
});