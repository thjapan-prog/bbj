this.legend_helmet_full_mask <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_full_mask";
        this.m.Name = "Full Cloth Mask";
        this.m.Description = "An ominous mask of thin, tightly wrapped cloth. It helps the wearer insulate themselves from the foul stench of decay and the humors of the dead and the diseased.";
        this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ClothEquip;
        this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
        this.m.Value = 50;
        this.m.Condition = 25;
        this.m.ConditionMax = 25;
        this.m.StaminaModifier = -1;
        this.m.Vision = -1;
        this.m.HideHair = true;
        this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_full_mask_" + variant;
        this.m.SpriteDamaged = "legendhelms_full_mask_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_full_mask_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_full_mask_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});