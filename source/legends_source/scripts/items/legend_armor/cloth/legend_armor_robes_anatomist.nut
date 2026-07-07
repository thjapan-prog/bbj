this.legend_armor_robes_anatomist <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_robes_anatomist";
		this.m.Name = "Anatomist's Robe";
		this.m.Description = "A dark robe and gloves worn by those who tinker with flesh and filth.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 350;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -7;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "robes_anatomist" + "_" + variant;
		this.m.SpriteDamaged = "robes_anatomist" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "robes_anatomist" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_robes_anatomist" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_robes_anatomist" + "_" + variant + ".png";
	}
});