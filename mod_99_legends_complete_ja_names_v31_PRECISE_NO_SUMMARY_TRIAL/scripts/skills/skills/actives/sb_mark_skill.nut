this.sb_mark_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sb_mark_skill";
		this.m.Name = "42. 標的指定";
		this.m.Description = "対象の弱点を露出させ、近接防御と遠隔防御を低下させる。";
		this.m.Icon = "ui/xx25.png";
		this.m.IconDisabled = "ui/xx25_sw.png";
		this.m.SoundOnUse = [
			"sounds/enemies/horror_spell_01.wav",
			"sounds/enemies/horror_spell_02.wav",
			"sounds/enemies/horror_spell_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 9;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "射程" + this.getMaxRange() + "マス"
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "対象: 弱点露出（近接防御と遠隔防御-20、3ターン）。特定パーク1つにつき追加で防御-10: #強靭、#鋼の頭骨、#不意打ち師、#先読み、#不屈、#挑発、#リーチ優位、#制圧、#一匹狼、#首狩り"
		});
		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local rr = 20;
		local bb = 10;
		local actor = this.getContainer().getActor();
		local tss = actor.getSkills();
		if (tss.hasSkill("perk.hold_out"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.steel_brow"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.backstabber"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.anticipation"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.relentless"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.taunt"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.reach_advantage"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.overwhelm"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.lone_wolf"))
		{
			rr = rr + bb;
		}
		if (tss.hasSkill("perk.head_hunter"))
		{
			rr = rr + bb;
		}
		local target = _targetTile.getEntity();
		local effect = this.Tactical.spawnSpriteEffect("effect_skull_03", this.createColor("#ffffff"), _targetTile, 0, 40, 1.0, 0.25, 0, 400, 300);
		local xsk = this.new("scripts/skills/effects/ai_weak_effect");
		xsk.m.TurnsBase = 3;
		for( local i = 0; i < rr; i = ++i )
		{
			target.getSkills().add(xsk);
		}
		this.spawnIcon("status_effect_53", target.getTile());
		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = 0.00001;
		hitInfo.DamageDirect = 1;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1;
		target.onDamageReceived(target, this, hitInfo);
		return true;
	}

});
