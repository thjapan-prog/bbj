this.legend_armor_robes_wizard <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_robes_wizard";
		this.m.Name = "Beautiful Robe";
		this.m.Description = "A soft, wide robe worn by practitioners of the arcane arts.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "robes_wizard" + "_" + variant;
		this.m.SpriteDamaged = "robes_wizard" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "robes_wizard" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_robes_wizard" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_robes_wizard" + "_" + variant + ".png";
	}
});