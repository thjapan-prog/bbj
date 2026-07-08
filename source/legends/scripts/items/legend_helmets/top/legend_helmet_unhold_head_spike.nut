this.legend_helmet_unhold_head_spike <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_unhold_head_spike";
		this.m.Name = "Unhold Head Spike";
		this.m.Description = "The heavy spiked armor used by barbarian unholds.";
		this.m.ArmorDescription = "Includes an unhold head spike.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 800;
		this.m.Condition = 90;
		this.m.ConditionMax = 90;
		this.m.StaminaModifier = -13;
		this.m.Vision = -2;
		this.m.Lower = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_unhold_head_spike_" + variant;
		this.m.SpriteDamaged = "legendhelms_unhold_head_spike_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_unhold_head_spike_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_unhold_head_spike_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});