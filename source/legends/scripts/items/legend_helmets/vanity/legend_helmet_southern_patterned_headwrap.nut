this.legend_helmet_southern_patterned_headwrap <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_southern_patterned_headwrap";
		this.m.Name = "Patterned Head Wrap";
		this.m.Description = "A patterned cloth head wrap made by southern tailors.";
		this.m.ArmorDescription = "Includes a patterned cloth head wrap.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 20;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
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
		this.m.Sprite = "legendhelms_southern_patterned_headwrap_" + variant;
		this.m.SpriteDamaged = "legendhelms_southern_patterned_headwrap_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_southern_patterned_headwrap_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_southern_patterned_headwrap_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});