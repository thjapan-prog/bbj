this.hemovore_HIGH_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hemovore_HIGH"; //is very old. Is lord/lady
		this.m.Icon = "ui/backgrounds/Background_hemovore_HIGH_male.png";
		this.m.Name = "Patriarch";
		this.m.BackgroundDescription = "Perhaps a renowned warrior or commander, these ancients have an unwavering distain for all living creatures — great and small alike. For them, the war never ended.";
		this.m.GoodEnding = "%name% adjusted back into society rather well, eventually building up the influence to misdirect raiding parties and patrols away from places they would call home. These actions bought the Fallen Empire time to organise and strike where the nobility were weakest, ultimately allowing them to destroy civilisation in a brutally effecient manner.";
		this.m.BadEnding = "%name%\'s desire for power became their downfall — they returned home and used their fame to raise an army under their own name, only to forget the glamour protecting them would seal their fate by watching a legionary skewer them with a pike.";		
		this.m.HiringCost = 1050;
		this.m.DailyCost = 58;
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
		this.m.Faces = ["bust_vampire_lord_head_04"]; //could also be 01 or 02 or 03
		this.m.Bodies = ["bust_vampire_lord_body_01"]; //could also be 02 or 03
		this.m.Hairs = this.Const.Hair.Vampire;
		this.m.HairColors = this.Const.HairColors.Zombie;
		// this.m.Beards = this.Const.Beards.Tidy;

		this.m.Level = this.Math.rand(2, 4);
		this.m.Names = this.Const.Strings.AncientSouthernNames;
		this.m.Titles = this.Const.Strings.AncientDeadTitles;
		// this.m.LastNames = this.Const.Strings.SouthernNamesLast;	
		this.m.BackgroundType = this.Const.BackgroundType.Untalented | this.Const.BackgroundType.Outlaw;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Merciless;
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[3];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[2];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[3];
		this.m.Modifiers.Terrain = [
				0.0, // ?
				0.0, //ocean
				0.03, //plains
				0.03, //swamp
				0.03, //hills
				0.03, //forest
				0.03, //forest
				0.03, //forest_leaves
				0.03, //autumn_forest
				0.03, //mountains
				0.0, // ?
				0.03, //farmland
				0.03, // snow
				0.03, // badlands
				0.03, //highlands
				0.03, //stepps
				0.0, //ocean
				0.03, //desert
				0.03 //oasis
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
				// this.Const.Perks.DeviousTree,
				// this.Const.Perks.FastTree,
				this.Const.Perks.LargeTree
			],
			Enemy = [
				this.Const.Perks.SwordmastersTree,
				this.Const.Perks.OccultTree,
				this.Const.Perks.UndeadTree,
				this.Const.Perks.CivilizationTree,
				this.Const.Perks.OutlawTree
			],
			Class = [
				this.Const.Perks.ScytheClassTree
				// this.Const.Perks.SpearfisherClassTree
				// this.Const.Perks.BeastClassTree
			],
			Profession = [
				this.Const.Perks.FencingTeacherProfessionTree
			],
			Magic = [
				// this.Const.Perks.AssassinMagicTree
				this.Const.Perks.PhilosophyMagicTree
			]
		}
	}

	function setGender(_gender = -1)
	{
		if (_gender == -1) _gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);

		if (_gender != 1) return;
 			//Female
		this.m.Faces = ["bust_vampire_lady_head_02"]; //could also be 01
		this.m.Bodies = ["bust_vampire_lady_body_02"];	//could also be 01
		this.m.Hairs = this.Const.Hair.Vampire;
		this.m.HairColors = this.Const.HairColors.Zombie;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.Name = "Matriarch";
		this.m.Icon = "ui/backgrounds/Background_hemovore_HIGH_female.png";
		this.m.Names = this.Const.Strings.SouthernFemaleNames;
		this.m.Titles = this.Const.Strings.AncientDeadTitles;
		this.m.BackgroundDescription = "Once serving their houses and acting on behalf of their partners, these ladies of a dark bloodline serve their house as they did in their past lives.";
		this.m.GoodEnding = "%name% adjusted back into society rather well, eventually building up the influence to misdirect raiding parties and patrols away from places they would call home. These actions bought the Fallen Empire time to organise and strike where the nobility were weakest, ultimately allowing them to destroy civilisation in a brutally effecient manner.";
		this.m.BadEnding = "%name%\'s desire for power became their downfall — they returned home and used their fame to raise an army under their own name, only to forget the glamour protecting them would seal their fate by watching a legionary skewer them with a pike.";
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female)) //female
		{
			return "{Of all the women in the Empire, %name% was one of the most influentual. | %name% was always drawn to the glittering gold trinkets of the upper nobility. | Once a lowly serving girl, %name% was married off to a man twice her age. | Years of brutal scars mark a past of torment %name% rather not recall.} {With a comfortable lifestyle and endless wealth assured, boredom set in for %name% — the social trapping of the cults were a good way to pass the time, and have some fun along the way. | %name% fell our of favour with high society when they were implicated in a coup gone wrong. She attests that the coup was supposed to be bloodless, but the others in the band had stronger whims than her. | The last in the line of a broken household, %name% had nothing left to live for and took her own life after her husband was killed on campaign — the cults offered a quick way to \'begin again\', which on reflection is not what she had in mind. | She greatly enjoyed visting the grand library in the south — the writings of the scholars there always delighted her mind. When the collapse came, she took everything she could, only to be buried under a burning building. | Once an attendent to a mystic, she made frequent visits to the top of their tower. He always said that you could see so far that you would known when the end of the world would come. That was a lie.} {Brandishing ancient and mortally fatal scars, %name% now wanders the world trying to make sense of what had happened all that time ago. | After a legendary falling out with the council of ancients, %name% heard of your goals and sought you out. WHile still a noblewoman at heart, she is as bloodthirsty as any other of your kind. | After the sacking of a small farmstead went wrong, %name% sought refuge in the forest with wounds that would kill any normal woman — finding your band was a strike of luck she would do hard to replicate. | Little has changed for her with her new unlife — wars are still fought, people are slain in the dozens... it makes her wonder if anything changed at all. | %name% occasionally likes to pretend to be a witch who eats children, only to deliberately be caught, cackle and then fly away when on the pyre. The reasons for this are unclear.}";
		}
		else //male
		{
			return "{%name% was born to rule, and rule they did from a tiny garrison on the fringes of nowhere. | Even before the transformation, %name% was a monster to many and would frequently watch executions for the sheer joy of it. | The tactical plans, maps and figurines of %name%\'s chamber could never prepare them for what happened. | Years of brutal and demanding service left %name% with nothing but an empty title and the armour on his back.} {He was unceremoniously unhorsed at a nameless battle far away from here. After feeling an axe bury itself through his ribcage, %name% was carried back to his tent and the physician did all they could to make him more comfortable. A man in black approached and offered him and way out — and that is where everything took a turn for the worst. | A mercenary of sorts, %name% travelled far across the Empire serving lords that rather not meet him. In one awful storm he met his end as his horse fell 30 feet into a fissure — then they found him. | Working as an overseer for a grand construction project, %name% found themselves on the other end of a dozen daggers held by slaves they once commanded. | Years of faithful service rewarded him with a calm death, but the allure of more time to squander was a powerful force for any to resist. | One of many honour guards in the empire, %name% was directed to right wrongs in the name of the Emperor. Years of campaigning resulted in more of the same, when the sky began to fall and the world came to a standstill, %name% couldn't find the will to fight on anymore.} {He has spent two lifetimes trying to find meaning in this new world, but new enemies to fight are definitely a bonus — even if they do scream nonsense when they see him. | %name% has been alone for a long time, travelling with packs of other undead for safety. Sometimes he looks into the empty sockets of a legionary in the hope he might see something. | This new world is strange and %name%\'s new existance is stranger still, but the promise of rebuilding what was once lost has kept him going.}";
		}
	}

	function onChangeAttributes() //'tag' denotes a skill that is increased, 'untag' denotes a skill that is decreased below the base
	{
		local c = {
			Hitpoints = [//tag
				18,
				25
			],
			Bravery = [
				11,
				17
			],
			Stamina = [
				20,
				25
			],
			MeleeSkill = [ //raise by default
				20,
				30
			],
			RangedSkill = [
				-50,
				-50
			],
			MeleeDefense = [//tag
				12,
				16
			],
			RangedDefense = [
				5,
				7
			],
			Initiative = [//untag
				5,
				10
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot equip body or head armour[/color], but receives [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] less damage from direct attacks. Damage threshold for injuries increased by [color=" + this.Const.UI.Color.PositiveValue + "]75%[/color]"
			}
		)
		return ret
	}

	function onAddEquipment()
	{
			///Talents
		// local talents = this.getContainer().getActor().getTalents();
		// talents.resize(this.Const.Attributes.COUNT, 0);
		// talents[this.Const.Attributes.Hitpoints] = 2;
		// talents[this.Const.Attributes.MeleeSkill] = 2;
		// talents[this.Const.Attributes.Initiative] = 2;
		this.getContainer().getActor().fillTalentValues(5, true);

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
		items.equip(this.new("scripts/items/weapons/ancient/legend_fan_axe"));
		}
		else if (r == 2)
		{
		items.equip(this.new("scripts/items/weapons/ancient/rhomphaia"));
		}
		else if (r == 3)
		{
		items.equip(this.new("scripts/items/weapons/ancient/crypt_cleaver"));
		}
		else if (r == 4)
		{
		items.equip(this.new("scripts/items/weapons/ancient/legend_great_khopesh"));
		}
		else if (r == 5)
		{
		items.equip(this.new("scripts/items/weapons/ancient/legend_broadhead_spear"));
		}
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.DamageReceivedRegularMult *= 0.80; //20% reduction
		_properties.ThresholdToReceiveInjuryMult *= 1.75; //+75% higher threshold
	}

});
