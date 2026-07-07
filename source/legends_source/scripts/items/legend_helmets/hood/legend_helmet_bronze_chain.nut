this.legend_helmet_bronze_chain <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_bronze_chain";
        this.m.Name = "Bronze Chain";
        this.m.Description = "A hood made of interlocking bronze rings. Very heavy, but offers excellent protection.";
        this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
        this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
        this.m.BaseInventorySound = ::Const.Sound.ArmorChainmailImpact;
        this.m.Value = 600;
        this.m.Condition = 90;
        this.m.ConditionMax = 90;
        this.m.StaminaModifier = -6;
        this.m.Vision = 0;
        this.m.HideHair = false;
        this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_bronze_chain_" + variant;
        this.m.SpriteDamaged = "legendhelms_bronze_chain_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_bronze_chain_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_bronze_chain_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});