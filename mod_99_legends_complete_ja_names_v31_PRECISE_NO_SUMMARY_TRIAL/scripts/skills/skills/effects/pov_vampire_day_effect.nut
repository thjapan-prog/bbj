this.pov_vampire_day_effect <- this.inherit("scripts/skills/skill", {
	m = {
		//TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_vampire_day_effect";
		this.m.Name = "吸血鬼：昼";
		this.m.Description = "The Vatt\'ghern\'s vampiric nature hampers their combat ability during daytime.";
		this.m.Icon = "skills/pov_vampire_day.png";
		this.m.IconMini = "pov_mini_vampire_day";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "The Vatt\'ghern\'s vampiric nature hampers their combat ability during daytime. All combat stats reduced by [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color].";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/vision.png",
			    text = "視野が[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/ranged_skill.png",
			    text = "遠隔技量が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/ranged_defense.png",
			    text = "遠隔防御が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/melee_skill.png",
			    text = "近接技量が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/melee_defense.png",
			    text = "近接防御が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/initiative.png",
			    text = "イニシアチブが[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/bravery.png",
			    text = "意思が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			},
			{
			    id = 11,
			    type = "text",
			    icon = "ui/icons/fatigue.png",
			    text = "最大疲労度が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]低下する。"
			}

		];
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.Vision += -1;
		_properties.RangedSkillMult *= 0.9;
		_properties.RangedDefenseMult *= 0.9;
		_properties.MeleeSkillMult *= 0.9;
		_properties.MeleeDefenseMult *= 0.9;
		_properties.InitiativeMult *= 0.9;
		_properties.BraveryMult *= 0.9;
		_properties.StaminaMult *= 0.9;
	}

});
