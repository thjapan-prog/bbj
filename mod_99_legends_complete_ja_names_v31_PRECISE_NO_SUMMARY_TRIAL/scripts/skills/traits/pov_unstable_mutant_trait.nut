this.pov_unstable_mutant_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_unstable_mutant";
		this.m.Name = "不安定な変異体";
		this.m.Icon = "ui/traits/pov_mutant.png";
		this.m.Description = "%name% は [color=" + this.Const.UI.Color.povPerkBlue + "]変異体[/color] であり、変異を得られる。ただしこれらの変異はヴァット・ゲルンのものと比べて不安定で未完成なため、その代償は大きく、自身の力だけでなくキャラクター全体の健康も損なう。";
		this.m.Order = this.Const.SkillOrder.Background;
	}

	getMutationLimit = function()
	{
		local actor = this.getContainer().getActor();
		// Checks For Mutation Limit
		local mutationCount = this.getMutations();
		local mutationLimit = 2;

		if (actor.getFlags().has("playerMutantPlus"))
		{
			mutationLimit = 3;
		}

		// loop over all mutations defined in ::TLW.PlayerMutation
	    foreach (key, mut in ::TLW.PlayerMutation)
	    {
	        // skip ones that count toward the limit
	        if (mut.Limit) continue;

	        // if actor has the skill from this mutation, subtract 1
	        local script = this.new(mut.Script);
	        if (actor.getSkills().hasSkill(script.getID()))
	        {
	            mutationCount -= 1;
	        }
	    }

	    // Fallback
		if (mutationCount < 0){mutationCount = 0;}

		local result = mutationLimit - mutationCount;

		// Fallback
		if (result <= 0){result = 0;}

		return result;
	}

	function getTooltip()
	{
		local result = [
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

		local mutations = this.getMutations();
		if (mutations == 1)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/pov_mutagen_shard_icon.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + mutations + "[/color] 突然変異"
			});
		} else {
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/pov_mutagen_shard_icon.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + mutations + "[/color] 突然変異"
			});
		}

		local limit = this.getMutationLimit();
		if (limit > 1)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + limit + "[/color] 個の突然変異をさらに獲得できる"
			});
		} else if (limit == 1) {
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + limit + "[/color] 個の突然変異をさらに獲得できる"
			});
		} else {
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]これ以上[/color][color=" + this.Const.UI.Color.povPerkBlue + "]通常の[/color]突然変異を獲得できない"
			});
		}

		if (::World.Assets.getOrigin() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.pov_mutants")
			{
				result.push({
					id = 19,
					type = "text",
					icon = "ui/icons/asset_food.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]+33%[/color] 食料消費増加"
				});

				result.push({
					id = 11,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "このキャラクターのヒットポイントの回復が[color=" + this.Const.UI.Color.NegativeValue + "]30%[/color]遅くなる。"
				});

				result.push({
					id = 11,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]負傷閾値が低下する。"
				});

				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/mood_02.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]気分の低下[/color]が定期的に発生する（不安定な突然変異の影響）。"
				});
			}
		}		

		return result;

	}

	function onUpdate( _properties )
	{
		if (::World.Assets.getOrigin() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.pov_mutants")
			{
				_properties.DailyFood *= 1.33;
				_properties.HitpointsRecoveryRateMult *= 0.7;
				_properties.ThresholdToReceiveInjuryMult *= 0.9;
			}
		}		

		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
		}else
		{
			// If in battle, then this should be a status effect
			this.m.Type = ::Const.SkillType.StatusEffect;
			this.m.Order = this.Const.SkillOrder.Background;
		}
	}

	function onNewDay()
	{
		local actor = this.getContainer().getActor();
		// 20% chance overall of mood drop, if not mutant scenario
		if (::World.Assets.getOrigin() != null)
		{
			if (this.World.Assets.getOrigin().getID() != "scenario.pov_mutants")
			{
				if (this.Math.rand(1,100) <= 18)
				{
					actor.worsenMood(0.5, "Feeling discomfort due to mutations");
				}
				else if (this.Math.rand(1,100) <= 3)
				{
					actor.worsenMood(1, "Hurting due to mutations");
				}
			}
		}		
	}

	function getMutations()
	{
		return this.getContainer().getActor().getFlags().getAsInt("pov_ActiveMutations");
	}

});

