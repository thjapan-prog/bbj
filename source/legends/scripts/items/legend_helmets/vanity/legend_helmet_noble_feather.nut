this.legend_helmet_noble_feather <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_noble_feather";
		this.m.Name = "Noble Feather";
		this.m.Description = "A cluster of rich, decorative feathers worn by nobles in their headwear.";
		this.m.ArmorDescription = "Includes cluster a rich feathers.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 10;
		this.m.Condition = 2;
		this.m.ConditionMax = 2;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_noble_feather_" + variant;
		this.m.SpriteDamaged = "legendhelms_noble_feather_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_noble_feather_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_noble_feather_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});