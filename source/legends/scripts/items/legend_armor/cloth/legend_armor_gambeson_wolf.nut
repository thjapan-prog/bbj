this.legend_armor_gambeson_wolf <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_gambeson_wolf";
		this.m.Name = "Wolf Gambeson";
		this.m.Description = "A heavy tunic lined with a thick wolf pelt that offers decent protection.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 300;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -9;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "gambeson_wolf" + "_" + variant;
		this.m.SpriteDamaged = "gambeson_wolf" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "gambeson_wolf" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_gambeson_wolf" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_gambeson_wolf" + "_" + variant + ".png";
	}
});