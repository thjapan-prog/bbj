this.legend_helmet_fleshcultist_book <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_fleshcultist_book";
		this.m.Name = "Fleshcultist Book";
		this.m.Description = "An old book strapped to the head that once belonged to a twisted flesh cultist, every page of the book is blank.";
		this.m.ArmorDescription = "Includes a book strapped to the head.";
		this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = ::Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
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
		this.m.Sprite = "legendhelms_fleshcultist_book_" + variant;
		this.m.SpriteDamaged = "legendhelms_fleshcultist_book_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_fleshcultist_book_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_fleshcultist_book_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});