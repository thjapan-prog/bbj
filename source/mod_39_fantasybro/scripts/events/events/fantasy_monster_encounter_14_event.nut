this.fantasy_monster_encounter_14_event <- this.inherit("scripts/events/event", {
	m = {
		HedgeKnight1 = null
	},
	function create()
	{
		this.m.ID = "event.fantasy_monster_encounter_14_event";
		this.m.Title = "Sudden Events...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_43.png[/img]{You heard rumors that the {village people | girls | women | children} in the town you previously visited were brutally murdered. Some people seem to believe that it was done by your mercenary group, an external force. Such misunderstandings and bad reputations are common for mercenary groups. You recalled a few members acting suspiciously but soon dismissed the thought.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "%hedgeknight1% may have something to do with it, but that\'s none our business.",
					function getResult( _event )
					{
						local r = 2;
						_event.m.HedgeKnight1.getBaseProperties().MeleeSkill += r;
						_event.m.HedgeKnight1.getBaseProperties().RangedSkill += r;
						_event.m.HedgeKnight1.getBaseProperties().Initiative += r;
						_event.m.HedgeKnight1.getBaseProperties().Bravery += r;
						_event.m.HedgeKnight1.improveMood(10, "Was feeling better");
						_event.m.HedgeKnight1.getSkills().update();
						this.List.push({
							id = 11,
							icon = "ui/icons/plus.png",
							text = _event.m.HedgeKnight1.getName() + "\'s melee skills, ranged skills, initiative and bravery +2."
						});
						return 0;
					}
				},
				{
					Text = "We march on.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
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
		foreach( bro in brothers )
		{
			if (!bro.getSkills().hasSkill("trait.player") && bro.getBackground().getID() == "background.killer_on_the_run")
			{
				candidates.push(bro);
			}
		}
		if (candidates.len() < 1)
		{
			return;
		}
		this.m.HedgeKnight1 = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 3;
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
		this.m.HedgeKnight1 = null;
	}

});

