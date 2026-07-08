this.hemovore_avatar_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hemovore_avatar";
		this.m.Icon = "ui/backgrounds/Background_hemovore_avatar.png"; 
		this.m.Name = "Progenitor"; //— 
		this.m.BackgroundDescription = "You have lived so many lives — from being a lowborn farmhand to one of the most trusted of the many hands of the Emperor, but now you hunt your own kind.";
		this.m.GoodEnding = "Thanks to your disruption you caused in the world, the group that fled from the ancient order eventually were found masquerading as bandits, thieves and mercenaries in a group far into the heart of the new civilisation. When the time came — an effort was made to wash them away along with the uncountable bodies of unrelated mortals. The veil was preserved, and you were rewarded well.";
		this.m.BadEnding = "Through weakness or a lack of focus, the group you hunted continued to ellude you. The ancients grew impatient and after your demise, lost interest in the group completely. The punishment after your final death continued — your name was struck from every record still held by the Empire and any physical evidence of your existance was met with the torch. Or worse.";		
		this.m.HiringCost = 999999999999999999999999;
		this.m.DailyCost = 0;
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

		this.m.Level = 3;
		this.m.Names = this.Const.Strings.VampireLordNames;
		this.m.Titles = this.Const.Strings.FallenHeroTitles;
		this.m.BackgroundType = this.Const.BackgroundType.Untalented | this.Const.BackgroundType.Outlaw;
		// this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		// this.m.AlignmentMax = this.Const.LegendMod.Alignment.Merciless;
		// this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[1];
		// this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[3];
		// this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[2];
		// this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[3];
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
				0.03, //snow
				0.03, //badlands
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
				// this.Const.Perks.CalmTree,
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
		this.addBackgroundType(this.Const.BackgroundType.Female); //— 
		this.m.Name = "Progenitor";
		this.m.Icon = "ui/backgrounds/Background_hemovore_avatar.png";
		this.m.Names = this.Const.Strings.SouthernFemaleNames;
		this.m.Titles = this.Const.Strings.FallenHeroTitles;
		this.m.BackgroundDescription = "You have lived so many lives — from being a lowborn farmhand to one of the most trusted of the many hands of the Emperor, but now you hunt your own kind.";
		this.m.GoodEnding = "Thanks to your disruption you caused in the world, the group that fled from the ancient order eventually were found masquerading as bandits, thieves and mercenaries in a group far into the heart of the new civilisation. When the time came — an effort was made to wash them away along with the uncountable bodies of unrelated mortals. The veil was preserved, and you were rewarded well.";
		this.m.BadEnding = "Through weakness or a lack of focus, the group you hunted continued to ellude you. The ancients grew impatient and after your demise, lost interest in the group completely. The punishment after your final death continued — your name was struck from every record still held by the Empire and any physical evidence of your existance was met with the torch. Or worse.";
	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female)) //female
		{
			return "{The memories bounce around in your head — you remember the blood, stone and darkness followed by the screaming, fire and the silence thereafter. You have no problem remembering the face of every man or woman you have killed, but can barely remember your own — how it used to be. The faster you find them the better chance you have to not share their fate.}";
		}
		else //male
		{
			return "{The memories bounce around in your head — you remember the blood, stone and darkness followed by the screaming, fire and the silence thereafter. You have no problem remembering the face of every man or woman you have killed, but can barely remember your own — how it used to be. The faster you find them the better chance you have to not share their fate.}";
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				25,
				30
			],
			Bravery = [ //gets +10 from avatar
				10,
				10
			],
			Stamina = [
				30,
				35
			],
			MeleeSkill = [ 
				25,
				35
			],
			RangedSkill = [
				-50,
				-50
			],
			MeleeDefense = [
				14,
				18
			],
			RangedDefense = [
				8,
				12
			],
			Initiative = [
				15,
				15
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
		// local talents = this.getContainer().getActor().getTalents();
		// talents.resize(this.Const.Attributes.COUNT, 0);
		// talents[this.Const.Attributes.MeleeSkill] = 2;
		// talents[this.Const.Attributes.MeleeDefense] = 2;
		// talents[this.Const.Attributes.Initiative] = 3;
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
		items.equip(this.new("scripts/items/weapons/ancient/legend_fan_axe"));
		}
		else if (r == 1)
		{
		items.equip(this.new("scripts/items/weapons/ancient/legend_kopis"));
		}
		else if (r == 2)
		{
		items.equip(this.new("scripts/items/weapons/ancient/khopesh"));
		}
		else if (r == 3)
		{
		items.equip(this.new("scripts/items/weapons/ancient/warscythe"));
		}
		else if (r == 4)
		{
		items.equip(this.new("scripts/items/weapons/ancient/legend_spatha"));
		}
		else if (r == 5)
		{
		items.equip(this.new("scripts/items/weapons/ancient/legend_decorated_sword"));
		}
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.DamageReceivedRegularMult *= 0.70; //30% reduction
		_properties.ThresholdToReceiveInjuryMult *= 1.90; //+90% higher threshold
	}

});
