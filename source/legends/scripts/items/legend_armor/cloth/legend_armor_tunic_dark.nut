this.legend_armor_tunic_dark <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_tunic_dark";
		this.m.Name = "Dark Tunic";
		this.m.Description = "A dark, heavy cloth tunic. Bulky, but offering additional protection.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
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
		this.m.Sprite = "tunic_dark" + "_" + variant;
		this.m.SpriteDamaged = "tunic_dark" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "tunic_dark" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_tunic_dark" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_tunic_dark" + "_" + variant + ".png";
	}
});