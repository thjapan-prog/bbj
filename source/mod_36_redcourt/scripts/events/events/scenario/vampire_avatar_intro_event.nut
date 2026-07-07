this.vampire_avatar_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.vampire_avatar_scenario_intro"; // —
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_101.png[/img]It is under control.\n\n The world is large, but not infinite. There are only so many hills, rivers and forests they can hide in before you find them. You were like them once — but quickly came to know better.\n The natural order must be preserved and doing so means making sacrifices when needed.\n\n The sellsword kicks in the air and lets out a scream as their comrades watch in horror.\n\n But first, you should finish what you started here and focus on the matter at hand.\n\n A muffled scream pierces the air and the mercenary falls into a slump as you pull your hand from his mouth, his jaw now fully detached in the palm of your hand as the viscera pools in your palm.\n For a brief moment a distant memory flares up, only to be subdued as quickly as it came. His tongue twitches and spasms in what remains of his skull as the rest of his ilk close up into a defence, forming a tight shield wall. Some are notably shaken while one stands their ground. The jawless man gurgles again — a gurgling reminiscent of pleas and curses.\n\n You take a short, mocking bow and unfurl your arms in a whimsical manner. Part of you hopes they follow the sane fate, but your attendant whispers in your ear and plants the seed of another delightful idea.\n\n Grabbing the nearest mortal you fix your gaze directly into theirs — the world may be too large to search on your own, but to blend in with the rest of these creatures will do nicely...",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Back To The Hunt!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}
		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The First Bloodline";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"home",
			this.World.Flags.get("HomeVillage")
		]);
	}

	function onClear()
	{
	}

});