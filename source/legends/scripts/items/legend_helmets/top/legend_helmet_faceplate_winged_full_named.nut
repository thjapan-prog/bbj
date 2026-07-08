this.legend_helmet_faceplate_winged_full_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_winged_full_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "An exceptionally well crafted faceplate adorned with angelic wings. The design is very light and the materials are of the highest quality.";
		this.m.ArmorDescription = "Includes an exceptionally well crafted faceplate adorned with angelic wings.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1000;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -4;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_winged_full_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_winged_full_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_winged_full_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_faceplate_winged_full_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(1, 2) * -1 ;
		this.m.StaminaModifier = this.Math.rand(3, 4) * -1;
		this.m.Condition = this.Math.rand(65, 90);
		this.m.ConditionMax = this.m.Condition;
	}
});