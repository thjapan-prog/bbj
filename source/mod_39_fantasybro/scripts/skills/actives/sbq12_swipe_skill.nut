this.sbq12_swipe_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Skillcharge = 2
	},
	function create()
	{
		this.m.ID = "actives.sbq12_swipe_skill";
		this.m.Name = "119. Spirit Swipe";
		this.m.Description = "Inflicts bleeding on enemies in the selected area, ignoring bleed immunity.";
		this.m.Icon = "skills/active_21.png";
		this.m.IconDisabled = "ui/active_21_sw.png";
		this.m.Overlay = "active_21";
		this.m.SoundOnUse = [
			"sounds/enemies/ghoul_claws_01.wav",
			"sounds/enemies/ghoul_claws_02.wav",
			"sounds/enemies/ghoul_claws_03.wav",
			"sounds/enemies/ghoul_claws_04.wav",
			"sounds/enemies/ghoul_claws_05.wav",
			"sounds/enemies/ghoul_claws_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = true;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of " + this.getMaxRange() + " tiles"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Inflicts 10 bleeding damage per turn for 2 turns."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can be used [color=#8f1e1e]" + this.m.Skillcharge + "[/color] more times in this battle."
		});
		return ret;
	}

	function onTargetSelected( _targetTile )
	{
		local affectedTiles = [];
		affectedTiles.push(_targetTile);
		for( local i = 0; i != 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = _targetTile.getNextTile(i);
				affectedTiles.push(tile);
			}
		}
		foreach( t in affectedTiles )
		{
			this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, t, t.Pos.X, t.Pos.Y);
		}
	}

	function isViableTarget( _user, _target )
	{
		if (!_target.isAttackable() || _target.isAlliedWith(_user) || _target.getHitpointsMax() < 2)
		{
			return false;
		}
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcharge = this.m.Skillcharge - 1
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectThresh);
		local targets = [];
		if (_targetTile.IsOccupiedByActor)
		{
			local entity = _targetTile.getEntity();
			if (this.isViableTarget(_user, entity))
			{
				targets.push(entity);
			}
		}
		for( local i = 0; i < 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local adjacent = _targetTile.getNextTile(i);
				if (adjacent.IsOccupiedByActor)
				{
					local entity = adjacent.getEntity();
					if (this.isViableTarget(_user, entity))
					{
						targets.push(entity);
					}
				}
			}
		}
		foreach( target in targets )
		{
			this.spawnAttackEffect(target.getTile(), this.Const.Tactical.AttackEffectSlash);
			local effect = this.new("scripts/skills/effects/bleeding_effect");
			effect.setDamage(10);
			target.getSkills().add(effect);
		}
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.m.Skillcharge <= 0)
		{
			return false;
		}

		return true;
	}

	function isHidden()
	{
		if (this.m.Skillcharge > 0)
		{
			return false;
		}

		return true;
	}

	function onCombatFinished()
	{
		this.m.Skillcharge = 3;
	}

});

