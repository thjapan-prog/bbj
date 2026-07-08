this.legend_armor_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_mail_shirt";
		this.m.Name = "Basic Mail Shirt";
		this.m.Description = "A basic mail shirt. Offers decent and affordable protection against slashing and piercing attacks.";
		this.m.ArmorDescription = "Includes a basic mail shirt.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 375;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -6;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "mail_shirt" + "_" + variant;
		this.m.SpriteDamagedBack = "mail_shirt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "mail_shirt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_mail_shirt" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_mail_shirt" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_mail_shirt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_mail_shirt" + "_" + variant + ".png";
	}
});