this.legend_helmet_southern_gladiator_helm_split <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_southern_gladiator_helm_split";
		this.m.Name = "Split Gladiator Helm";
		this.m.Description = "An impressive metal helm featuring an ornate crest and a heavy lattice faceplate, meant to intimidate the opponents of celebrated pit fighters of the southern city states.";
		this.m.ArmorDescription = "Includes a metal helm with an ornate crest and a heavy lattice faceplate.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2500;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -6;
		this.m.Vision = -3;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_southern_gladiator_helm_split_" + variant;
		this.m.SpriteDamaged = "legendhelms_southern_gladiator_helm_split_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_southern_gladiator_helm_split_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_southern_gladiator_helm_split_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});