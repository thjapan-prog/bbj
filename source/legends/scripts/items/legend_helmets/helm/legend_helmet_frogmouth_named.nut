this.legend_helmet_frogmouth_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_frogmouth_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A prestigious helm with a crafty sloped design meant to deflect blows. Such a masterpiece surely belonged to a champion of many great tournaments.";
		this.m.ArmorDescription = "Includes a prestigious frogmouth helm of excellent construction.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2250;
		this.m.Condition = 160;
		this.m.ConditionMax = 160;
		this.m.StaminaModifier = -10;
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
		this.m.Sprite = "legendhelms_frogmouth_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_frogmouth_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_frogmouth_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_frogmouth_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(2, 3) * -1 ;
		this.m.StaminaModifier = this.Math.rand(11, 13) * -1;
		this.m.Condition = this.Math.rand(180, 205);
		this.m.ConditionMax = this.m.Condition;
	}
});