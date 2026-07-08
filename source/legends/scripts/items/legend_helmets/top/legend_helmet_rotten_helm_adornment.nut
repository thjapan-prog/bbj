this.legend_helmet_rotten_helm_adornment <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_rotten_helm_adornment";
		this.m.Name = "Tarnished Helm Adornment";
		this.m.Description = "Ancient decayed relics of adornment from the helm of a long dead questing knight.";
		this.m.ArmorDescription = "Includes a set of decayed relics of adornment.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
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
		this.m.Sprite = "legendhelms_rotten_helm_adornment_" + variant;
		this.m.SpriteDamaged = "legendhelms_rotten_helm_adornment_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rotten_helm_adornment_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rotten_helm_adornment_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});