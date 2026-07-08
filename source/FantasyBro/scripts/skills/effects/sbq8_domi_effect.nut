this.sbq8_domi_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.sbq8_domi_effect";
		this.m.Name = "Entrapped";
		this.m.Description = "Reduces damage dealt by 30% and increases damage received by 30%.";
		this.m.Icon = "skills/status_effect_52.png";
		this.m.IconMini = "status_effect_52_mini";
		this.m.Overlay = "status_effect_52";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsSerialized = false;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult += 0.3;
		_properties.DamageTotalMult *= 0.7;
	}

});

