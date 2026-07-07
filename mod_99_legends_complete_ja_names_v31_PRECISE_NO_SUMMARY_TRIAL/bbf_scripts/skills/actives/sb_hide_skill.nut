this.sb_hide_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 7,
		Skillcool = 7
	},
	function create()
	{
		this.m.ID = "actives.sb_hide_skill";
		this.m.Name = "34. 隠れる";
		this.m.Description = "隠れて次のターンまで敵の攻撃を回避する。この効果が続く間、敵は移動に反応しない。（ZOC無視）";
		this.m.Icon = "ui/xx32.png";
		this.m.IconDisabled = "ui/xx32_sw.png";
		this.m.SoundOnUse = [
			"sounds/combat/perfect_focus_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsWeaponSkill = false;
		this.m.ActionPointCost = 5;
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
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "敵からの注目を受けにくくなる。近接防御と遠隔防御+12。移動APコスト1減少。ZOC無視"
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "クールダウン: 7 ターン\n残りクールダウン: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] ターン"
			}
		];
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		this.m.Container.add(this.new("scripts/skills/effects/sb_hide_effect"));
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		if (this.m.Skillcool < this.m.Cooldown)
		{
			return false;
		}

		if (this.getContainer().hasSkill("effect.sb_hide_effect"))
		{
			return false;
		}

		return true;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effect.sb_hide_effect");
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
