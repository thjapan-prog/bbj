this.legend_armor_nun_wimple <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_nun_wimple";
		this.m.Name = "Nun's Wimple";
		this.m.Description = "A basic wimple of plain grey cloth that signifies a life of devotion and poverty.";
		this.m.ArmorDescription = "Includes a basic wimple of plain grey cloth.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
        this.m.ItemType = this.m.ItemType;
        this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "nun_wimple" + "_" + variant;
		this.m.SpriteDamagedBack = "nun_wimple" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "nun_wimple" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_nun_wimple" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_nun_wimple" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_nun_wimple" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_nun_wimple" + "_" + variant + ".png";
	}
});