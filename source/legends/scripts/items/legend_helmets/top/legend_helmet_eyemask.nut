this.legend_helmet_eyemask <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_eyemask";
		this.m.Name = "Eye Mask";
		this.m.Description = "A metal mask covering the eyes and nose from blows.";
		this.m.ArmorDescription = "Includes a metal eye mask.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 125;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = 0;
		this.m.Vision = -1;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_eyemask_" + variant;
		this.m.SpriteDamaged = "legendhelms_eyemask_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_eyemask_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_eyemask_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});