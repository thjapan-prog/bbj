this.xxherocrimson_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.xxherosp";
		this.m.Name = "Crimson Knight";
		this.m.Icon = "ui/xxherocrimson_icon.png";
		this.m.BackgroundDescription = "Not much is known about his past, but his combat skills are undoubtedly outstanding. [color=" + this.Const.UI.Color.NegativeValue + "](Warning: This character cannot use skill books.)[/color]";
		this.m.GoodEnding = "%name% retired from %companyname%. After retirement, he continued his life as a mercenary and adventurer, gaining fame for his many exploits, and his stories became legendary and passed down to future generations.";
		this.m.BadEnding = "%name% retired from %companyname%. Since then, no one has heard any news about %name%";
		this.m.HiringCost = 100000;
		this.m.DailyCost = 35;
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.BeardChance = 50;
		this.m.Names = this.Const.Strings.KnightNames;
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
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Action point"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Damage"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Chance to hit head"
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Armor piercing damage"
			},
			{
				id = 9,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Armor Damage"
			}
		];
	}

	function onBuildDescription()
	{
		return "%name% is a reticent man who doesn\'t talk much about himself. His past is unknown, but his combat skills are reliable. [color=" + this.Const.UI.Color.NegativeValue + "](Warning: This character cannot use skill books.)[/color]";
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
				20,
				20
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
				10,
				10
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		actor.getSprite("accessory_special").setBrush("bust_militia_band_01");
		actor.getSprite("surcoat").setBrush("surcoat_04");
		actor.getSprite("surcoat").Saturation = 1.2;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/greatsword"));
		local sks = [
			"sb_flamewave_skill",
			"sb_firebomb_skill",
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
			"sbp_allrounder_skill",
			"sbp_challenger_skill"
		];
		sks = this.new("scripts/skills/actives/" + sks[this.Math.rand(0, sks.len() - 1)]);
		this.m.Container.add(sks);
		this.m.Container.add(this.new("scripts/skills/perks/perk_nine_lives"));
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
		_properties.ActionPoints += 1
		_properties.DamageTotalMult += 0.1;
		_properties.HitChance[this.Const.BodyPart.Head] += 10;
		_properties.DamageDirectAdd += 0.1;
		_properties.DamageArmorMult += 0.1;
	}

	function onDeath( _fatalityType )
	{
		this.getContainer().getActor().getSprite("surcoat").setBrush("");
		this.skill.onDeath( _fatalityType )
	}

});

