this.legend_helmet_orc_great_horns <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_orc_great_horns";
		this.m.Name = "Orc Great Horns";
		this.m.Description = "A pair of enormous horns of a massive beast, worn by the largest of orcs.";
		this.m.ArmorDescription = "Includes a pair of enormous horns.";
		this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorBoneImpact;
		this.m.InventorySound = ::Const.Sound.ArmorBoneImpact;
		this.m.Value = 20;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
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
		this.m.Sprite = "legendhelms_orc_great_horns_" + variant;
		this.m.SpriteDamaged = "legendhelms_orc_great_horns_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_orc_great_horns_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_orc_great_horns_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});