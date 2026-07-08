this.legend_armor_thick_plated_barbarian_armor_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_thick_plated_barbarian_armor_named";
		this.m.Name = "";
        this.m.NameList = ["Tarnished Harness", "Alloy Plate Armor", "Tainted Bulwark", "Tribal Plate"];
		this.m.Description = "This armor is composed of a strange alloy, and well crafted for barbarian standards. A truly rare and remarkable piece.";
		this.m.ArmorDescription = "Includes a heavy armor composed of a strange alloy, and well crafted for barbarian standards. A truly rare and remarkable piece.";
		this.m.Variants = [103];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 5500;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -26;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_body" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_body" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body" + "_" + variant + "_dead";
		this.m.Icon = "armor/icon_body_armor" + "_" + variant + ".png";
		this.m.IconLarge = "armor/inventory_body_armor" + "_" + variant + ".png";
		this.m.OverlayIcon = "armor/icon_body_armor" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "armor/inventory_body_armor" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(23, 26) * -1;
		this.m.Condition = this.Math.rand(155, 175);
		this.m.ConditionMax = this.m.Condition;
	}
});