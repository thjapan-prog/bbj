this.fantasy_monster_encounter_20_event <- this.inherit("scripts/events/event", {
	m = {
		HedgeKnight1 = null,
		Mname = ""
	},
	function create()
	{
		this.m.ID = "event.fantasy_monster_encounter_20_event";
		this.m.Title = "Sudden Events...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_06.png[/img]{You and a few of your comrades were at a tavern in casual attire when you heard a {villager | vagabond | brawler | drunkard} at a nearby table mention the name of your mercenary group.%SPEECH_ON%%companyname%? What a {shit name | scum}? When it comes to real mercenary groups, it\'s gotta be %mname%!%SPEECH_OFF%You had no intention of reacting to such trivial gossip, but %hedgeknight1%, who is always quick to anger, couldn\'t hold back this time either.%SPEECH_ON%{Hey, if you keep flapping your damn mouth, you\'ll be begging for a fist to your face. Got it? | Keep yapping like that, and you\'ll find yourself face-first in the dirt. | Damn motherfucker, are you itching to get hit?}%SPEECH_OFF%In an instant, a fight broke out. Luckily, no one died and it didn\'t lead to any major problems, but you\'re fed up with these unexpected situations.}",
			Image = "",
			List = [],
			Characters = [],
			Banner = [],
			Options = [
				{
					Text = "Damn it, just let me rest quietly.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				if (this.Math.rand(1, 100) <= 50)
				{
					local injury = _event.m.HedgeKnight1.addInjury(this.Const.Injury.Brawl);
					this.List = [
						{
							id = 10,
							icon = injury.getIcon(),
							text = _event.m.HedgeKnight1.getName() + " suffers " + injury.getNameOnly()
						}
					];
				}
				if (this.Math.rand(1, 100) <= 75)
				{
					local xxmoney = this.Math.rand(5, 500);
					this.World.Assets.addMoney(xxmoney);
					this.List.push({
						id = 11,
						icon = "ui/items/supplies/money.png",
						text = "You gain " + xxmoney + " gold"
					});
				}
				this.Characters.push(_event.m.HedgeKnight1.getImagePath());
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
		local currentTile = this.World.State.getPlayer().getTile();
		local nearTown = false;
		local towns = this.World.EntityManager.getSettlements();
		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(currentTile) <= 3)
			{
				nearTown = true;
				break;
			}
		}
		if (!nearTown)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];
		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.killer_on_the_run" || bro.getBackground().getID() == "background.thief" 
			|| bro.getBackground().getID() == "background.graverobber" || bro.getBackground().getID() == "background.raider" 
			|| bro.getBackground().getID() == "background.wildman" || bro.getBackground().getID() == "background.barbarian" 
			|| bro.getBackground().getID() == "background.brawler" || bro.getBackground().getID() == "background.nomad" 
			|| bro.getSkills().hasSkill("trait.bloodthirsty") || bro.getSkills().hasSkill("trait.brute") 
			|| bro.getBackground().getID() == "background.gambler")
			{
				candidates.push(bro);
			}
		}
		if (candidates.len() == 0)
		{
			return;
		}
		this.m.HedgeKnight1 = candidates[this.Math.rand(0, candidates.len() - 1)];
		local mname = this.Const.Strings.MercenaryCompanyNames;
		mname.push("Devil Dogs");
		mname.push("War Pigs");
		mname.push("Blood Raven");
		mname.push("Band of the Falcon");
		mname.push("Steel Wolves");
		mname.push("Lion Company");
		mname.push("Chimera Squad");
		mname.push("Blood Union Pack");
		mname.push("Free Merchants Guild");
		this.m.Mname = mname[this.Math.rand(0, mname.len() - 1)];
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
		_vars.push([
			"mname",
			this.m.Mname
		]);
	}

	function onClear()
	{
		this.m.HedgeKnight1 = null;
		this.m.Mname = null;
	}

});

