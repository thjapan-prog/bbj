this.hemovore_praetorian_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.hemovore_praetorian"; //—
		this.m.Name = "Praetorian";
		this.m.Icon = "ui/backgrounds/Background_hemovore_praetorian.png"; 
		this.m.BackgroundDescription = "A skilled, silent and seasoned warrior that has been tasked to aid you.";
		this.m.GoodEnding = "With your work almost completed, %name% returned back to the monolith as they always had done. They took off their helmet and laid it to rest on the shelf of the barrow inside the mine and tucked themselves back within their sarcophagus. Using their own strength they once again closed the lid back on the stone casket — sealing themselves within the darkness once more. The legionary lay there in darkness and thought of you. For the first moment in a long time, they dreamt of home and a better tomorrow.";
		this.m.BadEnding = "After your parting and the failure of your task, the legionary that had been assigned to you started to blame himself for your failing. They gradually traveled back to the monolith and took up their station once more. They stood still in the rain, snow and sunshine as the moss began to grow over their armour. One day things may change for %name%, but for now all they can do is what they were trained to do — wait.";
		this.m.HiringCost = 99999999999999999999999999999999999999999999;
		this.m.DailyCost = 0;
		this.m.Excluded = ::Legends.Legion.excludedTraits();

		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints,
			this.Const.Attributes.Fatigue,
			this.Const.Attributes.Initiative
		];
			//Apperance changes due to 'skeletal' trait anyway
		this.m.Names = this.Const.Strings.AncientDeadNames;
		this.m.Titles = this.Const.Strings.AncientDeadTitles;
		// this.m.LastNames = this.Const.Strings.SouthernNamesLast;		
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.YoungMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		// this.m.BackgroundType = this.Const.BackgroundType.Crusader | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.Educated;
		this.m.Level = this.Math.rand(3, 5);
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];

		this.m.Modifiers.Terrain = [
				0.0, // ?
				0.0, //ocean
				0.0, //plains
				0.05, //swamp
				0.1, //hills
				0.1, //forest
				0.1, //forest
				0.1, //forest_leaves
				0.1, //autumn_forest
				0.05, //mountains
				0.0, // ?
				0.0, //farmland
				0.1, //snow
				0.1, //badlands
				0.1, //highlands
				0.1, //steppes
				0.0, //ocean
				0.1, //desert
				0.1 //oasis
			];
		
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SpearTree,
				this.Const.Perks.ShieldTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.CleaverTree
			],
			Defense = [
				this.Const.Perks.HeavyArmorTree,
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.TrainedTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.ViciousTree
			],
			Enemy = [],
			Class = [
				this.Const.Perks.ButcherClassTree,
				this.Const.Perks.ScytheClassTree
			],
			Profession = [],
			Magic = []
		}
	}

	function onAdded()
	{
		this.character_background.onAdded();
		if (this.m.IsNew) 
		{
			::Legends.Traits.grant(this, ::Legends.Trait.LegendFleshless);
		}

		local actor = this.getContainer().getActor();
		actor.m.ExcludedInjuries = ::Legends.Legion.ExcludedInjures;
	}

	function onBuildDescription()
	{ //—
		return "{The pursuit of a mastery can take a lifetime, | Learning a skill is one thing — but becoming well known enough that your reputation precedes you is another, | As the best, everyone looks up to you to do more than the rest,} {but when time doesn\'t matter — what\'s the point in rushing? | but what is the point of the journey is you are able to outlive and outlast every opponent you face? | but when your eyes are hollow and people run and scream from you, who is there left to pass that knowledge onto?} {Contrary to belief, %name% can indeed talk, but much prefers that nobody else knows that they can. | %name% looms silently in the backdrop of your presence — not a sound emits from them aside from the gentle creaking of conjoined bones and rattling armour of battle. | %name% is so quiet that you often forget they exist. Only occasionally alerting you to their creeping presence when they sharpen their weapon or patch their armour. | Once a legionary, %name% served in almost every conflict leading up to the cataclysm. They still patrol, march, and sleep like a legionary while out of battle. Sometimes you catch them sitting down and staring at a empty bowl that would contain food. | Their military background is not entirely clear, their form and knowledge suggests years of military training, if not decades. What has changed since then and now is a mystery — sometimes you wonder if their inability to take a step back from the fighting line is the mark of a soldier or supernatural determination.} {%name% was ambushed some time ago by a band of sellswords, who cut down their legion except for him, who proved too difficult to kill in the moment and resulted in the sellswords taking what prizes they could and fleeing. | %name% has spent nearly an eternity guarding the monolith from prying mortal eyes, often rallying to it\'s defence from treasure hunters and bandits. Even still, their talents were wasted. | Multiple bonus have been broken, set and reset again across their body — smaller chips and cuts pock their frame. It is hard to say if these injuries happened before or after they became what they are now.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				15,
				20
			],
			Bravery = [
				15,
				15
			],
			Stamina = [
				35,
				35
			],
			MeleeSkill = [
				10,
				16
			],
			RangedSkill = [
				14,
				18
			],
			MeleeDefense = [
				9,
				15
			],
			RangedDefense = [
				5,
				0
			],
			Initiative = [
				-5,
				-10
			]
		};
		return c;
	}

	function onAdded() 
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		this.m.Container.add(this.new("scripts/skills/perks/perk_vampire_maintenance"));
		this.m.Container.add(this.new("scripts/skills/actives/legend_command_legion_skill"));
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.RangedSkill] = 1;
		talents[this.Const.Attributes.MeleeDefense] = 2;
		this.getContainer().getActor().fillTalentValues(2, true);

		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/ancient/rhomphaia"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/ancient/legend_gladius"));
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
			items.equip(this.new("scripts/items/weapons/ancient/crypt_cleaver"));
		}

		if (items.getItemAtSlot(this.Const.ItemSlot.Offhand))
		{
			items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[1, "ancient/ancient_plate_harness"],
			[1, "ancient/ancient_double_layer_mail"],
			[1, "ancient/ancient_plated_mail_hauberk"],
			[1, "ancient/ancient_scale_coat"]
		]))

		items.equip(this.Const.World.Common.pickHelmet([
			[1, "ancient/ancient_gladiator_helmet"],
			[1, "ancient/ancient_honorguard_helmet"]
		]));
	}

});

