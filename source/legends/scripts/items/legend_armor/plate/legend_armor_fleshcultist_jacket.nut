this.legend_armor_fleshcultist_jacket <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_fleshcultist_jacket";
		this.m.Name = "Faultfinder Jacket";
		this.m.Description = "A heavy linen jacket worn by fault finders.";
		this.m.ArmorDescription = "Includes a heavy linen jacket worn by fault finders.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 350;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "fleshcultist_jacket" + "_" + variant;
		this.m.SpriteDamagedBack = "fleshcultist_jacket" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "fleshcultist_jacket" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_fleshcultist_jacket" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_fleshcultist_jacket" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_fleshcultist_jacket" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_fleshcultist_jacket" + "_" + variant + ".png";
	}
});