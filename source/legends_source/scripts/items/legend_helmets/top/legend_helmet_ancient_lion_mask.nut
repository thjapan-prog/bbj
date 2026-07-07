this.legend_helmet_ancient_lion_mask <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_ancient_lion_mask";
		this.m.Name = "Ancient Lion Mask";
		this.m.Description = "An dilapidated helm featuring a noble lion crest, worn by the elite guardians of a forgotten empire.";
		this.m.ArmorDescription = "Includes a dilapidated helm with a noble lion crest.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 150;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -2;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_ancient_lion_mask_" + variant;
		this.m.SpriteDamaged = "legendhelms_ancient_lion_mask_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ancient_lion_mask_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ancient_lion_mask_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});