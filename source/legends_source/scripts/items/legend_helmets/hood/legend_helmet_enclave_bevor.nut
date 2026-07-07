this.legend_helmet_enclave_bevor <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_enclave_bevor";
        this.m.Name = "Bevor";
        this.m.Description = "A rigid plate of shaped steel designed to guard the neck and the lower face.";
        this.m.Variants = [1, 2, 3, 4, 5, 6];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorHalfplateImpact;
        this.m.InventorySound = ::Const.Sound.ArmorHalfplateImpact;
        this.m.BaseInventorySound = ::Const.Sound.ArmorHalfplateImpact;
        this.m.Value = 750;
        this.m.Condition = 95;
        this.m.ConditionMax = 95;
        this.m.StaminaModifier = -7;
        this.m.Vision = 0;
        this.m.HideHair = false;
        this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_enclave_bevor_" + variant;
        this.m.SpriteDamaged = "legendhelms_enclave_bevor_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_enclave_bevor_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_enclave_bevor_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});