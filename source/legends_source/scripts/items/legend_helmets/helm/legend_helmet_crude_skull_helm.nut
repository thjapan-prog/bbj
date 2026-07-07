this.legend_helmet_crude_skull_helm <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_crude_skull_helm";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A heavy helm typical of the northern barbarians with a skull-like face mask. This piece is as massive as it is impressive.";
		this.m.ArmorDescription = "Includes a heavy helm with a skull-like face mask.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 3500;
		this.m.Condition = 150;
		this.m.ConditionMax = 150;
		this.m.StaminaModifier = -9;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_crude_skull_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_crude_skull_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_crude_skull_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_crude_skull_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(1, 2) * -1 ;
		this.m.StaminaModifier = this.Math.rand(7, 9) * -1;
		this.m.Condition = this.Math.rand(150, 175);
		this.m.ConditionMax = this.m.Condition;
	}
});