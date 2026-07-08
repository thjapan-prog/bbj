this.legend_armor_diviner_jacket <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_diviner_jacket";
		this.m.Name = "Diviner's Jacket";
        this.m.NameList = ["Heretic's Wrap", "Beholder's vestments", "Jacket of the Augur", "Empyrian Coat", "Attestor's Skin", "Goreflesh Mantle"];
		this.m.Description = "An embellished jacket previously worn by the Diviner. You'd expect the stench of rotting flesh to cling to it, but it remains pristine.";
		this.m.ArmorDescription = "Includes an embellished jacket.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 3000;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -3;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "diviner_jacket" + "_" + variant;
		this.m.SpriteDamagedBack = "diviner_jacket" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "diviner_jacket" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_diviner_jacket" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_diviner_jacket" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_diviner_jacket" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_diviner_jacket" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(2, 4) * -1;
		this.m.Condition = this.Math.rand(35, 60);
		this.m.ConditionMax = this.m.Condition;
	}
});