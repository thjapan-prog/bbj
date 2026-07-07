// Tier IV passive (King). The crown's gravity is dread itself: enemies
// within 2 tiles of the King lose one step of morale at the start of
// every one of their turns, and any enemy that drops to Fleeing while
// the King draws breath cannot rally back to a higher state for the
// rest of the battle.
//
// This skill is a pure flag/tooltip carrier. The actual mechanics live
// in the actor hooks in mod_aurapower.nut:
//   - onTurnStart (per-enemy)     -> _aura_abyssalCrown_onEnemyTurnStart
//   - setMoraleState (rally-block) -> _aura_abyssalCrown_blockRally
this.aura_abyssal_crown <- this.inherit("scripts/skills/skill", {
	m = {
		// Radius of the dread aura, in tiles. Tunable here without touching
		// the hook side - the hook reads this off the carrier skill.
		Radius = 2
	},
	function create()
	{
		this.m.ID = "effects.aura_abyssal_crown";
		this.m.Name = "Abyssal Crown";
		this.m.Description = "The crown's gravity is dread itself. While this warrior breathes on the battlefield, every enemy within two tiles falters one step in morale at the start of their turn, and any foe broken into flight will not rally again until the battle ends.";
		this.m.Icon = "ui/aura/aura_abyssal_crown.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getTooltip()
	{
		local pos = this.Const.UI.Color.PositiveValue;
		local neg = this.Const.UI.Color.NegativeValue;
		return [
			{ id = 1, type = "title", text = this.getName() },
			{ id = 2, type = "description", text = this.getDescription() },
			{ id = 3, type = "text", icon = "ui/icons/bravery.png",
			  text = "Enemies within [color=" + pos + "]" + this.m.Radius + "[/color] tiles lose [color=" + neg + "]1 morale step[/color] at start of their turn" },
			{ id = 4, type = "text", icon = "ui/icons/bravery.png",
			  text = "Enemies in [color=" + neg + "]Fleeing[/color] can no longer rally back while the King lives" },
			{ id = 5, type = "text", icon = "ui/icons/special.png",
			  text = "Passive - always active in battle" }
		];
	}
});
