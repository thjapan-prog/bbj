this.sbp_headcollector_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_headcollector_skill";
		this.m.Name = "91. 首狩り";
		this.m.Icon = "ui/xxp13.png";
		this.m.Description = "頭部への命中率が+15%増加する。攻撃時に頭部に命中すると疲労が10回復する。";
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
			text = "頭蓋手術(105)スキルを所持：近接ダメージ+20%。"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		local r = this.getContainer().getActor().getSkills().hasSkill("actives.sbp_skullsurgery_skill") ? 0.2 : 0;
		_properties.MeleeDamageMult += r;
		_properties.HitChance[this.Const.BodyPart.Head] += 15;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		if (_bodyPart == this.Const.BodyPart.Head)
		{
			local actor = this.getContainer().getActor();
			actor.setFatigue(this.Math.max(0, actor.getFatigue() - 10));
			actor.setDirty(true);
		}
	}

});

