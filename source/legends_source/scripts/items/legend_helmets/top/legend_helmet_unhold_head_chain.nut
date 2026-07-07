this.legend_helmet_unhold_head_chain <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_unhold_head_chain";
		this.m.Name = "Unhold Head Chain";
		this.m.Description = "The chain used by barbarian beastmasters for controlling unholds.";
		this.m.ArmorDescription = "Includes an unhold head chain.";
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 240;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -7;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_unhold_head_chain_" + variant;
		this.m.SpriteDamaged = "legendhelms_unhold_head_chain_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_unhold_head_chain_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_unhold_head_chain_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});