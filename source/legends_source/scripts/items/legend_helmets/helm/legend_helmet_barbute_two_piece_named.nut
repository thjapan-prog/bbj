this.legend_helmet_barbute_two_piece_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_barbute_two_piece_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A mastercrafted two-piece barbute helm, meticulously joined and well-maintained.";
		this.m.ArmorDescription = "Includes a mastercrafted two-piece barbute helm.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2850;
		this.m.Condition = 90;
		this.m.ConditionMax = 90;
		this.m.StaminaModifier = -4;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_barbute_two_piece_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_barbute_two_piece_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_barbute_two_piece_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_barbute_two_piece_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(1, 2) * -1 ;
		this.m.StaminaModifier = this.Math.rand(2, 4) * -1;
		this.m.Condition = this.Math.rand(85, 105);
		this.m.ConditionMax = this.m.Condition;
	}
});