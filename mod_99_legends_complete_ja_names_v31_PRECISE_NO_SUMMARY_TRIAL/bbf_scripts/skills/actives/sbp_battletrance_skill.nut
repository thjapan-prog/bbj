this.sbp_battletrance_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_battletrance_skill";
		this.m.Name = "82. 戦闘恍惚";
		this.m.Icon = "ui/xxp9.png";
		this.m.Description = "多くの疲労を消費することで戦闘能力が強化される。";
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
			text = "現在の疲労が最大疲労の80%以上：近接防御+8、遠隔防御+8"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "残り疲労が25以下：近接攻撃スキル+8、遠隔攻撃スキル+8"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "マナ熟達(84)と宣伝工作(108)の両スキルを所持：全ステータス+20"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		if (actor.getFatiguePct() >= 0.8)
		{
			_properties.MeleeDefense += 8;
			_properties.RangedDefense += 8;
		}
		if (actor.getCurrentProperties().Stamina - actor.getFatigue() <= 25)
		{
			_properties.MeleeSkill += 8;
			_properties.RangedSkill += 8;
		}
		local q = actor.getSkills();
		if (q.hasSkill("actives.sbp_bondage_skill") && q.hasSkill("actives.sbq1_propaganda_skill"))
		{
			local r = 20;
			_properties.MeleeSkill += r;
			_properties.RangedSkill += r;
			_properties.MeleeDefense += r;
			_properties.RangedDefense += r;
			_properties.Stamina += r;
			_properties.Hitpoints += r;
			_properties.Initiative += r;
			_properties.Bravery += r;
		}
	}

});

