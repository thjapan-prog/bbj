this.pov_sickness2_injury <- this.inherit("scripts/skills/injury/injury", {
	m = {},
	function create()
	{
		this.injury.create();
		this.m.ID = "injury.pov_sickness2";
		this.m.Name = "Mutation Aftermath";
		this.m.Description = "このキャラクターは突然変異を経験した。[color=" + this.Const.UI.Color.NegativeValue + "]あらゆる戦闘を避けるべき[/color]ひどい状態が数日間続く。\n\n 回復中は大量のリソースを消費する必要がある。\n\n このデバフはこのキャラクターが突然変異するたびに適用されるが、その持続時間は毎回1〜2日短縮される。";
		this.m.Type = this.m.Type | this.Const.SkillType.TemporaryInjury;
		this.m.DropIcon = "injury_mutation_aftermath";
		this.m.Icon = "ui/injury/pov_injury_mutation_aftermath.png";
		this.m.IconMini = "pov_injury_mutation_aftermath_mini";
		this.m.HealingTimeMin = 4;
		this.m.HealingTimeMax = 7;
		this.m.IsAlwaysInEffect = true;
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
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.povPerkBlue + "]「嘔吐」[/color]する能力を獲得する"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] ヒットポイント"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60%[/color] 最大疲労度"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60%[/color] イニシアチブ"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60%[/color] 意思"
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60%[/color] 近接技量"
			},
			{
				id = 15,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60%[/color] 遠隔技量"
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60%[/color] 近接防御"
			},
			{
				id = 17,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] 遠隔防御"
			},
			{
				id = 17,
				type = "text",
				icon = "ui/icons/pov_intensity.png",
				text = "サイン強度が[color=" + this.Const.UI.Color.NegativeValue + "]70%[/color]減少する（乗算）。"
			},
			{
				id = 18,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-3[/color] 視野"
			},
			{
				id = 19,
				type = "text",
				icon = "ui/icons/asset_food.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+200%[/color] 食料消費"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onAdded()
	{
		this.injury.onAdded();
		local bro = this.getContainer().getActor();

		this.getContainer().add(::new("scripts/skills/actives/pov_vomit_skill")); // add puke

		if (bro.isPlacedOnMap())
		{
			this.Sound.play("sounds/vomit_01.wav", this.Const.Sound.Volume.Actor, bro.getPos());
			local myTile = bro.getTile();
			local candidates = [];

			for( local i = 0; i < 6; i = ++i )
			{
				if (!myTile.hasNextTile(i))
				{
				}
				else
				{
					local next = myTile.getNextTile(i);

					if (next.IsEmpty)
					{
						candidates.push(next);
					}
				}
			}

			if (candidates.len() == 0)
			{
				candidates.push(myTile);
			}

			myTile = candidates[this.Math.rand(0, candidates.len() - 1)];
			myTile.spawnDetail("detail_vomit");
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(bro) + " is now sick");
		}
	}

	function onTurnStart()
	{
		if (this.Math.rand(1, 100) <= 40)
		{
			return;
		}

		local bro = this.getContainer().getActor();
		this.Sound.play("sounds/vomit_01.wav", this.Const.Sound.Volume.Actor, bro.getPos());
		local myTile = bro.getTile();
		local candidates = [];

		for( local i = 0; i < 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local next = myTile.getNextTile(i);

				if (next.IsEmpty)
				{
					candidates.push(next);
				}
			}
		}

		if (candidates.len() == 0)
		{
			candidates.push(myTile);
		}

		myTile = candidates[this.Math.rand(0, candidates.len() - 1)];
		myTile.spawnDetail("detail_vomit");
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(bro) + " vomits");
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.pov_vomit")
	}

	function onUpdate( _properties )
	{
		this.injury.onUpdate(_properties);
		_properties.HitpointsMult *= 0.50;
		_properties.BraveryMult *= 0.40;
		_properties.InitiativeMult *= 0.40;
		_properties.StaminaMult *= 0.40;
		_properties.MeleeSkill *= 0.40;
		_properties.RangedSkill *= 0.40;
		_properties.MeleeDefense *= 0.40;
		_properties.RangedDefense *= 0.50;
		_properties.SignIntensity *= 0.30;
		_properties.Vision += -3;
		_properties.DailyFood += 2.0;
	}

});

