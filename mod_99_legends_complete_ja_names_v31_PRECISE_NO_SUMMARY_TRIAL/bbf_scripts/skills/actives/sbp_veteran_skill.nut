this.sbp_veteran_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_veteran_skill";
		this.m.Name = "107. 歴戦兵";
		this.m.Icon = "ui/xxp17.png";
		this.m.Description = "勤務12日ごとに近接・遠隔攻撃スキルが+1増加する。（最大ボーナス50）";
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
		local actor = this.getContainer().getActor();
		local hire = actor.getDaysWithCompany();
		local rr = this.Math.floor(hire / 12);
		rr = this.Math.min(rr, 50);
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "総勤務日数: " + hire + " 日\nボーナス: " + rr
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local hire = actor.getDaysWithCompany();
		local rr = this.Math.floor(hire / 12);
		rr = this.Math.min(rr, 50);
		if (rr >= 1)
		{
			_properties.MeleeSkill += rr;
			_properties.RangedSkill += rr;
		}
	}

});

