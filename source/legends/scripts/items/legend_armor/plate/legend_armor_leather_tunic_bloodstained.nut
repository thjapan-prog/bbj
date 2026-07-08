this.legend_armor_leather_tunic_bloodstained <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_tunic_bloodstained";
		this.m.Name = "Bloodstained Tunic";
		this.m.Description = "A leather tunic caked and crusted with dried remnants of past executions.";
		this.m.ArmorDescription = "Includes a bloodstained leather tunic.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 20;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_tunic_bloodstained" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_tunic_bloodstained" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_tunic_bloodstained" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_tunic_bloodstained" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_tunic_bloodstained" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_tunic_bloodstained" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_tunic_bloodstained" + "_" + variant + ".png";
	}
});