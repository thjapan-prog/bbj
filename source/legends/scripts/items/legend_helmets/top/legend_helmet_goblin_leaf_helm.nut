this.legend_helmet_goblin_leaf_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_goblin_leaf_helm";
		this.m.Name = "Goblin Leaf Mask";
		this.m.Description = "A rudimentary mask fashioned from foliage and bark, designed to help the wearer blend into the natural surroundings.";
		this.m.ArmorDescription = "Includes a rudimentary goblin mask.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 100;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -1;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_goblin_leaf_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_goblin_leaf_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_goblin_leaf_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_goblin_leaf_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});