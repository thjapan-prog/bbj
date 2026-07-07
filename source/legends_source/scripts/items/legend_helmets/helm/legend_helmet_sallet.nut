this.legend_helmet_sallet <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_sallet";
		this.m.Name = "Sallet";
		this.m.Description = "A metal sallet helm with an extended neck guard, a design uncommon in these lands. Well crafted to offer maximum protection with minimum weight, and without impairing vision.";
		this.m.ArmorDescription = "Includes a metal sallet.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 800;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
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
		this.m.Sprite = "legendhelms_sallet_" + variant;
		this.m.SpriteDamaged = "legendhelms_sallet_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_sallet_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_sallet_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});