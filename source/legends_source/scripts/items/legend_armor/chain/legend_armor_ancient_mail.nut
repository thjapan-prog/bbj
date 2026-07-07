this.legend_armor_ancient_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_ancient_mail";
		this.m.Name = "Ancient Mail";
		this.m.Description = "Old and crusted heavy mail of ancient design offering some protection, but fatiguing to wear.";
		this.m.ArmorDescription = "Includes a set of old and crusted heavy mail of ancient design.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 300;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -6;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "ancient_mail" + "_" + variant;
		this.m.SpriteDamagedBack = "ancient_mail" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "ancient_mail" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_ancient_mail" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_ancient_mail" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_ancient_mail" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_ancient_mail" + "_" + variant + ".png";
	}
});