this.legend_helmet_nose_plate <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_nose_plate";
		this.m.Name = "Nose Plate";
		this.m.Description = "A strip of metal tied on with a leather band, used for protecting the face from frontal blows.";
		this.m.ArmorDescription = "Includes a nose plate.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 60;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_nose_plate_" + variant;
		this.m.SpriteDamaged = "legendhelms_nose_plate_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_nose_plate_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_nose_plate_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});