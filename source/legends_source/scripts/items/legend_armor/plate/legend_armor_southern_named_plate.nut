this.legend_armor_southern_named_plate <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_named_plate";
		this.m.Name = "";
        this.m.NameList = ["Gilder's Shining Ward", "Gilder's Skin", "Suncloak", "Snakeskin", "Blazing Mail", "Suntouched Harness", "Shining Hauberk", "Armor of the Scorpion King"];
		this.m.Description = "Ancient knowledge has been used when forging this unique set of armor. Its light mail overlapped with golden splints offers high protection with manageable encumbrance.";
		this.m.ArmorDescription = "Includes light mail overlapped with golden splints offering high protection with manageable encumbrance.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 9000;
		this.m.Condition = 210;
		this.m.ConditionMax = 210;
		this.m.StaminaModifier = -25;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_named_plate" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_named_plate" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_named_plate" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_named_plate" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_named_plate" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_named_plate" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_named_plate" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(23, 26) * -1;
		this.m.Condition = this.Math.rand(210, 230);
		this.m.ConditionMax = this.m.Condition;
	}
});