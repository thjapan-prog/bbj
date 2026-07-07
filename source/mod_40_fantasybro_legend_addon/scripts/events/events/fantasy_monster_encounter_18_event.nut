this.fantasy_monster_encounter_18_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.fantasy_monster_encounter_18_event";
		this.m.Title = "Sudden Events...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "",
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
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

