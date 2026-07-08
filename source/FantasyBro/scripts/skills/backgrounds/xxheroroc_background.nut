this.xxheroroc_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.xxherosp";
		this.m.Name = "Battle Sage";
		this.m.Icon = "ui/traits/trait_icon_09.png";
		this.m.BackgroundDescription = "Battle Sage is a warrior and shaman of an ancient, forgotten race. [color=" + this.Const.UI.Color.NegativeValue + "](Warning: This character cannot use skill books.)[/color]";
		this.m.GoodEnding = "%name% retired from %companyname%. After retirement, he continued his life as a mercenary and adventurer, gaining fame for his many exploits, and his stories became legendary and passed down to future generations.";
		this.m.BadEnding = "%name% retired from %companyname%. Since then, no one has heard any news about %name%";
		this.m.HiringCost = 10000;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.dumb",
			"trait.greedy",
			"trait.night_blind",
			"trait.short_sighted",
			"trait.superstitious",
			"trait.paranoid",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.ailing",
			"trait.clubfooted",
			"trait.irrational",
			"trait.hesitant",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.asthmatic"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = null;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = null;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BeardChance = 0;
		this.m.Names = this.Const.Strings.SouthernNames;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] Damage"
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=#135213]+2[/color] Vision"
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Ignore nighttime penalties"
			}
		];
	}

	function onBuildDescription()
	{
		return "%name% is a warrior and shaman of an ancient, forgotten race. [color=" + this.Const.UI.Color.NegativeValue + "](Warning: This character cannot use skill books.)[/color]";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				10
			],
			Bravery = [
				10,
				10
			],
			Stamina = [
				10,
				10
			],
			MeleeSkill = [
				10,
				10
			],
			RangedSkill = [
				25,
				25
			],
			MeleeDefense = [
				5,
				5
			],
			RangedDefense = [
				5,
				5
			],
			Initiative = [
				15,
				15
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local xbody = actor.getSprite("body");
		local xhead = actor.getSprite("head");
		xhead.setBrush("bust_rochead_01");
		xbody.setBrush("bust_rocbody_01");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local ii = this.new("scripts/items/armor/named/black_leather_armor");
		ii.setUpgrade(this.new("scripts/items/armor_upgrades/unhold_fur_upgrade"));
		ii.m.Condition = 140;
		ii.m.ConditionMax = 140;
		ii.m.StaminaModifier = -5;
		items.equip(ii);
		items.equip(this.new("scripts/items/weapons/greatsword"));
		local sks = [
			"sb_fonature_skill",
			"sb_electric_skill",
			"sb_heal_skill",
			"sb_command_skill",
			"sb_concent_skill",
			"sb_great_skill",
			"sb_march_skill",
			"sb_mark_skill"
		];
		sks = this.new("scripts/skills/actives/" + sks[this.Math.rand(0, sks.len() - 1)]);
		this.m.Container.add(sks);
		sks = [
			"perk_bags_and_belts",
			"perk_fortified_mind",
			"perk_steel_brow",
			"perk_hold_out",
			"perk_lone_wolf",
			"perk_underdog",
			"perk_fast_adaption",
			"perk_adrenalin",
			"perk_recover",
			"perk_rotation",
			"perk_footwork"
		];
		sks = this.new("scripts/skills/perks/" + sks[this.Math.rand(0, sks.len() - 1)]);
		this.m.Container.add(sks);
		this.m.Container.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Container.add(this.new("scripts/skills/actives/ai_roc_skill"));
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.DamageTotalMult += 0.2;
		_properties.Vision += 2;
		_properties.IsAffectedByNight = false;
	}

});

