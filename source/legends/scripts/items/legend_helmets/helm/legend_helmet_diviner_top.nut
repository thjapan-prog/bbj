this.legend_helmet_diviner_top <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_diviner_top";
		this.m.Name = "Diviner's Crown";
		this.m.Description = "The crown of The Diviner. Upon placing it on your head it was as if your mind expanded out from your body.";
		this.m.ArmorDescription = "Includes the crown of The Diviner.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 5000;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -3;
		this.m.Vision = -5;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_diviner_top_" + variant;
		this.m.SpriteDamaged = "legendhelms_diviner_top_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_diviner_top_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_diviner_top_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});