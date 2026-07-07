this.sbp_bondage_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_bondage_skill";
		this.m.Name = "84. マナ熟達";
		this.m.Icon = "ui/xxp26.png";
		this.m.Description = "両手が空の状態で特定スキルのダメージが強化される。現在の意思が高いほど効果が大きい。";
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
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "対象スキル：21.電撃、23.ファイアボール、25.炎の波、27.大自然の力、29.凍結爆破、30.疾風怒濤、40.雷嵐、50.浄化の炎、53.岩投げ、115.根こそぎ。"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "スキルブックで習得できるスキルの最大数が3になる。"
		});
		return ret;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local a = _skill.getID();
		if (a == "actives.sb_electric_skill" || a == "actives.sb_fireball_skill" || a == "actives.sb_flamewave_skill" || a == "actives.sb_fonature_skill" ||
		a == "actives.sb_frostblast_skill" || a == "actives.sb_gale_skill" || a == "actives.sb_manaforce_skill" || a == "actives.sb_puri_skill" ||
		a == "actives.sb_rock_skill" || a == "actives.sb_uproot_skill")
		{
			local actor = this.getContainer().getActor();
			local mainh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			local offh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			local rr = actor.getCurrentProperties().getBravery() * 0.008;
			if (rr > 2)
			{
				rr = 2;
			}
			if (mainh == null && offh == null && rr > 0)
			{
				if (a == "actives.sb_manaforce_skill")
				{
					_properties.RangedDamageMult += rr / 2;
				}
				else
				{
					_properties.RangedDamageMult += rr;
				}
			}
		}
	}

});

