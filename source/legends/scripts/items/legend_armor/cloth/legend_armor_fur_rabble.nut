this.legend_armor_fur_rabble <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_fur_rabble";
		this.m.Name = "Fur Armor";
		this.m.Description = "Matted fur and rags, torn and filthy.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
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
		this.m.Sprite = "fur_rabble" + "_" + variant;
		this.m.SpriteDamaged = "fur_rabble" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "fur_rabble" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_fur_rabble" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_fur_rabble" + "_" + variant + ".png";
	}
});