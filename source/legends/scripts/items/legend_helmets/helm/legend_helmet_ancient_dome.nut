this.legend_helmet_ancient_dome <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_ancient_dome";
		this.m.Name = "Ancient Dome";
		this.m.Description = "A dome helm with heavy riveted bands that has once been in possession of an ancient household guard.";
		this.m.ArmorDescription = "Includes an ancient dome helm.";
		this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 200;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -6;
		this.m.Vision = -1;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_ancient_dome_" + variant;
		this.m.SpriteDamaged = "legendhelms_ancient_dome_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ancient_dome_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ancient_dome_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});