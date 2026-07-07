this.legend_armor_short_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_short_mail";
		this.m.Name = "Short Mail";
		this.m.Description = "Short chain mail that offers good protection, but is fatiguing to wear.";
		this.m.ArmorDescription = "Includes a set of short chain mail.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 500;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -8;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "short_mail" + "_" + variant;
		this.m.SpriteDamagedBack = "short_mail" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "short_mail" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_short_mail" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_short_mail" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_short_mail" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_short_mail" + "_" + variant + ".png";
	}
});