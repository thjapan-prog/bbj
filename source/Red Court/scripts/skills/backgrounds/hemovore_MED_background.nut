this.hemovore_MED_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hemovore_MED"; //is somewhat old
		this.m.Icon = "ui/backgrounds/Background_hemovore_MED_male.png";
		this.m.Name = "Attendant";
		this.m.BackgroundDescription = "Adepts once were the backbone of the Eternal Empire — merchants, bankers and minor nobles were many in their ranks. The gated society they once flourished in has gone, but the hunger for power remains.";
		this.m.GoodEnding = "Despite losing everything, %name% managed to reclaim some of their lost earnings, allbeit in a new currency than what they were used to. Using the crowns they hads tored away, %name% bought a home in the centre of town and masqueraded as a merchant — moving from town to town every few decades so the locals did not ask questions about how they remained so youthful.";
		this.m.BadEnding = "Just as before, greed is what got %name% in the end. The allure of gold prompted them to join another mercenary company. Their supernatural senses were call to attention and found themselves on the end of a stake to the heart.";			
		this.m.HiringCost = 600;
		this.m.DailyCost = 35;
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
		this.m.Faces = ["bust_skeleton_head_04"]; //could also be 05 or 03
		this.m.Bodies = ["bust_skeleton_body_04"]; //could also be 05 or 03
		this.m.Hairs = this.Const.Hair.Vampire;
		this.m.HairColors = this.Const.HairColors.Zombie;
		// this.m.Beards = this.Const.Beards.Tidy;

		this.m.Level = this.Math.rand(1, 3);
		this.m.Names = this.Const.Strings.AncientSouthernNames;
		this.m.BackgroundType = this.Const.BackgroundType.Untalented | this.Const.BackgroundType.Outlaw;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Merciless;
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[2];
		this.m.Modifiers.Terrain = [
				0.0, // ?
				0.0, //ocean
				0.02, //plains
				0.02, //swamp
				0.02, //hills
				0.02, //forest
				0.02, //forest
				0.02, //forest_leaves
				0.02, //autumn_forest
				0.02, //mountains
				0.0, // ?
				0.02, //farmland
				0.02, // snow
				0.02, // badlands
				0.02, //highlands
				0.02, //stepps
				0.0, //ocean
				0.02, //desert
				0.02 //oasis
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
				this.Const.Perks.MartyrTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.LargeTree
			],
			Enemy = [
				this.Const.Perks.OccultTree,
				this.Const.Perks.UndeadTree,
				this.Const.Perks.CivilizationTree,
				this.Const.Perks.OutlawTree
			],
			Class = [
				this.Const.Perks.ScytheClassTree,
				this.Const.Perks.BeastClassTree
			],
			Profession = [],
			Magic = []
		}
	}

	function setGender(_gender = -1)
	{
		if (_gender == -1) _gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);

		if (_gender != 1) return;
 			//Female
		this.m.Faces = ["bust_vampire_lady_head_01"]; //could also be 02
		this.m.Bodies = ["bust_vampire_lady_body_01"];	//could also be 02
		this.m.Hairs = this.Const.Hair.Vampire;
		this.m.HairColors = this.Const.HairColors.Zombie;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.Icon = "ui/backgrounds/Background_hemovore_MED_female.png";
		this.m.Names = this.Const.Strings.SouthernFemaleNames;
		this.m.BackgroundDescription = "The myriad of cults throughout the Empire attracted those from every walks of life, including the Empire\'s middle class, who now serve the the same power that enslaved them before — just in a more violent capacity.";
		this.m.GoodEnding = "Despite losing everything, %name% managed to reclaim some of their lost earnings, allbeit in a new currency than what they were used to. Using the crowns they hads tored away, %name% bought a home in the centre of town and masqueraded as a merchant — moving from town to town every few decades so the locals did not ask questions about how they remained so youthful.";
		this.m.BadEnding = "Just as before, greed is what got %name% in the end. The allure of gold prompted them to join another mercenary company. Their supernatural senses were call to attention and found themselves on the end of a stake to the heart.";
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female)) //female
		{
			return "{With her family once from a poor peasant farm, %name% spent a lifetime climbing her way to the top as a renowned merchant. | Built neither for hard labour or war — %name% found themselves work as an administrator for a public works office in the heart of the Empire. | %name% has a stature and manner that is almost invisible, if it were not for the sharp fangs and unhinged jaw — a mocking parody of their past self. | Once a banker and merchant, %name% now continues their pursuit of gold in this new life that has been given to them. Some joke that %name% has barely changed at all.} {After embezzling funds from her employer, %name% was due to be hanged from the neck until she was offered another way out — a way to serve the Empire and pay off her debts. | %name% experienced the fall of the Empire at a closer distance than she would\'ve liked — great marble colonnades were brought down and liberies were put to the torch. | The religions of the Empire mixed and blended togeather in the Empire, however %name% uncovered something far darker lurking under the canvas of society. Before they could publish their findings, things went awry quickly. | %name% joined the a cult at a very young age, inducted almost at birth into it\'s ranks. For her it was a way of preserving the heritage of the people she loved. Just not in the way they said it would. | %name% knew little of what the bargin they made really contained. But immortality and eternity beyond this existance is enough of a reason to compel anyone.} {In this new life, %name% carries on the traditions and name of the Empire. | Too terrifying to integrate back into society, your offer to once again blend in with this new world, as primitive as it may be, is a welcome one. | After several years on the run from witchhunters and mobs alike, %name% is finally ready to start fighting back. | The coinage and names have changed for %name%, but the struggle that is their existance still goes on.}";
		}
		else //male
		{
			return "{%name% ignored the trappings of city life and instead spent years focusing their career as a merchant. | %name%, ironically enough, was a warden of one of the richest cemeteries in the Empire. Watching over the tombs of the elite day and night for thieves. | Once a local champion and gladiator, %name% was struck down and fatally wounded. | %name% served as a legionary in the Empire — traveling far and wide across the territory to secure new space for the Empire to expand into.} {After years of faithful servitude, he was betrayed by a close friend and mentor, which found him swinging in a gibbet for his efforts. | He found himself in a brawl that turned violent, resulting in curses being shouted and knives being pulled. %name% was luckier than most, but still laying in the ground in a pool of his own gore. | %name% always dramed of something better than his current life. When a figure approached him with an offer on how he could server the Empire for years some come — he could not refuse. | Caught in a scheme that ended badly, %name% fell out of favour with the local cult — finding themselves or the other end of a ritual they heard so much about. | How he came to be what they are is a mystery — but %name% took it in their stride and has been using the full benefits of their newfound immortality.} {He now likes to hunt every night. While hunting at night isn\'t required — it does scare the average mortal considerably more. | %name% was caught by a few witchhunters not long before you found them. Luckily mere rope does not contain creatures of such strength for long. | While the situation with drinking blood and not keeping food down concerned him at first, %name% found a few ways around it and carries a small ledger indicating age, gender and even location of each victim he drinks from. Some are livestock. | After a close run-in with several billhooks, %name% gave up on trying to rekindle their fighting spirit. Sometimes discretion is the better part of valor but drinking sheep\'s blood can be demoralising at times.}";
		}
	}

	function onChangeAttributes() //'tag' denotes a skill that is increased, 'untag' denotes a skill that is decreased below the base
	{
		local c = {
			Hitpoints = [
				10,
				28
			],
			Bravery = [ //raise as default
				8,
				14
			],
			Stamina = [ //tag
				20,
				40
			],
			MeleeSkill = [ //tag
				15,
				35
			],
			RangedSkill = [
				-50,
				-50
			],
			MeleeDefense = [
				5,
				15
			],
			RangedDefense = [
				5,
				15
			],
			Initiative = [
				10,
				30
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot equip body or head armour[/color], but receives [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] less damage from direct attacks. Damage threshold for injuries increased by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			}
		)
		return ret
	}

	function onAddEquipment()
	{
			///Talents
		// local talents = this.getContainer().getActor().getTalents();
		// talents.resize(this.Const.Attributes.COUNT, 0);
		// talents[this.Const.Attributes.Hitpoints] = 1;
		// talents[this.Const.Attributes.Initiative] = 2;
		this.getContainer().getActor().fillTalentValues(4, true);

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
		r = this.Math.rand(0, 5);

		if (r == 0)
		{
		items.equip(this.new("scripts/items/weapons/ancient/khopesh"));
		}
		else if (r == 1)
		{
		items.equip(this.new("scripts/items/weapons/ancient/warscythe"));
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
		items.equip(this.new("scripts/items/weapons/ancient/legend_gladius"));
		}
		else if (r == 5)
		{
		items.equip(this.new("scripts/items/weapons/ancient/crypt_cleaver"));
		}
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.DamageReceivedRegularMult *= 0.90; //10% reduction
		_properties.ThresholdToReceiveInjuryMult *= 1.50; //+50% higher threshold
	}

});
