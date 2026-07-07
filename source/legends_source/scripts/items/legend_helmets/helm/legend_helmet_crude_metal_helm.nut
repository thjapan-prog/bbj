this.legend_helmet_crude_metal_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_crude_metal_helm";
		this.m.Name = "Crude Metal Helm";
		this.m.Description = "Although crudely made and rusty, this metal helm is a durable and sturdy piece of armor.";
		this.m.ArmorDescription = "Includes a crude metal helm.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 500;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -8;
		this.m.Vision = -1;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_crude_metal_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_crude_metal_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_crude_metal_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_crude_metal_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});