// =====================================================================
//  The Throne Stands Empty (v1.18.0)
//
//  A narrative beat that fires once when the company's Aura King dies in
//  battle or leaves the roster (the uniqueness rule allows only one living
//  King at a time). It carries no mechanical effect - it tells the player
//  the throne is open again and names the brother who now stands nearest
//  to it, so a Master waiting on the Tier IV trial is not left guessing
//  whether they have become eligible.
//
//  Triggering is PURE POLLING, not a death hook:
//    - ::AuraPower.updateThroneTracking() (called at the tail of
//      refreshEntireRoster) watches ::World.Flags for the transition
//      "a king existed last sweep -> none now" and sets the persistent
//      flag aura_throne_vacant_pending.
//    - This event's onUpdateScore reads that flag and bids into the normal
//      world-event lottery when it is set. The flag is cleared when the
//      player closes the event, so it fires exactly once per vacancy.
//
//  The event auto-registers simply by living in scripts/events/events/ -
//  the same path the Trial of Steel event loads from. No explicit
//  registration is required.
// =====================================================================
this.aura_throne_vacant_event <- ::inherit("scripts/events/event", {
	m = {
		FallenKingName = "",
		SuccessorName  = "",
		HasSuccessor   = false
	},

	function create()
	{
		this.m.ID = "event.aura_throne_vacant";
		this.m.Title = "The Throne Stands Empty";

		// ===== Screen: Intro - single acknowledging option =====
		this.m.Screens.push({
			ID = "Intro",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Bury him well.",
					function getResult( _event )
					{
						// Consume the pending flag so the event fires exactly
						// once per vacancy. Guarded - World may be mid-teardown.
						try
						{
							if ("World" in ::getroottable() && ::World != null
								&& "Flags" in ::World && ::World.Flags != null)
							{
								::World.Flags.set("aura_throne_vacant_pending", false);
							}
						}
						catch (e)
						{
							::logError("Aura Power: throne_vacant clear-pending - " + e);
						}
						return 0;
					}
				}
			],
			function start( _event )
			{
				// %kingname% / %successor% are substituted via onPrepareVariables.
				local opening = "The men felt it before word reached them. Not grief - something quieter. The aura %kingname% had carried left the company the moment they did, clean as a door closing on a warm room. No echo. No warmth left behind.";

				// A3 - Epitaph: weigh the fallen king's life by the number of
				// battles they fought (snapshotted to ::World.Flags while they
				// still lived). Skipped entirely if the count is unavailable
				// (e.g. a king crowned before this feature shipped).
				local epitaph = "";
				try
				{
					local battles = 0;
					if ("World" in ::getroottable() && ::World != null
						&& "Flags" in ::World && ::World.Flags != null
						&& ::World.Flags.has("aura_king_battles"))
						battles = ::World.Flags.get("aura_king_battles");

					if (battles > 0)
					{
						local n = battles + "";
						if (battles < 50)
							epitaph = "%kingname% had fought in " + n + " battles before the end - not long enough to be a legend, long enough to have earned the silence the men now give them.";
						else if (battles <= 150)
							epitaph = n + " battles. That is what %kingname% carried to the end. A full count, by any road that matters - enough blood and ground to know what the crown weighed and to carry it anyway.";
						else
							epitaph = n + " battles. The men will argue about the number for years, because numbers that large stop feeling like counts and start feeling like accusations. %kingname% survived every one of them, until they did not.";
					}
				}
				catch (e) {}

				local body = opening;
				if (epitaph != "") body += "\n\n" + epitaph;

				if (_event.m.HasSuccessor)
				{
					body += "\n\nOf those still standing, %successor% has walked furthest down that road. The ground between where they stand and where %kingname% stood is real - it does not close itself. The Trial of Steel answers no one's grief, only their will.\n\nThe throne waits.";
				}
				else
				{
					body += "\n\nNo one among them stands close enough to the threshold to call it theirs. The road is open, and longer than it looks.\n\nNo one stands ready - yet.";
				}

				this.Text = body;
			}
		});
	}

	function onDetermineStartScreen()
	{
		return "Intro";
	}

	// Gather the fallen king's name and the nearest successor. Called from
	// BOTH firing paths: onPrepare (which runs no matter how the event is
	// triggered - lottery OR the direct ::World.Events.fire we use to make
	// it prompt) and onUpdateScore (the lottery backstop). Centralised so
	// the two paths can never disagree.
	function refreshThroneData()
	{
		this.m.FallenKingName = "";
		this.m.SuccessorName  = "";
		this.m.HasSuccessor   = false;
		try
		{
			if (!("World" in ::getroottable()) || ::World == null) return;
			if (!("Flags" in ::World) || ::World.Flags == null) return;

			local f = ::World.Flags;
			this.m.FallenKingName = (f.has("aura_king_name") && f.get("aura_king_name") != "")
				? f.get("aura_king_name") : "the Aura King";

			local succ = ::AuraPower.findThroneSuccessor();
			if (succ != null)
			{
				this.m.HasSuccessor  = true;
				this.m.SuccessorName = succ.getName();
			}
		}
		catch (e)
		{
			::logError("Aura Power: throne_vacant refreshThroneData - " + e);
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
			local pending = f.has("aura_throne_vacant_pending")
				? f.get("aura_throne_vacant_pending") : false;
			if (!pending) return;

			// Safety: if a living king somehow exists again (e.g. another
			// brother was crowned before this event surfaced), the vacancy
			// is moot - cancel it silently.
			if (::AuraPower.hasLivingKing())
			{
				f.set("aura_throne_vacant_pending", false);
				return;
			}

			this.refreshThroneData();

			// Bid above the Trial of Steel (5000) so the vacancy is
			// acknowledged promptly if the lottery wins the race to it.
			this.m.Score = 6000;
		}
		catch (e)
		{
			::logError("Aura Power: throne_vacant onUpdateScore - " + e);
		}
	}

	function onPrepare()
	{
		// Authoritative data refresh - runs on every actual fire, including
		// the direct ::World.Events.fire path where onUpdateScore is skipped.
		this.refreshThroneData();
	}

	function onPrepareVariables( _vars )
	{
		_vars.push(["kingname",  this.m.FallenKingName != "" ? this.m.FallenKingName : "the Aura King"]);
		_vars.push(["successor", this.m.SuccessorName  != "" ? this.m.SuccessorName  : "no one"]);
	}

	function onClear()
	{
		this.m.FallenKingName = "";
		this.m.SuccessorName  = "";
		this.m.HasSuccessor   = false;
	}
});
