this.legend_helmet_ancient_legionary_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_ancient_legionary_helm";
		this.m.Name = "Ancient Legionary Helm";
		this.m.Description = "A heavy helm with a tattered horsehair plume and dulled finish, once a symbol of a legion's iron discipline.";
		this.m.ArmorDescription = "Includes a heavy helm of an ancient legionary.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 350;
		this.m.Condition = 95;
		this.m.ConditionMax = 95;
		this.m.StaminaModifier = -9;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_ancient_legionary_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_ancient_legionary_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ancient_legionary_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ancient_legionary_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});