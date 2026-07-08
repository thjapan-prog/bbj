this.legend_armor_robes_nun <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_robes_nun";
		this.m.Name = "Nun's Robe";
		this.m.Description = "A rugged, large robe made of simple cloth. Usually worn by young nuns.";
		this.m.Variants = [1, 2];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 22;
		this.m.ConditionMax = 22;
		this.m.StaminaModifier = -1;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "robes_nun" + "_" + variant;
		this.m.SpriteDamaged = "robes_nun" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "robes_nun" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_robes_nun" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_robes_nun" + "_" + variant + ".png";
	}
});