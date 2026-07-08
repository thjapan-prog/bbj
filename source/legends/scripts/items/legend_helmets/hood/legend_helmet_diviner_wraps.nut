this.legend_helmet_diviner_wraps <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_diviner_wraps";
        this.m.Name = "Diviner's Wraps";
        this.m.Description = "The headwear of The Diviner, despite not having any way to see through the fabric, once it sits on your face you can see through it as if it was never there at all.";
        this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ClothEquip;
        this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
        this.m.Value = 100;
        this.m.Condition = 50;
        this.m.ConditionMax = 50;
        this.m.StaminaModifier = -1;
        this.m.Vision = 0;
        this.m.HideHair = true;
        this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_diviner_wraps_" + variant;
        this.m.SpriteDamaged = "legendhelms_diviner_wraps_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_diviner_wraps_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_diviner_wraps_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});