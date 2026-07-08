this.legend_armor_studded_aketon <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_studded_aketon";
		this.m.Name = "Studded Aketon";
		this.m.Description = "A long, sturdy coat reinforced with metal studs that offers good protection.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 350;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -9;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "studded_aketon" + "_" + variant;
		this.m.SpriteDamaged = "studded_aketon" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "studded_aketon" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_studded_aketon" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_studded_aketon" + "_" + variant + ".png";
	}
});