this.legend_armor_apron <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_apron";
		this.m.Name = "Blacksmith Apron";
		this.m.Description = "A heavy leather apron of withstanding intense heat and stray sparks. Favored by blacksmiths.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 60;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -4;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "apron" + "_" + variant;
		this.m.SpriteDamaged = "apron" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "apron" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_apron" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_apron" + "_" + variant + ".png";
	}
});