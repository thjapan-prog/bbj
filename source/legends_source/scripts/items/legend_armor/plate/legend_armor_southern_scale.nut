this.legend_armor_southern_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_scale";
		this.m.Name = "Heavy Southern Lamellar";
		this.m.Description = "A heavy lamellar harness of metal plates that provides good protection, but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a heavy lamellar harness of metal plates.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1500;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -26;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_scale" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_scale" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_scale" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_scale" + "_" + variant + ".png";
	}
});