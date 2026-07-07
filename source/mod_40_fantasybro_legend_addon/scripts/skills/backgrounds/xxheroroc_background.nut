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
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = null;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = null;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BeardChance = 0;
		this.m.Names = this.Const.Strings.SouthernNames;
	  if("LegendMod" in this.Const)
	  {
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.PolearmTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.HammerTree,
				this.Const.Perks.SpearTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.BowTree,
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.ShieldTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.AgileTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.MartyrTree,
				this.Const.Perks.FitTree
			],
			Enemy = [],
			Class = [],
			Magic = []
		};
	  };
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
				text = "Ignore ZOC"
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Ignore nighttime penalties"
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=#135213]+1[/color] Vision"
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
			"perk_rotation"
		];
		sks = this.new("scripts/skills/perks/" + sks[this.Math.rand(0, sks.len() - 1)]);
		this.m.Container.add(sks);
		this.m.Container.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Container.add(this.new("scripts/skills/actives/ai_roc_skill"));
	  if("LegendMod" in this.Const)
	  {
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"patched_mail_shirt"
			],
			[
				1,
				"padded_leather"
			],
			[
				1,
				"basic_mail_shirt"
			],
			[
				1,
				"worn_mail_shirt"
			]
		]));
	  }
	  else
	  {
		items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
	  }
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.IsImmuneToZoneOfControl = true;
		_properties.IsAffectedByNight = false,
		_properties.Vision += 1;
	}

});

