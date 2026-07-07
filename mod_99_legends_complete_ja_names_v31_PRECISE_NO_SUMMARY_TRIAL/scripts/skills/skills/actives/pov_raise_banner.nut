this.pov_raise_banner <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.pov_raise_banner";
		this.m.Name = "旗を掲げろ！！";
		this.m.Description = "旗を掲げろ！全力を尽くせ！！傭兵団のために！！！\n\n傭兵団を鼓舞するために全力を注ぐ。逃走中の者を立て直し、魅了と睡眠を解除し、残りのメンバーのモラルを高めようとする。同時に、そのような意思の表れが近くの敵のモラルを下げる可能性がある。\n\nこのスキルは非常に消耗し、再び使用できるようになるまで数日の回復が必要になる。";
		this.m.Icon = "skills/pov_active_raise_banner.png";
		this.m.IconDisabled = "skills/pov_active_raise_banner_sw.png";
		this.m.Overlay = "pov_active_raise_banner";
		this.m.SoundOnUse = [
			"sounds/combat/pov_raise_banner.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 40;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	// 50% of resolve (used for BOTH ally bonus and enemy penalty)
	function getBonus()
	{
		local resolve = this.getContainer().getActor().getCurrentProperties().getBravery();
		return this.Math.max(0, this.Math.floor(resolve * 0.50));
	}

	function getTooltip()
	{
		local bonus = this.getBonus();

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
				text = "8マス以内の味方はモラル向上のためモラルチェックを行い、意思ボーナス[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color]（使用者の意思の50%）が適用されるが、距離1マスにつき[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color]減少する。逃走中の味方も立て直せる。"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "8マス以内の敵はモラル悪化のためモラルチェックを行い、意思ペナルティ[color=" + this.Const.UI.Color.NegativeValue + "]-" + bonus + "[/color]（使用者の意思の50%）が適用されるが、距離1マスにつき[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color]減少する。"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "上記と同じ確率で、関係する者の[color=" + this.Const.UI.Color.NegativeValue + "]睡眠[/color]および[color=" + this.Const.UI.Color.NegativeValue + "]魅了[/color]効果を解除する。"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "使用者を[color=" + this.Const.UI.Color.NegativeValue + "]消耗[/color]させ、意思をわずかに低下させ、数日間このスキルの使用を妨げる。"
			}
		];

		if (this.getContainer().hasSkill("effects.pov_banner_exerted"))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]このスキルを使用して消耗中。再び使用できるようになるまで数日かかる[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.pov_banner_exerted");
	}

	function onUse( _user, _targetTile )
	{
		local bonus = this.getBonus();
		local actors = this.Tactical.Entities.getAllInstancesAsArray();
		local myTile = _user.getTile();

		foreach (a in actors)
		{
			if (a == null || a.getID() == _user.getID())
			{
				continue;
			}

			local dist = myTile.getDistanceTo(a.getTile());

			// Max range = 8 distance
			if (dist > 8)
			{
				continue;
			}

			// --- Chance-based dispel (Sleeping + Charmed) ---
			local dispelChance = this.Math.min(100, this.Math.max(0, bonus - (dist * 5))); // e.g. bonus=50 => 50% chance, with distance 3: 35% chance
			local roll = this.Math.rand(1, 100);

			if (roll <= dispelChance)
			{
				::Legends.Effects.remove(a, ::Legends.Effect.Sleeping);
				::Legends.Effects.remove(a, ::Legends.Effect.Charmed);
				::Legends.Effects.remove(a, ::Legends.Effect.LegendIntenselyCharmed);
			}

			// Distance-scaled moraleCheck value: -5 per tile
			// Different formulas for Positive and Negative checks (opposite)
			// Max distance penalty = 40
			local moraleCheckPositive = bonus - (dist * 5);
			local moraleCheckNegative = (dist * 5) - bonus;

			// Allies: positive morale check
			if (a.getFaction() == _user.getFaction())
			{
				// Either rallies a fleeing guy, or just raises morale
				if (a.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					a.checkMorale(this.Const.MoraleState.Wavering - this.Const.MoraleState.Fleeing, moraleCheckPositive, this.Const.MoraleCheckType.Default, "pov_raise_banner_positive");
				}
				else
				{
					a.checkMorale(1, moraleCheckPositive, this.Const.MoraleCheckType.Default, "pov_raise_banner_positive");
				}
			}
			// Enemies: negative morale check
			else
			{
				a.checkMorale(-1, moraleCheckNegative, this.Const.MoraleCheckType.Default, "pov_raise_banner_negative");
			}
		}

		// Prevent the user from using it again / being affected same turn (vanilla behavior)
		local exerted = this.new("scripts/skills/effects/pov_banner_exerted_effect")
		// inspiring presence reduces cdr by one day
		if (_user.getSkills().hasPerk(::Legends.Perk.InspiringPresence))
		{
			exerted.m.Duration = 2;
		}
		this.getContainer().add(exerted);
		return true;
	}
});
