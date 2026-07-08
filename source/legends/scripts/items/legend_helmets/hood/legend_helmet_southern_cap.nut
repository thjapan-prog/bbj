this.legend_helmet_southern_cap <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_southern_cap";
        this.m.Name = "Southern Cap";
        this.m.Description = "A thin cap of rough fabric. Provides some reprieve from the sun.";
        this.m.Variants = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ClothEquip;
        this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
        this.m.Value = 30;
        this.m.Condition = 20;
        this.m.ConditionMax = 20;
        this.m.StaminaModifier = 0;
        this.m.Vision = 0;
        this.m.HideHair = true;
        this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_southern_cap_" + variant;
        this.m.SpriteDamaged = "legendhelms_southern_cap_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_southern_cap_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_southern_cap_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});