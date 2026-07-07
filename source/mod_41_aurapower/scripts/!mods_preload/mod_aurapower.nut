// =====================================================================
//  Aura Power - Knight's Aura
//  Mod registration, MSU settings, and the minimal combat hooks the
//  awakened skills (Undying Will, Resolute Aura) need to do their job.
//
//  ::Hooks (Modern Hooks) and ::MSU are defined during the config phase,
//  which always runs before !mods_preload, so they are safe to use here.
//  MSU's systems (::MSU.Class.*) only become available after MSU's own
//  queue runs - that is why the settings are built inside .queue() below.
//
//  This file deliberately does NOT track kills, per-battle markers, or
//  any combat-proof state. The 1.15.0 redesign moved trial eligibility
//  to LEVEL-ONLY and trial outcomes to a per-attempt RNG roll, so the
//  fragile kill-hook plumbing that 1.14.0 - 1.14.11 fought with has
//  been retired entirely.
// =====================================================================

::AuraPower.HooksMod <- ::Hooks.register(::AuraPower.ID, ::AuraPower.Version, ::AuraPower.Name);
::AuraPower.HooksMod.require([
	"vanilla",
	"mod_msu >= 1.8.0",
	"mod_modern_hooks"
]);

::AuraPower.HooksMod.queue([">mod_msu"], function()
{
	try
	{
		::AuraPower.MSU <- ::MSU.Class.Mod(::AuraPower.ID, ::AuraPower.Version, ::AuraPower.Name);
		local page = ::AuraPower.MSU.ModSettings.addPage("Aura Power");

		local sEnable = page.addBooleanSetting("EnableTrialEvent", ::AuraPower.Tunables.EnableTrialEvent, "Enable Trial of Steel", "When enabled, the Trial of Steel event fires periodically so brothers can attempt to ascend.");
		sEnable.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.EnableTrialEvent = this.getValue();
		});
		::AuraPower.Tunables.EnableTrialEvent = sEnable.getValue();

		// Crown's Hunt is the defining, MANDATORY mechanic of the Last Heir origin -
		// it can no longer be paused from settings (user decision 2026-06-26). The
		// "Enable Crown's Hunt" toggle is intentionally NOT registered: Tunables.
		// EnableCrownsHunt stays hard-true (see !aura_config.nut) so the hunt always
		// fires on the origin and can't be silently switched off. The only way to
		// clear a live hunt is the Reset button, which now requires Test Mode.

		// TestMode: when toggled ON, two things happen:
		//   1) The Tunables.TestMode flag is set so the Trial of Steel
		//      event auto-succeeds and uses 1-day cooldowns.
		//   2) Every living roster brother is IMMEDIATELY promoted to
		//      Aura King via ::AuraPower.bestowAuraKingOnAllNow() - a
		//      standalone helper with no shared state with Trial of
		//      Steel, so this cannot disturb a mid-trial campaign.
		// Toggling TestMode OFF reverts (1) only - already-promoted
		// brothers keep their King tier (testing-bloated saves are
		// expected and explicit).
		// TestMode: when toggled ON, two things happen:
		//   1) The Tunables.TestMode flag is set so the Trial of Steel
		//      event auto-succeeds and uses 1-day cooldowns.
		//   2) Every living roster brother is IMMEDIATELY promoted to
		//      Aura King via ::AuraPower.bestowAuraKingOnAllNow() - a
		//      standalone helper with no shared state with Trial of
		//      Steel, so this cannot disturb a mid-trial campaign.
		// Toggling TestMode OFF reverts (1) only - already-promoted
		// brothers keep their King tier (testing-bloated saves are
		// expected and explicit).
		local sTest = page.addBooleanSetting("TestMode", ::AuraPower.Tunables.TestMode, "Test Mode", "Developer tool. May permanently alter campaign progression. Instantly promotes every brother to Aura King and makes all trials auto-succeed. Save your game first.");
		sTest.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.TestMode = this.getValue();
			if (this.getValue() && !_oldValue)
			{
				try
				{
					if ("AuraPower" in ::getroottable()
						&& "bestowAuraKingOnAllNow" in ::AuraPower)
					{
						::AuraPower.bestowAuraKingOnAllNow();
					}
				}
				catch (e)
				{
					::logError("Aura Power: TestMode bestow trigger - " + e);
				}
			}
		});
		::AuraPower.Tunables.TestMode = sTest.getValue();

		// ---- Crown's Hunt test ----
		// Slider: which tier (1..6) the test fires.
		local sHuntTier = page.addRangeSetting("TestHuntTier", ::AuraPower.Tunables.TestHuntTier, 1, 6, 1, "Test - Crown's Hunt Tier", "Which tier the test button below spawns (1 = King's Patrol ... 6 = The Crown's Vanguard).");
		sHuntTier.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.TestHuntTier = this.getValue();
		});
		::AuraPower.Tunables.TestHuntTier = sHuntTier.getValue();

		// ONE merged button: fires the Crown's Hunt warning EVENT at the slider's
		// tier, and choosing "Brace yourselves." spawns that same tier's army -
		// so the warning and the soldiers both happen, at the chosen difficulty.
		// Deferred fire (World.Events.fire is dropped while this settings screen
		// is open), so close settings after toggling. Toggle OFF then ON to redo.
		local sHuntNow = page.addBooleanSetting("TestCrownsHuntNow", false, "Test - Crown's Hunt", "Spawns an encounter immediately. Save your game first. Fires the Crown's Hunt at the tier set above (warning event + that tier's army). Close settings after toggling; toggle OFF then ON to repeat.");
		sHuntNow.addAfterChangeCallback(function( _oldValue ) {
			if (this.getValue() && !_oldValue)
			{
				try
				{
					if ("AuraPower" in ::getroottable()
						&& "fireRivalChallengeNow" in ::AuraPower)
					{
						// Force the event (and its spawn) to the slider's tier.
						::AuraPower.TestForcedTier = ::AuraPower.Tunables.TestHuntTier;
						::AuraPower.fireRivalChallengeNow();
					}
				}
				catch (e)
				{
					::logError("Aura Power: TEST Crown's Hunt trigger - " + e);
				}
			}
		});

		// Recovery: clear leftover Crown's Hunt flags that silently block the
		// deterministic auto-fire (a live test-party, a recent aura_hunt_last_day,
		// or an aura_hunt_concluded from a tier-6 test). Toggle ON to wipe.
		local sHuntReset = page.addBooleanSetting("ResetCrownsHuntState", false, "Reset Crown's Hunt State", "Recovery tool for debugging and stuck events. Despawns the hunt army and clears leftover Crown's Hunt flags. REQUIRES Test Mode to be ON - the hunt is mandatory on the Last Heir origin and cannot be cleared during normal play.");
		sHuntReset.addAfterChangeCallback(function( _oldValue ) {
			if (this.getValue() && !_oldValue)
			{
				try
				{
					if ("AuraPower" in ::getroottable() && "resetHuntState" in ::AuraPower)
						::AuraPower.resetHuntState();
				}
				catch (e) { ::logError("Aura Power: ResetCrownsHuntState trigger - " + e); }
			}
		});

		// Kept under the legacy key "TrialCooldownDays" so existing MSU
		// save files keep their slider position.
		local sCd = page.addRangeSetting("TrialCooldownDays", ::AuraPower.Tunables.TrialCooldownDays, 1, 60, 1, "Days Between Trials", "Days between Trial of Steel events in the world-event lottery (separate from a brother's own failure cooldown).");
		sCd.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.TrialCooldownDays = this.getValue();
		});
		::AuraPower.Tunables.TrialCooldownDays = sCd.getValue();

		local sScore = page.addRangeSetting("TrialScoreMult", ::AuraPower.Tunables.TrialScoreMult, 0.5, 3.0, 0.5, "Trial Priority", "Scales how likely Trial of Steel is to win the world-event lottery (1.0 = default; higher values make trials fire more often).");
		sScore.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.TrialScoreMult = this.getValue();
		});
		::AuraPower.Tunables.TrialScoreMult = sScore.getValue();

		local sCandidates = page.addRangeSetting("TrialCandidateCount", ::AuraPower.Tunables.TrialCandidateCount, 1, 3, 1, "Trial Candidates", "How many eligible brothers appear when a trial fires. 1 = single random pick (no choice screen); 2-3 = pick which brother attempts.");
		sCandidates.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.TrialCandidateCount = this.getValue();
		});
		::AuraPower.Tunables.TrialCandidateCount = sCandidates.getValue();

		local sTrialBonus = page.addRangeSetting("TrialSuccessBonus", ::AuraPower.Tunables.TrialSuccessBonus, 0, 30, 5, "Trial Success Bonus", "Adds a flat bonus (%) to every brother's Trial of Steel success chance. 0 = default behaviour. Use this to give Dormant brothers a fighting chance at higher tiers.");
		sTrialBonus.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.TrialSuccessBonus = this.getValue();
		});
		::AuraPower.Tunables.TrialSuccessBonus = sTrialBonus.getValue();

		local sPower = page.addRangeSetting("PowerMult", ::AuraPower.Tunables.PowerMult, 0.5, 1.5, 0.05, "Aura Power Multiplier", "Scales the overall strength of aura skill effects (1.0 = default).");
		sPower.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.PowerMult = this.getValue();
		});
		::AuraPower.Tunables.PowerMult = sPower.getValue();

		local sDrain = page.addRangeSetting("FatigueDrainMult", ::AuraPower.Tunables.FatigueDrainMult, 0.5, 2.0, 0.05, "Aura Fatigue Upkeep", "Scales the fatigue upkeep cost of maintaining auras (1.0 = default).");
		sDrain.addAfterChangeCallback(function( _oldValue ) {
			::AuraPower.Tunables.FatigueDrainMult = this.getValue();
		});
		::AuraPower.Tunables.FatigueDrainMult = sDrain.getValue();
	}
	catch (error)
	{
		::logError("Aura Power: failed to build MSU settings (" + error + "). Using default tunables.");
	}

	::logInfo("Aura Power " + ::AuraPower.Version + " loaded.");
});

// =====================================================================
//  entity/tactical/actor combat hooks: Undying Will revive + Resolute
//  Aura morale snap. These are the ONLY skill mechanics that need
//  engine hooks - everything else (trial firing, success rolls, debuff
//  application) runs through the event flow.
// =====================================================================
::mods_hookExactClass("entity/tactical/actor", function(o)
{
	// ----- Helpers for the Tier IV King passives -----------------------
	// Iterates the player faction in tactical and returns true if at least
	// one living actor carries effects.aura_abyssal_crown. Used by the
	// rally-block hook ("Fleeing enemies cannot rally while the King lives").
	local _aura_isAnyAbyssalCrownAlive = function()
	{
		try
		{
			if (!("Tactical" in ::getroottable())) return false;
			if (::Tactical == null) return false;
			local entities = ::Tactical.getEntitiesOfFaction(::Const.Faction.Player);
			if (entities == null) return false;
			foreach (e in entities)
			{
				if (e == null || !e.isAlive()) continue;
				local s = e.getSkills();
				if (s == null) continue;
				if (s.hasSkill("effects.aura_abyssal_crown")) return true;
			}
		}
		catch (err) {}
		return false;
	}

	// BFS over tactical tiles out to _radius rings. Returns the first
	// player-controlled actor carrying aura_abyssal_crown found within
	// the radius, or null. Used by the enemy turn-start morale drop.
	local _aura_findNearbyAbyssalCrown = function( _enemy, _radius )
	{
		try
		{
			local origin = _enemy.getTile();
			if (origin == null) return null;
			local seen = {};
			seen[origin.ID] <- true;
			local frontier = [origin];
			for (local depth = 0; depth < _radius; depth = depth + 1)
			{
				local nextFrontier = [];
				foreach (t in frontier)
				{
					for (local i = 0; i < 6; i = i + 1)
					{
						if (!t.hasNextTile(i)) continue;
						local nt = t.getNextTile(i);
						if (nt.ID in seen) continue;
						seen[nt.ID] <- true;
						nextFrontier.push(nt);
						if (!nt.IsOccupiedByActor) continue;
						local e = nt.getEntity();
						if (e == null || !e.isAlive()) continue;
						if (!e.isPlayerControlled()) continue;
						local s = e.getSkills();
						if (s != null && s.hasSkill("effects.aura_abyssal_crown")) return e;
					}
				}
				frontier = nextFrontier;
			}
		}
		catch (err) {}
		return null;
	}

	// Returns true if the proposed setMoraleState call must be blocked
	// (Cataclysm Heart immunity on King, or Abyssal Crown rally-block on
	// a Fleeing enemy). Read once per setMoraleState call.
	local _aura_shouldBlockMoraleState = function( _actor, _state )
	{
		try
		{
			if (_actor == null || !_actor.isAlive()) return false;
			local skills = _actor.getSkills();
			if (skills == null) return false;

			local curState = _actor.getMoraleState();

			// Cataclysm Heart: while active, the King is immune to morale
			// drops. _state < curState means the call is trying to lower
			// morale; block it.
			if (_actor.isPlayerControlled() && _state < curState)
			{
				if (skills.hasSkill("effects.aura_cataclysm_heart"))
				{
					local cat = skills.getSkillByID("effects.aura_cataclysm_heart");
					if (cat != null && cat.m.IsActiveNow) return true;
				}
			}

			// Abyssal Crown: a Fleeing enemy cannot rally back WHILE STILL NEAR a
			// living crown-bearer (proximity, 2 tiles - same radius as the dread drop).
			// Brutal "no nerve near the King", but proximity so enemies that flee clear
			// of his aura recover and return (NOT the old map-wide check that froze the
			// whole field forever).
			if (!_actor.isPlayerControlled()
				&& curState == ::Const.MoraleState.Fleeing
				&& _state > ::Const.MoraleState.Fleeing)
			{
				if (_aura_findNearbyAbyssalCrown(_actor, 2) != null) return true;
			}
		}
		catch (err) {}
		return false;
	}

	// Helper: try to revive the actor via the Undying Will passive (Tier
	// IV King reward). When the brother would otherwise die we snap them
	// to 25% Max HP, fire the revive VFX/sound, and consume the once-per-
	// battle latch on the passive. Returns true if the revive absorbed
	// the killing blow and the caller should NOT continue with the
	// actual death path.
	local _aura_tryUndying = function( _actor )
	{
		try
		{
			if (!_actor.isPlayerControlled()) return false;
			local skills = _actor.getSkills();
			if (skills == null) return false;
			if (!skills.hasSkill("effects.aura_undying")) return false;
			local undying = skills.getSkillByID("effects.aura_undying");
			if (undying == null) return false;
			if (undying.m.HasFiredThisBattle) return false;

			// Flip BEFORE we touch HP so any callback we trigger (re-
			// entering the setHitpoints hook below) doesn't loop.
			undying.m.HasFiredThisBattle = true;

			local hpMax = _actor.getHitpointsMax();
			local revived = (hpMax * 0.25).tointeger();
			if (revived < 1) revived = 1;
			try { _actor.setHitpoints(revived); }
			catch (e)
			{
				try { _actor.m.Hitpoints = revived; } catch (e2) {}
			}
			undying.triggerReviveEffects();
			::logInfo("Aura Power: Undying Will - revived to " + revived + " HP");
			return true;
		}
		catch (e)
		{
			::logError("Aura Power: _aura_tryUndying - " + e);
		}
		return false;
	}

	// NOTE: Undying Will no longer intercepts kill()/setHitpoints. Those revived
	// AFTER HP hit 0, which on a SOLO King left BB's combat state half-dead and the
	// enemy AI disengaged (proven: post-revive enemies had 80-95% hitchance, Steady
	// morale, valid target - but never attacked). Undying now rides the ENGINE-NATIVE
	// Nine Lives cheat-death (granted at King tier, upgraded by the perk_nine_lives
	// hook below), so the King survives the way vanilla expects and the AI keeps
	// fighting.

	// setMoraleState - three jobs stacked here:
	//   1) Cataclysm Heart (Tier IV King): if the carrier's HP fraction
	//      has crossed the activation threshold, drops are blocked.
	//   2) Abyssal Crown (Tier IV King): enemies in Fleeing cannot rally
	//      back to a higher morale state while any living player brother
	//      carries the crown.
	//   3) Resolute Aura (Tier II Warrior): fires once per battle when
	//      the brother's morale drops to Wavering or worse, AFTER the
	//      vanilla state change has actually landed.
	if ("setMoraleState" in o)
	{
		local _aura_old_setMoraleState = o.setMoraleState;
		o.setMoraleState = function( _state )
		{
			// UNDEAD GUARD (crash fix 2026-06-29): undead (non-ghoul) are fearless
			// and are built WITHOUT a "morale" sprite. Forcing a morale state on a
			// Wiederganger/zombie makes vanilla's morale-icon render call setBrush on
			// the missing "morale" sprite -> "the index 'setBrush' does not exist"
			// (73x in one undead fight, real log). Worse, dropping an undead to
			// Fleeing also makes vanilla's own onTurnStart recovery checkMorale crash
			// the same way every turn after. Skipping them is the canonical vanilla
			// test (getFlags undead && !ghoul, used across vanilla/Legends/Reforged)
			// and is correct game-wise - the King's dread / Pulse should not move
			// undead at all. This one chokepoint covers Abyssal Crown, Pulse and
			// Undying's enemy-morale calls.
			try
			{
				if (this.getFlags().has("undead") && !this.getFlags().has("ghoul"))
					return;
			}
			catch (e) {}

			// Pre-checks: block before vanilla applies the state change.
			try
			{
				if (_aura_shouldBlockMoraleState(this, _state)) return;
			}
			catch (e) {}

			_aura_old_setMoraleState.call(this, _state);

			try
			{
				if (!this.isPlayerControlled()) return;
				if (_state < ::Const.MoraleState.Wavering) return;

				local skills = this.getSkills();
				if (skills != null && skills.hasSkill("effects.aura_resolute"))
				{
					local res = skills.getSkillByID("effects.aura_resolute");
					if (res != null && !res.m.HasFiredThisBattle)
					{
						res.triggerResoluteAura(this);
					}
				}
			}
			catch (e) {}
		}
	}

	// onTurnStart - Abyssal Crown drop. Every time a non-player actor
	// begins their turn, search 2 tiles out for a living player carrying
	// effects.aura_abyssal_crown. If one is found, drop the actor's
	// morale by one step (no-op if already Fleeing). The recursive
	// setMoraleState call passes through this hook again but never
	// trips the rally-block (we're going DOWN) or Cataclysm immunity
	// (non-player target), so the second pass is a clean no-op.
	if ("onTurnStart" in o)
	{
		local _aura_old_onTurnStart = o.onTurnStart;
		o.onTurnStart = function()
		{
			_aura_old_onTurnStart.call(this);


			try
			{
				if (!this.isAlive()) return;
				if (this.isPlayerControlled()) return;

				// Undead are fearless and crash on morale-icon render (see the
				// setMoraleState undead guard above) - never drop their morale.
				if (this.getFlags().has("undead") && !this.getFlags().has("ghoul")) return;

				local king = _aura_findNearbyAbyssalCrown(this, 2);
				if (king == null) return;

				local cur = this.getMoraleState();
				// The dread drop grinds enemies all the way to Fleeing (restored: the
				// King is terrifying). Proximity rally-block lets enemies that escape his
				// aura recover, so it is not a map-wide permanent lock.
				if (cur <= ::Const.MoraleState.Fleeing) return;

				this.setMoraleState(cur - 1);
			}
			catch (e)
			{
				::logError("Aura Power: Abyssal Crown onTurnStart - " + e);
			}
		}
	}
});

// --- entity/tactical/player.onHired: brought up to date for the v1.15.0
//     schema. Runs the schema migration AND refreshes aura skills so a
//     freshly hired brother gets their Hidden Potential indicator
//     immediately, no waiting for a world-state refresh.
// Undying Will = upgraded Nine Lives. Vanilla calls perk.nine_lives.setSpent(true)
// when its cheat-death procs (survives the killing blow the engine-native way). If
// the carrier also has effects.aura_undying, we upgrade that survival to Undying's
// 25% HP and run its extra effects (fatigue/status clear, crown VFX).
::mods_hookExactClass("skills/perks/perk_nine_lives", function(o)
{
	local _aura_old_setSpent = o.setSpent;
	o.setSpent = function( _f )
	{
		local proc = (_f && !this.m.IsSpent);
		_aura_old_setSpent.call(this, _f);
		if (proc)
		{
			try
			{
				local c = this.getContainer();
				if (c != null && c.hasSkill("effects.aura_undying"))
				{
					local actor = c.getActor();
					if (actor != null)
					{
						local revived = (actor.getHitpointsMax() * 0.25).tointeger();
						if (revived < 1) revived = 1;
						if (actor.getHitpoints() < revived) actor.setHitpoints(revived);
						try { actor.setDirty(true); } catch (e2) {}
						local und = c.getSkillByID("effects.aura_undying");
						if (und != null) { und.m.HasFiredThisBattle = true; und.triggerReviveEffects(); }
						::logInfo("Aura Power: Undying via vanilla Nine Lives - King survived at " + actor.getHitpoints() + " HP (engine-native, AI stays engaged)");
					}
				}
			}
			catch (e) { ::logError("Aura Power: nine_lives Undying proc - " + e); }
		}
	}
});

::mods_hookExactClass("entity/tactical/player", function(o)
{
	if ("onHired" in o)
	{
		local _aura_old_onHired = o.onHired;
		o.onHired = function()
		{
			_aura_old_onHired.call(this);
			try
			{
				::AuraPower.runSchemaV2Migration(this);
				::AuraPower.refreshAuraSkills(this);
				try { this.setDirty(true); } catch (e) {}
			}
			catch (e)
			{
				::logError("Aura Power: onHired hook - " + e);
			}
		}
	}
});

// --- Refresh every roster brother. Runs the schema migration (once per
//     brother) and grants any aura skill their current tier entitles
//     them to. Idempotent.
::AuraPower.refreshEntireRoster <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return;
		if (!("getPlayerRoster" in ::World)) return;
		local roster = ::World.getPlayerRoster().getAll();
		local refreshed = 0;
		local dist = [0, 0, 0, 0, 0]; // Dormant, Ember, Chosen, Gifted, Sovereign

		// Origin "The First Ember": one-time, post-load setup (reduce funds,
		// anoint the first brother to Awakening + Chosen). Keyed on the active
		// origin ID and latched inside the helper, so it is a no-op for every
		// other origin and after it has run once. Done BEFORE the per-bro sweep
		// so the anointed brother is refreshed in the same pass.
		::AuraPower.setupFirstEmberOrigin();

		foreach (bro in roster)
		{
			if (bro == null) continue;

			// One-time-per-brother schema migration. Wipes 1.14.x flags
			// and re-rolls the potential against the new 5-tier weights.
			::AuraPower.runSchemaV2Migration(bro);

			::AuraPower.refreshAuraSkills(bro);
			try { bro.setDirty(true); } catch (e) {}
			refreshed = ++refreshed;

			try
			{
				local p = ::AuraPower.getPotentialV2(bro);
				if (p >= 0 && p <= 4) dist[p] = ++dist[p];
			}
			catch (e) {}
		}
		if (refreshed > 0)
		{
			::logInfo("Aura Power: refreshed " + refreshed + " brother(s). "
				+ "Potential distribution -> Dormant: " + dist[0]
				+ ", Ember: " + dist[1]
				+ ", Chosen: " + dist[2]
				+ ", Gifted: " + dist[3]
				+ ", Sovereign Seed: " + dist[4]
				+ " (TestMode=" + ::AuraPower.Tunables.TestMode + ")");
		}

		// TEST MODE reconcile: the MSU toggle's off->on callback is the normal
		// mass-promoter, but that flip can fire while no world is loaded (main
		// menu) or be swallowed by MSU value persistence across save reloads -
		// the checkbox then reads ON while the freshly loaded roster was never
		// promoted (player report 2026-06-12: "re-enabled test mode after a
		// reload, trials auto-succeed but nobody gets the aura"). The bestow
		// helper is idempotent (King/Master brothers are skipped), so while
		// TestMode is ON we simply reconcile on every sweep; new recruits are
		// promoted too, which is what the TEST MODE description advertises.
		if (::AuraPower.Tunables.TestMode)
		{
			try { ::AuraPower.bestowAuraKingOnAllNow(); } catch (e) {}
		}

		// Tail of every roster sweep: detect whether the Aura King has died
		// or risen since last time, and queue the Throne Vacant / Rumour of a
		// King events accordingly. Pure polling on ::World.Flags - no death
		// hook. The events themselves fire through the world-event lottery.
		::AuraPower.updateThroneTracking();

		// Same idea for the Crown's Hunt: detect when the player has destroyed a
		// hunt party (and conclude the whole arc if it was the tier-6 Vanguard).
		::AuraPower.updateHuntTracking();
	}
	catch (e)
	{
		::logError("Aura Power: refreshEntireRoster - " + e);
	}
}

// --- world_state hooks: belt-and-braces refresh on every visible path
//     into the world map, so old saves auto-pick-up new schemas and any
//     fresh aura skill the moment they hit the world view.
//
//     CRITICAL: do NOT refresh inside onDeserialize or loadCampaign.
//     Those run while the save's serialization stream is still being
//     consumed; mutating the roster mid-read (schema migration, skill
//     add/remove, flag writes) aborts deserialize before the fog-of-war
//     block is read, which the engine reports as the unrecoverable
//     "Corrupt data before FoW" critical error. onShow fires AFTER the
//     load is fully complete, so it covers old-save migration safely.
::mods_hookExactClass("states/world_state", function(o)
{
	if ("onShow" in o)
	{
		local _aura_old_onShow = o.onShow;
		o.onShow = function()
		{
			_aura_old_onShow.call(this);
			::AuraPower.refreshEntireRoster();
			// Crown's Hunt conclusion: arm the closing-event fire ONLY from a
			// clean world onShow (a timer armed from the post-battle sweep can be
			// lost in the tactical->world transition). Re-armed on every onShow
			// while pending; the latch self-heals and the event clears the flag.
			try
			{
				if ("AuraPower" in ::getroottable()
					&& "fireCrownConcludedNow" in ::AuraPower
					&& "World" in ::getroottable() && ::World != null
					&& "Flags" in ::World && ::World.Flags != null
					&& ::World.Flags.has("aura_hunt_conclusion_pending")
					&& ::World.Flags.get("aura_hunt_conclusion_pending"))
				{
					::AuraPower.fireCrownConcludedNow();
				}
			}
			catch (e) { ::logError("Aura Power: onShow conclusion arm - " + e); }

			// Crown's Hunt warning: fire deterministically instead of waiting
			// on the world-event lottery, which starves our event for many
			// in-game days on a heavy mod stack. shouldFireCrownHunt() carries
			// the same eligibility gates as the lottery's onUpdateScore, and the
			// event's getResult stamps aura_hunt_last_day so neither path
			// double-fires. Runs AFTER refreshEntireRoster so hunt flags are
			// already reconciled by updateHuntTracking this frame.
			try
			{
				if ("AuraPower" in ::getroottable()
					&& "shouldFireCrownHunt" in ::AuraPower
					&& "fireCrownHuntNow" in ::AuraPower
					&& ::AuraPower.shouldFireCrownHunt())
				{
					::AuraPower.fireCrownHuntNow();
				}
			}
			catch (e) { ::logError("Aura Power: onShow hunt arm - " + e); }

				// Trial of Steel: same deterministic fire as the hunt above. The
				// Trial relied solely on the world-event lottery, which barely
				// polls our event on this stack (the TRIAL DIAG build proved
				// onUpdateScore was never called). shouldFireTrial carries the
				// lottery's eligibility gates plus a cadence flag; the event's
				// onPrepare stamps aura_trial_last_day so neither path double-fires.
				try
				{
					if ("AuraPower" in ::getroottable()
						&& "shouldFireTrial" in ::AuraPower
						&& "fireTrialNow" in ::AuraPower
						&& ::AuraPower.shouldFireTrial())
					{
						::AuraPower.fireTrialNow();
					}
				}
				catch (e) { ::logError("Aura Power: onShow trial arm - " + e); }
		}
	}
	if ("startNewCampaign" in o)
	{
		local _aura_old_startNewCampaign = o.startNewCampaign;
		o.startNewCampaign = function()
		{
			_aura_old_startNewCampaign.call(this);
			::AuraPower.refreshEntireRoster();
		}
	}
	if ("onInit" in o)
	{
		local _aura_old_onInit_ws = o.onInit;
		o.onInit = function()
		{
			_aura_old_onInit_ws.call(this);
			::AuraPower.refreshEntireRoster();
		}
	}
	// Continuous world-tick Crown's Hunt check (the fix for "the hunt never
	// comes", 2026-06-12, day 35->45 save): onShow fires only on load /
	// post-battle, and the lottery only polls onUpdateScore when the engine's
	// periodic draw comes around (~5 in-game days apart on this mod stack -
	// proven in log.html: trial drew on day 40, hunt turned eligible day 43,
	// no draw had happened by day 45). A player who neither loads nor fights
	// can therefore sit days past eligibility with both triggers silent.
	// onProcessInThread runs continuously during world play, so we CHECK here
	// (throttled to every ~5 real seconds).
	//
	// CRASH LESSON (2026-06-12 19:04, real log + stack): NEVER call
	// World.Events.fire from this thread. The engine's fire path runs
	// showEventScreen -> setNormalTime -> setPause -> updateTimeButtons and
	// that last call touches the world-screen topbar UI - from the processing
	// thread it is an instant critical exception. The thread therefore only
	// ARMS a one-shot Real timer; ::AuraPower._huntTickFire then runs in the
	// main context (the same context the old MSU test chain fired this exact
	// event from, repeatedly, without ever crashing) and does the
	// canFireEvent-gated fire there.
	if ("onProcessInThread" in o)
	{
		local _aura_old_onProcessInThread = o.onProcessInThread;
		o.onProcessInThread = function()
		{
			_aura_old_onProcessInThread.call(this);
			try
			{
				if (!("AuraPower" in ::getroottable())) return;
				local now = ::Time.getRealTime();
				if (now - ::AuraPower.HuntTickLastCheck < 5.0) return;
				::AuraPower.HuntTickLastCheck = now;
				// Crown's Hunt tick (quiet check - no CHECK-line logging at this
				// rate). NOTE: do NOT early-return on an ineligible hunt anymore -
				// the Trial tick below must run independently of the hunt.
				if (::AuraPower.shouldFireCrownHunt(false)
					&& !(::AuraPower.HuntFireArmedAt != 0.0 && (now - ::AuraPower.HuntFireArmedAt) < 10.0))
				{
					::AuraPower.HuntFireArmedAt = now;
					::Time.scheduleEvent(::TimeUnit.Real, 250, ::AuraPower._huntTickFire, null);
				}

				// Trial of Steel tick - same arm-a-Real-timer crash rule (NEVER
				// fire World.Events here), checked even when the hunt is ineligible.
				if ("shouldFireTrial" in ::AuraPower
					&& ::AuraPower.shouldFireTrial(false)
					&& !(::AuraPower.TrialFireArmedAt != 0.0 && (now - ::AuraPower.TrialFireArmedAt) < 10.0))
				{
					::AuraPower.TrialFireArmedAt = now;
					::Time.scheduleEvent(::TimeUnit.Real, 250, ::AuraPower._trialTickFire, null);
				}
			}
			catch (e) {}
		}
	}
});

// --- tactical_state.onCombatStart sweep: cover the (rare) cases where
//     a brother joins via combat scripting and the world_state refresh
//     didn't catch them.
::mods_hookExactClass("states/tactical_state", function(o)
{
	local _aura_combat_start_method = null;
	foreach (cand in ["onCombatStart", "onCombatStarted", "enter", "onInit"])
	{
		if (cand in o)
		{
			_aura_combat_start_method = cand;
			break;
		}
	}
	if (_aura_combat_start_method != null)
	{
		local methodName = _aura_combat_start_method;
		local _aura_old_combat_start = o[methodName];
		o[methodName] = function()
		{
			_aura_old_combat_start.call(this);
			::AuraPower.refreshEntireRoster();
		}
	}
});
