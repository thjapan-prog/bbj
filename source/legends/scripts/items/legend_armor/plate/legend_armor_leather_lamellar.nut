this.legend_armor_leather_lamellar <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_lamellar";
		this.m.Name = "Leather Lamellar Armor";
		this.m.Description = "Numerous overlapping leather plates provide decent protection for most of the upper body.";
		this.m.ArmorDescription = "Includes armor of overlapping leather plates.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 250;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -6;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_lamellar" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_lamellar" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_lamellar" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_lamellar" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_lamellar" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_lamellar" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_lamellar" + "_" + variant + ".png";
	}
});