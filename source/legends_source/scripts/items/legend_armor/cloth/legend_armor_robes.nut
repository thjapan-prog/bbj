this.legend_armor_robes <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_robes";
		this.m.Name = "Monk's Robe";
		this.m.Description = "A rugged, large robe made of simple cloth usually worn by monks and similar individuals who don't care for fashion.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "robes" + "_" + variant;
		this.m.SpriteDamaged = "robes" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "robes" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_robes" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_robes" + "_" + variant + ".png";
	}
});