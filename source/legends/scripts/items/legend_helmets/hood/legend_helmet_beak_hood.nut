this.legend_helmet_beak_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_beak_hood";
        this.m.Name = "Beaked Hood";
        this.m.Description = "A thick leather hood with a distinctive, bird-like mask. The beak acts as a ventilator, containing sweet-smelling herbs to ward away sickness and disease. Counts as a cultist item.";
        this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ArmorLeatherImpact;
        this.m.BaseInventorySound = ::Const.Sound.ArmorLeatherImpact;
        this.m.Value = 150;
        this.m.Condition = 65;
        this.m.ConditionMax = 65;
        this.m.StaminaModifier = -3;
        this.m.Vision = -1;
        this.m.HideHair = true;
        this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_beak_hood_" + variant;
        this.m.SpriteDamaged = "legendhelms_beak_hood_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_beak_hood_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_beak_hood_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});