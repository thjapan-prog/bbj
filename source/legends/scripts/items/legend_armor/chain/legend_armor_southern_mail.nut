this.legend_armor_southern_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_southern_mail";
		this.m.Name = "Southern Mail";
		this.m.Description = "A long and heavy mail shirt of southern design made with slightly thinner and lighter metal rings than those used in the north";
		this.m.ArmorDescription = "Includes a long and heavy mail shirt.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1400;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -13;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_mail" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_mail" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_mail" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_mail" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_mail" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_mail" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_mail" + "_" + variant + ".png";
	}
});