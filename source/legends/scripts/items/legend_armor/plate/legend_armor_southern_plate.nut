this.legend_armor_southern_plate <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_plate";
		this.m.Name = "Mail with Lamellar Plating";
		this.m.Description = "A heavy shirt of interlapping metal plates worn over mail.";
		this.m.ArmorDescription = "Includes a heavy shirt of interlapping metal plates.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 750;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -8;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_plate" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_plate" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_plate" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_plate" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_plate" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_plate" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_plate" + "_" + variant + ".png";
	}
});