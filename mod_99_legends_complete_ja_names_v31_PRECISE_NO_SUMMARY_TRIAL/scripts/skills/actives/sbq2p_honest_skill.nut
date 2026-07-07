this.sbq2p_honest_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbq2p_honest_skill";
		this.m.Name = "109. 正直な攻撃者";
		this.m.Icon = "ui/xxp30.png";
		this.m.Description = "ダメージ+30%増加。頭部への攻撃確率が0%に減少する。";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 100;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
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
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult += 0.3;
		_properties.HitChance[this.Const.BodyPart.Head] *= 0;
	}

});

