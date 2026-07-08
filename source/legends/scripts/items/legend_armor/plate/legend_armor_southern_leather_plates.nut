this.legend_armor_southern_leather_plates <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_leather_plates";
		this.m.Name = "Stitched Nomad Armor";
		this.m.Description = "A leather nomad armor stitched together from various hides and scraps.";
		this.m.ArmorDescription = "Includes a stitched armor of leather hide and scraps.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 200;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -5;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_leather_plates" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_leather_plates" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_leather_plates" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_leather_plates" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_leather_plates" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_leather_plates" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_leather_plates" + "_" + variant + ".png";
	}
});