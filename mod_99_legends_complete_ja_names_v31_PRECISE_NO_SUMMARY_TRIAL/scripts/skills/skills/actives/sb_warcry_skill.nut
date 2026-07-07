this.sb_warcry_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 7,
		Skillcool = 7
	},
	function create()
	{
		this.m.ID = "actives.sb_warcry_skill";
		this.m.Name = "74. 雄叫び";
		this.m.Description = "恐ろしい雄叫びを上げ、周囲の敵に負の効果を与える。";
		this.m.Icon = "ui/xx44.png";
		this.m.IconDisabled = "ui/xx44_sw.png";
		this.m.Overlay = "active_49";
		this.m.SoundOnUse = [
			"sounds/enemies/warcry_01.wav"
		];
		this.m.SoundVolume = 1.1;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 222;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "2マス以内の敵は受けるダメージが永続的に20%増加し、士気が低下する可能性がある。この効果は累積する。弱点が露出している敵には効果が2.5倍になる。"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "クールダウン: 7ターン\n残りクールダウン: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] ターン"
		});
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getAllInstances();
		this.Tactical.spawnSpriteEffect("effect_skull_03", this.createColor("#ffffff"), myTile, 0, 20, 0.5, 1.2, 2, 400, 300);
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (a.getID() == _user.getID())
				{
					continue;
				}
				if (myTile.getDistanceTo(a.getTile()) > 2)
				{
					continue;
				}
				if (!a.isAlliedWith(_user) && a.isAlive() && a.isAttackable() && !a.getSkills().hasSkill("effects.charmed") && a.getCurrentProperties().DamageReceivedTotalMult > 0)
				{
					if (a.getSkills().hasSkill("effects.ai_weak_effect"))
					{
						a.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
						a.getBaseProperties().DamageReceivedTotalMult += 0.5;
						this.spawnIcon("status_effect_70", a.getTile());
					}
					else
					{
						if (this.Math.rand(1, 100) <= 50)
						{
							a.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
						}
						a.getBaseProperties().DamageReceivedTotalMult += 0.2;
						this.spawnIcon("status_effect_52", a.getTile());
					}
					local fakeb = this.new("scripts/skills/actives/ai_fakebuff");
					fakeb.m.Overlay = "";
					a.getSkills().add(fakeb);
				}
			}
		}
		return true;
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

