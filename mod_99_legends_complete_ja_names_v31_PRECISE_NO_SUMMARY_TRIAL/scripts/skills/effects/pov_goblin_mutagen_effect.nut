this.pov_goblin_mutagen_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.pov_goblin_mutagen";
		this.m.Name = "変異：ゴブリン";
		this.m.Icon = "skills/pov_goblin.png";
		this.m.IconMini = "";
		this.m.Overlay = "goblin";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "[color=" + this.Const.UI.Color.povPerkBlue + "]Reactive Muscles[/color]: This character\'s muscles have mutated, allowing them to execute swift and intricate movements with ease. Their body flows effortlessly through battle, making evasive maneuvers and repositioning far less taxing.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Mutated Cornea[/color]: Their eyes have adapted to detect the subtlest shifts in wind and motion, enhancing their ability to anticipate and correct projectile trajectories. Their ranged attacks strike with uncanny accuracy and can bypass obstructions with surprising frequency.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Frail Physique[/color]: This character\'s body has become more fragile, struggling to endure direct blows. Even minor injuries can take a severe toll, and heavier armor feels overly cumbersome, sapping energy faster than normal.\n\n[color=" + this.Const.UI.Color.povPerkBlue + "]Skittish Mind[/color]: The Vatt\'ghern' is more prone to panic in the face of danger, making them susceptible to fear and doubt. Prolonged engagements or overwhelming odds may break their resolve more easily than most.";
	}

	function getPenalty()
	{
		local actor = this.getContainer().getActor();

		local bodyitem = actor.getBodyItem();

		if (bodyitem == null)
		{
			return 0;
		}
	
		local armorFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Body);
		local helmetFatPen = actor.getItems().getStaminaModifier(::Const.ItemSlot.Head);
		local totalPen = armorFatPen + helmetFatPen;
		local penalty = totalPen * 0.15;
		return penalty;
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
				icon = "ui/icons/action_points.png",
				text = "移動スキル（スプリント、フットワーク、回転）の行動力と疲労コストが[color=" + this.Const.UI.Color.PositiveValue + "]大幅に削減[/color]される。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.povPerkPurple + "]狙い撃ち[/color]の行動力コストが[color=" + this.Const.UI.Color.PositiveValue + "]2[/color]削減されるが、疲労コストがわずかに増加する。[color=" + this.Const.UI.Color.povPerkPurple + "]再装填[/color]の行動力コストが[color=" + this.Const.UI.Color.PositiveValue + "]1[/color]、疲労コストが[color=" + this.Const.UI.Color.PositiveValue + "]15%[/color]削減される"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "全遠隔ダメージが[color=" + this.Const.UI.Color.PositiveValue + "]12%[/color]増加する。ゴブリンのスパイクボールを使用時はボーナスが[color=" + this.Const.UI.Color.PositiveValue + "]30%[/color]に増加する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "遠隔技量が追加で[color=" + this.Const.UI.Color.PositiveValue + "]15%[/color]上昇し、射撃が防がれない確率が追加で[color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]上昇する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "最大ヒットポイントが[color=" + this.Const.UI.Color.NegativeValue + "]20%[/color]減少し、近接防御が[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]低下する。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "全ての士気チェックに[color=" + this.Const.UI.Color.NegativeValue + "]20[/color]のペナルティが適用される。"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "装甲着用による疲労とイニシアチブのペナルティが[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]増加する。"
			}
			
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		// Buffs
		// Get a bunch of ranged and mobility bonuses too
		_properties.MovementFatigueCostAdditional += -1;
		_properties.RangedSkillMult *= 1.15;
		_properties.RangedDamageMult *= 1.12;
		_properties.RangedAttackBlockedChanceMult = this.Math.max(0, _properties.RangedAttackBlockedChanceMult - 0.25);
		// Debuffs
		// Also a moral check penalty? dunno if it works
		_properties.Hitpoints *= 0.80;
		_properties.MeleeDefenseMult *= 0.85;
		_properties.Stamina += this.getPenalty();
		_properties.Initiative += this.getPenalty();
	}

	// THIS HAS NOT BE FULLY TESTED
	function checkMorale( _change, _difficulty, _type = this.Const.MoraleCheckType.Default, _showIconBeforeMoraleIcon = "", _noNewLine = false )
	{
		_difficulty = _difficulty - 20;
	}

	function onAfterUpdate(_properties)
	{
		local reloadXbow = this.getContainer().getSkillByID("actives.reload_bolt");
		if (reloadXbow != null)
		{
			reloadXbow.m.ActionPointCost -= 1;
			reloadXbow.m.FatigueCost *= 0.85;
		};
		local reloadGun = this.getContainer().getSkillByID("actives.reload_handgonne");
		if (reloadGun != null)
		{
			reloadGun.m.ActionPointCost -= 1;
			reloadGun.m.FatigueCost *= 0.85;
		};
		local aimedShot = this.getContainer().getSkillByID("actives.aimed_shot");
		if (aimedShot != null)
		{
			aimedShot.m.ActionPointCost -= 2;
			aimedShot.m.FatigueCost *= 1.2;
		};
		local sprint = this.getContainer().getSkillByID("actives.sprint");
		if (sprint != null)
		{
			sprint.m.ActionPointCost = 2;
			sprint.m.FatigueCost *= 0.6;
		};
		local footwork = this.getContainer().getSkillByID("actives.footwork");
		if (footwork != null)
		{
			footwork.m.ActionPointCost = 2;
			footwork.m.FatigueCost *= 0.6;
		};
		local rotation = this.getContainer().getSkillByID("actives.rotation");
		if (rotation != null)
		{
			rotation.m.ActionPointCost = 2;
			rotation.m.FatigueCost *= 0.6;
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




