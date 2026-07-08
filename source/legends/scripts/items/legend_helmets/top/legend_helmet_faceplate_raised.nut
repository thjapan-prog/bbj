this.legend_helmet_faceplate_raised <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_raised";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A heavy, reinforced faceplate raised up to allow the user to breathe freely without obscuring his face.";
		this.m.ArmorDescription = "Includes a raised reinforced faceplate.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 800;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -3;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_raised_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_raised_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_raised_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_faceplate_raised_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(0, 0) * -1 ;
		this.m.StaminaModifier = this.Math.rand(2, 3) * -1;
		this.m.Condition = this.Math.rand(50, 70);
		this.m.ConditionMax = this.m.Condition;
	}
});