this.legend_helmet_faction_helmet_2 <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_faction_helmet_2";
		this.m.Name = "Zweihander's Hat";
		this.m.Description = "A slumped, feathered hat favoured by noble swordsman who value a dashing appearance as much as a sharp blade.";
		this.m.ArmorDescription = "Includes a feathered hat.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
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
		this.m.Sprite = "legendhelms_faction_helmet_2_" + variant;
		this.m.SpriteDamaged = "legendhelms_faction_helmet_2_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faction_helmet_2_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_faction_helmet_2_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});