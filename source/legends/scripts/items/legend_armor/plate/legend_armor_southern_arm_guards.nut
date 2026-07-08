this.legend_armor_southern_arm_guards <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_southern_arm_guards";
		this.m.Name = "Southern arm guards";
		this.m.Description = "A pair of leather arm guards favored by southern assassins for their lightweight design.";
		this.m.ArmorDescription = "Includes a pair of leather arm guards.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 300;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "southern_arm_guards" + "_" + variant;
		this.m.SpriteDamagedBack = "southern_arm_guards" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "southern_arm_guards" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_arm_guards" + "_" + variant + ".png";
		this.m.IconLarge = "legend_armor/inventory_southern_arm_guards" + "_" + variant + ".png";
		this.m.OverlayIcon = "legend_armor/icon_southern_arm_guards" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_arm_guards" + "_" + variant + ".png";
	}
});