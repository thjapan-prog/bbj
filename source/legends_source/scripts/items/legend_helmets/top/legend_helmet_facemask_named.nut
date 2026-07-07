this.legend_helmet_facemask_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_facemask_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A heavy, exquisite metal faceplate in the shape of a face frozen in a mocking smile.";
		this.m.ArmorDescription = "Includes a heavy, exquisite metal anthropomorphic faceplate.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1200;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -2;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_facemask_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_facemask_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_facemask_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_facemask_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(1, 1) * -1 ;
		this.m.StaminaModifier = this.Math.rand(2, 3) * -1;
		this.m.Condition = this.Math.rand(55, 70);
		this.m.ConditionMax = this.m.Condition;
	}
});