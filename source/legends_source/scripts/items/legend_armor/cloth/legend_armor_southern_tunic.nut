this.legend_armor_southern_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_tunic";
		this.m.Name = "Southern Tunic";
		this.m.Description = "A light and well made checkered tunic of southern origin.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -1;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "southern_tunic" + "_" + variant;
		this.m.SpriteDamaged = "southern_tunic" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "southern_tunic" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_southern_tunic" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_southern_tunic" + "_" + variant + ".png";
	}
});