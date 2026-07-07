this.legend_helmet_crude_cylinder_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_crude_cylinder_helm";
		this.m.Name = "Crude Cylinder Helm";
		this.m.Description = "This heavy metal helm also protects the wearers face, albeit at the cost of visibility.";
		this.m.ArmorDescription = "Includes a crude cylinder helm.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 600;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -12;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_crude_cylinder_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_crude_cylinder_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_crude_cylinder_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_crude_cylinder_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});