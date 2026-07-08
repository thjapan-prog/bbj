this.legend_helmet_rotten_faction_helmet <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_rotten_faction_helmet";
		this.m.Name = "Decayed Faction Helm Ornament";
		this.m.Description = "A crested ornament of a noble house tarnished by time and rot, a grim reminder that even the highborn are not exempt from the common fate of all mortals.";
		this.m.ArmorDescription = "Includes a decayed crested ornament of a noble house.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.Lower = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rotten_faction_helmet_" + variant;
		this.m.SpriteDamaged = "legendhelms_rotten_faction_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rotten_faction_helmet_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rotten_faction_helmet_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});