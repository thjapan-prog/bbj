this.sbq1_propaganda_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbq1_propaganda_skill";
		this.m.Name = "108. 宣伝工作";
		this.m.Description = "Affect the reputation of your mercenary group by engaging in propaganda activities. Propaganda can only be used once per battle and can only be used again when you participate in a battle and win it. The cooldown is shared with everyone. A high reputation value is determined as good, and a low reputation value is determined as evil.";
		this.m.Icon = "ui/xx77.png";
		this.m.IconDisabled = "ui/xx77_sw.png";
		this.m.Overlay = "status_effect_106";
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
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 20;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "When used on yourself or an ally : +1~2 Reputation, +5 Renown"
		});
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "When used on an enemy : -1~2 Reputation, +5 Renown"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Max number of skills that can be learned through skill books becomes 3."
		});
		return ret;
	}

	function getCursorForTile( _tile )
	{
		return this.Const.UI.Cursor.Give;
	}

	function onUse( _user, _targetTile )
	{
		local everyone = this.Tactical.Entities.getAllInstances();
		if (this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))
		{
			this.World.Assets.addMoralReputation(this.Math.rand(1, 2));
			this.World.Assets.addBusinessReputation(5);
			this.spawnIcon("morale_up", _targetTile);
		}
		else
		{
			this.World.Assets.addMoralReputation(this.Math.rand(-1, -2));
			this.World.Assets.addBusinessReputation(5);
			this.spawnIcon("morale_down", _targetTile);
		}
		foreach( ever in everyone )
		{
			foreach( e in ever )
			{
				if (e.getSkills().hasSkill("actives.sbq1_propaganda_skill") && !e.getFlags().has("propagander"))
				{
					e.getFlags().add("propagander");
				}
			}
		}
		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (_targetTile.IsEmpty || !_targetTile.getEntity().isAlive() || _targetTile.getEntity().isDying())
		{
			return false;
		}
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else if (this.getContainer().getActor().getFlags().has("propagander"))
		{
			return false;
		}
		return true;
	}

	function onCombatFinished()
	{
		if (!this.getContainer().getActor().isPlacedOnMap() || !this.getContainer().getActor().isAlive())
		{
			return false;
		}
		local actor = this.getContainer().getActor();
		local gg = 0;
		local actors = this.Tactical.Entities.getAllInstances();
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (!a.isAlliedWith(actor))
				{
					gg = 1;
					break;
				}
			}
		}
		if (gg == 0)
		{
			this.getContainer().getActor().getFlags().remove("propagander")
		}
	}

});

