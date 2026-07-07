this.xxmob_barbarian_elder <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Name = this.Const.Strings.FT.M9;
		this.m.Type = this.Const.EntityType.BarbarianChampion;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BarbarianChampion.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.WildMale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.WildExtended;
		this.m.BeardChance = 100;
		this.m.SoundPitch = 0.95;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/ghost_agent");
		this.m.AIAgent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_knock_out"));
		this.m.AIAgent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_rally"));
		this.m.AIAgent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.m.AIAgent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_wake_up_ally"));
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local tattoos = [
			3,
			4,
			5,
			6
		];

		if (this.Math.rand(1, 100) <= 66)
		{
			local tattoo_body = this.actor.getSprite("tattoo_body");
			local body = this.actor.getSprite("body");
			tattoo_body.setBrush("tattoo_0" + tattoos[this.Math.rand(0, tattoos.len() - 1)] + "_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			local tattoo_head = this.actor.getSprite("tattoo_head");
			tattoo_head.setBrush("tattoo_0" + tattoos[this.Math.rand(0, tattoos.len() - 1)] + "_head");
			tattoo_head.Visible = true;
		}

		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BarbarianChampion);
		b.Vision += 2;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		b.IsSpecializedInMaces = true;
		this.m.Skills.update();
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_wildmen_01");
		local s = this.new("scripts/skills/actives/horror_skill");
		s.m.SoundOnUse = [
			"sounds/combat/rage_01.wav",
			"sounds/combat/rage_02.wav"
		];
		s.m.ID = "actives.horrific_scream";
		s.m.Name = "Barbarian Howl";
		s.m.MinRange = 2;
		s.m.MaxRange = 6;
		s.m.ActionPointCost = 6;
		s.m.FatigueCost = 15;
		this.m.Skills.add(s)
		this.m.Skills.add(this.new("scripts/skills/actives/rally_the_troops"));
		this.m.Skills.add(this.new("scripts/skills/effects/berserker_mushrooms_effect"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_inspiring_presence"));
	}

	function assignRandomEquipment()
	{
		local w = this.new("scripts/items/weapons/two_handed_flanged_mace");
		w.m.ArmamentIcon = "icon_wildmen_07_named_01";
		w.m.IsDroppedAsLoot = false;
		this.m.Items.equip(w);
		w = this.Const.Items.NamedBarbarianArmors;
		w = this.new("scripts/items/" + w[this.Math.rand(0, w.len() - 1)]);
		w.m.IsDroppedAsLoot = false;
		this.m.Items.equip(w);
		w = this.new("scripts/items/helmets/barbarians/beastmasters_headpiece");
		w.m.IsDroppedAsLoot = false;
		this.m.Items.equip(w);
		this.m.Items.addToBag(this.new("scripts/items/weapons/wooden_stick"));
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (_tile != null)
		{
			for( local i = 0; i < this.Const.Tactical.KrakenDevourVictimParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.KrakenDevourVictimParticles[i].Brushes, _tile, this.Const.Tactical.KrakenDevourVictimParticles[i].Delay, this.Const.Tactical.KrakenDevourVictimParticles[i].Quantity, this.Const.Tactical.KrakenDevourVictimParticles[i].LifeTimeQuantity, this.Const.Tactical.KrakenDevourVictimParticles[i].SpawnRate, this.Const.Tactical.KrakenDevourVictimParticles[i].Stages);
			}
			for( local i = 0; i < this.Const.Tactical.GruesomeFeastParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.GruesomeFeastParticles[i].Brushes, _tile, this.Const.Tactical.GruesomeFeastParticles[i].Delay, this.Const.Tactical.GruesomeFeastParticles[i].Quantity, this.Const.Tactical.GruesomeFeastParticles[i].LifeTimeQuantity, this.Const.Tactical.GruesomeFeastParticles[i].SpawnRate, this.Const.Tactical.GruesomeFeastParticles[i].Stages);
			}
			local flip = this.Math.rand(0, 100) < 50;
			this.m.IsCorpseFlipped = flip;
			this.spawnBloodPool(_tile, 1);
			local decal = _tile.spawnDetail("bust_xxcorpse_01", this.Const.Tactical.DetailFlag.Corpse, flip, false);
			decal.Scale = this.Math.rand(1, 10) * 0.01 + 1.1;
			decal.varySaturation(0.2);
			decal.varyColor(0.2, 0.2, 0.2);
			this.spawnTerrainDropdownEffect(_tile);
			local corpse = clone this.Const.Corpse;
			corpse.Faction = this.getFaction();
			corpse.CorpseName = this.getName();
			corpse.Tile = _tile;
			corpse.IsHeadAttached = true;
			corpse.IsConsumable = true;
			corpse.IsResurrectable = false;
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}
		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

});

