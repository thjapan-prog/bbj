this.vampire_finds_scroll_event <- this.inherit("scripts/events/event", {
	m = {
		Vampire = null,
		FoundItem = null
	},
	function create()
	{
		this.m.ID = "event.vampire_finds_scroll";
		this.m.Title = "Whispers of the Past";
		this.m.Cooldown = 40.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",

			Text = "%terrainImage%{During patrol, a figure beside a cart is camped out by an ancient road which has long since been reclaimed by nature. The hooded figure appears to sense you at a distance that no man should be able to see. Their stare pieces through the air and straight through you as if they somehow knew what you were.\n\n The man slowly packs away a skull sat beside him at the edge of the campfire and flings an object upwards through the air at you. %vampire% braces to move after expecting a net to crest their body but said net never comes. Instead, a satchel of parchment and papers lands in a nearby bush.\n %vampire% opens the leather bound bag but upon returning their gaze to the cart, nothing remains except a long burnt out campfire... }",
			Image = "",
			List = [],
			Characters = [], 
			Options = [
				{
					Text = "We should leave.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Vampire.getImagePath());
				this.World.Assets.getStash().add(_event.m.FoundItem);
				this.List.push({
					id = 10,
					icon = "ui/items/" + _event.m.FoundItem.getIcon(),
					text = "You gain " + this.Const.Strings.getArticle(_event.m.FoundItem.getName()) + _event.m.FoundItem.getName()
				});
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return;
		}

		if (this.World.Assets.getOrigin().getID() != "scenario.hemovores" && this.World.Assets.getOrigin().getID() != "scenario.hemovores_avatar") //THIS WORKS
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("trait.hemovore"))
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Vampire = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 5;
	}

	function onPrepare()
	{
		local item;
		local r = this.Math.rand(1, 2);

		if (r == 1)
		{
			item = this.new("scripts/items/loot/ornate_tome_item");
		}
		else if (r == 2)
		{
			item = this.new("scripts/items/misc/legend_ancient_scroll_item");
		}

		this.m.FoundItem = item;
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"vampire",
			this.m.Vampire.getNameOnly()
		]);
		_vars.push([
			"finding",
			this.Const.Strings.getArticle(this.m.FoundItem.getName()) + this.m.FoundItem.getName()
		]);
	}

	function onClear()
	{
		this.m.Vampire = null;
		this.m.FoundItem = null;
	}

});

