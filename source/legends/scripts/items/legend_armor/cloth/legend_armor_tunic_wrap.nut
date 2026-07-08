this.legend_armor_tunic_wrap <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_tunic_wrap";
		this.m.Name = "Linen Tunic Wrap";
		this.m.Description = "A simple cloth wrapped tunic that offers limited protection.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -1;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "tunic_wrap" + "_" + variant;
		this.m.SpriteDamaged = "tunic_wrap" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "tunic_wrap" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_tunic_wrap" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_tunic_wrap" + "_" + variant + ".png";
	}
});