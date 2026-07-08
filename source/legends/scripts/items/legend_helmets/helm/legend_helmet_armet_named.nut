this.legend_helmet_armet_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_armet_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "A sophisticated steel helm offering excellent protection despite its agile silhouette. Masterfully crafted of exquisite steel and layered with decorative paint.";
		this.m.ArmorDescription = "Includes a masterfully crafted armet of exquisite steel.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4000;
		this.m.Condition = 170;
		this.m.ConditionMax = 170;
		this.m.StaminaModifier = -11;
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
		this.m.Sprite = "legendhelms_armet_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_armet_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_armet_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_armet_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(1, 2) * -1 ;
		this.m.StaminaModifier = this.Math.rand(8, 9) * -1;
		this.m.Condition = this.Math.rand(165, 180);
		this.m.ConditionMax = this.m.Condition;
	}
});