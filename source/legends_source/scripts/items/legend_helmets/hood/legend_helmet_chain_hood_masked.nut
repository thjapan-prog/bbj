this.legend_helmet_chain_hood_masked <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
    m = {},
    function create()
    {
        this.legend_helmet.create();
        this.m.ID = "armor.head.legend_helmet_chain_hood_masked";
        this.m.Name = "Masked Chain Mail Hood";
        this.m.Description = "A hood made of chain mail with a leather brim and a cloth mask. Keeps the wearer's face obstructed while being surprisingly comfortable to wear.";
        this.m.Variants = [1, 2, 3];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
        this.updateVariant();
        this.m.ImpactSound = ::Const.Sound.ArmorChainmailImpact;
        this.m.InventorySound = ::Const.Sound.ArmorChainmailImpact;
        this.m.BaseInventorySound = ::Const.Sound.ArmorChainmailImpact;
        this.m.Value = 400;
        this.m.Condition = 80;
        this.m.ConditionMax = 80;
        this.m.StaminaModifier = -3;
        this.m.Vision = -1;
        this.m.HideHair = true;
        this.m.HideBeard = false;
        this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
    }

    function updateVariant()
    {
        local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
        this.m.Sprite = "legendhelms_chain_hood_masked_" + variant;
        this.m.SpriteDamaged = "legendhelms_chain_hood_masked_" + variant + "_damaged";
        this.m.SpriteCorpse = "legendhelms_chain_hood_masked_" + variant + "_dead";
        this.m.Icon = "legend_helmets/inventory_chain_hood_masked_" + variant + ".png";
        this.m.IconLarge = this.m.Icon;
    }
});