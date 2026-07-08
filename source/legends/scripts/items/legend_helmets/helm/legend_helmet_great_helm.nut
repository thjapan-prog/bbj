this.legend_helmet_great_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_great_helm";
		this.m.Name = "Great Helm";
		this.m.Description = "A heavy, cylindrical helm reinforced with a cross-plate and a perforated breath, offering near-total head protection at the cost of peripheral vision.";
		this.m.ArmorDescription = "Includes a heavy, cylindrical helm.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2500;
		this.m.Condition = 175;
		this.m.ConditionMax = 175;
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
		this.m.Sprite = "legendhelms_great_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_great_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_great_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_great_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});