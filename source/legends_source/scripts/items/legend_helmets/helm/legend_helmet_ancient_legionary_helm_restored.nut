this.legend_helmet_ancient_legionary_helm_restored <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_ancient_legionary_helm_restored";
		this.m.Name = "Restored Ancient Legionary helm";
		this.m.Description = "A restored and polished helm of a long dead legionary, once again serving its purpose after centuries of decay and neglect.";
		this.m.ArmorDescription = "Includes a restored ancient legionary helm.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 800;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -9;
		this.m.Vision = -1;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_ancient_legionary_helm_restored_" + variant;
		this.m.SpriteDamaged = "legendhelms_ancient_legionary_helm_restored_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ancient_legionary_helm_restored_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ancient_legionary_helm_restored_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});