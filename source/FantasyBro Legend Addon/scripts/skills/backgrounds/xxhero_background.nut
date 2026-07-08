this.xxhero_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.adventurer";
		this.m.Name = "Adventurer";
		this.m.Icon = "ui/backgrounds/background_10.png";
		this.m.BackgroundDescription = "Adventurers are composed of various races and are skilled warriors who take risks and undertake challenges for honor, beliefs, financial gain, or the thrill of adventure itself.";
		this.m.GoodEnding = "%name% retired from %companyname%. After retirement, {Wanting a quiet life, %name% settled in a small village, bought land, built a house, and lived a normal but happy life as hoped. | %name% returned to the life of an adventurer, slaying monsters, finding treasure, and discovering mysterious places, and was remembered as a great adventurer. | %name% gathered like-minded individuals to form a mercenary group, became the leader, earned the respect, and made a name in the world. | %name% became a great teacher to rookie adventurers, built up a reputation, and was eventually elected as the Master of the Adventurer\'s Guild.}";
		this.m.BadEnding = "%name% retired from %companyname%. {Since then, no one has heard any news about %name% | %name% is believed to have died shortly thereafter from injuries sustained in battle | %name% returned as an adventurer, but is said to have died a miserable death, having done nothing of note.}";
		this.m.HiringCost = 500;
		this.m.DailyCost = 35;
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

	function onBuildDescription()
	{
		return "Adventurers are composed of various races and are skilled warriors who take risks and undertake challenges for honor, beliefs, financial gain, or the thrill of adventure itself. %fullname% is one of those adventurers.";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				1,
				10
			],
			Bravery = [
				5,
				10
			],
			Stamina = [
				1,
				10
			],
			MeleeSkill = [
				8,
				15
			],
			RangedSkill = [
				15,
				18
			],
			MeleeDefense = [
				1,
				2
			],
			RangedDefense = [
				1,
				2
			],
			Initiative = [
				1,
				10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		if (!this.m.Container.hasSkill("actives.xxzzfantasy_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/xxzzfantasy_skill"));
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 5);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/two_handed_flail"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/polehammer"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/billhook"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/longaxe"));
		}
		else
		{
			items.equip(this.new("scripts/items/weapons/longsword"));
		}
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
		r = this.Math.rand(0, 17);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/armor/ragged_dark_surcoat"));
		}
		else if (r == 5)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 6)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else if (r == 7)
		{
			items.equip(this.new("scripts/items/armor/oriental/nomad_robe"));
		}
		else if (r == 8)
		{
			items.equip(this.new("scripts/items/armor/oriental/thick_nomad_robe"));
		}
		else if (r == 9)
		{
			items.equip(this.new("scripts/items/armor/oriental/stitched_nomad_armor"));
		}
		else if (r == 10)
		{
			items.equip(this.new("scripts/items/armor/oriental/gladiator_harness"));
		}
		else if (r == 11)
		{
			items.equip(this.new("scripts/items/armor/werewolf_hide_armor"));
		}
		else if (r == 12)
		{
			items.equip(this.new("scripts/items/armor/ancient/ancient_mail"));
		}
		else if (r == 13)
		{
			items.equip(this.new("scripts/items/armor/barbarians/scrap_metal_armor"));
		}
		else if (r == 14)
		{
			items.equip(this.new("scripts/items/armor/barbarians/thick_furs_armor"));
		}
		else if (r == 15)
		{
			items.equip(this.new("scripts/items/armor/thick_dark_tunic"));
		}
		else
		{
			items.equip(this.new("scripts/items/armor/oriental/gladiator_harness"));
		}
	  }
	}

});

