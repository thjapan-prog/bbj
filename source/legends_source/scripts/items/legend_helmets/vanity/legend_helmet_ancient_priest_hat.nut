this.legend_helmet_ancient_priest_hat <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_ancient_priest_hat";
		this.m.Name = "Ancient Lich Crown";
		this.m.Description = "A ceremonial crown that has endured the passage of time. It still carries the authority of ancient Lich Priests.";
		this.m.ArmorDescription = "Includes an ancient ceremonial crown.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 20;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
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
		this.m.Sprite = "legendhelms_ancient_priest_hat_" + variant;
		this.m.SpriteDamaged = "legendhelms_ancient_priest_hat_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_ancient_priest_hat_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_ancient_priest_hat_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});