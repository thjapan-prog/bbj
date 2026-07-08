this.legend_armor_hauberk_sleeveless <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_hauberk_sleeveless";
		this.m.Name = "Sleeveless Hauberk";
		this.m.Description = "Long and heavy chain mail that offers good protection, but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a set of long and heavy chain mail.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1250;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -7;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "hauberk_sleeveless" + "_" + variant;
		this.m.SpriteDamagedBack = "hauberk_sleeveless" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "hauberk_sleeveless" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_hauberk_sleeveless" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_hauberk_sleeveless" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_hauberk_sleeveless" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_hauberk_sleeveless" + "_" + variant + ".png";
	}
});