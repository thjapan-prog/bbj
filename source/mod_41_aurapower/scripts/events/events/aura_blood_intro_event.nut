// =====================================================================
//  Aura Power - Origin Intro: "Blood of the Last House"
//
//  The story window shown once at campaign start for the "Blood of the Last
//  House" origin, the way vanilla origins frame themselves (lone_wolf,
//  rf_random_solo). Two screens: the fall of the house, then the present
//  and the vow. Pure narrative - no mechanical effect.
//
//  Auto-discovered by living in scripts/events/events/. IsSpecial = true so it
//  never enters the world-event lottery; it is fired directly by
//  aura_inheritor_scenario.onSpawnPlayer via ::World.Events.fire.
// =====================================================================
this.aura_blood_intro_event <- ::inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.aura_blood_intro";
		this.m.Title = "Blood of the Last House";
		this.m.IsSpecial = true;

		// ===== Screen A: The Fall =====
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_24.png[/img]Your house was not the largest, and it was not the most feared. But three generations back, your grandfather\'s grandfather stood before the empty throne and was found worthy. The aura that had slept in the bloodline for no one knows how many years rose in him on that night and did not stop rising. He became the Aura King - not by conquest, not by birth, but by the simple terrible fact that the power chose him and he did not break under it. For a time the family name meant something that people were careful not to speak too carelessly.[p]The last King of your line died without an heir old enough to hold what he had built. There is no mystery in what followed. The rival kingdom to the north had been patient for years - patient in the way of men who know they are waiting for a door to open rather than forcing one. They moved in the grey season after the King\'s death, when the house was at its weakest and the world had not yet decided whether to mourn or step in. They did not move with mercy. They moved with fire, and with the particular thoroughness of men who want to make sure there is nothing left to grow back.[/p][p]Your family is gone. The house is gone. The name is gone - not merely forgotten, but burned away by people who understood that a ruined name cannot raise an army. They were not wrong. They were, in that calculation, almost completely right.[/p]",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The line did not end there.",
					function getResult( _event )
					{
						return "B";
					}
				}
			],
			function start( _event )
			{
				try { this.Banner = "ui/banners/" + ::World.Assets.getBanner() + "s.png"; } catch (e) {}
			}
		});

		// ===== Screen B: The Present / the Vow =====
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_24.png[/img]You came out of the ruins with one thing they forgot to burn. The weapon was your grandfather\'s grandfather\'s - you had seen it your whole life on a wall that no longer exists, in a hall that no longer stands. You do not remember deciding to take it. You only remember that your hands found it in the dark and did not let go.[p]The aura found you some time after that. Not in a dramatic hour - no vision, no voice, no moment that would make a good story later. It arrived the way cold does, or grief: gradually, and then completely. It has been burning hotter every year since the fires cooled, and lately it burns hot enough that you are done pretending it is anything other than what it is. Your grandfather\'s grandfather was [color=#bcad8c]Sovereign Seed[/color], or so the old accounts say. Whatever that is, you carry it too.[/p][p]You are not thinking about rebuilding the house. You are not thinking about reclaiming land or titles or any of the rest of the things that men with houses think about. You are thinking about the kingdom to the north, and the particular face of the man who gave the order, and the fact that you are still here and still moving and have not yet made them regret what they left alive.[/p][p]One man. One weapon. One aura that has not yet found its ceiling.[/p]",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "They will remember.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				try { this.Banner = "ui/banners/" + ::World.Assets.getBanner() + "s.png"; } catch (e) {}
			}
		});
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onUpdateScore()
	{
		this.m.Score = 0;
	}

	function onPrepare()
	{
	}

	function onClear()
	{
	}
});
