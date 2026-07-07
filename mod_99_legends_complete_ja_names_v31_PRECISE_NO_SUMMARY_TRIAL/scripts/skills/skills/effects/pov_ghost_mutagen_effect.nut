this.pov_ghost_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_ghost_mutagen";
		this.m.Name = "変異：霊体";
		this.m.Icon = "skills/pov_geist.png";
		this.m.IconMini = "";
		this.m.Overlay = "geist";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Phase Coating[/color]: This character is able to secrete a substance that vibrates rapidly when stimulated. When applied to weapons, this aids in armor penetration. This very coating though reduces the damage done to armor itself.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Screaming Strikes[/color]: This character\'s strikes carry the echo of lost, vengeful souls, inflicting as much mental harm as physical to the enemies.";
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
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
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.povPerkBurgundy + "]恐ろしい存在[/color]パークを獲得する（既にそのパークを持っている場合は意思が+10増加する）。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "装甲を無視する攻撃スキル[color=" + this.Const.UI.Color.povTooltipBlue + "]「幽霊の一撃」[/color]を獲得する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/direct_damage.png",
				text = "鎧貫通が[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]上昇し、追加でフラットボーナス[color=" + this.Const.UI.Color.PositiveValue + "]5[/color]が加算される。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "装甲へのダメージが[color=" + this.Const.UI.Color.NegativeValue + "]40%[/color]減少する。"
			}
		];
		return ret;
	}

	function onAdded()
	{
		// Testing Swerdgeist Actives
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_slash_skill"));
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_split_skill"));
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_swing_skill"));

		// Testing Rustunggeist Actives
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_punch_skill"));
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_punch_swing_skill"));
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_headbutt_skill"));
		//this.m.Container.add(::new("scripts/skills/actives/pov_ghost_kick_skill"));

		if (!this.m.Container.hasSkill("actives.pov_ghastly_touch"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_ghastly_touch_skill"));
		}
	}

	function onUpdate( _properties )
	{
		// Buffs
		_properties.DamageDirectAdd += 0.05;
		_properties.DamageDirectMult += 0.20;
		// Debuffs
		_properties.DamageArmorMult *= 0.6;
	}

	function isHidden()
	{
		return this.inBattleHiddenCheck();
	}

	function inBattleHiddenCheck()
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null)
		{
			return false;
		}

		return true;
	}

});

