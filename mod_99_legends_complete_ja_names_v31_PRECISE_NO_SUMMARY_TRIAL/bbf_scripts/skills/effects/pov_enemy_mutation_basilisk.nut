this.pov_enemy_mutation_basilisk <- this.inherit("scripts/skills/skill", {
	m = {
		//TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.pov_enemy_mutation_basilisk";
		this.m.Name = "[color="+ ::Const.UI.Color.povEnemyMutation + "] Basilisk\'s Focus [/color]";
		this.m.Description = "This enemy has some properties of a Basilisk! Their intense focus grants them increased chance and damage against enemie's heads, but reduced damage against their bodies. In addition, all their attacks cost more fatigue";
		this.m.Icon = "skills/pov_basilisk_mutant.png";
		this.m.IconMini = "pov_mini_basilisk_mutant";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "They become more swift and have a terrifying presence, but they are also easier to injure, and their fast attacks do not pack the same punch.";
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
				id = 11,
				type = "text",
				icon = "ui/icons/chance_to_hit_head.png",
				text = "頭部命中率が[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color]上昇する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "頭部命中時、ダメージが[color=" + this.Const.UI.Color.PositiveValue + "]+14%[/color]増加する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "胴体命中時、ダメージが[color=" + this.Const.UI.Color.NegativeValue + "]-14%[/color]減少する"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "全スキルの疲労コストが[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]増加する"
			}
		];
		return ret;
	}

	function onAdded() 
	{
		local actor = this.getContainer().getActor();
		if (!::MSU.isKindOf(actor, "player")) 
		{
			::TLW.MutagenDrop.addMutagenDrop(actor, ::TLW.Mutation.Basilisk);
	  	}
	}

	function onUpdate( _properties )
	{
		if(_properties.YrdenTrapped == false)
		{
			// Buffs
			_properties.HitChance[this.Const.BodyPart.Head] += 10;
			_properties.DamageAgainstMult[this.Const.BodyPart.Head] += 0.14;
		}	
		// Debuffs
		_properties.DamageAgainstMult[this.Const.BodyPart.Body] += -0.14;
		_properties.FatigueEffectMult *= 1.15;
	}

});
