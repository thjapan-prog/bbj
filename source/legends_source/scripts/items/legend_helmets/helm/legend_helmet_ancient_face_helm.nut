this.legend_helmet_ancient_face_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_ancient_face_helm";
		this.m.Name = "Ancient Face Helm";
		this.m.Description = "A sturdy helm with a face mask of an ancient honor guard. Despite its age, the helm is in remarkably good condition.";
		this.m.ArmorDescription = "Includes a sturdy, ancient helm with a metal face mask.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 500;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -10;
		this.m.Vision = -2;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_ancient_face_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_ancient_face_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ancient_face_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ancient_face_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});