this.fantasy_monster_encounter_12_event <- this.inherit("scripts/events/event", {
	m = {
		Title1 = "Warrior",
		HedgeKnight1 = null
	},
	function create()
	{
		this.m.ID = "event.fantasy_monster_encounter_12_event";
		this.m.Title = "Sudden Events...";
		this.m.Cooldown = 15.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img]{People with dangerous and unusual jobs, such as mercenaries and adventurers, often have their own pasts. While talking with the members during break time, You heard a story about one of the members\' pasts. The story was interesting enough to listen to until the meal was ready, and thanks to it, you found out what had happened to him in the past. | While you were spending time chatting with one of the members, you happened to hear about a story from his past. He continued the story in a calm tone about what he did before becoming an adventurer and mercenary, and it was quite an interesting story. When the long story was over, he looked straight at you and spoke.%SPEECH_ON%It\'s been a long time since I had such a deep conversation with someone. Thanks for listening, Boss.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It was an interesting story",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.HedgeKnight1.getImagePath());
				_event.m.HedgeKnight1.improveMood(0.5, "Was feeling better");
				_event.m.HedgeKnight1.getFlags().add("PastDone");
				if (this.Math.rand(1, 100) <= 67)
				{
					local back_type = [
					"gambler_background",
					"thief_background",
					"graverobber_background",
					"killer_on_the_run_background",
					"raider_background",
					"wildman_background",
					"brawler_background",
					"militia_background",
					"squire_background",
					"apprentice_background",
					"retired_soldier_background",
					"vagabond_background",
					"refugee_background",
					"miner_background",
					"farmhand_background",
					"fisherman_background",
					"lumberjack_background",
					"poacher_background",
					"hunter_background",
					"sellsword_background"
					];
					local back_name = [
					"Gambler",
					"Thief",
					"Graverobber",
					"Killer",
					"Raider",
					"Wildman",
					"Brawler",
					"Militia",
					"Squire",
					"Apprentice",
					"Ex-Soldier",
					"Vagabond",
					"Refugee",
					"Miner",
					"Farmhand",
					"Fisherman",
					"Lumberjack",
					"Poacher",
					"Hunter",
					"Sellsword"
					];
					local back_check = [
					"background.gambler",
					"background.thief",
					"background.graverobber",
					"background.killer_on_the_run",
					"background.raider",
					"background.wildman",
					"background.brawler",
					"background.militia",
					"background.squire",
					"background.apprentice",
					"background.retired_soldier",
					"background.vagabond",
					"background.refugee",
					"background.miner",
					"background.farmhand",
					"background.fisherman",
					"background.lumberjack",
					"background.poacher",
					"background.hunter",
					"background.sellsword"
					];
					back_type = this.new("scripts/skills/backgrounds/" + back_type[this.Math.rand(0, back_type.len() - 1)]);
					back_type.m.RawDescription = _event.m.HedgeKnight1.getBackground().m.RawDescription + " You have heard about %name%\'s past, but that is not important. What matters is that %name% is a member of %companyname%.";
					_event.m.HedgeKnight1.getSkills().removeByID(_event.m.HedgeKnight1.getBackground().getID());
					_event.m.HedgeKnight1.getSkills().add(back_type);
					for( local i = 0; i < back_check.len(); i = ++i )
					{
						if (_event.m.HedgeKnight1.getSkills().hasSkill(back_check[i]))
						{
							_event.m.Title1 = back_name[i];
						}
					}
					_event.m.HedgeKnight1.getSkills().update();
				}
				else
				{
					local back_type = [
					"Warrior",
					"Runaway",
					"Inquisitor",
					"Orphan",
					"Tax Evader",
					"Revenger",
					"Prizefighter",
					"Proxy Duelist",
					"Craftsman",
					"Pirate",
					"Cheater",
					"Villager",
					"Ex-Convict",
					"Bookworm",
					"Outlaw",
					"Lover",
					"Romanticist",
					"Adulterer",
					"Bodyguard",
					"Hangman",
					"Daydreamer",
					"Vigilante",
					"Pacifist",
					"Collector",
					"Fixer",
					"Dancer",
					"Singer",
					"Trainer"
					];
					_event.m.Title1 = back_type[this.Math.rand(0, back_type.len() - 1)];
					back_type = this.new("scripts/skills/backgrounds/companion_1h_background");
					back_type.m.RawDescription = _event.m.HedgeKnight1.getBackground().m.RawDescription + " You have heard about %name%\'s past, but that is not important. What matters is that %name% is a member of %companyname%.";
					_event.m.HedgeKnight1.getSkills().removeByID(_event.m.HedgeKnight1.getBackground().getID());
					_event.m.HedgeKnight1.getSkills().add(back_type);
					_event.m.HedgeKnight1.getSkills().update();
				}
				this.List.push({
					id = 10,
					icon = this.Const.MoodStateIcon[_event.m.HedgeKnight1.getMoodState()],
					text = _event.m.HedgeKnight1.getName() + " was a " + _event.m.Title1
				});
				_event.m.HedgeKnight1.setTitle(_event.m.Title1);
			}
		});
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < 10)
		{
			return;
		}
		if (this.World.Flags.get("FantasyMonsterEncounter") != 1)
		{
			return;
		}
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];
		local rr = 1;
		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("trait.player"))
			{
				continue;
			}

			if (bro.getLevel() < 5)
			{
				continue;
			}

			if (bro.getSkills().hasSkill("effects.xxzzfantasy_skill") && !bro.getFlags().has("PastDone"))
			{
				candidates.push(bro);
			}
		}
		if (candidates.len() < rr)
		{
			return;
		}
		rr = this.Math.rand(0, candidates.len() - 1);
		this.m.HedgeKnight1 = candidates[rr];
		candidates.remove(rr);
		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"hedgeknight1",
			this.m.HedgeKnight1.getName()
		]);
	}

	function onClear()
	{
		this.m.Title1 = "Warrior";
		this.m.HedgeKnight1 = null;
	}

});

