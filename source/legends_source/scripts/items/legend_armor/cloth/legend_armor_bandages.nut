this.legend_armor_bandages <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_bandages";
		this.m.Name = "Bandages";
		this.m.Description = "Normally used for dressing wounds rather than preventing new ones.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 1;
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
		this.m.Sprite = "bandages" + "_" + variant;
		this.m.SpriteDamaged = "bandages" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bandages" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_bandages" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_bandages" + "_" + variant + ".png";
	}
});