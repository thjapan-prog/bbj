this.legend_helmet_hood_cloth_round <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_hood_cloth_round";
		this.m.Name = "Round Hood Cloth";
		this.m.Description = "A rounded hood designed to be worn over a helm, shielding more expensive pieces from the rain.";
		this.m.ArmorDescription = "Includes a rounded cloth hood.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 5;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_hood_cloth_round_" + variant;
		this.m.SpriteDamaged = "legendhelms_hood_cloth_round_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_hood_cloth_round_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_hood_cloth_round_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});