this.avatar_vampire_recruits_skeleton_event <- this.inherit("scripts/events/event", {
	m = {
		Dude = null
	},
	function create()
	{
		this.m.ID = "event.avatar_vampire_recruits_skeleton";
		this.m.Title = "At the Monolith...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({ //—
			ID = "A",
			Text = "[img]gfx/ui/events/event_73.png[/img]Finding yourself back at the Black Monolith, the remains of your kind huddle around the artefact like beggers to an open fire. In the distance a crowd gathers and circles the pit, tiny black shapes across the dark brush strokes of the great crater. The Monolith hums gently and you notice a familiar face with a skeleton draped with rags in tow.%SPEECH_ON%I\'m glad you came back, we were almost forgetting your last visit.%SPEECH_OFF%Wilhelm smiled through his crooked fangs, knowing full well that you wouldn't dare hit a messenger of the Emperor.%SPEECH_ON%He has been watching closely and has taken pity on your very noble cause — so much as to grant you one of his best and most faithful!%SPEECH_OFF%The legionary creaked under the weight of the armour — their bleached bones looked unremarkable as they stood silently to attention. As you stared deeply into their empty sockets, something stirred within them, something that made you and he feel a brief connection.%SPEECH_ON%Our masters feel that while you have earned the extra help, your progress thus far has not earned anything beyond that. You may take him or leave him with us, it matters not to me.%SPEECH_OFF%",
			Image = "", 
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Fine, insult accepted — give him to me.",
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

		if (this.World.Assets.getOrigin().getID() != "scenario.hemovores_avatar") //only happens with this origin
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

