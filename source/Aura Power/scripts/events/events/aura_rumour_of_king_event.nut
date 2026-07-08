// =====================================================================
//  The Rumour of a King (v1.18.0)
//
//  A narrative beat that fires a little while AFTER a brother ascends to
//  Aura King - the world's delayed reaction to a crown it was never told
//  about. The moment of ascension itself is already covered by the Trial
//  of Steel success screen ("The battlefield kneels before a king."); this
//  event is the OUTSIDE world catching up, so it is deliberately fired
//  through the regular world-event lottery rather than immediately. The
//  travel-timer delay reads, in-fiction, as the rumour spreading ahead of
//  the company.
//
//  Trigger: ::AuraPower.updateThroneTracking sets ::World.Flags
//  "aura_king_risen_pending" on the no-king -> king transition (excluding
//  TestMode mass-crowning). This event's onUpdateScore bids into the
//  lottery while that flag is set; the flag is consumed when the player
//  closes the event. Auto-registers by living in scripts/events/events/.
// =====================================================================
this.aura_rumour_of_king_event <- ::inherit("scripts/events/event", {
	m = {
		KingName = ""
	},

	function create()
	{
		this.m.ID = "event.aura_rumour_of_king";
		this.m.Title = "The Rumour of a King";

		this.m.Screens.push({
			ID = "Intro",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let them look.",
					function getResult( _event )
					{
						try
						{
							if ("World" in ::getroottable() && ::World != null
								&& "Flags" in ::World && ::World.Flags != null)
							{
								::World.Flags.set("aura_king_risen_pending", false);
							}
						}
						catch (e)
						{
							::logError("Aura Power: rumour_of_king clear-pending - " + e);
						}
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Text = "Word moves faster than boots on mud. %kingname% said nothing - they never do, afterwards - but the men were already speaking of it in low voices before the company cleared the next settlement's gate. Not bragging. Something closer to the way old soldiers talk around a fire when they have seen something they cannot unfold into words.\n\nMerchants on the road find reasons to look twice. A carter who would have haggled an hour over toll rates stepped aside without being asked. An innkeeper poured the first round without being told to. The company has felt the weight of reputation before. This is different. This is the weight of something that has no name in any law or ledger, and every person they pass seems to know it anyway.\n\n%kingname% has not changed. The road ahead has not changed. Only the world's idea of them has, and it did that without asking permission.";
			}
		});
	}

	function onDetermineStartScreen()
	{
		return "Intro";
	}

	function refreshKingName()
	{
		this.m.KingName = "the new king";
		try
		{
			if (!("World" in ::getroottable()) || ::World == null) return;
			if (!("Flags" in ::World) || ::World.Flags == null) return;
			local f = ::World.Flags;
			if (f.has("aura_risen_king_name") && f.get("aura_risen_king_name") != "")
				this.m.KingName = f.get("aura_risen_king_name");
			else if (f.has("aura_king_name") && f.get("aura_king_name") != "")
				this.m.KingName = f.get("aura_king_name");
		}
		catch (e)
		{
			::logError("Aura Power: rumour_of_king refreshKingName - " + e);
		}
	}

	function onUpdateScore()
	{
		this.m.Score = 0;

		try
		{
			if (!("World" in ::getroottable()) || ::World == null) return;
			if (!("Flags" in ::World) || ::World.Flags == null) return;

			local f = ::World.Flags;
			local pending = f.has("aura_king_risen_pending")
				? f.get("aura_king_risen_pending") : false;
			if (!pending) return;

			// Stale guard: if no king is alive any more (the new king died
			// before word got around), the rumour is moot - drop it.
			if (!::AuraPower.hasLivingKing())
			{
				f.set("aura_king_risen_pending", false);
				return;
			}

			this.refreshKingName();

			// Below the Trial of Steel (5000) and the Throne Vacant beat
			// (6000): a calm rumour should not jump the queue ahead of the
			// trials themselves, but still surfaces within a little travel.
			this.m.Score = 4000;
		}
		catch (e)
		{
			::logError("Aura Power: rumour_of_king onUpdateScore - " + e);
		}
	}

	function onPrepare()
	{
		this.refreshKingName();
	}

	function onPrepareVariables( _vars )
	{
		_vars.push(["kingname", this.m.KingName != "" ? this.m.KingName : "the new king"]);
	}

	function onClear()
	{
		this.m.KingName = "";
	}
});
