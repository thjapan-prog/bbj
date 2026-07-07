this.xxogretown_enter_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.xxogretown_enter_event";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 0 * this.World.getTime().SecondsPerDay;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_123.png[/img]{A stench of death and fear fills the air. A gigantic evil alive since the mythic age rules over this place. A being filled with unimaginable malice and hunger will show no mercy to anyone who dares to trespass on its domain.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Prepare for Battle!",
					function getResult( _event )
					{					
						local pp = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						pp.CombatID = "Event";
						pp.Music = this.Const.Music.BeastsTracks;
						pp.IsAutoAssigningBases = false;
						pp.IsLootingProhibited = true;
						pp.IsWithoutAmbience = true;
						pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
						pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
						pp.BeforeDeploymentCallback = function ()
						{
							local size = this.Tactical.getMapSize();
							for( local x = 0; x < size.X; x = ++x )
							{
								for( local y = 0; y < size.Y; y = ++y )
								{
									local tile = this.Tactical.getTileSquare(x, y);
									if (this.Math.rand(1, 100) <= 50)
									{
										tile.removeObject();
										tile.clear();
										tile.Level = this.Math.min(0, tile.Level);
									}
									else
									{
										tile.Level = this.Math.min(1, tile.Level);
									}
								}
							}
						};
						pp.Entities = [];
						pp.Entities.push({
							ID = this.Const.EntityType.AlpShadow,
							Variant = 0,
							Row = 3,
							Script = "scripts/entity/tactical/enemies/xxmob_ogre",
							Faction = this.Const.Faction.Enemy
						});
						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(pp, false, false, true);
						return 0;
					}
				},
				{
					Text = "Fall back!",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				if (this.World.State.getLastLocation() != null)
				{
					this.World.State.getLastLocation().setVisited(false);
				}
			}
		});
		this.m.Screens.push({
			ID = "Victory",
			Text = "[img]gfx/ui/events/event_134.png[/img]{The fierce battle is over. You and your companions have scoured the area for valuables. After collecting all the valuables, the party decided to leave.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It was worth it.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";
				this.World.Assets.getStash().makeEmptySlots(2);
				local item = this.new("scripts/items/weapons/named/xxorc_axe_two_handed");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain "  + this.Const.Strings.getArticle(item.getName()) + item.getName()
				});
				item = this.new("scripts/items/special/fountain_of_youth_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 11,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain "  + this.Const.Strings.getArticle(item.getName()) + item.getName()
				});
				this.World.Assets.addMoney(10000);
				this.List.push({
					id = 12,
					icon = "ui/items/supplies/money.png",
					text = "You gain 10000 gold"
				});
				if (this.World.State.getLastLocation() != null)
				{
					this.World.State.getLastLocation().die();
				}
			}
		});
		this.m.Screens.push({
			ID = "Defeat",
			Text = "[img]gfx/ui/events/event_88.png[/img]{What the hell is this place? Seeing an escape opportunity, you decide to run away from this place.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Shouldn\'t have come here...",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";
			}
		});
	}

	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
	}

});

