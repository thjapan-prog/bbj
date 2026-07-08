this.hemovore_magic_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hemovore_magic"; //Spellcaster
		this.m.Icon = "ui/backgrounds/Background_hemovore_magic.png"; 
		this.m.Name = "Necropath";
		this.m.BackgroundDescription = "Where some fall apart in a crisis, others look for answers — %name% found them and regretted it ever since.";
		this.m.GoodEnding = "When the collapse of the Empire came, %name% turned to their books and scrolls for answers. While under your wing they did the same and only ended up surpassing their previous powers — with their newfound knowledge they returned to the library and took command of what remained of the archives. They stood watch over the empty halls and sunken shelves for many years, maybe they will one day find a way to revert the mistakes of the past — or perhaps continue them.";
		this.m.BadEnding = "Just as an eagle soars too high into the sky before being struck by an arrow, the pride and ambition of %name% led to a similar fate. Their powers steadily began to overtake them, turning them into a vile parody of rotting corpse and immortal being. After a struggle with their own inner ambitions, they eventually drove a stake through their own heart to end the suffering.";
		this.m.HiringCost = 9999999999999999999999999999;
		this.m.DailyCost = 43; //—
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

		this.m.Level = this.Math.rand(3, 4);
		this.m.Names = this.Const.Strings.AncientSouthernNames;
		this.m.BackgroundType = this.Const.BackgroundType.Untalented | this.Const.BackgroundType.Outlaw;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Merciless;
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[2];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[2];
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
				this.Const.Perks.FastTree
			],
			Enemy = [
				this.Const.Perks.UndeadTree,
				this.Const.Perks.BeastTree
			],
			Class = [],
			Profession = [],
			Magic = [
				this.Const.Perks.ZombieMagicTree,
				this.Const.Perks.StavesMagicTree,
				this.Const.Perks.PhilosophyMagicTree
			]
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
		this.m.Icon = "ui/backgrounds/Background_hemovore_magic.png";
		this.m.Names = this.Const.Strings.SouthernFemaleNames;
		this.m.BackgroundDescription = "Where some fall apart in a crisis, others look for answers — %name% found them and regretted it ever since.";
		this.m.GoodEnding = "When the collapse of the Empire came, %name% turned to their books and scrolls for answers. While under your wing they did the same and only ended up surpassing their previous powers — with their newfound knowledge they returned to the library and took command of what remained of the archives. They stood watch over the empty halls and sunken shelves for many years, maybe they will one day find a way to revert the mistakes of the past — or perhaps continue them.";
		this.m.BadEnding = "Just as an eagle soars too high into the sky before being struck by an arrow, the pride and ambition of %name% led to a similar fate. Their powers steadily began to overtake them, turning them into a vile parody of rotting corpse and immortal being. After a struggle with their own inner ambitions, they eventually drove a stake through their own heart to end the suffering.";
	}

	function onBuildDescription() //—
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female)) //female
		{
			return "{When the sky collapsed across the Empire | When the rivers of blood ran dry in the streets | When the blaze had settled | When the screaming stopped} {%name% emerged from a ruined cellar she used to escape the chaos. | %name% emerged from the burnt library where they had taken refuge under the collapsed bookshelves. | %name% found themselves buried under rubble with wounds that would kill a normal woman. | %name% emerged from deep in the forest to see the devastation first hand.} {She used her academic wit to search for answers all across the aftermath of the Empire — only to find that what was not destroyed in the cataclysm was looted shortly thereafter. | A stranger in a strange land, she searched for answers in the ruins of the Empire, only to find silent crypts and dark recesses as comfort for a long lost home. | Having lost her home, she quickly set out looking for answers. When asked what she found, they fall mysteriously silent as a result.} {When she found the fabled Black Library, her stricken heart began tremble once more — but it has been many years since and has yet to cover most of the archives. It was not for nothing however, as she has picked up quite a few tricks since they found this place.}";
		}
		else //male
		{
			return "{When the sky collapsed across the Empire | When the rivers of blood ran dry in the streets | When the blaze had settled | When the screaming stopped} {%name% emerged from a ruined cellar he used to escape the chaos. | %name% emerged from the burnt library where they had taken refuge under the collapsed bookshelves. | %name% found themselves buried under rubble with wounds that would kill a normal man. | %name% emerged from deep in the forest to see the devastation first hand.} {he used his academic wit to search for answers all across the aftermath of the Empire — only to find that what was not destroyed in the cataclysm was looted shortly thereafter. | A stranger in a strange land, he searched for answers in the ruins of the Empire, only to find silent crypts and dark recesses as comfort for a long lost home. | Having lost his home, he quickly set out looking for answers. When asked what he found, they fall mysteriously silent as a result.} {When he found the fabled Black Library, his stricken heart began tremble once more — but it has been many years since and has yet to cover most of the archives. It was not for nothing however, as he has picked up quite a few tricks since they found this place.}";
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				25,
				35
			],
			Bravery = [
				8,
				14
			],
			Stamina = [
				10,
				10
			],
			MeleeSkill = [
				5,
				18
			],
			RangedSkill = [
				-50,
				-50
			],
			MeleeDefense = [
				3,
				7
			],
			RangedDefense = [
				3,
				7
			],
			Initiative = [
				15,
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot equip body or head armour[/color], but receives [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color] less damage from direct attacks. Damage threshold for injuries increased by [color=" + this.Const.UI.Color.PositiveValue + "]90%[/color]"
			}
		)
		return ret
	}

	function onAddEquipment()
	{
			///Talents
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 2);
		talents[this.Const.Attributes.Hitpoints] = 2;
		talents[this.Const.Attributes.Initiative] = 1;
		this.getContainer().getActor().fillTalentValues(2, true);

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
		items.equip(this.new("scripts/items/weapons/ancient/khopesh"));
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
		items.equip(this.new("scripts/items/weapons/ancient/legend_khopesh"));
		}
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.DamageReceivedRegularMult *= 0.70; //30% reduction
		_properties.ThresholdToReceiveInjuryMult *= 1.90; //+90% higher threshold
	}

});
