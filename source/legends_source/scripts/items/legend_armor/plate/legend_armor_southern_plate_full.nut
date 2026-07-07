this.legend_armor_southern_plate_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_plate_full";
		this.m.Name = "Southern Long Mail Coat with Padding";
		this.m.Description = "A padded, heavy coat of overlapping metal plates that provides extensive protection for the torso.";
		this.m.ArmorDescription = "Includes a padded, heavy coat of overlapping metal plates.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1500;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -26;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_plate_full" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_plate_full" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_plate_full" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_plate_full" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_plate_full" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_plate_full" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_plate_full" + "_" + variant + ".png";
	}
});