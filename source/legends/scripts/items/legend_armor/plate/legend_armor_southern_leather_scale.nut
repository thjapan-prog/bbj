this.legend_armor_southern_leather_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_leather_scale";
		this.m.Name = "Rusted Nomad Mail";
		this.m.Description = "A worn-down, light mail shirt with rusted metal plates grafted onto it.";
		this.m.ArmorDescription = "Includes a light mail shirt with rusted metal plates grafted onto it.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 300;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -10;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_leather_scale" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_leather_scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_leather_scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_leather_scale" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_leather_scale" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_leather_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_leather_scale" + "_" + variant + ".png";
	}
});