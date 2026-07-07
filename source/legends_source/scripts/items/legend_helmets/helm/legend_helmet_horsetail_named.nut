this.legend_helmet_horsetail_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_horsetail_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "An expertly crafted nasal helm decorated with intricate golden ornaments.";
		this.m.ArmorDescription = "Includes an expertly crafted nasal helm.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1500;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -3;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_horsetail_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_horsetail_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_horsetail_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_horsetail_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(0, 1) * -1 ;
		this.m.StaminaModifier = this.Math.rand(2, 3) * -1;
		this.m.Condition = this.Math.rand(70, 105);
		this.m.ConditionMax = this.m.Condition;
	}
});