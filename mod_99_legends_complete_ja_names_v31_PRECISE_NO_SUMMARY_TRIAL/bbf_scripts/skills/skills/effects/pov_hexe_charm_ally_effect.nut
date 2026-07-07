this.pov_hexe_charm_ally_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_charm";
		this.m.Name = "魅了"; //probably should change cos there is already vanillas "Charmed", but it will not bork anything with the same name, its not something important(like ID, which should be unique obv)
		this.m.Description = "Inspired by a strange power, this entity sees their skills improved, but it also somehow draws in more attention than they would want.";	//make something up urself
		this.m.Icon = "skills/pov_beguiled_status_effect.png";
		this.m.IconMini = "pov_mini_beguiled_status_effect";
		this.m.Overlay = "";
		this.m.SoundOnUse = [		//dont know if this is needed or how it works
			"sounds/enemies/dlc2/hexe_charm_chimes_01.wav",
			"sounds/enemies/dlc2/hexe_charm_chimes_02.wav",
			"sounds/enemies/dlc2/hexe_charm_chimes_03.wav",
			"sounds/enemies/dlc2/hexe_charm_chimes_04.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip() //WIP, dont really know how to make tooltips look cool
	{
		local ret = this.skill.getTooltip();
		local turnsText = this.m.TurnsLeft > 0 ? (" Lasts [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turns.") : "";
		ret.push({			//dont know why i did this with ret.push, probably stole somewhere (^:
			id = 12,
			type = "text",
			icon = "ui/icons/special.png",
			text = "魅了された。いくつかの強化を受け、また敵を引き寄せる。" + turnsText, //should base this on them buffs, or make something up
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "意思が[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color]上昇する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "近接技量が[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]上昇する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "遠隔技量が[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]上昇する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "近接防御が[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]上昇する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "遠隔防御が[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]上昇する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "イニシアチブが[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]上昇する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "毎ターンの疲労回復が[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color]増加する"
		});
		ret.push({
			id = 13,
			type = "text",
			icon = "ui/icons/special.png",
			text = "敵がこの存在を攻撃する確率が[color=" + this.Const.UI.Color.NegativeValue + "]2[/color]倍になる。"
		});
		return ret;
	}


	function onAdded()
	{
		this.spawnIcon("pov_medium_beguiled_status_effect", this.getContainer().getActor().getTile());
	}

	function onUpdate(_properties) //idk how to make this interesting, so i guess ill just add some stats, but i think that you should make this more spicy, but easier said than done, as always
	{
		_properties.BraveryMult *= 1.25;
		_properties.MeleeSkillMult *= 1.10; //should tweak these, dont forget to update the tooltip
		_properties.RangedSkillMult *= 1.10;
		_properties.MeleeDefenseMult *= 1.10;
		_properties.RangedDefenseMult *= 1.10;
		_properties.Initiative *= 1.10;
		_properties.FatigueRecoveryRate += 3;
		_properties.TargetAttractionMult *= 2.0; //prio mult, probably too big
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});
