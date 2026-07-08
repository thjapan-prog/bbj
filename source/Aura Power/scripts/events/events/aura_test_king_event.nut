// =====================================================================
//  Aura King Bestowed - Standalone Testing Event
//
//  Fires via ::World.Events.fire("event.aura_test_king") - hooked to
//  the "BestowAuraKingNow" MSU setting. Completely separate from the
//  Trial of Steel flow: it does NOT share Target/TargetTier/cooldown/
//  postpone/rejection state with the trial event. The only thing it
//  touches outside its own m table is the per-brother promotion call.
//
//  Behaviour: when the player confirms, every living roster brother is
//  reset to a clean slate (Hollow Core scar removed, postpone /
//  rejection / cooldown flags cleared) and promoted to Aura King via
//  ::AuraPower.applyTrialSuccess(bro, King). The promotion path already
//  calls refreshAuraSkills, which grants every Tier I/II/III/IV skill
//  the brother is now entitled to.
//
//  m.IsSpecial = true and onUpdateScore returns 0 so this event never
//  enters the world-event lottery - it ONLY fires when invoked manually.
// =====================================================================
this.aura_test_king_event <- ::inherit("scripts/events/event", {
	m = {
		PromotedCount = 0,
		SkippedCount  = 0
	},

	function create()
	{
		this.m.ID = "event.aura_test_king";
		this.m.Title = "A Crown Bestowed";
		this.m.IsSpecial = true;

		// ===== Screen: Intro - the bestow / decline choice =====
		this.m.Screens.push({
			ID = "Intro",
			Text = "A radiance you cannot name settles over the camp. Every warrior in the company feels it - a weight, a knowing, a crown unseen but unmistakable resting on their brow. The aura sleeping in their bones answers, and answers in full. Whatever potential they carried, whatever ladder they would have climbed, has been collapsed into a single instant. They are kings now, all of them.\n\n[i](Testing tool. The roster will be promoted to Aura King in one stroke.)[/i]",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Let the crown find them.",
					function getResult( _event )
					{
						return "Result";
					}
				},
				{
					Text = "Not yet.",
					function getResult( _event )
					{
						::logInfo("Aura Power: aura_test_king - bestowal declined.");
						return 0;
					}
				}
			]
		});

		// ===== Screen: Result - bestowal happens HERE (in start) so the
		//       text we render reflects the actual counts. Putting the
		//       side-effect in start() instead of getResult() mirrors the
		//       Trial of Steel event's success/failure screens.
		this.m.Screens.push({
			ID = "Result",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Forward.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				_event.bestowAuraKingOnAll();
				local pos = ::Const.UI.Color.PositiveValue;
				local neg = ::Const.UI.Color.NegativeValue;
				this.Text = "The crown has settled. [color=" + pos + "]"
					+ _event.m.PromotedCount + "[/color] warrior(s) now bear Aura King; "
					+ "[color=" + neg + "]" + _event.m.SkippedCount + "[/color] were already crowned or beyond reach."
					+ "\n\nReturn to the field and put every aura skill through its paces.";
			}
		});
	}

	// Delegate to the standalone helper in !aura_config.nut. Keeping the
	// roster-iteration logic in exactly one place avoids the two copies
	// drifting apart. Helper returns {promoted, skipped}; we mirror the
	// counts onto m.* so the Result screen text can read them off the
	// event instance.
	function bestowAuraKingOnAll()
	{
		this.m.PromotedCount = 0;
		this.m.SkippedCount  = 0;
		try
		{
			local result = ::AuraPower.bestowAuraKingOnAllNow();
			if (result != null)
			{
				if ("promoted" in result) this.m.PromotedCount = result.promoted;
				if ("skipped"  in result) this.m.SkippedCount  = result.skipped;
			}
		}
		catch (e)
		{
			::logError("Aura Power: event bestowAuraKingOnAll - " + e);
		}
	}

	function onUpdateScore()
	{
		// Never enters the world-event lottery - fires only via
		// ::World.Events.fire("event.aura_test_king").
		this.m.Score = 0;
	}

	function onPrepare()
	{
	}

	function onClear()
	{
		this.m.PromotedCount = 0;
		this.m.SkippedCount  = 0;
	}
});
