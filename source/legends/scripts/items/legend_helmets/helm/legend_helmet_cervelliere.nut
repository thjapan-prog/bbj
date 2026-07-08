this.legend_helmet_cervelliere <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_cervelliere";
		this.m.Name = "Reinforced Cervelliere";
		this.m.Description = "A heavy steel helm with added bolted cheek guards that offers extensive coverage for the jaw and the temples.";
		this.m.ArmorDescription = "Includes a steel cervelliere with bolted cheek guards.";
		this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1500;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -7;
		this.m.Vision = -1;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_cervelliere_" + variant;
		this.m.SpriteDamaged = "legendhelms_cervelliere_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_cervelliere_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_cervelliere_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});