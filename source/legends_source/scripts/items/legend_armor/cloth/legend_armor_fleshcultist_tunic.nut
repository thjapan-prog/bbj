this.legend_armor_fleshcultist_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_fleshcultist_tunic";
		this.m.Name = "Fleshcultist Tunic";
		this.m.Description = "An elaborate leather tunic.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 350;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -4;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "fleshcultist_tunic" + "_" + variant;
		this.m.SpriteDamaged = "fleshcultist_tunic" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "fleshcultist_tunic" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_fleshcultist_tunic" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_fleshcultist_tunic" + "_" + variant + ".png";
	}
});