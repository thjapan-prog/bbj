this.legend_armor_southern_gladiator_harness <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_southern_gladiator_harness";
		this.m.Name = "Gladiator Harness";
		this.m.Description = "A flashy harness commonly worn by pit fighters in arenas of the southern city states.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -4;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "southern_gladiator_harness" + "_" + variant;
		this.m.SpriteDamaged = "southern_gladiator_harness" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "southern_gladiator_harness" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_southern_gladiator_harness" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_southern_gladiator_harness" + "_" + variant + ".png";
	}
});