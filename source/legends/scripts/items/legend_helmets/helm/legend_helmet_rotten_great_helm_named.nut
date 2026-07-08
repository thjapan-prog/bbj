this.legend_helmet_rotten_great_helm_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_rotten_great_helm_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A heavy, cylindrical helm, which once belonged to a decorated knight. Incrusted with gold and precious gems, it betrays a craftsmanship which years of neglect could not diminish.";
		this.m.ArmorDescription = "Includes a decayed, heavy, cylindrical helm of exquisite craftsmanship.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 3400;
		this.m.Condition = 190;
		this.m.ConditionMax = 190;
		this.m.StaminaModifier = -13;
		this.m.Vision = -3;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rotten_great_helm_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_rotten_great_helm_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rotten_great_helm_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rotten_great_helm_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(3, 3) * -1 ;
		this.m.StaminaModifier = this.Math.rand(12, 14) * -1;
		this.m.Condition = this.Math.rand(190, 215);
		this.m.ConditionMax = this.m.Condition;
	}
});