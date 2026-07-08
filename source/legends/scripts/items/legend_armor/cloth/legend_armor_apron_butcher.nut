this.legend_armor_apron_butcher <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_apron_butcher";
		this.m.Name = "Butcher's Apron";
		this.m.Description = "A rugged apron worn by butchers to protect against accidental cuts.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "apron_butcher" + "_" + variant;
		this.m.SpriteDamaged = "apron_butcher" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "apron_butcher" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_apron_butcher" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_apron_butcher" + "_" + variant + ".png";
	}
});