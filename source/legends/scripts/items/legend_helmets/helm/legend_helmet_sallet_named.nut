this.legend_helmet_sallet_named <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_sallet_named";
		this.m.Name = "Gilded Sallet";
		this.m.Description = "A beautifully designed metal sallet helm with an extended neck guard, a design uncommon in these lands. Expertly crafted to offer maximum protection with minimum weight, and without impairing vision.";
		this.m.ArmorDescription = "Includes a beautifully designed metal sallet.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1600;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -2;
		this.m.Vision = 0;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_sallet_named_" + variant;
		this.m.SpriteDamaged = "legendhelms_sallet_named_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_sallet_named_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_sallet_named_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});