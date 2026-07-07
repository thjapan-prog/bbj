this.vampire_joins_event <- this.inherit("scripts/events/event", {
	m = {
		Dude = null,
	},
	function create()
	{
		this.m.ID = "event.vampire_joins";
		this.m.Title = "Word spreads...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay; 
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_76.png[/img]From the corner of your vision you notice a figure — their flesh is pale and gaunt as your own and in truth, you are unsure of how long they have been observing you. The company halts and takes stock of this new creature on the horizon, which moves towards you with a steady and confidant speed.\n\n The figure is indeed one of your own, perhaps another who has been jaded by the council and tired of their excuses.\n One more of your kind could make many hands and light work in future endevors...",
			Image = "", 
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We always need more like us.",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Dude);
						this.World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						return 0;
					}

				},
				{
					Text = "We won\'t take you.",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						return 0;
					}

				}
			],

			function start( _event ) //1 = least likely to generate.
			{
				local backgrounds = [
					[1,	"hemovore_HIGH_background"],
					[2, "hemovore_MED_background"],
					[3, "hemovore_LOW_background"]
				];
				local totalWeight = 0;
				local result = []
				foreach (background in backgrounds)
				{
				    totalWeight += background[0];
				}
				local r = this.Math.rand(0, totalWeight);
				foreach (background in backgrounds)
				{
				    r = r - background[0];
				    if (r <= 0)
				    {
				       result.push(background[1])
				      break;
				    }
				}
				local roster = this.World.getTemporaryRoster();
				_event.m.Dude = roster.create("scripts/entity/tactical/player");
				_event.m.Dude.setStartValuesEx(result);
				this.Characters.push(_event.m.Dude.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		if (this.World.Assets.getOrigin().getID() != "scenario.hemovores" && this.World.Assets.getOrigin().getID() != "scenario.hemovores_avatar") //THIS WORKS
		{
			return;
		}

		this.m.Score = 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
		this.m.Dude = null;
	}

});

