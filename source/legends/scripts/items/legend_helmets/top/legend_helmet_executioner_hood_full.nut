this.legend_helmet_executioner_hood_full <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_executioner_hood_full";
		this.m.Name = "Executioner's Hood";
		this.m.Description = "A hood worn by executioners to protect their identity and prevent retaliation. Counts as a cultist item.";
		this.m.ArmorDescription = "Includes a tall leather hood.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 120;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -1;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_executioner_hood_full_" + variant;
		this.m.SpriteDamaged = "legendhelms_executioner_hood_full_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_executioner_hood_full_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_executioner_hood_full_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});