this.sb_headbutt_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 3,
		Skillcool = 3
	},
	function create()
	{
		this.m.ID = "actives.sb_headbutt_skill";
		this.m.Name = "32. 頭突き";
		this.m.Description = "単体の対象にダメージを与える。常に頭を狙う。（近接スキル）";
		this.m.Icon = "ui/xx31.png";
		this.m.IconDisabled = "ui/xx31_sw.png";
		this.m.Overlay = "active_52";
		this.m.SoundOnUse = [
			"sounds/enemies/lindwurm_tail_slam_01.wav",
			"sounds/enemies/lindwurm_tail_slam_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/enemies/lindwurm_tail_slam_hit_01.wav",
			"sounds/enemies/lindwurm_tail_slam_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 27;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "鋼の頭骨、首狩り（パーク）: ダメージ+30"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "クールダウン: 3 ターン\n残りクールダウン: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] ターン"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		this.Sound.play("sounds/combat/indomitable_0" + this.Math.rand(1, 2) + ".wav", this.Const.Sound.Volume.Skill * 1.5, _user.getPos());
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.HitChance[this.Const.BodyPart.Head] += 100.0;
			_properties.DamageDirectAdd = 0;
			_properties.DamageDirectMeleeAdd = 0;
			_properties.DamageDirectRangedAdd = 0;
			_properties.DamageDirectMult = 1;
			local actor = this.getContainer().getActor();
			local mainh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			local offh = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			local dmg = 40;
			dmg = (actor.getSkills().hasSkill("perk.steel_brow") ? 30 : 0) + dmg;
			dmg = (actor.getSkills().hasSkill("perk.head_hunter") ? 30 : 0) + dmg;
			_properties.DamageRegularMin = dmg;
			_properties.DamageRegularMax = dmg;
			if (mainh != null && offh == null && mainh.isDoubleGrippable())
			{
				_properties.DamageTotalMult /= 1.25;
			}
			_properties.DamageArmorMult = 0.5;
		}
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.m.Skillcool < this.m.Cooldown)
		{
			return false;
		}
		return true;
	}

	function onTurnStart()
	{
		this.m.Skillcool = this.m.Skillcool + 1;
	}

	function onCombatFinished()
	{
		this.m.Skillcool = this.m.Cooldown;
	}

});
