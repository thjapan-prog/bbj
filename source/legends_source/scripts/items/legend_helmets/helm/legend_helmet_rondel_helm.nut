this.legend_helmet_rondel_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_rondel_helm";
		this.m.Name = "Rondel Helm";
		this.m.Description = "A short skullcap with a pair of rondels affixed to the sides, providing extra protection to the wearer's head.";
		this.m.ArmorDescription = "Includes a skullcap with protective side rondels.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 775;
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -6;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rondel_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_rondel_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rondel_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rondel_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});