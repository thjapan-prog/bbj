this.sb_bribe_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sb_bribe_skill";
		this.m.Name = "10. 買収";
		this.m.Description = "対象の敵に賄賂を贈る。賄賂を受け取った対象は一定確率で戦闘を放棄するか、離反する。\n[color=#8f1e1e]必要条件：[/color] 149クラウン";
		this.m.Icon = "ui/xx24.png";
		this.m.IconDisabled = "ui/xx25_sw.png";
		this.m.SoundOnUse = [
			"sounds/combat/taunt_01.wav",
			"sounds/combat/taunt_02.wav",
			"sounds/combat/taunt_03.wav",
			"sounds/combat/taunt_04.wav",
			"sounds/combat/taunt_05.wav"
		];
		this.m.SoundVolume = 2.2;
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
		this.m.MaxRange = 3;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "成功確率: [color=#135213]70%[/color]"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "金銭に興味がない存在や意思が高い存在には使用できない"
		});
		if (this.Tactical.isActive())
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "所持クラウン: [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color]"
			});
		}
		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.World.Assets.getMoney() < 149)
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local target = _targetTile.getEntity();
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}
		if (target.isAlliedWith(this.getContainer().getActor()))
		{
			return false;
		}
		if (!target.getFlags().has("human") && !target.getFlags().has("goblin"))
		{
			return false;
		}
		if (target.getSkills().hasSkill("actives.insects"))
		{
			return false;
		}
		if (target.getBaseProperties().Bravery > 71)
		{
			return false;
		}
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		local rr = 70;
		this.World.Assets.addMoney(-149);
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSlash);
		if (target.getBaseProperties().Bravery > 70)
		{
			rr = 40;
		}
		if (this.Math.rand(1, 99) <= rr)
		{
			this.Tactical.spawnIconEffect("status_effect_107", _targetTile, this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			target.playSound(this.Const.Sound.ActorEvent.DamageReceived, 2.2);
			if (this.Math.rand(1, 100) <= 50)
			{
				target.setFaction(this.Const.Faction.PlayerAnimals);
			}
			else
			{
				target.checkMorale(-100, -100, this.Const.MoraleCheckType.MentalAttack);
				target.checkMorale(-100, -100, this.Const.MoraleCheckType.MentalAttack);
				target.checkMorale(-100, -100, this.Const.MoraleCheckType.MentalAttack);
				target.checkMorale(-100, -100, this.Const.MoraleCheckType.MentalAttack);
				target.checkMorale(-100, -100, this.Const.MoraleCheckType.MentalAttack);
			}
		}
		return true;
	}

});
