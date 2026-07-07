this.vampire_finds_weapon_event <- this.inherit("scripts/events/event", {
	m = {},

	function create()
	{
		this.m.ID = "event.vampire_finds_weapon";
		this.m.Title = "Something old...";
		this.m.Cooldown = 35.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "%terrainImage%{%randombrother% stops at an outcrop of stone, on closer inspection it once was an old wall with varying scratches, damages and indentations marking its rocky skin. %vampire% moves towards a brick loosely hanging from the wall and, with a skill of a mason, manages to dislodge it intact.\n\n A weapon is pulled from the cavity, draped in fine cloth that has been rotting for some time. The weapon is in much better condition than the cloth which %randombrother% casts aside. %SPEECH_ON%{Just how I left it! | Not the first time I\'ve been reminded of home — and probably not the last either. | I saw the glint beyond the rocks and something pulled me in — it\'s hard to explain... | Sat here for so long...}%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [{
				Text = "Likely older than all of us...",
				getResult = @(_event) 0
			}],

			function start( _event )
			{
				local items = [
					::Const.World.Common.pickItem([
						[1, "weapons/ancient/legend_broad_warscythe"],
						[1, "weapons/ancient/legend_broadhead_spear"],
						[1, "weapons/ancient/legend_decorated_crypt_cleaver"],
						[1, "weapons/ancient/broken_bladed_pike"],
						[1, "weapons/ancient/legend_decorated_sword"],
						[1, "weapons/ancient/legend_honed_warscythe"],
						[1, "weapons/ancient/legend_oxtongue_spear"]
					], "scripts/items/"),
					
					::Const.World.Common.pickItem([
						[1, "shields/ancient/auxiliary_shield"],
						[1, "weapons/ancient/legend_military_crypt_cleaver"],
						[1, "weapons/ancient/legend_kopis"],
						[1, "weapons/ancient/legend_broken_decorated_sword"],
						[1, "weapons/ancient/legend_sica"],
						[1, "weapons/ancient/legend_gladius"],
						[1, "weapons/ancient/legend_spatha"]
					], "scripts/items/"),

					::Const.World.Common.pickItem([
						[1, "weapons/ancient/ancient_sword"],
						[1, "weapons/ancient/falx"],
						[1, "weapons/ancient/ancient_spear"],
						[1, "weapons/ancient/legend_broken_spatha"],
						[1, "shields/ancient/tower_shield"],
						[1, "weapons/ancient/bladed_pike"],
						[1, "weapons/ancient/legend_military_rhomphaia"]
					], "scripts/items/")
				];

				this.List.extend(::Legends.EventList.addItems(items, ::World.Assets.getStash()));
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

		this.m.Score = 5;
	}

	function onPrepare()
	{
		// if (item.getConditionMax() > 1)
		// {
		// 	item.setCondition(this.Math.max(1, item.getConditionMax() * this.Math.rand(10, 40) * 0.01));
		// }
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

