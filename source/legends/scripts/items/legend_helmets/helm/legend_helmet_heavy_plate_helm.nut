this.legend_helmet_heavy_plate_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_heavy_plate_helm";
		this.m.Name = "Heavy Plate Helm";
		this.m.Description = "This heavy helm usually is worn as a sign of high standing and reputation within barbarian warbands.";
		this.m.ArmorDescription = "Includes a heavy plate helm.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1200;
		this.m.Condition = 175;
		this.m.ConditionMax = 175;
		this.m.StaminaModifier = -15;
		this.m.Vision = -2;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_heavy_plate_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_heavy_plate_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_heavy_plate_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_heavy_plate_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});