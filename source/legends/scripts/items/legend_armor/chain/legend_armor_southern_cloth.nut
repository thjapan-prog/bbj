this.legend_armor_southern_cloth <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_southern_cloth";
		this.m.Name = "Nomad Outer Robe";
		this.m.Description = "A durable cloth robe designed to shield the wearer from the sun's heat and the sting of minor cuts.";
		this.m.ArmorDescription = "Includes a heavy nomad robe.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_cloth" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_cloth" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_cloth" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_cloth" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_cloth" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_cloth" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_cloth" + "_" + variant + ".png";
	}
});