this.legend_helmet_barb_open_chain <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_barb_open_chain";
        this.m.Name = "Rusted Open Chain";
        this.m.Description = "A worn chain mail head covering. The links are thick but neglected, covered in a layer of deep rust.";
        this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
        this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
        this.m.BaseInventorySound = ::Const.Sound.ArmorChainmailImpact;
        this.m.Value = 225;
        this.m.Condition = 65;
        this.m.ConditionMax = 65;
        this.m.StaminaModifier = -3;
        this.m.Vision = 0;
        this.m.HideHair = true;
        this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_barb_open_chain_" + variant;
        this.m.SpriteDamaged = "legendhelms_barb_open_chain_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_barb_open_chain_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_barb_open_chain_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});