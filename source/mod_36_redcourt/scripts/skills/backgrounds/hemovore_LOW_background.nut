this.hemovore_LOW_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hemovore_LOW"; //is young and therefore uses new sprites
		this.m.Icon = "ui/backgrounds/Background_hemovore_LOW_male.png";
		this.m.Name = "Fledgling";
		this.m.BackgroundDescription = "Even the lowest of society once enjoyed the advantages the religions and cults brought to the Empire, and now in the veil between life and death, these servents can no longer tell what is and once was.";
		this.m.GoodEnding = "In a world where there is no end, it can be difficult to find closure. %name% had lost everything during the collapse but thanks to the witch\'s magic, was able to live a reletively normal life out in the woods. At times, a witchhunter would peer closely between the cracks of the glamour, but %name% never stuck around long enough to see if it held.";
		this.m.BadEnding = "Waking in a world that had moved on without them was difficult for %name%. Using their abilities they found a few safe havens for their kind dotted across the desert, where they melded into the crypts and simply vanished.";		
		this.m.HiringCost = 450;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.craven",
			"trait.dastard",
			"trait.clubfooted",
			"trait.tiny",
			"trait.short_sighted",
			"trait.drunkard",
			"trait.insecure",
			"trait.night_blind",
			"trait.legend_fear_dark",
			"trait.deathwish", //Cannot lose res via being hit
			"trait.gluttonous", //does not eat
			"trait.asthmatic", //not really affected by fatigue
			"trait.fat", // doesn't eat
			"trait.spartan",  //no food required
			"trait.fear_nobles",
			"trait.fear_greenskins",
			"trait.greedy", //Not paid
			"trait.fear_beasts",
			"trait.fear_undead", //not scared of lesser dead
			"trait.legend_steady_hands",
			"trait.legend_sureshot",
			"trait.ailing" //cant be poisoned
		];
		
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill
		];		
		//Male
		this.m.Faces = ["bust_skeleton_head_05"]; //could also be 04 or 03
		this.m.Bodies = ["bust_skeleton_body_05"]; //could also be 04 or 03
		this.m.Hairs = this.Const.Hair.Vampire;
		this.m.HairColors = this.Const.HairColors.Zombie;
		// this.m.Beards = this.Const.Beards.Tidy;

		this.m.Level = this.Math.rand(1, 2);
		this.m.Names = this.Const.Strings.AncientSouthernNames;
		this.m.BackgroundType = this.Const.BackgroundType.Untalented | this.Const.BackgroundType.Outlaw;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Merciless;
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[1];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[1];

		this.m.Modifiers.Terrain = [
				0.0, // ?
				0.0, //ocean
				0.01, //plains 
				0.01, //swamp
				0.01, //hills
				0.01, //forest
				0.01, //forest
				0.01, //forest_leaves
				0.01, //autumn_forest
				0.01, //mountains
				0.0, // ?
				0.01, //farmland
				0.01, // snow
				0.01, // badlands
				0.01, //highlands
				0.01, //stepps
				0.0, //ocean
				0.01, //desert
				0.01 //oasis
			];

		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.CleaverTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.SpearTree
			],
			Defense = [
				this.Const.Perks.HemovoreTree
			],
			Traits = [
				this.Const.Perks.ViciousTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.FastTree
			],
			Enemy = [
				this.Const.Perks.CivilizationTree,
				this.Const.Perks.OutlawTree
			],
			Class = [
				this.Const.Perks.SpearfisherClassTree,
				this.Const.Perks.BeastClassTree
			],
			Profession = [],
			Magic = [
				this.Const.Perks.AssassinMagicTree
			]
		}
	}

	function setGender(_gender = -1)
	{
		if (_gender == -1) _gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);

		if (_gender != 1) return; //fucking kill me jesus christ
 			//Female
		this.m.Faces = ["bust_vampire_lady_head_01"]; //could also be 02
		this.m.Bodies = ["bust_vampire_lady_body_01"];	//could also be 02
		this.m.Hairs = this.Const.Hair.Vampire;
		this.m.HairColors = this.Const.HairColors.Zombie;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.Icon = "ui/backgrounds/Background_hemovore_LOW_female.png";
		this.m.Names = this.Const.Strings.SouthernFemaleNames;
		this.m.BackgroundDescription = "Serving girls and fishwives enjoyed all the amenities their partners had access to. For a time, life was good — but the bargins they made have haunted them for far, far longer than anticipated.";
		this.m.GoodEnding = "In a world where there is no end, it can be difficult to find closure. %name% had lost everything during the collapse but thanks to the witch\'s magic, was able to live a reletively normal life out in the woods. At times, a witchhunter would peer closely between the cracks of the glamour, but %name% never stuck around long enough to see if it held.";
		this.m.BadEnding = "Waking in a world that had moved on without them was difficult for %name%. Using their abilities they found a few safe havens for their kind dotted across the desert, where they melded into the crypt hierarchy and simply vanished.";	
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female)) //female
		{
			return "{The Empire stretched far and wide and those under its rule enjoyed the safety that came with it. %name% was just one small ant in a giant hive they could not comprehend. | %name% was, and insists she still is, a servant at the behest of a small household, they treated her well. Which should've been the first red flag she saw. | For over a decade, %name% toiled in the fields with her husband. Sometimes she wonders if he is still out there — buried in some unnamed crypt or hollow at the edge of the world. Would he even recognise her? | %name% spent much of her life drifting from one job to another. Years of hard labour and toil caused her to brush shoulders with some members of upper society, which is where it all started to go wrong.} {Corruption isn\'t initially noticable to the average person — %name% was no differant. It started with serving at parties, then attending parties...then becoming the main course. | Subtle things can corrupt the meekest minds — those wishing for a better life and to raise their status in society often discards parts of them themselves on the ascent. Maybe %name% shed too much in persuit of a better life? It is nobody\'s place but hers to judge. | %name% was accustomed to a life of hardship and boredom. For her, joining one of the many religions of the Empire was not only interesting, but allowed her to sub shoulders with many of the rich and powerful figures at the time. It started with fun and games, but quickly led to something darker. | Faced with having no home or title to their name, %name% joined one of the many cults of the Empire for any kind of charity they could bestow. | %name% was a battlefield physician, far before what she is now. She took extra care to attend to the wounded until a plague swept through the camp. On her deathbed she was given a choice — succumb to a long, painful death. Or join a greater cause.} {With little left to go back to, she awoke recently and has been living on the fringes of civilisation. | After several close shaves with packs of witchhunters, %name% decided to play it safe and took to living in the wilds where no beast or woodsman was a match for her. | After she awoke centuries later, %name% came across a group of primitives wearing bags over their heads — maybe not much has changed after all? | %name% now drifts from coven to coven to find answers, only to be rejected at every turn in persuit of answers.}";
		}
		else //male
		{
			return "{Some men aren\'t destined for greatness, %name% was one such man. He struggled to make a living with whatever job he could within the Empire. | Once a miner in the hills of a vast city, %name% recalls the time that everyone gave thanks to the gods before going into the mines. As the times changed, so did the gods — and so did the sacrifices for passage below. | %name% worked for years as a labourer in the inner city, one day the call to war came and he answered. | A long time ago, %name% could\'ve been considered a member of royalty. However, he admits that he was only thirty-second in the line of succession — but a claim is a claim, right?} {Despite this stable life, %name% found themselves within a conspiracy against a superior gone wrong, and one they still insist not being a part of. | He was content at the time with letting things just be — life in the empire was good for everyone, for a time. | %name% found themselves serving as an auxillery in one of the many royal armies at the time. The pay was good, but the safety was better. If the religions throughout the empire hadn\'t meddled, maybe %name% would not be here today. | As the harvests failed each year, the food got more scarce. Something dark swept over the lands — birds died, animals disappeared. Soon %name% fell to the same fate as everyone else. | In the final days of the Empire, %name% drifted from city to city, hoping to find some glimmer of light still remaining from what was before. With no hope left, he took his own life — and somehow awoke centuries later.} {%name% has adjusted well to their new life — a form of dark vitality has blossomed in the wake of what they have lost. | %name% struggled with their new form at first — having children run at the sight of you and farmers try to run you through with a pitchfork can take some getting used to, after all. | %name% had little issue finding comfort in their new condition, they experienced what they always wanted — just not in a manner that they expected. | For %name%, this change of events has been difficult. They visted where their home once stood, and found only mossy foundations and a bandit camp. Despite being a dozen well armed men, they fled at the sight of him.}";
		}
	}

	function onChangeAttributes()  //'tag' denotes a skill that is increased, 'untag' denotes a skill that is decreased below the base
	{
		local c = {
			Hitpoints = [ //untag
				9,
				13
			],
			Bravery = [
				5,
				10
			],
			Stamina = [
				20,
				25
			],
			MeleeSkill = [
				8,
				10
			],
			RangedSkill = [
				-50,
				-50
			],
			MeleeDefense = [
				3,
				6
			],
			RangedDefense = [
				5,
				7
			],
			Initiative = [ //tag
				20,
				40
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		// actor.m.Container.add(this.new("scripts/skills/racial/vampire_racial"));
		if (this.m.IsNew) 
		{
			this.m.Container.add(this.new("scripts/skills/racial/vampire_racial"));
		}

		local actor = this.getContainer().getActor();
		actor.m.ExcludedInjuries = [ 
			"injury.infected_wound",
			"injury.sickness",
		];
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip()
		ret.push(
			{
				id = 13,
				type = "text",
				icon = "ui/icons/armor_body.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot equip body or head armour[/color], but receives [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less damage from direct attacks. Damage threshold for injuries increased by [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color]"
			}
		)
		return ret
	}
	
	function onAddEquipment()
	{
			// /Talents
		// local talents = this.getContainer().getActor().getTalents();
		// talents.resize(this.Const.Attributes.COUNT, 0);
		// talents[this.Const.Attributes.Initiative] = 2;
		this.getContainer().getActor().fillTalentValues(3, true);

			///Armour
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickHelmet([
			[1, ""]
		]));
		items.equip(this.Const.World.Common.pickArmor([
			[1, ""]
		]));

			///Weapons
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
		items.equip(this.new("scripts/items/weapons/ancient/broken_ancient_sword"));
		}
		else if (r == 1)
		{
		items.equip(this.new("scripts/items/weapons/ancient/falx"));
		}
		else if (r == 2)
		{
		items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
		}
		else if (r == 3)
		{
		items.equip(this.new("scripts/items/weapons/ancient/ancient_sword"));
		}
		else if (r == 4)
		{
		items.equip(this.new("scripts/items/weapons/ancient/khopesh"));
		}
		else if (r == 4)
		{
		items.equip(this.new("scripts/items/weapons/ancient/legend_sica"));
		}
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.DamageReceivedRegularMult *= 0.90; //10% reduction
		_properties.ThresholdToReceiveInjuryMult *= 1.30; //+30% higher threshold
	}

});