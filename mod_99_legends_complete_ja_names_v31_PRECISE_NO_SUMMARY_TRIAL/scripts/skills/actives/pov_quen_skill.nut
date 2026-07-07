this.pov_quen_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ShieldPower = 50,
		Cooldown = 0 // for enemy
	},
	function create()
	{
		this.m.ID = "actives.pov_quen";
		this.m.Name = "Quen Sign";
		this.m.Description = "ヴァトゲルンは大きなダメージを遮断する魔法の盾を作り出し、攻撃した敵にも傷を負わせる。\n\nヴァトゲルンのサインは基本クールダウンが2ターン（全サイン共通）。サイン強度はこのサインのダメージ耐性と反射ダメージに影響する。";
		//this.m.KilledString = "Electrocuted";
		this.m.Icon = "skills/pov_active_quen.png";
		this.m.IconDisabled = "skills/pov_active_quen_sw.png";
		this.m.Overlay = "pov_active_quen";
		this.m.SoundOnUse = [
			"sounds/combat/pov_quen_sign.wav"
		];	
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = false;
		//this.m.IsAOE = true;
		//this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		//this.m.InjuriesOnHead = this.Const.Injury.BurningHead;
		//this.m.DirectDamageMult = 1.00;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
		//this.m.ChanceDecapitate = 75;
		//this.m.ChanceDisembowel = 50;
		//this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();

		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;
		local chance = -10 + intensity; // burn chance = 30 + sign intensity

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/pov_intensity.png",
			text = "現在のサイン強度: [color=" + this.Const.UI.Color.PositiveValue + "]"+ this.Math.round(intensity) +"%[/color]."
		});
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "次に受ける攻撃のダメージを[color=" + this.Const.UI.Color.PositiveValue + "]"+this.m.ShieldPower+"%[/color]遮断する魔法の盾を付与し、遮断した量だけ攻撃した敵にダメージを与える。盾はその後壊れる。"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "遮断ダメージはサイン強度1ポイントにつき[color=" + this.Const.UI.Color.PositiveValue + "]1%[/color]増加し、反射ダメージはサイン強度合計の[color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]増加する。"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		// Quen Power equal to 50 + 1 * sign intensity (cap at 100)
		// (Shown in effect) Reflect damage increased by 25% of Sign Intensity
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;	
		this.m.ShieldPower = this.Math.min(100, 50 + intensity);
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInSigns ? 0.75 : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInSigns ? 3 : 4;
	}
	
	function onCombatStarted()
	{
		this.m.Cooldown = 0;
	}

	function onCombatFinished()
	{
		this.m.Cooldown = 0;
	}

	function onTurnStart()
	{
		this.m.Cooldown = this.Math.max(0, this.m.Cooldown - 1);
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("trait.pov_witcher"))
		{
			return (!actor.getSkills().hasSkill("effects.pov_sign_cooldown") && this.skill.isUsable());
		}
		else if (this.m.Cooldown <= 0 && this.skill.isUsable())
		{
			return true;
		}
		else
		{
			return false;
		}	
	}

	function onUse( _user, _targetTile )
	{
		this.m.Cooldown = 3;
		local actor = this.getContainer().getActor();
		local intensity = 100 * actor.getCurrentProperties().SignIntensity;

		local skill = this.new("scripts/skills/effects/pov_quen_effect")
		skill.m.Strength = this.m.ShieldPower;
		actor.getSkills().add(skill);
		return true;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill == this)
		{
			// Sign Cooldown (player only, for enemy its set individually to 3)
			local actor = this.getContainer().getActor();
			if (actor.getSkills().hasSkill("trait.pov_witcher"))
			{
		    	actor.getSkills().add(this.new("scripts/skills/effects/pov_sign_cooldown_effect"));
			}
		}	
	}

});

