this.legend_armor_rotten_plate_chest <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_rotten_plate_chest";
		this.m.Name = "Decayed Breastplate Armor";
		this.m.Description = "A worn breastplate of decaying, plated steel. Long years of neglect have left the metal pitted and brittle, offering only some of its former protection.";
		this.m.ArmorDescription = "Includes a worn breastplate of decaying, plated steel.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1250;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -16;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "rotten_plate_chest" + "_" + variant;
		this.m.SpriteDamagedBack = "rotten_plate_chest" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "rotten_plate_chest" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_rotten_plate_chest" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_rotten_plate_chest" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_rotten_plate_chest" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_rotten_plate_chest" + "_" + variant + ".png";
	}
});