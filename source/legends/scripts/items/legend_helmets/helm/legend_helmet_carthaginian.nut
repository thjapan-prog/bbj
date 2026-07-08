this.legend_helmet_carthaginian <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_carthaginian";
		this.m.Name = "Carthaginian Helm";
		this.m.Description = "A sturdy alloy helm of foreign design.";
		this.m.ArmorDescription = "Includes a foreign alloy helm.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1600;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -5;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_carthaginian_" + variant;
		this.m.SpriteDamaged = "legendhelms_carthaginian_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_carthaginian_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_carthaginian_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});