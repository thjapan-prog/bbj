this.vampire_recruits_skeleton_event <- this.inherit("scripts/events/event", {
	m = {
		Dude = null
	},
	function create()
	{
		this.m.ID = "event.vampire_recruits_skeleton";
		this.m.Title = "Mistaken Identity";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({ //—
			ID = "A",
			Text = "[img]gfx/ui/events/event_73.png[/img]After all this time, you find yourself back home. The sky turns and writhes in pain over the monolith as distant shapes skitter around the bottom of the pit. The occasional scouting party of legionaries marching in lock-step formation depart from the caverns below as hemovores twist and turn out of the sky and take perch on the higher parts of the scaffolding under the Monolith\'s looming shadow. You are not welcome here, but at this distance you should blend in for now.\n\n From a nearby mound of stripped landscape a figure emerges from the trees — clad in blemished armour and wielding a chipped weapon. As they close the distance it is clear to you now — this was, or rather still is, a legionary who seems to have confused you for it\'s officer.\n\n The socketless eyes stare blankly at you, probing your mind for recognition like a stray dog does for affection.\n The bones of the warrior are pocked with dents, cuts, breaks and other injuries — unsure if this is what led to their current state or if they have picked them up along the way. Whoever this once was, you are sure you can think of a compelling name and place for them in your band of misfits.",
			Image = "",
			List = [],
			Characters = [], 
			Options = [
				{
					Text = "Let\'s give you a good name...",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Dude);
						this.World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						return 0;
					}
				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.Dude = roster.create("scripts/entity/tactical/player");
				_event.m.Dude.getFlags().add("PlayerSkeleton");
				_event.m.Dude.getFlags().add("undead");
				_event.m.Dude.getFlags().add("skeleton");
				_event.m.Dude.setStartValuesEx([
					"hemovore_praetorian_background"
				]);
				_event.m.Dude.getSkills().add(this.new("scripts/skills/racial/skeleton_racial"));
				_event.m.Dude.getSkills().add(this.new("scripts/skills/traits/skeletal_trait"));

				this.Characters.push(_event.m.Dude.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.Assets.getOrigin().getID() != "scenario.hemovores") //only happens with this origin
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();
		local locations = this.World.EntityManager.getLocations();
		local nearSite = false;

		foreach( v in locations )
		{
			if (v.getTypeID() == "location.black_monolith" && v.getTile().getDistanceTo(currentTile) < 5)
			{
				nearSite = true;
				break;
			}
		}

		if (!nearSite)
		{
			return;
		}

		this.m.Score = 25;
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

