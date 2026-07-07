this.sbp_prudence_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_prudence_skill";
		this.m.Name = "101. 慎重さ";
		this.m.Icon = "ui/xxp24.png";
		this.m.Description = "このキャラクターはあらゆる行動を慎重に判断し、冷静を保つ。";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 100;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
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
			}
		];
		ret.push({
			id = 3,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=#135213]+12[/color] 近接防御"
		});
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=#8f1e1e]逃走[/color]状態：ターン開始時に[color=#135213]71%[/color]の確率で[color=#135213]崩壊[/color]状態になる"
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "移動1マスごとに追加APコスト[color=#8f1e1e]+1[/color]"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 12;
		_properties.MovementAPCostAdditional += 1;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		if (actor.getMoraleState() == this.Const.MoraleState.Fleeing && this.Math.rand(1, 100) <= 71)
		{
			actor.setMoraleState(this.Const.MoraleState.Breaking);
		}
	}

});

