this.xxi_female_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_villager";
		this.m.Name = "Female Villager";
		this.m.Icon = "ui/backgrounds/background_13.png";
		this.m.HiringCost = 50;
		this.m.DailyCost = 5;
		this.m.Excluded = [];
		this.m.Titles = [];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = null;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = null;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BeardChance = 0;
		this.m.Names = this.Const.Strings.CharacterNamesFemale;
		this.m.GoodEnding = "%name% retired from %companyname%. After retirement, she settled in a small town. It is said that there she returned to the life of an ordinary woman and lived happily.";
		this.m.BadEnding = "%name% retired from %companyname%. Since then, no one has heard any news about %name%";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				15,
				10
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local xbody = actor.getSprite("body");
		local xhead = actor.getSprite("head");
		local xhair = actor.getSprite("hair");
		local xtattoo_head = actor.getSprite("tattoo_head");
		xbody.setBrush("bust_naked_body_78" + this.Math.rand(69, 70));
		xhead.setBrush("bust_head_787" + this.Math.rand(0, 1));
		xhair.setBrush("hair_black_787" + this.Math.rand(0, 6));
		if (this.Math.rand(0, 3) == 0)
		{
			if (this.Math.rand(0, 1) == 0)
			{
				xtattoo_head.setBrush("bust_head_pox_01");
			}
			else
			{
				xtattoo_head.setBrush("bust_head_darkeyes_01");
			}
		}
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/ghost_death_01.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/ghost_death_02.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Fatigue] = [
			"sounds/enemies/ghastly_touch_01.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/skeleton_idle_01.wav",
			"sounds/enemies/skeleton_idle_04.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived];
		actor.m.Sound[this.Const.Sound.ActorEvent.Flee] = actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived];
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/xxdress"));
	}

});

