this.legend_helmet_southern_helmet_nasal <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_southern_helmet_nasal";
		this.m.Name = "Heavy Lamellar Helm";
		this.m.Description = "A heavy helm made from overlapping metal plates, featuring an ornate nasal guard.";
		this.m.ArmorDescription = "Includes a heavy lamellar helm.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1000;
		this.m.Condition = 125;
		this.m.ConditionMax = 125;
		this.m.StaminaModifier = -7;
		this.m.Vision = -2;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_southern_helmet_nasal_" + variant;
		this.m.SpriteDamaged = "legendhelms_southern_helmet_nasal_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_southern_helmet_nasal_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_southern_helmet_nasal_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});