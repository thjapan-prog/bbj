this.legend_helmet_aventail_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet", {
	m = {},
	function create()
	{
		this.legend_named_helmet.create();
		this.m.ID = "armor.head.legend_helmet_aventail_named";
        this.m.NameList = ::Const.Strings.LegendHelmetLayers;
		this.m.Description = "Truly fit for a knight, this mail aventail is made from the highest quality materials and boasts precious decorations and ornaments.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.BaseInventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1500;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -3;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_aventail_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_aventail_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_aventail_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_aventail_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
	}

	function randomizeValues()
	{
        this.m.Vision = this.Math.rand(0, 0) * -1 ;
		this.m.StaminaModifier = this.Math.rand(2, 2) * -1;
		this.m.Condition = this.Math.rand(65, 75);
		this.m.ConditionMax = this.m.Condition;
	}
});