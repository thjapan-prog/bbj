this.xxheroroyal_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.xxheroroyal";
		this.m.Name = "Royalty";
		this.m.Icon = "ui/traits/trait_icon_37.png";
		this.m.BackgroundDescription = "People with royal blood usually have high status and great authority. Some royalty sometimes become mercenaries for their own ambition or pleasure. [color=" + this.Const.UI.Color.NegativeValue + "](Warning: This character cannot use skill books.)[/color]";
		this.m.GoodEnding = "%name% started the succession war by gathering his soldiers based on his experience and mercenary skills acquired from the %companyname%. He eventually seized his goal of the throne by battling and persuading against the great nobles.";
		this.m.BadEnding = "%name% retired from %companyname%. After retiring, he lost his life to an assassin sent by another royal family.";
		this.m.HiringCost = 10000;
		this.m.DailyCost = 35;
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Bodies = this.Const.Bodies.Thick;
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
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Add [color=" + this.Const.UI.Color.PositiveValue + "]300[/color] crowns when winning a battle"
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Get [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] crowns when killing humans"
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=#8f1e1e]Handicap:[/color] Ranged skills are always 0. Attacking a target at a distance of 2 tiles or more will always miss"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=#8f1e1e]When this character dies:[/color] Player will lose 10,000 crowns as a penalty and their reputation with a random noble house will decrease"
			}
		];
	}

	function onBuildDescription()
	{
		return "%name% is a member of the royal family, descended from a noble bloodline. [color=" + this.Const.UI.Color.NegativeValue + "](Warning: This character cannot use skill books.)[/color]";
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
				0,
				0
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
		local coat_type = [
			"01",
			"02",
			"03",
			"06",
			"07",
			"08",
			"09",
			"10"
		];
		actor.getSprite("surcoat").setBrush("bust_body_noble_" + coat_type[this.Math.rand(0, coat_type.len() - 1)]);
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
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
		items.equip(this.new("scripts/items/weapons/arming_sword"));
		this.m.Container.add(this.new("scripts/skills/actives/sb_bribe_skill"));
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.SurviveWithInjuryChanceMult *= 0;
		_properties.TargetAttractionMult *= 1.5;
		_properties.RangedSkill *= 0;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}
		if (_skill.isAttack())
		{
			local d = this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile());
			if (d != 1)
			{
				_properties.MeleeSkill *= 0;
			}
		}
	}

	function onCombatFinished()
	{
		if (!this.getContainer().getActor().isPlacedOnMap() || !this.getContainer().getActor().isAlive())
		{
			return false;
		}
		local actor = this.getContainer().getActor();
		local gg = 0;
		local actors = this.Tactical.Entities.getAllInstances();
		foreach( i in actors )
		{
			foreach( a in i )
			{
				if (!a.isAlliedWith(actor))
				{
					gg = 1;
					break;
				}
			}
		}
		if (gg == 0)
		{
			this.World.Assets.addMoney(300 / 2);
		}
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		if (_targetEntity.getFlags().has("human"))
		{
			this.World.Assets.addMoney(20);
		}
	}

	function onDeath( _fatalityType )
	{
		this.getContainer().getActor().setFaction(this.Const.Faction.Player);
		this.getContainer().getActor().getSprite("surcoat").setBrush("");
		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);
		local noblehouse = nobles[this.Math.rand(0, nobles.len() - 1)];
		if (noblehouse != null)
		{
			noblehouse.addPlayerRelation(-100.0, "You are considered traitors");
		}
		if (this.World.Assets.getMoney() >= 10000)
		{
			this.World.Assets.addMoney(-10000);
		}
		else
		{
			this.World.Assets.addMoney(-this.World.Assets.getMoney());
		}
		this.skill.onDeath( _fatalityType );
	}

});

