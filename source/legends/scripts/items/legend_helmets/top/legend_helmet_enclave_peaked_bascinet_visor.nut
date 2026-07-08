this.legend_helmet_enclave_peaked_bascinet_visor <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_enclave_peaked_bascinet_visor";
		this.m.Name = "Peaked Bascinet Visor";
		this.m.Description = "A reinforced iron faceplate featuring a sharp peak and a perforated breath made for specifically the peaked bascinet.";
		this.m.ArmorDescription = "Includes a reinforced iron faceplate with a sharp peak.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 900;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -6;
		this.m.Vision = -1;
		this.m.Lower = true;
		this.m.HideHair = false;
		this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_enclave_peaked_bascinet_visor_" + variant;
		this.m.SpriteDamaged = "legendhelms_enclave_peaked_bascinet_visor_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_enclave_peaked_bascinet_visor_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_enclave_peaked_bascinet_visor_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});