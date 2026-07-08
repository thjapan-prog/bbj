this.legend_helmet_southern_headband_coin <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_southern_headband_coin";
        this.m.Name = "Southern Coin Headband";
        this.m.Description = "A thin headband decorated with small jingling coins. Typically worn by entertainers, designed to catch the light and the ear of onlookers.";
        this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ClothEquip;
        this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
        this.m.Value = 20;
        this.m.Condition = 5;
        this.m.ConditionMax = 5;
        this.m.StaminaModifier = 0;
        this.m.Vision = 0;
        this.m.HideHair = false;
        this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_southern_headband_coin_" + variant;
        this.m.SpriteDamaged = "legendhelms_southern_headband_coin_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_southern_headband_coin_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_southern_headband_coin_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});