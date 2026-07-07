this.legend_helmet_leather_cap <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_leather_cap";
        this.m.Name = "Leather Cap";
        this.m.Description = "A sturdy leather cap that fits tightly over the head. It offers basic coverage but leaves the ears and neck exposed.";
        this.m.Variants = [1, 2, 3, 4];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
        this.m.BaseInventorySound = ::Const.Sound.ArmorLeatherImpact;
        this.m.Value = 75;
        this.m.Condition = 35;
        this.m.ConditionMax = 35;
        this.m.StaminaModifier = -1;
        this.m.Vision = 0;
        this.m.HideHair = true;
        this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_leather_cap_" + variant;
        this.m.SpriteDamaged = "legendhelms_leather_cap_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_leather_cap_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_leather_cap_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});