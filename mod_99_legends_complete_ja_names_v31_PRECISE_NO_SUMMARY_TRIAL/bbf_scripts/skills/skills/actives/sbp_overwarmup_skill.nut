this.sbp_overwarmup_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_overwarmup_skill";
		this.m.Name = "100. ウォームアップ";
		this.m.Icon = "ui/xxp20.png";
		this.m.Description = "全ステータスが+5増加する。ただし戦闘開始時1ターンは行動不能になる。";
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
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "先読み（パーク）：このスキルのステータスボーナスに+5を加算する。"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		local rr = 5 + (this.getContainer().getActor().getSkills().hasSkill("perk.anticipation") ? 5 : 0);
		_properties.MeleeSkill += rr;
		_properties.RangedSkill += rr;
		_properties.MeleeDefense += rr;
		_properties.RangedDefense += rr;
		_properties.Stamina += rr;
		_properties.Hitpoints += rr;
		_properties.Initiative += rr;
		_properties.Bravery += rr;
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.setActionPoints(0);
		local stun = this.new("scripts/skills/effects/ai_stun_effect");
		actor.getSkills().add(stun);
		stun.setTurns(1);
	}

});

