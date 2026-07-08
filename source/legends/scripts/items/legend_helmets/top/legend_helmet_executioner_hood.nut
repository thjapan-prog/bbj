this.legend_helmet_executioner_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_executioner_hood";
		this.m.Name = "Executioner's Cowl";
		this.m.Description = "A heavy, deep cowl designed to hide the identity of the executioner from the vengeance of those sympathetic to the condemned. Counts as a cultist item.";
		this.m.ArmorDescription = "Includes a heavy cloth hood.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_executioner_hood_" + variant;
		this.m.SpriteDamaged = "legendhelms_executioner_hood_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_executioner_hood_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_executioner_hood_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});