this.legend_helmet_chain_attachment <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_chain_attachment";
		this.m.Name = "Chain Attachment";
		this.m.Description = "A curtain of mail designed to be hanged over the mouth.";
		this.m.ArmorDescription = "Includes a mail mouth protector.";
		this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
		this.m.Value = 250;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_chain_attachment_" + variant;
		this.m.SpriteDamaged = "legendhelms_chain_attachment_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_chain_attachment_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_chain_attachment_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});