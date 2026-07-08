this.legend_armor_southern_padded_chest <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_southern_padded_chest";
		this.m.Name = "Padded Vest";
		this.m.Description = "A thick cloth vest padded with dense wool to protect against blunt hits.";
		this.m.ArmorDescription = "Includes a thick cloth vest.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 325;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -4;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_padded_chest" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_padded_chest" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_padded_chest" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_padded_chest" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_padded_chest" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_padded_chest" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_padded_chest" + "_" + variant + ".png";
	}
});