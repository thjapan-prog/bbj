this.legend_armor_cult_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_cult_armor";
		this.m.Name = "Cultist Leather Armor";
		this.m.Description = "Dark, heavy leather armor adorned with occult symbols. It offers sturdy protection and was likely used in grim rituals.";
		this.m.ArmorDescription = "Includes leather armor adorned with occult symbols.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 250;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -7;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "cult_armor" + "_" + variant;
		this.m.SpriteDamagedBack = "cult_armor" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "cult_armor" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cult_armor" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_cult_armor" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_cult_armor" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cult_armor" + "_" + variant + ".png";
	}
});