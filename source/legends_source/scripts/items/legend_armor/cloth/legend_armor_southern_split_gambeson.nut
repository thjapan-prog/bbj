this.legend_armor_southern_split_gambeson <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_split_gambeson";
		this.m.Name = "Southern Split Gambeson";
		this.m.Description = "A long, sturdy tunic of southern origin that is split at the bottom.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -8;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "southern_split_gambeson" + "_" + variant;
		this.m.SpriteDamaged = "southern_split_gambeson" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "southern_split_gambeson" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_southern_split_gambeson" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_southern_split_gambeson" + "_" + variant + ".png";
	}
});