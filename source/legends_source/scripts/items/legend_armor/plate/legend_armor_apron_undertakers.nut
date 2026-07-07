this.legend_armor_apron_undertakers <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_apron_undertakers";
		this.m.Name = "Undertaker's Apron";
		this.m.Description = "A heavy leather apron designed to protect the wearer's clothing from stains and fluids. Usually worn by those who tend to the dead.";
		this.m.ArmorDescription = "Includes a heavy leather undertaker's apron.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 60;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -4;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "apron_undertakers" + "_" + variant;
		this.m.SpriteDamagedBack = "apron_undertakers" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "apron_undertakers" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_apron_undertakers" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_apron_undertakers" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_apron_undertakers" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_apron_undertakers" + "_" + variant + ".png";
	}
});