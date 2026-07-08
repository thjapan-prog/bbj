// =====================================================================
//  Aura Power - Origin: "Blood of the Last House"
//
//  A SOLO origin (single character; if he dies the campaign ends). The heir
//  starts at Level 4, already at Aura Awakening with Sovereign Seed potential,
//  high Lone-Wolf-tier base stats, and a famous two-handed family heirloom.
//
//  Modelled on rf_random_solo (Reforged's own solo origin) - Legends script
//  hooks are NOT active here, so we avoid all Legends-only methods.
//
//  The aura grant, stat floor, and the heirloom weapon are all set here in
//  onSpawnAssets (fresh-campaign creation, safe). The heirloom is just a random
//  two-handed weapon - we deliberately do NOT touch the perk tree / weapon
//  masteries (left to play out naturally). All of this lives in our mod only.
// =====================================================================
this.aura_inheritor_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.aura_inheritor";
		this.m.Name = "Blood of the Last House";
		this.m.Description = "[p=c][img]gfx/ui/events/event_24.png[/img][/p][p]Your house was not the largest nor the most feared, but it held something the others did not. Three generations back, your grandfather\'s grandfather stood before the empty throne and was found worthy. He rose to Aura King, and for a time the family name meant something the world was careful not to speak too carelessly. That era is gone. The rival kingdom moved when your house was weakest, in the grey years after the last King\'s death, and they did not move with mercy. What they left you with is a name no one recognises, no walls to return to, and an aura in the blood that has been burning hotter every year since the fires cooled.[/p][p][color=#bcad8c]Awakened Heir:[/color] You begin alone at [color=#bcad8c]Level 4[/color], already at [color=#bcad8c]Aura Awakening[/color] - the first tier of ascension - with [color=#bcad8c]Sovereign Seed[/color] potential. The trial threshold at every tier comes to you at better odds than any other soul alive.\n[color=#bcad8c]The Blood Remembers:[/color] High talent in [color=#bcad8c]Fatigue[/color], [color=#bcad8c]Melee Skill[/color], [color=#bcad8c]Melee Defense[/color], and [color=#bcad8c]Resolve[/color], and a famous two-handed weapon carried out of the ruin of the house.\n[color=#c90000]A House of One:[/color] There is no company. You walk alone. If you fall, there is nothing left of the bloodline, and this story ends without an Aura King. There is no recovery from death.\n[color=#c90000]Nothing Else Survived:[/color] The treasury burned with everything else. You begin with very little coin.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 60;
	}

	function onSpawnAssets()
	{
		local roster = ::World.getPlayerRoster();

		local bro = roster.create("scripts/entity/tactical/player");
		bro.m.HireTime = ::Time.getVirtualTimeF();
		bro.setName(::Const.Strings.CharacterNames[::Math.rand(0, ::Const.Strings.CharacterNames.len() - 1)]);
		bro.setPlaceInFormation(4);
		bro.improveMood(2.0, "The last of a fallen house");

		// Avatar marker (Reforged-native, used by rf_random_solo). The flag is
		// what onCombatFinished checks; the trait integrates the protagonist UI.
		try { bro.getSkills().add(::new("scripts/skills/traits/player_character_trait")); } catch (e) {}
		bro.getFlags().set("IsPlayerCharacter", true);

		// Background: hedge knight - the Lone Wolf template (a martial wanderer
		// with a rich perk tree and many weapon/armour skills to learn), fitting
		// a warrior heir far better than a disowned noble. The fallen-house story
		// is told via the RawDescription below.
		bro.setStartValuesEx([ "hedge_knight_background" ]);
		try
		{
			// Relabel the displayed background so it reads as the story, not
			// "Hedge Knight" - we keep the hedge-knight perk tree (rich skills to
			// learn) but show a fitting name. This is purely the display string;
			// the perk tree is bound to the class, so nothing mechanical changes.
			bro.getBackground().m.Name = "Fallen Scion";
			bro.getBackground().m.RawDescription = "%name% is the last living descendant of a house that once raised an Aura King from the same blood. He carries that inheritance like a stone no one else can see - it does not slow him, but it is always there. The kingdom that shattered his family did not finish the work, and he has spent every year since ensuring that was a mistake. He will rebuild nothing. He will reclaim nothing but the right to make them understand what they destroyed.";
			bro.getBackground().buildDescription(true);
		}
		catch (e) {}
		bro.setTitle("the Last Heir");

		// Talents: focus the four the bloodline taught at 2-3 stars (never lower);
		// everything else zero. Resolve is the Bravery attribute internally.
		bro.m.Talents = [];
		bro.m.Attributes = [];
		local talents = bro.getTalents();
		talents.resize(::Const.Attributes.COUNT, 0);
		talents[::Const.Attributes.Fatigue]     = ::Math.rand(2, 3);
		talents[::Const.Attributes.MeleeSkill]  = ::Math.rand(2, 3);
		talents[::Const.Attributes.MeleeDefense]= ::Math.rand(2, 3);
		talents[::Const.Attributes.Bravery]     = ::Math.rand(2, 3);
		bro.fillAttributeLevelUpValues(::Const.XP.MaxLevelWithPerkpoints - 1);
		bro.m.PerkPoints = 3;
		bro.m.LevelUps = 3;
		bro.m.Level = 4;

		// Prodigy: raise BASE attributes (m.BaseProperties - the actual sheet
		// stat) to a Lone-Wolf-tier FLOOR; only lifted if rolled lower. NOTE max
		// fatigue is "Stamina", not "Fatigue", on a Properties object.
		try
		{
			local b = bro.m.BaseProperties;
			if (b.Hitpoints    < 60)  b.Hitpoints    = 60;
			if (b.Bravery      < 50)  b.Bravery      = 50;   // Resolve
			if (b.Stamina      < 110) b.Stamina      = 110;  // max Fatigue
			if (b.Initiative   < 100) b.Initiative   = 100;
			if (b.MeleeSkill   < 68)  b.MeleeSkill   = 68;
			if (b.MeleeDefense < 12)  b.MeleeDefense = 12;
			if (b.RangedDefense< 5)   b.RangedDefense= 5;
			::logInfo("Aura Power: Last Heir base stats raised to Lone-Wolf-tier floor.");
		}
		catch (e) { ::logError("Aura Power: Last Heir stat floor - " + e); }

		// Aura: forced Sovereign Seed potential + Aura Awakening tier. Pre-seed
		// the potential flag (+ migrated marker) so the schema-v2 roll cannot
		// overwrite it; setTier wires the full Tier I aura kit.
		try
		{
			local f = bro.getFlags();
			f.set("aura_potential_v2", ::AuraPower.Potential.SovereignSeed);
			f.set("aura_potential_v2_migrated", true);
			if (::AuraPower.getTier(bro) < ::AuraPower.Tier.Awakening)
				::AuraPower.setTier(bro, ::AuraPower.Tier.Awakening);
			::logInfo("Aura Power: Blood of the Last House - " + bro.getName()
				+ " starts at Awakening with Sovereign Seed.");
		}
		catch (e)
		{
			::logError("Aura Power: Last Heir aura grant - " + e);
		}

		// Family heirloom: a famous TWO-HANDED weapon, random each campaign. Just
		// the weapon - NO perk/mastery linking (the player asked to leave skills
		// alone). Create the item FIRST, then clear the hands, then equip, so a
		// failure can never leave him unarmed.
		try
		{
			local pool = [
				"named_greatsword",
				"named_warbrand",
				"named_two_handed_scimitar",
				"named_greataxe",
				"named_two_handed_hammer",
				"named_two_handed_mace",
				"named_two_handed_spiked_mace",
				"named_two_handed_flail"
			];
			local weaponScript = pool[::Math.rand(0, pool.len() - 1)];

			local heirloom = ::new("scripts/items/weapons/named/" + weaponScript);
			if (heirloom != null)
			{
				local items = bro.getItems();
				local mh = items.getItemAtSlot(::Const.ItemSlot.Mainhand);
				if (mh != null) items.unequip(mh);
				local oh = items.getItemAtSlot(::Const.ItemSlot.Offhand);
				if (oh != null) items.unequip(oh);
				items.equip(heirloom);

				::logInfo("Aura Power: Last Heir heirloom '" + heirloom.getName()
					+ "' = " + weaponScript + ".");
			}
		}
		catch (e) { ::logError("Aura Power: Last Heir heirloom - " + e); }

		// A fallen house has nothing else. Lean start.
		bro.getSkills().update();
		::World.Assets.getStash().add(::new("scripts/items/supplies/ground_grains_item"));
		::World.Assets.m.Money = ::World.Assets.m.Money / 3;
		::World.Assets.m.ArmorParts = ::World.Assets.m.ArmorParts / 2;
		::World.Assets.m.Medicine = ::World.Assets.m.Medicine / 2;
		::World.Assets.m.Ammo = 0;
	}

	function onSpawnPlayer()
	{
		// Vanilla-safe placement (vanilla lone_wolf pattern). NO Reforged
		// navigator.findPath (which the rf_random_solo copy used and which is the
		// kind of dependency that breaks a standalone stack). A guard counter
		// caps the search loop so it can NEVER hang, even if no road tile is
		// found near the village.
		local randomVillage = null;
		local settlements = ::World.EntityManager.getSettlements();
		for (local i = 0; i < settlements.len(); i = i + 1)
		{
			randomVillage = settlements[i];
			if (randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3 && !randomVillage.isSouthern())
				break;
		}
		if (randomVillage == null && settlements.len() > 0) randomVillage = settlements[0];

		local origin = randomVillage.getTile();
		// Search a WIDER ring (+-4) for a road tile. CRUCIAL: also remember any
		// valid EMPTY land tile as a fallback, so if no road tile turns up we
		// still spawn on solid, unoccupied ground - never on the settlement tile
		// itself (spawning the party on an occupied/settlement tile is what made
		// the next world finalisation hang on some seeds).
		local spawnTile = null;     // preferred: an empty road tile
		local fallbackTile = null;  // any empty land tile near the village
		for (local g = 0; g < 600 && spawnTile == null; g = g + 1)
		{
			local x = ::Math.rand(::Math.max(2, origin.SquareCoords.X - 4), ::Math.min(::Const.World.Settings.SizeX - 2, origin.SquareCoords.X + 4));
			local y = ::Math.rand(::Math.max(2, origin.SquareCoords.Y - 4), ::Math.min(::Const.World.Settings.SizeY - 2, origin.SquareCoords.Y + 4));
			if (!::World.isValidTileSquare(x, y)) continue;
			local tile = ::World.getTileSquare(x, y);
			if (tile.Type == ::Const.World.TerrainType.Ocean || tile.Type == ::Const.World.TerrainType.Shore) continue;
			if (tile.getDistanceTo(origin) == 0) continue;
			if (tile.IsOccupied) continue;
			fallbackTile = tile;
			if (tile.HasRoad) spawnTile = tile;
		}
		if (spawnTile == null) spawnTile = (fallbackTile != null) ? fallbackTile : origin;

		::World.State.m.Player = ::World.spawnEntity("scripts/entity/world/player_party", spawnTile.Coords.X, spawnTile.Coords.Y);
		try { ::World.Assets.updateLook(6); } catch (e) {}
		::World.getCamera().setPos(::World.State.m.Player.getPos());
		::logInfo("Aura Power: Last Heir party placed (road=" + spawnTile.HasRoad + ").");

		// Music + the origin intro story, deferred ~1s so the world map is up
		// before the window opens (the vanilla lone_wolf / rf_random_solo pattern).
		::Time.scheduleEvent(::TimeUnit.Real, 1000, function ( _tag )
		{
			try { ::Music.setTrackList(::Const.Music.IntroTracks, ::Const.Music.CrossFadeTime); } catch (e) {}
			try { ::World.Events.fire("event.aura_blood_intro"); } catch (e) {}
		}, null);

		// Story: the rival kingdom at the TOP of the map - the northern noble
		// house, whose settlements sit at the highest Y (this is exactly how the
		// "Northern Raiders" origin defines "north") - is the one that destroyed
		// the heir's house. Make it hostile to the player. Pure vanilla faction
		// API, so this works standalone.
		try
		{
			local nobles = ::World.FactionManager.getFactionsOfType(::Const.FactionType.NobleHouse);
			local enemy = null;
			local bestY = -1.0;
			foreach (n in nobles)
			{
				local sumY = 0.0;
				local cnt = 0;
				foreach (s in n.getSettlements())
				{
					sumY += s.getTile().SquareCoords.Y;
					cnt = cnt + 1;
				}
				if (cnt > 0)
				{
					local avgY = sumY / cnt;
					if (avgY > bestY) { bestY = avgY; enemy = n; }
				}
			}
			if (enemy != null)
			{
				enemy.addPlayerRelation(-200.0, "The northern kingdom that razed your house and your name");
				::logInfo("Aura Power: Last Heir - northern kingdom '" + enemy.getName()
					+ "' set hostile (avgY=" + bestY + ").");
			}
		}
		catch (e) { ::logError("Aura Power: Last Heir northern enemy - " + e); }
	}

	// Avatar: the campaign ends if no IsPlayerCharacter remains alive.
	function onCombatFinished()
	{
		local roster = ::World.getPlayerRoster().getAll();
		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}
		return false;
	}
});
