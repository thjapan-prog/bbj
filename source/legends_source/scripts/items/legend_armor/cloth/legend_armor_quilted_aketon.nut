this.legend_armor_quilted_aketon <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_quilted_aketon";
		this.m.Name = "Quilted Aketon";
		this.m.Description = "A sturdy, quilted coat that offers decent protection.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -6;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "quilted_aketon" + "_" + variant;
		this.m.SpriteDamaged = "quilted_aketon" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "quilted_aketon" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_quilted_aketon" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_quilted_aketon" + "_" + variant + ".png";
	}
});