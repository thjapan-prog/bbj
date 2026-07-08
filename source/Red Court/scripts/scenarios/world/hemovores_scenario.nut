this.hemovores_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.hemovores";
		this.m.Name = "The Red Court";
		this.m.Description = "[p=c][img]gfx/ui/events/event_33.png[/img][/p][p]The ancients call for order — but like always, the vote is the same. Another century passes and the time has still not come. Maybe you and a few loyalists could change that... \n[color=#bcad8c]The New Order:[/color] Start with 4 young necrosavants, you will encounter more of your kind hidden in towns. \n[color=#bcad8c]Frail Minds:[/color] A poultice will shield you and others from the eyes of mortal society. Any mortal that joins you is willing to die for you. Buy and sell prices are 30% worse.[/p]";
		this.m.Difficulty = 4;
		this.m.Order = 191; 
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(4);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(27);
		this.m.StartingBusinessReputation = 0; //None
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 4; i = ++i ) //4 starters
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			///---
 			bro.getSprite("socket").setBrush("bust_base_undead");
			///---
			bro.m.HireTime = this.Time.getVirtualTimeF();

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		///---
		bros[0].setStartValuesEx([ // 1
			"hemovore_LOW_background"
		]);
		bros[0].getSkills().add(this.new("scripts/skills/traits/hemovore_trait")); //vampire racial stuff
		bros[0].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "%name% was sick of the Ancients far before you ever came into the fold. For years they have plotted how they would go about exacting their revenge on what is, for the most part, an untouchable target. They lept at the idea of defying the Ancients and joining you for glory and adventure — just like all those centuries ago.";
 		this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.VampireAncientWisdom);		
		bros[0].m.PerkPointsSpent += 1;
		bros[0].setPlaceInFormation(3);
		bros[0].setVeteranPerks(2);
		///---
		bros[1].setStartValuesEx([ // 2
			"hemovore_MED_background"
		]);
		bros[1].getSkills().add(this.new("scripts/skills/traits/hemovore_trait")); //vampire racial stuff
		bros[1].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "%name% was, until recently, a devout servant of the Ancients. Years of faithful service to upper society was rewarded with excatly nothing. Finally seeing that they had been taken advantage of, %name% joined your expedition outside of the royal court — although they admit that they didn\'t plan any further than this point.";
 		this.addScenarioPerk(bros[1].getBackground(), this.Const.Perks.PerkDefs.VampireAncientWisdom);		
		bros[1].m.PerkPointsSpent += 1;		
		bros[1].setPlaceInFormation(4);
		bros[1].setVeteranPerks(2);
		///---
		bros[2].setStartValuesEx([ // 3
			"hemovore_LOW_background"
		]);
		bros[2].getSkills().add(this.new("scripts/skills/traits/hemovore_trait")); //vampire racial stuff
		bros[2].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "Once a notable member of nobility, %name% became imbittered in a violent coup that ultimately failed. Their co-conspiritors never gave them up, even after being beheaded and their bodies thrown into a river. Now they live with the guilt gnawing away inside them. Perhaps this is what the Ancients intended all along?";
 		this.addScenarioPerk(bros[2].getBackground(), this.Const.Perks.PerkDefs.VampireAncientWisdom);		
		bros[2].m.PerkPointsSpent += 1;		
		bros[2].setPlaceInFormation(5);
		bros[2].setVeteranPerks(2);
		///---
		bros[3].setStartValuesEx([ // 4
			"hemovore_LOW_background"
		]);
		bros[3].getSkills().add(this.new("scripts/skills/traits/hemovore_trait")); //vampire racial stuff
		bros[3].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "%name% is old — and very old at that. How someone so wise and long in the tooth is still of their status is beyond the reasoning of most. When asked the best you will get is 'I did it for her' — whatever that is supposed to mean...";
 		this.addScenarioPerk(bros[3].getBackground(), this.Const.Perks.PerkDefs.VampireAncientWisdom);		
		bros[3].m.PerkPointsSpent += 1;		
		bros[3].setPlaceInFormation(12);
		bros[3].setVeteranPerks(2);

		//Starting stash
		this.World.Assets.m.Money = this.World.Assets.m.Money / 1;
		this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 1;
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 1;
		this.World.Assets.m.Ammo = this.World.Assets.m.Ammo / 1;
	}

	function onSpawnPlayer() // spawn player
	{
		local randomVillage;
		local northernmostY = 0;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			local v = this.World.EntityManager.getSettlements()[i];

			if (v.getTile().SquareCoords.Y > northernmostY && !v.isMilitary() && !v.isIsolatedFromRoads() && v.getSize() <= 2)
			{
				northernmostY = v.getTile().SquareCoords.Y;
				randomVillage = v;
			}

			i = ++i;
		}

		randomVillage.setLastSpawnTimeToNow();
		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 2), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 2));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 2), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 2));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		local attachedLocations = randomVillage.getAttachedLocations();
		local closest;
		local dist = 99999;
		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.State.m.Player.getSprite("body").setBrush("figure_vampire_02"); // World map look, could be 01.
		this.World.State.m.Player.getSprite("body").setHorizontalFlipping(true); // Flip world map look
		this.World.State.m.Player.setSpriteOffset("body", this.createVec(4, 0)) // x axis, y axis. Postive values move left, negative values move right.
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([ //Start music
				"music/undead_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.vampire_scenario_intro");
		}, null);

		foreach( a in attachedLocations )
		{
			if (a.getTile().getDistanceTo(randomVillageTile) < dist)
			{
				dist = a.getTile().getDistanceTo(randomVillageTile);
				closest = a;
			}
		}
	}

	function onInit() //Price changes
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BuyPriceMult = 1.3; //+30%
		this.World.Assets.m.SellPriceMult = 0.7; //-30%
	}

	///TEST

	function onHiredByScenario( bro ) //Recruitment rules
	{
		if (bro.getBackground().getID() == "background.hemovore_LOW" || bro.getBackground().getID() == "background.hemovore_MED" || bro.getBackground().getID() == "background.hemovore_HIGH" || bro.getBackground().getID() == "background.hemovore_magic")
		{
			bro.improveMood(2.0, "The new dawn has come!");
			bro.getSkills().add(this.new("scripts/skills/traits/hemovore_trait"));
			bro.getSprite("socket").setBrush("bust_base_undead");
		}
		else if (bro.getBackground().getID() == "background.cultist" || bro.getBackground().getID() == "background.hemovore_praetorian" || bro.getBackground().getID() == "background.legend_legion_legionary" || bro.getBackground().getID() == "background.legend_legion_gladiator_background")
		{
			bro.improveMood(2.0, "Has found a new calling...");
			bro.getSprite("socket").setBrush("bust_base_undead");
		}
		else //everyone else
		{
			bro.getSkills().add(this.new("scripts/skills/traits/glamoured_trait"));
			bro.improveMood(3.0, "I don\'t know how to put it - I feel really great!");
		}
	}

	function onUpdateHiringRoster( _roster )
	{
		local bros = _roster.getAll();
		this.addBroToRoster(_roster, "cultist_background", 4);
		this.addBroToRoster(_roster, "hemovore_LOW_background", 15);
		this.addBroToRoster(_roster, "hemovore_MED_background", 20);
		this.addBroToRoster(_roster, "hemovore_HIGH_background", 30);
	}

	function onGenerateBro(bro)
	{
		if (bro.getBackground().getID() == "background.hemovore_LOW" || bro.getBackground().getID() == "background.hemovore_MED" || bro.getBackground().getID() == "background.hemovore_HIGH" || bro.getBackground().getID() == "background.hemovore_magic")
		{				
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.0) //1.0 = default
			bro.getBaseProperties().DailyWageMult *= 1.0; //1.0 = default
			bro.getSkills().update();
		}
		else
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.0) //1.0 = default
			bro.getBaseProperties().DailyWageMult *= 1.0; //1.0 = default
			bro.getSkills().update();
		}
	}

	///TEST
	
	function isCultist( _background )
	{
		return _background.isBackgroundType(this.Const.BackgroundType.ConvertedCultist | this.Const.BackgroundType.Cultist);
	}

	function updateLook() // backend of this managed in asset_manager.
	{
		this.World.State.m.Player.getSprite("body").setBrush("figure_vampire_02"); // World map look, could be 01.
		this.World.State.m.Player.getSprite("body").setHorizontalFlipping(true); // Flip world map look
		this.World.State.m.Player.setSpriteOffset("body", this.createVec(1, 0)) // x axis, y axis. Positive values move left, negative values move right.
	}
});

