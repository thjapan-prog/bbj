this.legend_armor_vala_robe <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_armor_vala_robe";
		this.m.Name = "Vala's Cloak";
		this.m.Description = "A rugged, surprisingly light cloak ideal for a vala's journeys through the lands.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 0;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = 0;
        this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "vala_robe" + "_" + variant;
		this.m.SpriteDamaged = "vala_robe" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "vala_robe" + "_" + variant + "_dead";
		this.m.IconLarge ="legend_armor/inventory_vala_robe" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_vala_robe" + "_" + variant + ".png";
	}
});