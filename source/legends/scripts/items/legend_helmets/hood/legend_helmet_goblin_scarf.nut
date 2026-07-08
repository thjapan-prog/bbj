this.legend_helmet_goblin_scarf <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_goblin_scarf";
        this.m.Name = "Goblin Scarf";
        this.m.Description = "A tattered, foul-smelling scrap of cloth that offers little more than a bit of warmth.";
        this.m.Variants = [1, 2, 3, 4, 5];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorLeatherImpact;
        this.m.InventorySound = ::Const.Sound.ClothEquip;
        this.m.BaseInventorySound = ::Const.Sound.ClothEquip;
        this.m.Value = 5;
        this.m.Condition = 5;
        this.m.ConditionMax = 5;
        this.m.StaminaModifier = 0;
        this.m.Vision = 0;
        this.m.HideHair = false;
        this.m.HideBeard = true;
        this.m.ItemType = this.m.ItemType;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_goblin_scarf_" + variant;
        this.m.SpriteDamaged = "legendhelms_goblin_scarf_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_goblin_scarf_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_goblin_scarf_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});