this.legend_helmet_orc_tail <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_orc_tail";
		this.m.Name = "Orc Tail";
		this.m.Description = "A thick tail of hair decorated with bone pieces. A symbol of status among the orcs.";
		this.m.ArmorDescription = "Includes a thick tail of hair.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 20;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_orc_tail_" + variant;
		this.m.SpriteDamaged = "legendhelms_orc_tail_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_orc_tail_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_orc_tail_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});