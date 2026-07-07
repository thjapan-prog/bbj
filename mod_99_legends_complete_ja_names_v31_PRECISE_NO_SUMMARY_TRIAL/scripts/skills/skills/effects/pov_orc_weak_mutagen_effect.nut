this.pov_orc_weak_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {
		SkillCount = 0,
		RageStacks = 0
	},
	function create()
	{
		this.m.ID = "effects.pov_orc_weak_mutagen";
		this.m.Name = "オークの猛攻";
		this.m.Icon = "skills/pov_orcber_mutant.png";
		this.m.IconMini = "pov_mini_orcber_mutant";
		this.m.Overlay = "orc1";
		this.m.Type = this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Kinetic Fibers[/color]: This character\'s muscles have mutated in such a way that the they allow the use of large, unqieldy orc weapons, while also improving the user's strength.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Hightened Agressiveness[/color]:This character\'s nervous system was tweaked to be a pool of endless rage. The Vatt\'ghern gains the charge ability, but has little mind to defend himself properly. When injured, they receive a temporary boost to their agression.";
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
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]オーク武器[/color]を使用時の疲労ペナルティなしで装備できる。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "負傷した時に[color=" + this.Const.UI.Color.PositiveValue + "]一時的なバフ[/color]を得る。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.povTooltipBlue + "]突撃[/color]して相手を気絶させる能力を獲得する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "全体のダメージが[color=" + this.Const.UI.Color.PositiveValue + "]+6%[/color]増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "遠隔防御が[color=" + this.Const.UI.Color.NegativeValue + "]20%[/color]に加えてフラット[color=" + this.Const.UI.Color.NegativeValue + "]8[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "周囲の敵1体につき近接防御が[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color]低下する。"
			}
		];

		return ret;
	}

	

	function onUpdate( _properties )
	{
		// Buffs
		// Charge Ability
		_properties.DamageTotalMult *= 1.06;
		_properties.IsProficientWithHeavyWeapons = true;
		// Debuffs
		_properties.RangedDefenseMult *= 0.80;
		_properties.RangedDefense += -8;
		_properties.SurroundedDefense -= 5;

	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.pov_charge"))
		{
			this.m.Container.add(::new("scripts/skills/actives/pov_charge_skill"));
		}

		this.getContainer().getActor().getCurrentProperties().IsProficientWithHeavyWeapons = true;
		local equippedItem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (equippedItem != null)
		{
			this.getContainer().getActor().getItems().unequip(equippedItem);
			this.getContainer().getActor().getItems().equip(equippedItem);
		}

		equippedItem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (equippedItem != null)
		{
			this.getContainer().getActor().getItems().unequip(equippedItem);
			this.getContainer().getActor().getItems().equip(equippedItem);
		}
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

