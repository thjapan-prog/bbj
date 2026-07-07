this.legend_armor_gambeson_named <- this.inherit("scripts/items/legend_armor/legend_cloth_named", {
	m = {},
	function create()
	{
		this.legend_cloth_named.create();
		this.m.ID = "legend_armor.body.legend_armor_gambeson_named";
		this.m.Name = "";
        this.m.NameList = ["Heraldic Gambeson", "Splendor", "Grandiosity", "Pageantry", "Swank", "Noble Gambeson", "Duty", "Honor", "Noble's Burden", "Protector", "Ward"];
		this.m.Description = "A mastercrafted heavy padded tunic that offers excellent protection.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 1500;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -7;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "gambeson_named" + "_" + variant;
		this.m.SpriteDamaged = "gambeson_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "gambeson_named" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_gambeson_named" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_gambeson_named" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(4, 6) * -1;
		this.m.Condition = this.Math.rand(75, 90);
		this.m.ConditionMax = this.m.Condition;
	}
});