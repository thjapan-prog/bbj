this.pov_beguile_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 0 //should be ok on serialization, i think tis in the parent table
	},
	function create()
	{
		this.m.ID = "actives.pov_beguile";
		this.m.Name = "Beguile";	//same comment as charm_ally effect
		this.m.Description = "味方または敵に魅了をかけ、戦闘能力に影響を与えようとする。\n\n魅了された味方は全ステータスにボーナスを得るが、敵の注目を集めやすくなる。魅了された敵は受けるダメージが大幅に増加する。\n\n";	//this probably should be more sublime and poetic or whatever
		this.m.Icon = "skills/pov_active_beguile.png";	//wip obv
		this.m.IconDisabled = "skills/pov_active_beguile_sw.png";
		this.m.Overlay = "pov_active_beguile";
		this.m.SoundOnUse = [
			//"sounds/enemies/dlc2/hexe_charm_kiss_01.wav",	//these will probably sound out of place
			//"sounds/enemies/dlc2/hexe_charm_kiss_02.wav",
			//"sounds/enemies/dlc2/hexe_charm_kiss_03.wav",
			//"sounds/enemies/dlc2/hexe_charm_kiss_04.wav"
			"sounds/enemies/dlc2/hexe_hex_01.wav",
			"sounds/enemies/dlc2/hexe_hex_02.wav",
			"sounds/enemies/dlc2/hexe_hex_03.wav",
			"sounds/enemies/dlc2/hexe_hex_04.wav",
			"sounds/enemies/dlc2/hexe_hex_05.wav"
		];
		this.m.SoundOnHit = [
			"sounds/enemies/dlc2/hexe_charm_chimes_01.wav",
			"sounds/enemies/dlc2/hexe_charm_chimes_02.wav",
			"sounds/enemies/dlc2/hexe_charm_chimes_03.wav",
			"sounds/enemies/dlc2/hexe_charm_chimes_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 500;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.ActionPointCost = 4;		//play with numbers urself
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 8; //tf is this lmfao?!?
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "味方を対象：全ステータス[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]ボーナス、意思[color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]ボーナス、疲労回復[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color]を付与するが、敵の注意を引きやすくなる。"	//im not good at this
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "敵を対象：全ソースからの被ダメージが[color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]増加するが、与えるダメージも[color=" + this.Const.UI.Color.NegativeValue + "]12%[/color]増加する。"	//well I am
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "どちらの効果も2ターン間持続する。"	//well I am
			}
		];

		if (this.m.Cooldown >= 1)
		{
			ret.push(
				{
					id = 7,
					type = "hint",
					icon = "ui/icons/warning.png",
					text = "スキルがクールダウン中。残りターン数: [color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.Cooldown+"[/color]"
				}
			);
		}

		return ret;
	}

	function isUsable()
	{
		return this.m.Cooldown == 0 && this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

//		if (!this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))	//ally check, maybe will be useful for later if you decide to separate the charm effect for ally\\enemy
//		{
//			return false;
//		}

		//target check, calling by ID
		if (_targetTile.getEntity().getSkills().hasSkill("effects.pov_charm") || _targetTile.getEntity().getSkills().hasSkill("effects.pov_hex"))	//should prevent you from using this on already affected targets
		{
			return false;
		}

		return true;
	}

	function onTurnStart()
	{
		this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
	}

	function onUse(_user, _targetTile) //this implementation is just for the flying heart effect, i think
	{
		local tag = {
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onDelayedEffect.bindenv(this), tag);
		this.m.Cooldown = 2;
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local _targetTile = _tag.TargetTile;
		local _user = _tag.User;
		local target = _targetTile.getEntity();
		local time = this.Tactical.spawnProjectileEffect("effect_heart_01", _user.getTile(), _targetTile, 0.33, 2.0, false, false);
		local self = this;
		this.Time.scheduleEvent(this.TimeUnit.Virtual, time, function ( _e )
		{
			if (!_targetTile.getEntity().isAlliedWith(this.getContainer().getActor()))	//enemy check
			{
				local bonus = _targetTile.getDistanceTo(_user.getTile()) == 1 ? -5 : 0;

				if (target.getSkills().hasSkill("background.eunuch")/* || target.getSkills().hasSkill("trait.player") || target.getSkills().hasSkill("trait.loyal")*/)	//dont think some of these checks are needed as we are already past the enemy check
				{
					if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " cannot be charmed");
					}

					return false;
				}

				if (target.checkMorale(0, -50 + bonus, this.Const.MoraleCheckType.MentalAttack))
				{
					if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " resists being charmed thanks to his resolve");
					}

					return false;
				}

				if (target.getCurrentProperties().IsResistantToAnyStatuses && this.Math.rand(1, 100) <= 50)
				{
					if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " resists being charmed thanks to his unnatural physiology");
					}

					return false;
				}
				target.getSkills().add(this.new("scripts/skills/effects/pov_hexe_hex_effect")); //debuff effect, for enemies
				return true;
			}
			else	//ally "check"
			{
				if (target.getSkills().hasSkill("background.eunuch")) //no pp, poor guy
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " cannot be charmed");
					return false;
				}
				if (target.getCurrentProperties().IsResistantToAnyStatuses && this.Math.rand(1, 100) <= 50)	//some people are just strange
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " resists being charmed thanks to his unnatural physiology");
					return false;
				}
				target.getSkills().add(this.new("scripts/skills/effects/pov_hexe_charm_ally_effect")); //buff effect, for allies
				return true;
			}
		}.bindenv(this), this);
	}
});