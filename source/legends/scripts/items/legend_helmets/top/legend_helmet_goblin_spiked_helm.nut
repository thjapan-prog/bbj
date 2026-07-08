this.legend_helmet_goblin_spiked_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_goblin_spiked_helm";
		this.m.Name = "Spiked Goblin Helm";
		this.m.Description = "The distinctive spiked helm of a goblin overseer, designed to instill a greater fear of the master than of the enemy in the ranks below.";
		this.m.ArmorDescription = "Includes a cruel helm with several iron spikes.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
		this.m.Value = 125;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -4;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_goblin_spiked_helm_" + variant;
		this.m.SpriteDamaged = "legendhelms_goblin_spiked_helm_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_goblin_spiked_helm_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_goblin_spiked_helm_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});