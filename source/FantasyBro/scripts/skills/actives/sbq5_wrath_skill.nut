this.sbq5_wrath_skill <- this.inherit("scripts/skills/skill", {
	m = {
		SkillFire = 0,
		Skillcharge = 1
	},
	function create()
	{
		this.m.ID = "actives.sbq5_wrath_skill";
		this.m.Name = "112. Wrath of Davkul";
		this.m.Description = "After 3 turns, inflicts Pain on all enemies. But, your AP becomes 0 until the effect of this skill is activated. This skill can only be used while engaged in melee with an enemy. \n[color=#8f1e1e]Requirements:[/color] 299 Crowns";
		this.m.Icon = "ui/xx79.png";
		this.m.IconDisabled = "ui/xx79_sw.png";
		this.m.Overlay = "active_102";
		this.m.SoundOnUse = [
			"sounds/combat/perfect_focus_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsAttack = true;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 35;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Pain: Lose 10-50 health at the start of its next turn. This effect is classified as bleeding, but does not cause death."
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can be used [color=#8f1e1e]" + this.m.Skillcharge + "[/color] more times in this battle."
		});
		if (this.Tactical.isActive())
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "Own [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
			});
		}
		if (this.Tactical.isActive() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This skill can only be used while engaged in melee.[/color]"
			});
		}
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.SkillFire = 4;
		this.m.Skillcharge = this.m.Skillcharge - 1
		this.World.Assets.addMoney(-299);
		if (_user.hasSprite("xwrath_eye"))
		{
			_user.getSprite("xwrath_eye").Visible = false;
			_user.removeSprite("xwrath_eye");
		}
		_user.addSprite("xwrath_eye");
		_user.getSprite("xwrath_eye").setBrush("zombie_rage_eyes");
		_user.getSprite("xwrath_eye").Visible = true;
		_user.getSprite("xwrath_eye").Color = this.createColor("#ffd000");
		if (_user.hasSprite("arms_icon"))
		{
			_user.removeSprite("arms_icon");
			_user.addSprite("arms_icon")
			_user.getItems().updateAppearance();
		}
		return true;
	}

	function fakeAffectedTiles()
	{
		local atile = this.getContainer().getActor().getTile();
		local ret = [
			atile
		];
		local size = this.Tactical.getMapSize();
		for( local x = 0; x < size.X; x = ++x )
		{
			for( local y = 0; y < size.Y; y = ++y )
			{
				if (atile.getDistanceTo(this.Tactical.getTileSquare(x, y)) == 9 && this.Tactical.getTileSquare(x, y) != atile)
				{
					ret.push(this.Tactical.getTileSquare(x, y));
				}
			}
		}
		return ret;
	}

	function onTurnStart()
	{
		this.m.SkillFire = this.Math.max(0, this.m.SkillFire - 1);
		if (this.getContainer().getActor().isAlive() && this.m.SkillFire > 0)
		{
			local actor = this.getContainer().getActor();
			local atile = actor.getTile();
			actor.setActionPoints(0);
			if (this.m.SkillFire == 1)
			{
				local tiles = this.fakeAffectedTiles();
				local everyone = this.Tactical.Entities.getAllInstances();
				this.Tactical.spawnIconEffect("active_102", atile, this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
				this.Sound.play("sounds/enemies/horror_spell_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Skill * 1.2, atile.Pos);
				this.Tactical.getCamera().quake(this.createVec(0, -1.0), 6.0, 0.16, 0.35);
				if (this.getContainer().getActor().hasSprite("xwrath_eye"))
				{
					this.getContainer().getActor().getSprite("xwrath_eye").Visible = false;
					this.getContainer().getActor().removeSprite("xwrath_eye");
				}
				foreach( t in tiles )
				{
					local flip = !this.m.IsProjectileRotated && e.getPos().X > actor.getPos().X;
					this.Tactical.spawnProjectileEffect("bust_body_bloodied_02", atile, t, 0.7, 2, false, flip);
					this.Tactical.spawnProjectileEffect("blood_splatter_dark_0" + this.Math.rand(1, 6), atile, t, 1.4 + (this.Math.rand(1, 3) * 0.1), 2, false, flip);
				}
				foreach( ever in everyone )
				{
					foreach( e in ever )
					{
						if (actor.isAlive() && e.isAlive() && !actor.isAlliedWith(e))
						{
							local dmg = this.Math.rand(10, 50);
							local effect = this.new("scripts/skills/effects/ai_pain_effect");
							effect.m.Name = "Pain (" + dmg + " Damage)";
							effect.setDamage(dmg);
							e.getSkills().add(effect);
						}
					}
				}
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " successfully casts the spell and activates its effect.");
			}
			else
			{
				this.Tactical.spawnIconEffect("status_effect_106", atile, this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
				this.Sound.play("sounds/enemies/miasma_spell_0" + this.Math.rand(2, 3) + ".wav", this.Const.Sound.Volume.Skill * 1.5, atile.Pos);
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " is casting a spell.");
			}
		}
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		if (this.World.Assets.getMoney() < 299)
		{
			return false;
		}
		if (this.m.SkillFire != 0)
		{
			return false;
		}
		else if (this.m.Skillcharge <= 0)
		{
			return false;
		}
		else if (!this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
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
		this.m.Skillcharge = 1;
		this.m.SkillFire = 0;
		if (this.getContainer().getActor().hasSprite("xwrath_eye"))
		{
			this.getContainer().getActor().getSprite("xwrath_eye").Visible = false;
			this.getContainer().getActor().removeSprite("xwrath_eye");
		}
	}

});

