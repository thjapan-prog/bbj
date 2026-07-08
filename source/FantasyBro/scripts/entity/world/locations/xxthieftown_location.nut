this.xxthieftown_location <- this.inherit("scripts/entity/world/location", {
	function getDescription()
	{
		return "A city of exiles and rebels who rebelled against the nobility. The pure spirit of the uprising is gone and it is now a den of villains.";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.xxthieftown_location";
		this.m.LocationType = this.Const.World.LocationType.Unique;
		this.m.IsDespawningDefenders = false;
		this.m.IsShowingDefenders = false;
		this.m.IsShowingBanner = true;
		this.m.IsAttackable = false;
		this.m.VisibilityMult = 1.0;
		this.m.Resources = 500;
		this.m.OnEnter = "event.xxthieftown_enter_event";
	}

	function onSpawned()
	{
		this.m.Name = "City of Thieves";
		this.location.onSpawned();
		this.Const.World.Common.addTroop(this, {
			Type = this.Const.World.Spawn.Troops.SkeletonMedium
		}, false);
	}

	function onInit()
	{
		this.location.onInit();
		this.addSprite("body").setBrush("world_stronghold_02");
		this.addSprite("lighting").setBrush("world_stronghold_02_undead_lights");
		this.getSprite("lighting").Saturation = 1.2;
	}

});

