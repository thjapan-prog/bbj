this.hemovores_avatar_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.hemovores_avatar";
		this.m.Name = "The First Bloodline"; //contains avatar
		this.m.Description = "[p=c][img]gfx/ui/events/event_101.png[/img][/p][p]You have lived a thousand lives so far, but those less fortunate than you are in need of correction. \n[color=#bcad8c]High Stakes:[/color] Start with a powerful ancient necrosavant, an unloyal retainer and 3 unlucky mercenaries. Buy and sell prices are 30% worse. \n[color=#bcad8c]Bent Purpose:[/color] You are powerful enough to shield yourself and your kind from mortal eyes. Any mortal that joins you is willing to die for you — but if you die, your grip on their minds will be broken and everything will end.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 192;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(4);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(27);
		this.m.StartingBusinessReputation = 0; //None
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 5; i = ++i ) //5 starters
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			///---
			bro.m.HireTime = this.Time.getVirtualTimeF();

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll(); //— 
		///---
		bros[0].setStartValuesEx([ // 1
			"manhunter_background",
			"nomad_background",
			"slave_background",
			"tailor_background",
			"daytaler_background",
			"gravedigger_background",
			"graverobber_background",
			"apprentice_background"
		]);
		bros[0].getSkills().add(this.new("scripts/skills/traits/enthralled_trait")); //merc
		bros[0].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "%name% is barely a fighter on the best of days — their recent actions when you encountered them made you sure of that. Given some proper \'courage\' they could be made a halfway decent fighter... or a halfway decent distraction.";
		bros[0].setPlaceInFormation(3);
		bros[0].setVeteranPerks(2);
		///---
		bros[1].setStartValuesEx([ // 2
			"disowned_noble_background",
			"adventurous_noble_background",
			"retired_soldier_background",
			"swordmaster_background",
			"sellsword_background",
			"militia_background",
			"bastard_background",
			"hunter_background",
			"beast_hunter_background",
			"legend_conscript_background",
			"legend_noble_ranged",
			"legend_noble_2h",
			"legend_noble_shield",
			"raider_background"
		]);
		bros[1].getSkills().add(this.new("scripts/skills/traits/enthralled_trait")); //merc
		bros[1].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "%name% was one of the harder converts to your menagerie, cursing this way and that until you eventually peered deep enough to offer something they couldn\'t refuse.";
		bros[1].setPlaceInFormation(4);
		bros[1].setVeteranPerks(2);
		///---
		bros[2].setStartValuesEx([ //3
			"butcher_background",
			"hedge_knight_background",
			"hunter_background",
			"sellsword_background",
			"militia_background",
			"bastard_background",
			"poacher_background",
			"retired_soldier_background"
		]);
		bros[2].getSkills().add(this.new("scripts/skills/traits/enthralled_trait")); //merc
		bros[2].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "While tough on the battlefield, the slaughter of their commander caused them to be one of the first to openly barter with you, much to the horror of their comrades. At first it was gold, then fine wine and then eventually the conversation rolled around to women. A particular woman in fact. You aim to keep your side of the bargin but %name% may not like how much you intend to twist the words of their contract.";
		bros[2].setPlaceInFormation(5);
		bros[2].setVeteranPerks(2);
		///---
		bros[3].setStartValuesEx([ // 4
			"hemovore_MED_background" 
		]);
		bros[3].getSkills().add(this.new("scripts/skills/traits/hemovore_trait")); //vampire racial stuff
 		bros[3].getSprite("socket").setBrush("bust_base_undead");
		bros[3].getSkills().getAllSkillsOfType(this.Const.SkillType.Background)[0].m.RawDescription = "%name% has been in your service for some time now, once a slave of your family a long time ago they have risen through the order in both status and skill. What remains to be seen is if their ambitions surpass their current loyalty to you.";
 		this.addScenarioPerk(bros[3].getBackground(), this.Const.Perks.PerkDefs.VampireAncientWisdom);
 		bros[3].m.PerkPointsSpent += 2;
		bros[3].setPlaceInFormation(12);
		bros[3].setVeteranPerks(2);
		///---
		bros[4].setStartValuesEx([ // 5
			"hemovore_avatar_background"
		]);
		bros[4].getSkills().add(this.new("scripts/skills/traits/hemovore_trait")); //vampire racial stuff
 		bros[4].getSprite("socket").setBrush("bust_base_undead");
 		bros[4].getSprite("miniboss").setBrush("bust_miniboss_undead"); //AVATAR
 		bros[4].getFlags().set("IsPlayerCharacter", true); //AVATAR
 		bros[4].getSkills().add(this.new("scripts/skills/traits/player_character_trait")); //AVATAR
 		this.addScenarioPerk(bros[4].getBackground(), this.Const.Perks.PerkDefs.VampireAncientWisdom);
		this.addScenarioPerk(bros[4].getBackground(), this.Const.Perks.PerkDefs.VampireDarkflight);
		bros[4].m.PerkPointsSpent += 2;
		bros[4].setPlaceInFormation(13);
		bros[4].setVeteranPerks(2);

		//Starting stash & mortality
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/cured_rations_item"));
		this.World.Assets.m.Money = this.World.Assets.m.Money * 1;
		this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts * 1;
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 1;
		this.World.Assets.m.Ammo = this.World.Assets.m.Ammo / 1;
		this.World.Assets.addMoralReputation(-30.0);
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
		this.World.State.m.Player.getSprite("body").setBrush("figure_vampire_01"); // World map look, could be 02.
		this.World.State.m.Player.getSprite("body").setHorizontalFlipping(true); // Flip world map look
		this.World.State.m.Player.setSpriteOffset("body", this.createVec(4, 0)) // x axis, y axis. Postive values move left, negative values move right.
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([ //Start music
				"music/undead_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.vampire_avatar_scenario_intro"); 
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

	function onCombatFinished()
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}

	///TEST

	function onHiredByScenario( bro ) //Recruitment rules
	{
		if (bro.getBackground().getID() == "background.hemovore_LOW" || bro.getBackground().getID() == "background.hemovore_MED" || bro.getBackground().getID() == "background.hemovore_HIGH" || bro.getBackground().getID() == "background.hemovore_magic")
		{
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
			bro.getSkills().add(this.new("scripts/skills/traits/enthralled_trait"));
			bro.improveMood(3.0, "Everything I want could be mine...and more!");
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