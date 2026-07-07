this.pov_rain_special <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.pov_rain";
		this.m.Name = "悪天候";
		this.m.Description = "現在の天候状況により視界が悪化し、多くの行動が困難になるが、炎に対する抵抗力が高まる。";
		this.m.Icon = "skills/pov_rain_effect.png";
		this.m.IconMini = "status_effect_35_mini";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;
		this.m.IsActive = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
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
			}
		];

		if (actor != null && actor.getCurrentProperties().IsResistantToRain == true)
		{
			ret.push({
				id = 12,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] 遠隔スキル"
			});
			ret.push({
				id = 13,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+8%[/color] 疲労コスト"
			});
		}
		else
		{
			ret.push({
				id = 11,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color] 視界"
			});
			ret.push({
				id = 12,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] 遠隔スキル"
			});
			ret.push({
				id = 13,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+15%[/color] 疲労コスト"
			});	
		}

		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/pov_fire.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] 炎耐性"
		});

		return ret;
	}

	function onUpdate( _properties )
	{
		if (this.Tactical.isActive() && this.Tactical.getWeather().IsRaining)
		{
			this.m.IsHidden = !_properties.IsAffectedByRain;
			if (_properties.IsAffectedByRain)
			{
				if (_properties.IsResistantToRain)
				{
					_properties.RangedSkillMult *= 0.90;
					_properties.FatigueEffectMult *= 1.08;
				}
				else
				{
					_properties.Vision -= 1;
					_properties.RangedSkillMult *= 0.85;
					_properties.FatigueEffectMult *= 1.15;
				}
			}
		}
		else
		{
			this.m.IsHidden = true;
		}	
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (this.Tactical.getWeather().IsRaining && _hitInfo.DamageType == this.Const.Damage.DamageType.Burning)
		{
			_properties.DamageReceivedTotalMult *= 0.75;
		}
	}

});

