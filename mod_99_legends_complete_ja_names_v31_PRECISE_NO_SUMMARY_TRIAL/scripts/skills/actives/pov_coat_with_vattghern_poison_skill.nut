this.pov_coat_with_vattghern_poison_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.pov_coat_with_vattghern_poison";
		this.m.Name = "Use Vattghern-Poisoned Oil";
		this.m.Description = "ヴァトゲルンの毒で武器と矢尻をコーティングする。近接状態では使用不可。";
		this.m.Icon = "skills/pov_active_coat_vattghern_poison.png";
		this.m.IconDisabled = "skills/pov_active_coat_vattghern_poison_sw.png";
		this.m.Overlay = "pov_active_coat_vattghern_poison";
		this.m.SoundOnUse = [
			"sounds/combat/poison_applied_01.wav",
			"sounds/combat/poison_applied_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
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
				text = "次の[color=" + this.Const.UI.Color.PositiveValue + "]4[/color]回の攻撃に毒状態効果を付与し、ターンごとに[color=" + this.Const.UI.Color.NegativeValue + "]10[/color]ダメージを与える。この毒の間、対象はイニシアチブとダメージが[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]、視野が[color=" + this.Const.UI.Color.NegativeValue + "]1[/color]低下する。"
			}
		];

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]このキャラクターは近接状態のため使用できない[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function onUse( _user, _targetTile )
	{
		local poison = _user.getSkills().getSkillByID("effects.pov_vattghern_poison_coat");

		if (poison != null)
		{
			poison.resetTime();
		}
		else
		{
			this.m.Container.add(this.new("scripts/skills/effects/pov_vattghern_poison_coat_effect"));
		}

		if (this.m.Item != null && !this.m.Item.isNull())
		{
			this.m.Item.removeSelf();
		}

		return true;
	}

});

