this.legend_armor_leather_brigandine_named <- this.inherit("scripts/items/legend_armor/legend_named_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_brigandine_named";
		this.m.Name = "";
        this.m.NameList = ["Harness", "Ward", "Defense", "Barrier", "Studded Vest", "Lifesaver", "Skin", "Peel", "Guard", "Tarnished Harness", "Duty", "Honor"];
		this.m.Description = "A rare thick leather brigandine studded with steel rivets for added protection. A piece of true craftsmanship!";
		this.m.ArmorDescription = "Includes a masterwork reinforced leather brigandine.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 2500;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -6;
        this.m.ItemType = this.m.ItemType;
        this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "leather_brigandine_named" + "_" + variant;
		this.m.SpriteDamagedBack = "leather_brigandine_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "leather_brigandine_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_leather_brigandine_named" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_leather_brigandine_named" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_leather_brigandine_named" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_leather_brigandine_named" + "_" + variant + ".png";
	}

	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(5, 7) * -1;
		this.m.Condition = this.Math.rand(80, 100);
		this.m.ConditionMax = this.m.Condition;
	}
});