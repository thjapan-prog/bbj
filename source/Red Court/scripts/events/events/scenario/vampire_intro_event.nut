this.vampire_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.vampire_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_115.png[/img]The wait has been agonising, but after a short afternoon the hag emerges from her hovel — sheathing a large dagger in her waistband. Other hexe would normally keep a small group of followers nearby for protection, often wearing pigments on their skin in an attempt to recapture their faded youth.\n\n This one was an exception. There was no attempt to look young, nor any enamoured thralls on her flanks — just one old woman alone in the forest.\n There is probably a story to be told here, but you get the impression that it isn\'t your fate to hear it.\n %SPEECH_ON%Is everything in order?%SPEECH_OFF% The hag nods and her withered hand moves to the dagger.\n\n At first you consider how dangerous one old woman could be, but your thoughts quickly move to the unusual weapon on her belt and how it might be designed to do unspeakable things to someone of your condition. The hexe\'s hand moves past it however, and into a satchel, she produces a coarse pigment in a small bowl, more specifically — a cap of a human skull. %SPEECH_ON%Put this under your eyes, no more than the size of a raindrop.%SPEECH_OFF%She mimics a motion under her eyes, making sure to keep eye contact at all times.\n You point towards the bowl. %SPEECH_ON%How often?%SPEECH_OFF% She nods. %SPEECH_ON%Just the once, anymore of your kind you find on the road should do the same — about my payment...%SPEECH_OFF%You nod in return. %SPEECH_ON%Everything has been arranged and put into motion, I do not know when they will be here — but your paths will cross soon.%SPEECH_OFF%The hexe nods a few times and staggers off. Part of you is tempted to kill her, but an uneasy feeling passes over you before you can make good on your instinct, at that moment she turns back again from the safety of her doorway.%SPEECH_ON%I\'m expecting company of the unfriendly variety soon — and you'd do well to clear off before they arrive. Once you apply that under your eyes, even I won\'t be able to tell what you are.%SPEECH_OFF% %randombrother% approaches from the treeline and watches the witch go. %SPEECH_ON%Do you have it?%SPEECH_OFF% You turn to face them, beaming darkly with the cresting in your palms. %SPEECH_ON%Oh I have it brother, and so much more!%SPEECH_OFF%",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "A new dawn begins!",
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
		this.m.Title = "Uneasy Allies";
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