this.legend_helmet_enclave_peaked_bascinet <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_enclave_peaked_bascinet";
		this.m.Name = "Peaked Bascinet";
		this.m.Description = "An imposing steel helm that extends into a flared gorget to protect the throat.";
		this.m.ArmorDescription = "Includes a peaked bascinet with a gorget.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2800;
		this.m.Condition = 180;
		this.m.ConditionMax = 180;
		this.m.StaminaModifier = -13;
		this.m.Vision = -2;
		this.m.Lower = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_enclave_peaked_bascinet_" + variant;
		this.m.SpriteDamaged = "legendhelms_enclave_peaked_bascinet_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_enclave_peaked_bascinet_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_enclave_peaked_bascinet_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});