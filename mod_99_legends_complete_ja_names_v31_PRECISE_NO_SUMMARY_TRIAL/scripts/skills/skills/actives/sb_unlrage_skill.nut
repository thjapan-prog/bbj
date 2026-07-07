this.sb_unlrage_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Cooldown = 7,
		Skillcool = 7
	},
	function create()
	{
		this.m.ID = "actives.sb_unlrage_skill";
		this.m.Name = "72. 怒りの解放";
		this.m.Description = "内なる怒りを解放し、戦闘能力を大幅に強化する。";
		this.m.Icon = "ui/xx12.png";
		this.m.IconDisabled = "ui/xx12_sw.png";
		this.m.SoundOnUse = [
			"sounds/combat/rage_01.wav",
			"sounds/combat/rage_02.wav"
		];
		this.m.SoundVolume = 0.9;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted + 228;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 25;
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
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "近接ダメージ+30%、受けるダメージ30%減少"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "3ターン持続"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "クールダウン: 7ターン\n残りクールダウン: [color=#8f1e1e]" + this.Math.max(0, (this.m.Cooldown - this.m.Skillcool)) + "[/color] ターン"
			}
		];
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Skillcool = 0;
		this.m.Container.add(this.new("scripts/skills/effects/sb_unlrage_effect"));
		return true;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}
		else
		if (this.m.Skillcool < this.m.Cooldown)
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

