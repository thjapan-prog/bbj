this.vampire_recruits_mage_event <- this.inherit("scripts/events/event", {
	m = {
		Dude = null
	},
	function create()
	{
		this.m.ID = "event.vampire_recruits_mage";
		this.m.Title = "Ancient Knowledge";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({ //—
			ID = "A",
			Text = "[img]gfx/ui/events/event_173.png[/img]{While the desert reminds you of home, much has changed since you were last here. Landmarks of hills and mountains now are devoid of their artificial foregrounds — rivers and streams have long dried up while the wildlife that stalks the sands is more aggressive than you remember them to be. After a moment more, you begin to realise where you are and in doing so feel an uncanny sense of dread as you crest the next dune and see the old shimmering domes of gold that you once remembered.\n\n You are in the right place, just much higher above everything than you expected.\n\n There is an offshoot from the main dome that feels more inviting than the main concourse, which still has ropes pitched and swinging down from a forgotten camp not far from the shadow of the dome\'s peak. You do not bother with the rope, and instead merely will yourself down to the inside of the annex.\n Inside is much more organised than you\'d imagined — scrolls and books are all categorised correctly and neatly while large shelves have been repaired and maintained for quite some time.\n Many of the shelves have been build upon one another and stand tall several lengths of a man\'s height higher than yourself.\n Stopping for a moment, you notice that some dessicated remains have been swept to the darkest corner of the main hall, still clutching their weapons in fear.\n\n Something appears in your mind, as if a pin prick of light through a stone wall had just emerged in your conciousness. You blindly strike into the dark and a carrion dressed in robes falls to the floor as its head meanders in a differant direction. More shuffling can be heard in the dark but as you look into the shadows the figures prefer to study you with an un-natural restraint.\n\n From a darker corner, there is a differant kind of shuffling. It travels around the room with a supernatural pace that is hard to follow, it surveys you from all angles and eventually rests on a high shelf far above you with glinting eyes.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Watch back.",
					function getResult( _event ) 
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_89.png[/img]{The gargoyle like creature peers closer, as if not beliving its eyes while it studies you. After a few uneasy momemnts it clears its throat and starts to speak, but you speak, or rather call out, first.%SPEECH_ON%I know what you are!%SPEECH_OFF% The looming figure doesn\'t seem surpirsed by this, and calmly responds from the safety of its perch.%SPEECH_ON%I know what I am too, but what you were and what you are now are very much apart!%SPEECH_OFF% The figure gingerly moves into the backshadow of a nearby torch, but does not dismount from the bookshelf above. Part of you intends to go up there yourself — but so far the stranger has shown a surprising lack of aggression to you and those you have travelled with.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Come with us.",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Dude);
						this.World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						return 0;
					}
				},
				{
					Text = "I need fighters not scholars...",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						return 0;
					}
				}
			],
			function start( _event )
			{
				local roster = this.World.getTemporaryRoster();
				_event.m.Dude = roster.create("scripts/entity/tactical/player");
				_event.m.Dude.setStartValuesEx([
					"hemovore_magic_background"
				]);
				_event.m.Dude.getSkills().add(this.new("scripts/skills/traits/bright_trait"));
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

		local currentTile = this.World.State.getPlayer().getTile();
		local locations = this.World.EntityManager.getLocations();
		local nearSite = false;

		foreach( v in locations )
		{
			if (v.getTypeID() == "location.sunken_library" && v.getTile().getDistanceTo(currentTile) < 5)
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
		// _vars.push([
		// 	"joiner",
		// 	this.m.Dude.getName()
		// ]);
	}

	function onClear()
	{
		this.m.Dude = null;
	}

});

