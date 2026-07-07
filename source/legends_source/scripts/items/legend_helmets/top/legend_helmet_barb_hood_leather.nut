this.legend_helmet_barb_hood_leather <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_barb_hood_leather";
		this.m.Name = "Barbarian Leather Hood";
		this.m.Description = "The crude padded leather hood of a barbarian, it is heavy and surprisingly protective. Counts as a cultist item.";
		this.m.ArmorDescription = "Includes a crude leather hood.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 300;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -4;
		this.m.Vision = -2;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_barb_hood_leather_" + variant;
		this.m.SpriteDamaged = "legendhelms_barb_hood_leather_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_barb_hood_leather_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_barb_hood_leather_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});