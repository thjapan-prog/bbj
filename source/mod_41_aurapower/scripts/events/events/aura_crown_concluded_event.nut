// =====================================================================
//  Aura Power - World event: "The Crown's Hunt, Ended"
//
//  The closing beat of the Crown's Hunt arc. When the player destroys the
//  tier-6 Crown's Vanguard, ::AuraPower.updateHuntTracking sets the flag
//  aura_hunt_conclusion_pending; this event reads it through the world-event
//  lottery (high score so it surfaces on a short travel) and, once shown,
//  clears it. The aura_hunt_concluded flag - also set at the same moment - is
//  what permanently stops the hunt event from ever firing again.
//
//  Auto-discovered by living in scripts/events/events/.
// =====================================================================
this.aura_crown_concluded_event <- ::inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.aura_crown_concluded";
		this.m.Title = "The Crown's Hunt, Ended";

		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_24.png[/img]The Crown's Vanguard does not retreat - that is not a thing the Vanguard was built to do - so it ends the only way it can: in the mud, to the last named knight, beneath a banner that has no one left to carry it. You stand in the quiet afterward and understand, before any messenger could put it into words, that this was the last of them.[p]Word will climb north the way bad news always does. Not that a company won a battle - the crown loses battles and forgets them by morning - but that the thing they burned a house to prevent, the thing they sent their finest swords to put back into the ground, walked off the field again. They spent a generation certain you were dead. They spent a war certain they could correct the oversight. They were wrong both times, and men in high stone rooms do not send a third army to be proven wrong a third time.[/p][p]The hunt is over. Not because they forgave the bloodline, and not because they have stopped fearing it - but because they have finally, correctly, become more afraid of you than they are willing to pay to be rid of you.[/p][p]Your house was burned so that nothing could ever rise from it. Something did. Let them live with it.[/p]",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let them live with it.",
					function getResult( _event )
					{
						try
						{
							if ("World" in ::getroottable() && ::World != null
								&& "Flags" in ::World && ::World.Flags != null)
								::World.Flags.set("aura_hunt_conclusion_pending", false);
						}
						catch (e) { ::logError("Aura Power: Crown concluded clear - " + e); }
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
		try
		{
			if (!("World" in ::getroottable()) || ::World == null) return;
			if (!("Flags" in ::World) || ::World.Flags == null) return;
			if (::World.Flags.has("aura_hunt_conclusion_pending")
				&& ::World.Flags.get("aura_hunt_conclusion_pending"))
				this.m.Score = 6000;   // above the hunt's own score so it surfaces promptly
		}
		catch (e) { ::logError("Aura Power: Crown concluded onUpdateScore - " + e); }
	}

	function onPrepare() {}
	function onClear() {}
});
