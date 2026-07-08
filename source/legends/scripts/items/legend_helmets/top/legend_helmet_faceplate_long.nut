this.legend_helmet_faceplate_long <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_long";
		this.m.Name = "Long Faceplate";
		this.m.Description = "A sturdy iron jaw guard adjoined with a neck guard.";
		this.m.ArmorDescription = "Includes a jaw guard with a neck guard.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 180;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -3;
		this.m.Vision = 0;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_long_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_long_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_long_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_faceplate_long_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});