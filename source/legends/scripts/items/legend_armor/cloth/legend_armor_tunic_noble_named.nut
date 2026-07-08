this.legend_armor_tunic_noble_named <- this.inherit("scripts/items/legend_armor/legend_cloth_named", {
	m = {},
	function create()
	{
		this.legend_cloth_named.create();
		this.m.ID = "legend_armor.body.legend_armor_tunic_noble_named";
		this.m.Name = "";
        this.m.NameList = ["Heraldic Tunic", "Splendor", "Grandiosity", "Pageantry", "Swank", "Duty", "Honor", "Noble"];
		this.m.Description = "A fine, linen tunic of exquisite material, embroidered with pleasing patterns. Light and sturdy.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 1500;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "tunic_noble_named" + "_" + variant;
		this.m.SpriteDamaged = "tunic_noble_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "tunic_noble_named" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_tunic_noble_named" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_tunic_noble_named" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(0, 2) * -1;
		this.m.Condition = this.Math.rand(46, 56);
		this.m.ConditionMax = this.m.Condition;
	}
});