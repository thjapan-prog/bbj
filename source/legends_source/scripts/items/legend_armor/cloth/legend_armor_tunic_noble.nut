this.legend_armor_tunic_noble <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_tunic_noble";
		this.m.Name = "Noble Tunic";
		this.m.Description = "A thin, linen tunic of exquisite material, embroidered with pleasing patterns. Fashionable, but offering little protection.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "tunic_noble" + "_" + variant;
		this.m.SpriteDamaged = "tunic_noble" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "tunic_noble" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_tunic_noble" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_tunic_noble" + "_" + variant + ".png";
	}
});