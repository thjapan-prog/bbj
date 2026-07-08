this.legend_helmet_ram_horns <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_ram_horns";
		this.m.Name = "Ram Horns";
		this.m.Description = "A pair of curled horns of a wild beast, used as a sign of competency in northern tribes.";
		this.m.ArmorDescription = "Includes a pair of curled horns.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorBoneImpact;
		this.m.InventorySound = ::Const.Sound.ArmorBoneImpact;
		this.m.Value = 50;
		this.m.Condition = 6;
		this.m.ConditionMax = 6;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_ram_horns_" + variant;
		this.m.SpriteDamaged = "legendhelms_ram_horns_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ram_horns_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ram_horns_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});