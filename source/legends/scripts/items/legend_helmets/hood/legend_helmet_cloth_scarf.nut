this.legend_helmet_cloth_scarf <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_cloth_scarf";
        this.m.Name = "Cloth Scarf";
        this.m.Description = "A simple cloth wrap for the neck, favored by those who prefer to pass through unnoticed.";
        this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ClothEquip;
        this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
        this.m.Value = 10;
        this.m.Condition = 15;
        this.m.ConditionMax = 15;
        this.m.StaminaModifier = 0;
        this.m.Vision = 0;
        this.m.HideHair = false;
        this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_cloth_scarf_" + variant;
        this.m.SpriteDamaged = "legendhelms_cloth_scarf_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_cloth_scarf_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_cloth_scarf_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});