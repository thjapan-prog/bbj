// =====================================================================
//  Aura Power - Ascension System (1.15.0 redesign)
//  Core namespace, tunables, lookup tables, and per-brother state helpers.
//
//  Design summary:
//   - Every recruit is rolled into one of 5 potential tiers when first
//     seen by the mod. The potential is NOT a cap - it is a success-rate
//     modifier for the Trial of Steel. Any potential can in principle
//     ascend to Aura King; the table just makes some paths gambler's runs.
//   - Trials unlock by character level alone (4 / 7 / 11 / 14). When the
//     event fires the player chooses Attempt / Postpone / Reject. Attempt
//     rolls vs the success-rate table; failure applies sickness + injury
//     and sets a cooldown. Postpone adds +10% (cap +30%) to the next
//     success roll. Reject skips this tier until the next gate.
//
//  This file lives in !mods_preload so that ::AuraPower exists before any
//  skill or event script is loaded.
// =====================================================================

::AuraPower <- {
	ID = "mod_aurapower",
	Name = "Aura Power - Knight\'s Aura",
	Version = "1.0.5",

	// New 5-tier potential. Flag stored as integer 0..4 under
	// "aura_potential_v2". Old 3-tier flag "aura_potential" is wiped by
	// the schema-v2 migration and ignored from here on.
	Potential = {
		Dormant       = 0,    // 70%
		Ember         = 1,    // 20%
		Chosen        = 2,    //  5%
		Gifted        = 3,    //  3%
		SovereignSeed = 4     //  2%
	},

	// Ascension tier, stored in flag "aura_tier".
	// Tier.Failed (-1) is a legacy state from 1.14.x - the migration
	// clears it back to None so the brother gets a fresh start under the
	// new "anyone can retry" rules.
	Tier = {
		Failed    = -1,
		None      = 0,
		Awakening = 1,
		Warrior   = 2,
		Master    = 3,
		King      = 4
	},

	Tunables = {
		// Test mode: skips the success roll (always succeed) and shrinks
		// every cooldown to 1 day. Useful for chaining a brother all the
		// way to Aura King in one sitting.
		TestMode = false,

		EnableTrialEvent = true,

		// Separate toggle for "The Crown's Hunt" (independent of Trial of Steel).
		// default ON = original behaviour in every way.
		EnableCrownsHunt = true,

		// Calibration tool for "The Crown's Hunt" - spawn an enemy-kingdom noble
		// party of an EXACT tier (1..4) from MSU to verify each composition.
		TestHuntTier = 1,                // slider 1..4
		TestHuntNamedCommander = false,  // force a named commander (minibossify)


		// Days between Trial of Steel firings - now the cadence gap for the
		// deterministic direct-fire (see shouldFireTrial), separate from per-
		// brother failure cooldowns. Name kept as TrialCooldownDays for MSU save
		// backward compat. Default lowered 14 -> 7 -> 2 (2026-06-27): once the
		// trial fires reliably (direct-fire fix) 2 days is a good unattended pace.
		TrialCooldownDays = 2,

		// MSU "Trial Priority" score multiplier. Default 2.0 (2026-06-27). NOTE:
		// since the direct-fire fix this only affects the rare lottery fallback
		// path (cadence-gated); the deterministic trigger fires regardless.
		TrialScoreMult = 2.0,

		// How many eligible brothers are drawn per Trial of Steel event.
		// 1 = single random pick (no choice screen); 2-3 = player picks which
		// brother attempts. Owner-decided default = 3.
		TrialCandidateCount = 3,

		// Level gate per tier.
		T1Level = 4,
		T2Level = 7,
		T3Level = 11,
		// T4 King gate. Was 20 (raised from 14 because the King kit -
		// Undying Will + Abyssal Crown + Cataclysm Heart + every Tier I-III
		// active/passive - is dominant). Lowered to 15 per user request so
		// the crown is reachable earlier in the campaign.
		T4Level = 15,

		// MSU flat bonus % added to the Trial of Steel success chance at every
		// tier. Integer (not 0.0) so every operand in the chance formula stays
		// integer. default 0 = original behaviour, exactly.
		TrialSuccessBonus = 0,

		// Postpone mechanics.
		PostponeDelayDays   = 5,
		PostponeBonusPerStack = 10,
		PostponeBonusMax    = 30,

		// Global multipliers (legacy, still consulted by aura skills).
		PowerMult        = 1.0,
		FatigueDrainMult = 1.0
	}
};

// ---------------------------------------------------------------------
//  Static lookup tables
// ---------------------------------------------------------------------

// SuccessRateTable[tier][potential] -> integer percent.
// Tier indices: 1=Awakening, 2=Warrior, 3=Master, 4=King.
// Potential indices: 0=Dormant, 1=Ember, 2=Chosen, 3=Gifted, 4=Sovereign.
::AuraPower.SuccessRateTable <- [
	null,                          // tier 0 (None) - unused
	[35,  60, 80, 95, 100],        // T1 Awakening
	[15,  40, 65, 85,  95],        // T2 Warrior
	[ 5,  20, 45, 70,  90],        // T3 Master
	[ 1,   8, 25, 55,  85]         // T4 King
];

// Potential King Bonus (1.18.0). Additive flat-stat reward applied ON TOP of
// the base King tier bonus, indexed by the brother's hidden potential. Makes
// a hard-won Dormant King statistically distinct from a born Sovereign Seed.
// Same 7-slot shape as aura_power.getTierBonus:
//   [fatigue, fatigueRecovery, initiative, meleeDef, rangedDef, hitpoints, bravery]
// Dormant = all zero by design: arriving at the crown against 1% odds is its
// own reward; potential caps how high the stat ceiling climbs, not whether you
// can wear the crown. Tuned conservative on purpose - King already carries
// Undying Will + Cataclysm Heart + Abyssal Crown, so this is a dividend, not a
// power spike (Sovereign totals stay well under Reforged/Legends elite curves).
::AuraPower.KingBonusTable <- [
	[0, 0, 0, 0, 0,  0, 0],   // 0 Dormant
	[2, 0, 2, 1, 0,  0, 2],   // 1 Ember
	[4, 1, 4, 2, 2,  5, 3],   // 2 Chosen
	[6, 1, 6, 3, 3,  8, 5],   // 3 Gifted
	[8, 2, 8, 4, 4, 12, 7]    // 4 Sovereign Seed
];

// Sickness duration (days) inflicted on the brother on trial failure.
::AuraPower.FailSicknessDays <- [
	0,   // tier 0 unused
	2,   // T1 fail: Aura Rejection
	3,   // T2 fail: Spiritual Fracture
	5,   // T3 fail: Soul Collapse
	7    // T4 fail (one option among King's Judgment)
];

// Per-brother cooldown (days) on trial failure - blocks ALL further trial
// attempts for that brother until expired (user spec C).
::AuraPower.FailCooldownDays <- [
	0,   // tier 0 unused
	2,   // T1
	4,   // T2
	7,   // T3
	10   // T4
];

// ---------------------------------------------------------------------
//  Display helpers
// ---------------------------------------------------------------------
::AuraPower.getPotentialName <- function( _potential )
{
	switch (_potential)
	{
		case ::AuraPower.Potential.Dormant:        return "Dormant";
		case ::AuraPower.Potential.Ember:          return "Ember";
		case ::AuraPower.Potential.Chosen:         return "Chosen";
		case ::AuraPower.Potential.Gifted:         return "Gifted";
		case ::AuraPower.Potential.SovereignSeed:  return "Sovereign Seed";
	}
	return "Unrevealed";
}

::AuraPower.getTierName <- function( _tier )
{
	switch (_tier)
	{
		case ::AuraPower.Tier.Failed:    return "Hollow Core";
		case ::AuraPower.Tier.None:      return "Unawakened";
		case ::AuraPower.Tier.Awakening: return "Aura Awakening";
		case ::AuraPower.Tier.Warrior:   return "Aura Warrior";
		case ::AuraPower.Tier.Master:    return "Aura Master";
		case ::AuraPower.Tier.King:      return "Aura King";
	}
	return "Unknown";
}

::AuraPower.getTierTagline <- function( _tier )
{
	switch (_tier)
	{
		case ::AuraPower.Tier.Awakening: return "To know death and rise above fear";
		case ::AuraPower.Tier.Warrior:   return "To stand firm in battle";
		case ::AuraPower.Tier.Master:    return "To shatter one\'s own limits";
		case ::AuraPower.Tier.King:      return "To bear the will of kings";
	}
	return "";
}

// Convenience: level gate per tier.
::AuraPower.getLevelGateForTier <- function( _tier )
{
	local t = ::AuraPower.Tunables;
	switch (_tier)
	{
		case ::AuraPower.Tier.Awakening: return t.T1Level;
		case ::AuraPower.Tier.Warrior:   return t.T2Level;
		case ::AuraPower.Tier.Master:    return t.T3Level;
		case ::AuraPower.Tier.King:      return t.T4Level;
	}
	return 99;
}

// ---------------------------------------------------------------------
//  Generic flag helpers (kept from 1.14.x, used by postpone/cooldown/etc)
// ---------------------------------------------------------------------
::AuraPower.getProof <- function( _bro, _key, _default = 0 )
{
	local flags = _bro.getFlags();
	local k = "aura_proof_" + _key;
	return flags.has(k) ? flags.get(k) : _default;
}

::AuraPower.setProof <- function( _bro, _key, _value )
{
	_bro.getFlags().set("aura_proof_" + _key, _value);
}

::AuraPower.incProof <- function( _bro, _key, _by = 1 )
{
	::AuraPower.setProof(_bro, _key, ::AuraPower.getProof(_bro, _key, 0) + _by);
}

// ---------------------------------------------------------------------
//  Potential rolling - 5-tier weighted roll, persisted in aura_potential_v2.
// ---------------------------------------------------------------------
::AuraPower._rollPotentialV2 <- function( _bro )
{
	local flags = _bro.getFlags();
	if (flags.has("aura_potential_v2"))
		return flags.get("aura_potential_v2");

	// Weights: 70 / 20 / 5 / 3 / 2  (sums to 100)
	local roll = ::Math.rand(1, 100);
	local p;
	if      (roll <=  70) p = ::AuraPower.Potential.Dormant;        // 1..70
	else if (roll <=  90) p = ::AuraPower.Potential.Ember;          // 71..90
	else if (roll <=  95) p = ::AuraPower.Potential.Chosen;         // 91..95
	else if (roll <=  98) p = ::AuraPower.Potential.Gifted;         // 96..98
	else                  p = ::AuraPower.Potential.SovereignSeed;  // 99..100
	flags.set("aura_potential_v2", p);
	return p;
}

// The character-sheet indicator and trial-success calculation use this.
// Returns the persisted 5-tier potential, rolling once if needed.
::AuraPower.getPotentialV2 <- function( _bro )
{
	return ::AuraPower._rollPotentialV2(_bro);
}

// Legacy 1.14.x shims so any older skill code that still calls these
// resolves to the new v2 roll. Both are deprecated but kept to prevent
// load-time crashes if some piece of mod or save references them.
::AuraPower.getPotential <- function( _bro )
{
	return ::AuraPower.getPotentialV2(_bro);
}

::AuraPower.getRealPotential <- function( _bro )
{
	return ::AuraPower.getPotentialV2(_bro);
}

::AuraPower._rollPotential <- function( _bro )
{
	return ::AuraPower._rollPotentialV2(_bro);
}

// ---------------------------------------------------------------------
//  Tier accessor
// ---------------------------------------------------------------------
::AuraPower.getTier <- function( _bro )
{
	local flags = _bro.getFlags();
	return flags.has("aura_tier") ? flags.get("aura_tier") : ::AuraPower.Tier.None;
}

// ---------------------------------------------------------------------
//  Uniqueness rule: only one Aura King can exist at a time.
//  Returns true if any LIVING roster brother (other than _exclude, if
//  given) currently holds Tier.King. Used to block the T4 Trial of
//  Steel and to keep the bestow-helper to a single King.
// ---------------------------------------------------------------------
::AuraPower.hasLivingKing <- function( _exclude = null )
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return false;
		if (!("getPlayerRoster" in ::World)) return false;
		foreach (bro in ::World.getPlayerRoster().getAll())
		{
			if (bro == null || !bro.isAlive()) continue;
			if (_exclude != null && bro.getID() == _exclude.getID()) continue;
			if (::AuraPower.getTier(bro) >= ::AuraPower.Tier.King) return true;
		}
	}
	catch (e) {}
	return false;
}

// ---------------------------------------------------------------------
//  Throne tracking (Tier IV King death/dismiss detection).
//
//  Detection is PURE POLLING - it runs at the tail of refreshEntireRoster
//  (world_state.onShow / onInit / startNewCampaign / combat start), never
//  on a fragile death hook. State lives on ::World.Flags so it persists
//  across save/load. The transition "a king existed last sweep -> none now"
//  is what queues the Throne Vacant event; the event itself fires through
//  the normal world-event lottery via its onUpdateScore reading the
//  pending flag. No new engine hook is introduced anywhere.
//
//  Flags used (all on ::World.Flags):
//    aura_king_was_present     bool  - was a living king present last sweep
//    aura_king_name            str   - name of the last living king (so the
//                                       event can mourn them by name after
//                                       they are already gone from the roster)
//    aura_throne_vacant_pending bool - set on the empty transition, consumed
//                                       by the event when the player closes it
// ---------------------------------------------------------------------
// Origin "The First Ember" one-time setup. The scenario itself spawns a plain
// default company (it just inherits early_access_scenario); ALL of the origin's
// custom behaviour is applied HERE, from refreshEntireRoster, after the campaign
// is fully built - which is post-load safe (no mid-spawn roster mutation, the
// thing that hung campaign start in v1). Keyed on the active origin ID, latched
// so it runs exactly once. For any other origin it just marks itself done.
::AuraPower.setupFirstEmberOrigin <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return;
		if (!("Flags" in ::World) || ::World.Flags == null) return;
		local wf = ::World.Flags;
		if (wf.has("aura_first_ember_done") && wf.get("aura_first_ember_done")) return;

		// Active origin must be readable; bail (retry next refresh) if not yet.
		// NB: getOrigin/getID are class methods - call directly via the shared
		// helper, never gate with `("getOrigin" in Assets)` (always false). The old
		// guard here silently dead-ended this backstop on every save.
		local oid = ::AuraPower.getActiveOriginID();
		if (oid == "") return;   // assets not ready yet - retry next refresh

		if (oid != "scenario.aura_inheritor")
		{
			wf.set("aura_first_ember_done", true);   // not our origin - never recheck
			return;
		}

		if (!("getPlayerRoster" in ::World)) return;
		local bros = ::World.getPlayerRoster().getAll();
		if (bros.len() == 0) return;   // roster not built yet - retry next refresh

		// BACKSTOP ONLY. The scenario's onSpawnAssets already anoints the hero
		// (Sovereign Seed + Awakening) and reduces funds at campaign creation -
		// the reliable path. This re-asserts the aura if that grant somehow did
		// not stick (idempotent: only promotes when still below Awakening, never
		// clobbers a later trial-driven tier, never touches money again).
		local hero = bros[0];
		if (hero != null)
		{
			local hf = hero.getFlags();
			if (::AuraPower.getTier(hero) < ::AuraPower.Tier.Awakening)
			{
				hf.set("aura_potential_v2", ::AuraPower.Potential.SovereignSeed);
				hf.set("aura_potential_v2_migrated", true);
				try { hero.setTitle("the Last Heir"); } catch (e) {}
				::AuraPower.setTier(hero, ::AuraPower.Tier.Awakening);
				::logInfo("Aura Power: Blood of the Last House backstop - re-asserted Awakening on "
					+ hero.getName() + ".");
			}
		}

		wf.set("aura_first_ember_done", true);
	}
	catch (e)
	{
		::logError("Aura Power: setupFirstEmberOrigin - " + e);
	}
}

// ---------------------------------------------------------------------
//  TEST helper: fire the "A Rival Aura" event on demand (the MSU toggle).
//
//  WHY this is deferred and not a plain ::World.Events.fire: the MSU
//  setting callback runs while the mod-settings screen is still on top of
//  the world map. World.Events.fire from that context sets ActiveEvent but
//  World.State.showEventScreen never displays it - the event is silently
//  swallowed (observed in log.html: "...fired on demand." with no event on
//  screen). The reliable fix is a self-rescheduling real-time retry that
//  waits until the settings screen closes and World.Events.canFireEvent is
//  true, then fires exactly once. A module-level latch keeps a single chain
//  alive; the retry is capped so it can never spin forever. This is the same
//  Time.scheduleEvent(Real) pattern the origin intro and dash VFX use.
// ---------------------------------------------------------------------
::AuraPower.RivalFireChainActive <- false;
::AuraPower.RivalFireRetries     <- 0;

::AuraPower._rivalFireTick <- function( _tag )
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null
			|| !("Events" in ::World) || ::World.Events == null)
		{
			::AuraPower.RivalFireChainActive = false;   // no world - abandon
			::AuraPower.TestForcedTier = 0;             // never leak the slider tier into a later real fire
			return;
		}

		local canFire = false;
		try { canFire = ::World.Events.canFireEvent(true, true); } catch (e) { canFire = false; }

		if (canFire)
		{
			::World.Events.fire("event.aura_rival_challenge");
			::logInfo("Aura Power: TEST - rival challenge fired (world ready after "
				+ ::AuraPower.RivalFireRetries + " retries).");
			::AuraPower.RivalFireChainActive = false;   // done
			return;
		}

		::AuraPower.RivalFireRetries = ::AuraPower.RivalFireRetries + 1;
		if (::AuraPower.RivalFireRetries >= 60)   // ~48s cap at 800ms/tick
		{
			::logInfo("Aura Power: TEST - rival challenge gave up (world never became event-ready).");
			::AuraPower.RivalFireChainActive = false;
			::AuraPower.TestForcedTier = 0;       // never leak the slider tier into a later real fire
			return;
		}

		// Settings screen still up / another event in progress - try again.
		::Time.scheduleEvent(::TimeUnit.Real, 800, ::AuraPower._rivalFireTick, null);
	}
	catch (e)
	{
		::logError("Aura Power: _rivalFireTick - " + e);
		::AuraPower.RivalFireChainActive = false;
	}
}

::AuraPower.fireRivalChallengeNow <- function()
{
	// Self-heal a stuck latch: if a previous chain never reset (e.g. its tick
	// never ran), don't silently swallow the request - log and restart.
	if (::AuraPower.RivalFireChainActive)
		::logInfo("Aura Power: TEST - Crown's Hunt fire already pending; restarting the retry chain.");
	::AuraPower.RivalFireChainActive = true;
	::AuraPower.RivalFireRetries     = 0;
	::logInfo("Aura Power: TEST - Crown's Hunt event requested; waiting for world to be event-ready.");
	::Time.scheduleEvent(::TimeUnit.Real, 800, ::AuraPower._rivalFireTick, null);
}

// Fire the closing event DIRECTLY (no Time.scheduleEvent - a Real timer armed
// around the tactical->world transition never runs here; proven by diagnostics).
// Called straight from world_state.onShow (a clean world-map context where
// World.Events.fire actually displays). If the world can't show an event this
// instant (canFireEvent false during the transition), we leave the pending flag
// and the NEXT onShow retries; the lottery score on the event is a final
// backstop. The event's getResult clears aura_hunt_conclusion_pending.
::AuraPower.fireCrownConcludedNow <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null
			|| !("Events" in ::World) || ::World.Events == null) return;
		// Fire DIRECTLY with NO canFireEvent gate: that strict check returns false
		// right after the hunt battle (the rival noble house is hostile, so its
		// parties block it) and was swallowing the event. onShow means the world
		// map is up, so World.Events.fire shows the screen. If showEventScreen
		// fails on a transitional frame it clears ActiveEvent but leaves our
		// pending flag set, so the next onShow / the lottery (score 6000) retries.
		::World.Events.fire("event.aura_crown_concluded");
		::logInfo("Aura Power: Crown's Hunt - closing event fired.");
	}
	catch (e) { ::logError("Aura Power: fireCrownConcludedNow - " + e); }
}

// ---------------------------------------------------------------------
//  Deterministic Crown's Hunt trigger.
//
//  The warning event (event.aura_rival_challenge) was previously left to
//  the world-event lottery alone. On a heavy mod stack (Reforged + Legends
//  + dynamic_spawns + ... ~35 mods) the lottery starves it for many in-game
//  days: a huge competing event pool plus a global event-cooldown that other
//  mods' events keep consuming means our score-2500 bid rarely wins a draw.
//  Players on Last Heir reported it never arriving across 12+ eligible days.
//
//  So we stop depending on winning the weighted draw. world_state.onShow
//  calls shouldFireCrownHunt() and, when eligible, fires the warning DIRECTLY
//  via fireCrownHuntNow() - the same proven path fireCrownConcludedNow uses.
//  The event's onPrepare still computes the tier; its "Brace yourselves"
//  getResult stamps aura_hunt_last_day, which BOTH this guard and the lottery
//  onUpdateScore backstop honour, so the 20-day cadence holds and nothing
//  double-fires. The lottery score is kept as a harmless secondary backstop.
// ---------------------------------------------------------------------

// Robust active-origin id read.
//
// ROOT-CAUSE FIX (2026-06-12): getOrigin() and getID() are CLASS METHODS, so
// `("getOrigin" in ::World.Assets)` and `("getID" in origin)` return FALSE in
// BB's Squirrel - the `in` operator only sees an instance's own slots, never the
// methods inherited from its class. The mod's old origin gates used those `in`
// guards and therefore tripped on EVERY call, silently making every Last Heir
// feature think "not our origin." That is why The Crown's Hunt never fired - both
// the lottery bid AND the new deterministic onShow path were killed at the same
// dead guard. Vanilla and Legends always call ::World.Assets.getOrigin().getID()
// DIRECTLY; we do the same here, wrapped in try/catch only for the brief window
// during load before Assets is ready (returns "" = not-ready, distinct from a
// real non-matching origin id).
::AuraPower.getActiveOriginID <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return "";
		if (!("Assets" in ::World) || ::World.Assets == null) return "";
		local origin = ::World.Assets.getOrigin();   // class method - call directly
		if (origin == null) return "";
		return origin.getID();
	}
	catch (e) { return ""; }
}

::AuraPower.isLastHeirOrigin <- function()
{
	return ::AuraPower.getActiveOriginID() == "scenario.aura_inheritor";
}

// Mirrors the gates in aura_rival_challenge_event.onUpdateScore (minus the
// scoring), so the direct fire only happens when the lottery would also be
// eligible. Returns true when a fresh hunt warning should be shown right now.
//
// _verbose=false is for the continuous world-tick caller (every ~5 real
// seconds) - same answer, no CHECK/NO log lines at that frequency. The onShow
// caller stays verbose so load-time diagnostics keep working.
::AuraPower.shouldFireCrownHunt <- function( _verbose = true )
{
	// DIAGNOSTIC build (2026-06-12): logs exactly which gate blocks the fire, so a
	// "never arrives" report on a real save can be pinned to a leftover flag vs a
	// genuine ineligibility. Safe to quieten once the cause is confirmed.
	local function block( _why ) { if (_verbose) ::logInfo("Aura Power: shouldFireCrownHunt -> NO (" + _why + ")"); return false; }
	try
	{
		if (!::AuraPower.Tunables.EnableTrialEvent) return block("EnableTrialEvent toggle OFF");
		if (!::AuraPower.Tunables.EnableCrownsHunt) return block("EnableCrownsHunt toggle OFF");
		if (!("World" in ::getroottable()) || ::World == null) return block("no World");
		if (!("Flags" in ::World) || ::World.Flags == null) return block("no World.Flags");

		local wf = ::World.Flags;

		// Last Heir origin only. Uses getActiveOriginID (calls getOrigin DIRECTLY -
		// the old `("getOrigin" in Assets)` guard was always false; see that helper).
		local oid = ::AuraPower.getActiveOriginID();
		if (oid != "scenario.aura_inheritor") return false;   // not our origin (quiet)

		// From here we ARE on Last Heir, so every block reason is worth logging.
		local concluded = wf.has("aura_hunt_concluded") ? wf.get("aura_hunt_concluded") : false;
		local partyId   = wf.has("aura_hunt_party_id") ? wf.get("aura_hunt_party_id") : 0;
		local lastDay   = wf.has("aura_hunt_last_day") ? wf.get("aura_hunt_last_day") : -999;
		local day       = ::AuraPower.getCurrentDay();
		if (_verbose)
			::logInfo("Aura Power: shouldFireCrownHunt CHECK day=" + day + " concluded=" + concluded
				+ " partyId=" + partyId + " lastDay=" + lastDay + " toggle=" + ::AuraPower.Tunables.EnableTrialEvent);

		// The whole arc is over once the tier-6 Vanguard has been beaten.
		if (concluded) return block("aura_hunt_concluded=true (arc finished / leftover test conclusion)");

		// Don't stack: a hunt party is still out there (unbeaten / chasing).
		if (partyId != 0)
		{
			local active = null;
			try { active = ::World.getEntityByID(partyId); } catch (e) { active = null; }
			if (active != null) return block("hunt party " + partyId + " still alive on map");
		}

		// Grace period at the start of the campaign.
		if (day < 20) return block("day " + day + " < 20 grace");

		// ~20-day cadence between hunts (stamped by the event's getResult).
		if (lastDay > -999 && (day - lastDay) < 20) return block("cadence: " + (day - lastDay) + " days since last (<20)");

		if (_verbose) ::logInfo("Aura Power: shouldFireCrownHunt -> YES (firing)");
		return true;
	}
	catch (e) { ::logError("Aura Power: shouldFireCrownHunt - " + e); return false; }
}

// Fire the warning DIRECTLY. canFireEvent is intentionally NOT gated (exactly
// as fireCrownConcludedNow): onShow means the world map is up, and the nearby
// hostile parties that are common in this stack make that strict check return
// false and swallow the event. If a transitional frame drops the fire, the
// event's getResult never runs, so aura_hunt_last_day stays unset and the next
// onShow simply retries.
::AuraPower.fireCrownHuntNow <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null
			|| !("Events" in ::World) || ::World.Events == null) return;
		// A REAL fire must never consume a leftover test override. This is the
		// exact day-43 incident: a test request's retry chain stalled with
		// TestForcedTier=5 still set, then this deterministic fire ran and the
		// event's onPrepare served a tier-5 war detachment to a company that
		// had only beaten the tier-1 patrol.
		if (("TestForcedTier" in ::AuraPower) && ::AuraPower.TestForcedTier != 0)
		{
			::logInfo("Aura Power: Crown's Hunt - clearing stale test tier override (" + ::AuraPower.TestForcedTier + ") before the real fire.");
			::AuraPower.TestForcedTier = 0;
		}
		::World.Events.fire("event.aura_rival_challenge");
		::logInfo("Aura Power: Crown's Hunt - warning fired directly (deterministic, day "
			+ ::AuraPower.getCurrentDay() + ").");
	}
	catch (e) { ::logError("Aura Power: fireCrownHuntNow - " + e); }
}

// Wipe ALL Crown's Hunt progress flags AND despawn the tracked hunt army if
// one is still roaming. Recovery tool for saves bloated by MSU testing (a
// leftover live party, a stamped aura_hunt_last_day, or an aura_hunt_concluded
// from a tier-6 test) - any of which silently blocks the next hunt. The
// despawn uses party.die(), the same call vanilla/Legends contracts use to
// remove their pursuit parties.
::AuraPower.resetHuntState <- function()
{
	try
	{
		// Crown's Hunt is mandatory on the Last Heir origin: a normal player must
		// NOT be able to despawn the pursuing army or reset the tier ladder to
		// escape it (user decision 2026-06-26). The Reset button only does anything
		// while Test Mode is ON - the dev's hunt-testing/recovery path stays open,
		// but live campaigns can't cheese the hunt away.
		if (!::AuraPower.Tunables.TestMode)
		{
			::logInfo("Aura Power: Reset Crown's Hunt State ignored - enable Test Mode to use it (the hunt is mandatory on the Last Heir origin).");
			return;
		}
		if (!("World" in ::getroottable()) || ::World == null
			|| !("Flags" in ::World) || ::World.Flags == null) return;
		local wf = ::World.Flags;
		if (wf.has("aura_hunt_party_id") && wf.get("aura_hunt_party_id") != 0)
		{
			try
			{
				local party = ::World.getEntityByID(wf.get("aura_hunt_party_id"));
				if (party != null)
				{
					party.die();
					::logInfo("Aura Power: Crown's Hunt RESET - despawned the roaming hunt party.");
				}
			}
			catch (e) {}
		}
		wf.set("aura_hunt_concluded", false);
		wf.set("aura_hunt_party_id", 0);
		wf.set("aura_hunt_active_tier", 0);
		wf.set("aura_hunt_last_day", -999);
		wf.set("aura_hunt_relief", 0);
		wf.set("aura_hunt_wave", 0);
		wf.set("aura_hunt_next_tier", 1);
		wf.set("aura_hunt_conclusion_pending", false);
		::logInfo("Aura Power: Crown's Hunt state RESET (all hunt flags cleared, ladder back to tier 1).");
	}
	catch (e) { ::logError("Aura Power: resetHuntState - " + e); }
}

// ---------------------------------------------------------------------
//  Finds a valid empty land tile 5-13 tiles from the player to drop a hostile
//  party on (used by The Crown's Hunt to spawn the kingdom's army a short
//  march away, so the warning event buys real preparation time). Rejects
//  ocean / shore / mountain / occupied / off-map tiles.
// ---------------------------------------------------------------------
::AuraPower._findRivalSpawnTile <- function( _playerTile )
{
	local best = null;
	for (local g = 0; g < 900 && best == null; g = g + 1)
	{
		local dx = ::Math.rand(-11, 11);
		local dy = ::Math.rand(-11, 11);
		local adx = (dx < 0) ? -dx : dx;
		local ady = (dy < 0) ? -dy : dy;
		local manhattan = adx + ady;
		if (manhattan < 5 || manhattan > 13) continue;   // a few tiles off, never on top of the player
		local x = _playerTile.SquareCoords.X + dx;
		local y = _playerTile.SquareCoords.Y + dy;
		if (x < 2 || y < 2
			|| x > ::Const.World.Settings.SizeX - 2
			|| y > ::Const.World.Settings.SizeY - 2) continue;
		if (!::World.isValidTileSquare(x, y)) continue;
		local tile = ::World.getTileSquare(x, y);
		if (tile.Type == ::Const.World.TerrainType.Ocean
			|| tile.Type == ::Const.World.TerrainType.Shore
			|| tile.Type == ::Const.World.TerrainType.Mountains) continue;
		if (tile.IsOccupied) continue;
		best = tile;
	}
	return best;
}

// =====================================================================
//  The Crown's Hunt - 6 discrete army tiers (1..6).
// =====================================================================
// We cannot author a vanilla spawn template by hand (the engine stores it in an
// internal array form - every attempt threw "the index 'N' does not exist" /
// "indexing array with string"), and ::Const.World.Spawn.Noble CAPS at greatsword
// (no hedge knights / knights / master archers / swordmasters at ANY resource).
// So each tier's EXACT composition is built by hand: spawn a minimal noble party,
// clear it, and add every unit with ::Const.World.Common.addTroop. See
// spawnKingdomHuntersTier / _addHuntUnit.
//
// HuntTierData fields:
//   Comp      = [[troopTypeName, count], ...]  the exact line-up.
//   Commander = a troop type added once with a huge minibossify so it rolls its
//               NAMED variant (the army's leader); null = none.
//   Sirs      = number of NAMED noble Knights ("Sir ___") added on top - the
//               heaviest signature elites, reserved for the top tiers.
//
// Tuning is "hard but winnable": line infantry (footman/billman) pads every tier
// so the player can cut a path forward; the lethal Swordmaster is held to tier 6
// only, Hedge Knights are the tanky-but-fair backbone up top, Master Archers are
// capped low (ranged elites punish hard). Size grows ~4 -> ~15 to track a company
// growing from ~4 to ~12 brothers. Tier climbs a ladder - one rung per beaten
// wave (aura_hunt_next_tier). Beating tier 6 ends the hunt for good (see
// updateHuntTracking).
::AuraPower.HuntTierData <- [
	null,   // tier 0 unused
	{ Label = "King's Patrol",        Commander = null, Sirs = 0,
	  Comp = [["Footman",3],["Sergeant",1]] },
	{ Label = "Royal Patrol",         Commander = null, Sirs = 0,
	  Comp = [["Footman",4],["Billman",1],["Arbalester",1],["Sergeant",1]] },
	{ Label = "Royal Hunters",        Commander = null, Sirs = 0,
	  Comp = [["Footman",4],["Billman",2],["Arbalester",1],["Greatsword",1],["Sergeant",1]] },
	{ Label = "Royal War Party",      Commander = null, Sirs = 0,
	  Comp = [["Footman",3],["Billman",2],["Arbalester",2],["Greatsword",2],["HedgeKnight",2],["StandardBearer",1],["Sergeant",1]] },
	{ Label = "Royal War Detachment", Commander = "HedgeKnight", Sirs = 1,
	  Comp = [["Footman",2],["Greatsword",3],["Billman",2],["Arbalester",1],["MasterArcher",1],["HedgeKnight",3],["StandardBearer",1],["Sergeant",1]] },
	{ Label = "The Crown's Vanguard", Commander = "Swordmaster", Sirs = 2,
	  Comp = [["Greatsword",3],["Billman",2],["MasterArcher",2],["HedgeKnight",4],["Swordmaster",2],["StandardBearer",1],["Sergeant",2]] }
];

// Set by the merged MSU test button so the Crown's Hunt event uses the slider's
// tier for BOTH the warning text and the spawned army. 0 = use the ladder.
::AuraPower.TestForcedTier <- 0;

// Continuous world-tick state for the Crown's Hunt check (not serialized -
// a real-time throttle, a once-per-day log latch, and the armed-fire window).
::AuraPower.HuntTickLastCheck <- 0.0;
::AuraPower.HuntTickBlockLogDay <- -1;
::AuraPower.HuntFireArmedAt <- 0.0;

// Main-context one-shot fire for the world-tick trigger.
//
// CRASH LESSON (2026-06-12 19:04, real log): World.Events.fire MUST NOT be
// called from world_state.onProcessInThread. The engine's fire path runs
// showEventScreen -> setNormalTime -> setPause -> updateTimeButtons, which
// touches the world-screen TOPBAR UI - doing that from the processing thread
// is an instant critical exception. So the thread only ARMS a Real timer and
// THIS callback (timer callbacks run in the main context - the exact path the
// old MSU test chain used to fire this same event without ever crashing)
// re-checks the gates and fires.
::AuraPower._huntTickFire <- function( _tag = null )
{
	try
	{
		if (::AuraPower.shouldFireCrownHunt(false))
		{
			local canFire = false;
			try { canFire = ::World.Events.canFireEvent(true, true); } catch (e) { canFire = false; }
			if (canFire)
			{
				::AuraPower.fireCrownHuntNow();
			}
			else
			{
				// Eligible, but the engine can't show an event right now
				// (another event up / a screen open). Log once per day so the
				// wait is visible in log.html; the world tick will re-arm.
				local day = ::AuraPower.getCurrentDay();
				if (::AuraPower.HuntTickBlockLogDay != day)
				{
					::AuraPower.HuntTickBlockLogDay = day;
					::logInfo("Aura Power: Crown's Hunt is ready (day " + day + ") - waiting for a free event slot.");
				}
			}
		}
	}
	catch (e) { ::logError("Aura Power: _huntTickFire - " + e); }
	// Always reopen the arming window so the world tick can arm again
	// (also self-heals if a timer ever fires after a state transition).
	::AuraPower.HuntFireArmedAt = 0.0;
}

// =====================================================================
//  Trial of Steel deterministic firing (2026-06-27 fix).
//
//  ROOT CAUSE (proven via the TRIAL DIAG build): the Trial relied ENTIRELY
//  on BB's world-event lottery, which on this heavy mod stack polls
//  onUpdateScore only ~every 5 in-game days - across multiple test sessions
//  onUpdateScore was logged ZERO times. The Crown's Hunt already bypasses
//  the lottery with a deterministic onShow + world-tick fire; the Trial
//  never got the same treatment, so it "fired once then vanished for weeks"
//  no matter how high the player set Trial Priority / how low Days Between.
//  These helpers mirror the hunt pattern exactly (same crash rules).
// =====================================================================
::AuraPower.TrialTickBlockLogDay <- -1;
::AuraPower.TrialFireArmedAt <- 0.0;

// The same eligibility the lottery's onUpdateScore applies (minus scoring),
// plus a world-level cadence (aura_trial_last_day, stamped in the event's
// onPrepare) so the deterministic trigger never re-pops the trial faster than
// the "Days Between Trials" (TrialCooldownDays) setting. Returns true when a
// fresh Trial of Steel should be shown right now.
::AuraPower.shouldFireTrial <- function( _verbose = true )
{
	local function block( _why ) { if (_verbose) ::logInfo("Aura Power: shouldFireTrial -> NO (" + _why + ")"); return false; }
	try
	{
		if (!::AuraPower.Tunables.EnableTrialEvent) return block("EnableTrialEvent toggle OFF");
		if (!("World" in ::getroottable()) || ::World == null) return block("no World");
		if (!("Flags" in ::World) || ::World.Flags == null) return block("no World.Flags");

		local day = ::AuraPower.getCurrentDay();
		local lastDay = ::World.Flags.has("aura_trial_last_day") ? ::World.Flags.get("aura_trial_last_day") : -999;
		local gap = ::AuraPower.Tunables.TestMode ? 1 : ::AuraPower.Tunables.TrialCooldownDays;
		if (lastDay > -999 && (day - lastDay) < gap)
			return block("cadence: " + (day - lastDay) + " day(s) since last trial (< " + gap + ")");

		local cands = ::AuraPower.findTrialCandidates(::AuraPower.Tunables.TrialCandidateCount);
		if (cands.len() == 0) return block("no eligible brothers");

		if (_verbose) ::logInfo("Aura Power: shouldFireTrial -> YES (day " + day + ", " + cands.len() + " eligible)");
		return true;
	}
	catch (e) { ::logError("Aura Power: shouldFireTrial - " + e); return false; }
}

// Fire the Trial of Steel DIRECTLY (main context ONLY - same crash rule as the
// hunt: never from onProcessInThread). The event's onPrepare draws candidates
// and stamps aura_trial_last_day, so a swallowed fire (no free event slot)
// leaves the cadence flag unset and the next onShow / world-tick retries.
::AuraPower.fireTrialNow <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null
			|| !("Events" in ::World) || ::World.Events == null) return;
		::World.Events.fire("event.aura_trial_of_steel");
		::logInfo("Aura Power: Trial of Steel - fired directly (deterministic, day "
			+ ::AuraPower.getCurrentDay() + ").");
	}
	catch (e) { ::logError("Aura Power: fireTrialNow - " + e); }
}

// Main-context one-shot fire armed by the world tick (mirror of _huntTickFire).
::AuraPower._trialTickFire <- function( _tag = null )
{
	try
	{
		if (::AuraPower.shouldFireTrial(false))
		{
			local canFire = false;
			try { canFire = ::World.Events.canFireEvent(true, true); } catch (e) { canFire = false; }
			if (canFire)
			{
				::AuraPower.fireTrialNow();
			}
			else
			{
				local day = ::AuraPower.getCurrentDay();
				if (::AuraPower.TrialTickBlockLogDay != day)
				{
					::AuraPower.TrialTickBlockLogDay = day;
					::logInfo("Aura Power: Trial of Steel is ready (day " + day + ") - waiting for a free event slot.");
				}
			}
		}
	}
	catch (e) { ::logError("Aura Power: _trialTickFire - " + e); }
	::AuraPower.TrialFireArmedAt = 0.0;
}

// Adds N copies of a named troop type to a party via the vanilla addTroop API.
// _minibossify is the same lever vanilla uses to roll a named/elite variant
// (pass a big number on the commander to guarantee the named version).
::AuraPower._addHuntUnit <- function( _party, _troopName, _count, _minibossify )
{
	local def = null;
	try { def = ::Const.World.Spawn.Troops[_troopName]; } catch (e) { def = null; }
	if (def == null)
	{
		::logInfo("Aura Power: hunt - troop type '" + _troopName + "' not found; skipped.");
		return 0;
	}
	local added = 0;
	for (local i = 0; i < _count; i = i + 1)
	{
		try { ::Const.World.Common.addTroop(_party, { Type = def }, false, _minibossify); added = added + 1; }
		catch (e) { ::logError("Aura Power: addTroop '" + _troopName + "' - " + e); }
	}
	return added;
}

// LEGACY (2026-06-12): no longer used by the hunt event - the tier now climbs
// the aura_hunt_next_tier ladder one rung per beaten wave. This strength-based
// formula could jump several tiers between waves (real save: beat the tier-1
// patrol, met a tier-5 war detachment). Kept only as a reference curve.
::AuraPower.computeHuntTier <- function( _reliefSteps = 0 )
{
	local size = 0;
	local sumLvl = 0;
	try
	{
		foreach (bro in ::World.getPlayerRoster().getAll())
		{
			if (bro == null || !bro.isAlive()) continue;
			size = size + 1;
			sumLvl = sumLvl + bro.getLevel();
		}
	}
	catch (e) {}
	local avg = (size > 0) ? (sumLvl / size) : 1;
	local day = ::AuraPower.getCurrentDay();

	local tier = 1;
	if (avg >= 4  && day >= 25)  tier = 2;
	if (avg >= 6  && day >= 50)  tier = 3;
	if (avg >= 8  && day >= 90)  tier = 4;
	if (avg >= 10 && day >= 120) tier = 5;
	if (avg >= 11 && day >= 200) tier = 6;

	tier = tier - _reliefSteps;
	if (tier < 1) tier = 1;
	if (tier > 6) tier = 6;
	return tier;
}

// Spawns the tier's noble party near the player, hostile and intercepting.
// _forceMiniboss forces a named commander on any tier (for testing rank).
::AuraPower.spawnKingdomHuntersTier <- function( _tier, _forceMiniboss = false )
{
	try
	{
		if (_tier < 1) _tier = 1;
		if (_tier > 6) _tier = 6;

		if (!("World" in ::getroottable()) || ::World == null) return null;
		if (!("State" in ::World) || ::World.State == null) return null;
		local player = ::World.State.getPlayer();
		if (player == null) return null;

		// Enemy kingdom = northern-most noble house (the Last Heir origin's rule).
		// Forced hostile so the soldiers actually engage - works in any campaign.
		local nobles = ::World.FactionManager.getFactionsOfType(::Const.FactionType.NobleHouse);
		if (nobles == null || nobles.len() == 0)
		{
			::logInfo("Aura Power: spawnKingdomHuntersTier - no noble house on this map.");
			return null;
		}
		local faction = null;
		local bestY = -1.0;
		foreach (n in nobles)
		{
			local sumY = 0.0;
			local cnt = 0;
			foreach (s in n.getSettlements())
			{
				sumY += s.getTile().SquareCoords.Y;
				cnt = cnt + 1;
			}
			if (cnt > 0)
			{
				local avgY = sumY / cnt;
				if (avgY > bestY) { bestY = avgY; faction = n; }
			}
		}
		if (faction == null) faction = nobles[0];
		try { faction.addPlayerRelation(-200.0, "A rival kingdom marching to hunt the company"); } catch (e) {}

		local tile = ::AuraPower._findRivalSpawnTile(player.getTile());
		if (tile == null)
		{
			::logInfo("Aura Power: spawnKingdomHuntersTier - no open tile near the player.");
			return null;
		}

		local data = ::AuraPower.HuntTierData[_tier];

		// Spawn a MINIMAL valid noble party (resources 1 -> almost nothing), then
		// replace its roster with our hand-picked composition via addTroop. This
		// is the only way to field elite ranks the Noble list won't spawn.
		local party = faction.spawnEntity(tile, data.Label, false, ::Const.World.Spawn.Noble, 1, 0);
		if (party == null)
		{
			::logInfo("Aura Power: spawnKingdomHuntersTier - spawnEntity returned null (tier " + _tier + ").");
			return null;
		}

		// Clear the few auto-spawned troops so the party is EXACTLY our comp.
		try { party.getTroops().clear(); } catch (e) {}

		local total = 0;
		foreach (pair in data.Comp)
			total = total + ::AuraPower._addHuntUnit(party, pair[0], pair[1], 0);
		// Named "Sir ___" knights: heavy named noble Knights (forced named variant).
		local sirs = ("Sirs" in data) ? data.Sirs : 0;
		if (sirs > 0)
			total = total + ::AuraPower._addHuntUnit(party, "Knight", sirs, 9999);
		// Named commander: one extra elite forced to roll its named variant.
		if (data.Commander != null || _forceMiniboss)
		{
			local cmd = (data.Commander != null) ? data.Commander : "Swordmaster";
			total = total + ::AuraPower._addHuntUnit(party, cmd, 1, 9999);
		}
		try { party.updateStrength(); } catch (e) {}

		try { party.setDescription("Soldiers of a rival kingdom, marching to hunt the company down."); } catch (e) {}
		try { party.setMovementSpeed(::Const.World.MovementSettings.Speed * 1.4); } catch (e) {}
		try { party.setAttackableByAI(false); } catch (e) {}

		try
		{
			local c = party.getController();
			try { c.getBehavior(::Const.World.AI.Behavior.ID.Flee).setEnabled(false); } catch (e) {}
			try { c.getBehavior(::Const.World.AI.Behavior.ID.Attack).setEnabled(true); } catch (e) {}
			local intercept = ::new("scripts/ai/world/orders/intercept_order");
			intercept.setTarget(player);
			c.addOrder(intercept);
		}
		catch (e) { ::logError("Aura Power: spawnKingdomHuntersTier controller/order - " + e); }

		// Remember this hunt so updateHuntTracking can tell when it's destroyed
		// (player won). getEntityByID resolves the stored ID after save/load too.
		try
		{
			if ("Flags" in ::World && ::World.Flags != null)
			{
				::World.Flags.set("aura_hunt_party_id", party.getID());
				::World.Flags.set("aura_hunt_active_tier", _tier);
			}
		}
		catch (e) {}

		::logInfo("Aura Power: spawned tier " + _tier + " '" + data.Label + "' from '"
			+ faction.getName() + "' (" + total + " troops added, commander "
			+ (data.Commander != null ? data.Commander : "none") + ") near the player.");
		return party;
	}
	catch (e)
	{
		::logError("Aura Power: spawnKingdomHuntersTier - " + e);
		return null;
	}
}

// Poll (from refreshEntireRoster) for the player destroying a hunt party. A
// fleeing player leaves the party alive and chasing, so "the stored party ID no
// longer resolves" means it was wiped out in battle = a win. Beating the tier-6
// Crown's Vanguard concludes the whole arc and queues the closing event. No
// death hook - pure ::World.Flags polling, and getEntityByID resolves the stored
// ID across save/load.
::AuraPower.updateHuntTracking <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return;
		if (!("Flags" in ::World) || ::World.Flags == null) return;
		local f = ::World.Flags;

		if (!f.has("aura_hunt_party_id")) return;
		local id = f.get("aura_hunt_party_id");
		if (id == null || id == 0) return;

		local tier = f.has("aura_hunt_active_tier") ? f.get("aura_hunt_active_tier") : 0;

		// The party is BEATEN if its world entity is gone OR it still resolves but
		// has zero troops left (defeated parties can linger a sweep as an empty
		// shell - getEntityByID alone returned "still-present" even after a win).
		local party = null;
		try { party = ::World.getEntityByID(id); } catch (e) { party = null; }
		local troopCount = -1;
		if (party != null) { try { troopCount = party.getTroops().len(); } catch (e) { troopCount = -1; } }

		local beaten = (party == null) || (troopCount == 0);
		if (!beaten) return;
		f.set("aura_hunt_party_id", 0);
		f.set("aura_hunt_active_tier", 0);

		if (tier >= 6)
		{
			f.set("aura_hunt_concluded", true);            // stop the lottery for good
			f.set("aura_hunt_conclusion_pending", true);   // world_state.onShow + lottery fire it
			::logInfo("Aura Power: Crown's Hunt - the tier-6 Vanguard is destroyed; the hunt is concluded. Closing event pending.");
			// NB: the closing event is armed from world_state.onShow (a clean
			// world context), NOT here - a timer armed from this post-battle sweep
			// can be lost in the tactical->world transition (memory trap 3).
		}
		else
		{
			// LADDER: a win advances the hunt exactly ONE tier, and only when
			// the beaten party was at (or above) the ladder's current rung -
			// beating a leftover low-tier test party never re-advances it, and
			// beating a stale over-tiered spawn still moves one step, not five.
			local cur = f.has("aura_hunt_next_tier") ? f.get("aura_hunt_next_tier") : 1;
			local nextTier = cur;
			if (tier >= cur && cur < 6) nextTier = cur + 1;
			f.set("aura_hunt_next_tier", nextTier);
			::logInfo("Aura Power: Crown's Hunt - tier " + tier + " party destroyed (player won); the next wave will be tier " + nextTier + ".");
		}
	}
	catch (e)
	{
		::logError("Aura Power: updateHuntTracking - " + e);
	}
}

// Deferred wrapper for the MSU TEST button: the settings screen is still up
// when the toggle callback runs, so we wait ~0.7s before spawning. Tier and
// the force-commander flag ride along as the scheduleEvent tag.
::AuraPower._testHuntTick <- function( _tag )
{
	try
	{
		local t = (_tag != null && "t" in _tag) ? _tag.t : 1;
		local m = (_tag != null && "m" in _tag) ? _tag.m : false;
		::AuraPower.spawnKingdomHuntersTier(t, m);
	}
	catch (e) { ::logError("Aura Power: _testHuntTick - " + e); }
}

::AuraPower.testSpawnHunters <- function( _tier, _forceMiniboss = false )
{
	::logInfo("Aura Power: TEST - hunters spawn requested (tier " + _tier
		+ ", forceCommander " + _forceMiniboss + "); deferring ~0.7s.");
	::Time.scheduleEvent(::TimeUnit.Real, 700, ::AuraPower._testHuntTick, { t = _tier, m = _forceMiniboss });
}

// Safe read of vanilla's per-brother lifetime battle count (BB maintains
// m.LifetimeStats.Battles on every brother). Returns 0 if unavailable.
::AuraPower.getLifetimeBattles <- function( _bro )
{
	try
	{
		if (_bro != null && "m" in _bro && _bro.m != null
			&& "LifetimeStats" in _bro.m && _bro.m.LifetimeStats != null
			&& "Battles" in _bro.m.LifetimeStats)
			return _bro.m.LifetimeStats.Battles;
	}
	catch (e) {}
	return 0;
}

::AuraPower.updateThroneTracking <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return;
		if (!("getPlayerRoster" in ::World)) return;
		if (!("Flags" in ::World) || ::World.Flags == null) return;

		// Find a living king (if any) and remember their name while present.
		local livingKing = null;
		foreach (bro in ::World.getPlayerRoster().getAll())
		{
			if (bro == null || !bro.isAlive()) continue;
			if (::AuraPower.getTier(bro) >= ::AuraPower.Tier.King)
			{
				livingKing = bro;
				break;
			}
		}
		local kingNow = (livingKing != null);

		local f = ::World.Flags;

		// First observation this campaign (fresh start, or an old save loaded
		// after this feature shipped): establish the baseline WITHOUT firing
		// any transition. Without this, loading a save that already has a king
		// would read as a brand-new "king has risen" the first time we look,
		// and an old save with no king is correctly silent. Either way we fire
		// nothing on the boundary - only genuine in-campaign transitions count.
		if (!(f.has("aura_throne_tracking_initialized") && f.get("aura_throne_tracking_initialized")))
		{
			f.set("aura_king_was_present", kingNow);
			if (kingNow)
		{
			f.set("aura_king_name", livingKing.getName());
			f.set("aura_king_battles", ::AuraPower.getLifetimeBattles(livingKing));
		}
			f.set("aura_throne_tracking_initialized", true);
			return;
		}

		local wasPresent = f.has("aura_king_was_present") ? f.get("aura_king_was_present") : false;

		if (wasPresent && !kingNow)
		{
			// The throne just emptied - the king died in battle or left the
			// roster since the last sweep. Queue the narrative beat.
			f.set("aura_throne_vacant_pending", true);
			local who = f.has("aura_king_name") ? f.get("aura_king_name") : "the Aura King";
			::logInfo("Aura Power: " + who + " is gone - the throne stands empty. Throne Vacant event queued.");
		}
		else if (!wasPresent && kingNow && !::AuraPower.Tunables.TestMode)
		{
			// A new Aura King has risen since the last sweep. Queue the "word
			// spreads" beat - deliberately NOT fired immediately (the trial
			// success screen already covers the moment of ascension); the
			// world-event lottery picks it up a little later, which reads as
			// the rumour travelling ahead of the company. TestMode mass-
			// crowning is excluded so bulk testing doesn't queue it.
			f.set("aura_king_risen_pending", true);
			f.set("aura_risen_king_name", livingKing.getName());
			::logInfo("Aura Power: " + livingKing.getName() + " has risen to Aura King - Rumour of a King queued (lottery).");
		}

		f.set("aura_king_was_present", kingNow);
		if (kingNow)
		{
			f.set("aura_king_name", livingKing.getName());
			f.set("aura_king_battles", ::AuraPower.getLifetimeBattles(livingKing));
		}

		// The Throne Vacant and Rumour events are fired by the world-event
		// lottery (their onUpdateScore reads the pending flags set above). We
		// deliberately do NOT force-fire from here: a real-time fire timer
		// armed at the tactical->world transition (king dies mid-battle) is
		// silently dropped by the engine, so the event would never appear.
		// The lottery is the reliable, save-persistent path - the pending flag
		// waits on ::World.Flags until the event wins a lottery tick (a short
		// travel), which also reads, in-fiction, as word reaching the company.
	}
	catch (e)
	{
		::logError("Aura Power: updateThroneTracking - " + e);
	}
}

// Returns the living roster brother nearest the throne (highest aura tier,
// tie-broken by character level), or null if no awakened brother remains.
// Used by the Throne Vacant event to name a successor. Only brothers at
// Awakening or above count as "on the road" - an unawakened recruit is not
// a candidate for the crown.
::AuraPower.findThroneSuccessor <- function()
{
	try
	{
		if (!("World" in ::getroottable()) || ::World == null) return null;
		if (!("getPlayerRoster" in ::World)) return null;

		local best = null;
		local bestTier = -1;
		local bestLevel = -1;
		foreach (bro in ::World.getPlayerRoster().getAll())
		{
			if (bro == null || !bro.isAlive()) continue;
			local t = ::AuraPower.getTier(bro);
			if (t >= ::AuraPower.Tier.King) continue;       // throne should be empty
			if (t < ::AuraPower.Tier.Awakening) continue;   // only awakened count
			local lvl = bro.getLevel();
			if (t > bestTier || (t == bestTier && lvl > bestLevel))
			{
				best = bro;
				bestTier = t;
				bestLevel = lvl;
			}
		}
		return best;
	}
	catch (e)
	{
		::logError("Aura Power: findThroneSuccessor - " + e);
	}
	return null;
}

// ---------------------------------------------------------------------
//  Time helpers
// ---------------------------------------------------------------------
// Current world day as integer. Falls back to 0 if World/Time isn't ready
// yet (very early load), which means cooldown / postpone checks default
// to "expired" - safer than crashing.
::AuraPower.getCurrentDay <- function()
{
	try
	{
		if ("World" in ::getroottable() && ::World != null
			&& "getTime" in ::World)
		{
			return ::World.getTime().Days;
		}
	}
	catch (e) {}
	return 0;
}

// ---------------------------------------------------------------------
//  Per-brother trial state (postpone bonus, postpone-until, cooldown,
//  rejection) - all stored on the brother's persistent flag bag.
// ---------------------------------------------------------------------

// Postpone bonus accumulated by the player choosing "Postpone" on the
// trial event. Caps at PostponeBonusMax. Resets to 0 on success or
// failure of an actual attempt. Reject does NOT reset (user spec A).
::AuraPower.getPostponeBonus <- function( _bro )
{
	local f = _bro.getFlags();
	return f.has("aura_postpone_bonus") ? f.get("aura_postpone_bonus") : 0;
}

::AuraPower.bumpPostponeBonus <- function( _bro )
{
	local t = ::AuraPower.Tunables;
	local cur = ::AuraPower.getPostponeBonus(_bro);
	local next = cur + t.PostponeBonusPerStack;
	if (next > t.PostponeBonusMax) next = t.PostponeBonusMax;
	_bro.getFlags().set("aura_postpone_bonus", next);
	return next;
}

::AuraPower.clearPostponeBonus <- function( _bro )
{
	local f = _bro.getFlags();
	if (f.has("aura_postpone_bonus")) f.remove("aura_postpone_bonus");
}

// Postpone-until-day: the trial event will not fire for this brother
// while currentDay < this value. Set when the player chooses Postpone.
::AuraPower.getPostponeUntilDay <- function( _bro )
{
	local f = _bro.getFlags();
	return f.has("aura_postpone_until_day") ? f.get("aura_postpone_until_day") : 0;
}

::AuraPower.isPostponed <- function( _bro )
{
	return ::AuraPower.getCurrentDay() < ::AuraPower.getPostponeUntilDay(_bro);
}

::AuraPower.applyPostpone <- function( _bro )
{
	local t = ::AuraPower.Tunables;
	local until = ::AuraPower.getCurrentDay() + t.PostponeDelayDays;
	_bro.getFlags().set("aura_postpone_until_day", until);
	::AuraPower.bumpPostponeBonus(_bro);
}

::AuraPower.clearPostpone <- function( _bro )
{
	local f = _bro.getFlags();
	if (f.has("aura_postpone_until_day")) f.remove("aura_postpone_until_day");
}

// Cooldown-until-day: set by trial failure. Blocks ALL trial attempts
// for this brother until expired.
::AuraPower.getCooldownUntilDay <- function( _bro )
{
	local f = _bro.getFlags();
	return f.has("aura_trial_cooldown_until_day") ? f.get("aura_trial_cooldown_until_day") : 0;
}

::AuraPower.isOnCooldown <- function( _bro )
{
	return ::AuraPower.getCurrentDay() < ::AuraPower.getCooldownUntilDay(_bro);
}

::AuraPower.getCooldownDaysRemaining <- function( _bro )
{
	local d = ::AuraPower.getCooldownUntilDay(_bro) - ::AuraPower.getCurrentDay();
	return d > 0 ? d : 0;
}

::AuraPower.applyCooldown <- function( _bro, _tier )
{
	local days = (_tier >= 1 && _tier <= 4) ? ::AuraPower.FailCooldownDays[_tier] : 2;
	if (::AuraPower.Tunables.TestMode) days = 1;
	local until = ::AuraPower.getCurrentDay() + days;
	_bro.getFlags().set("aura_trial_cooldown_until_day", until);
}

::AuraPower.clearCooldown <- function( _bro )
{
	local f = _bro.getFlags();
	if (f.has("aura_trial_cooldown_until_day")) f.remove("aura_trial_cooldown_until_day");
}

// Rejection: when the player picks Reject, this brother skips the
// current trial tier entirely. Next chance opens when his level hits
// the gate of the next tier (user spec B - e.g. reject T1 at Lv 4 ->
// next chance is T2 at Lv 7).
//
// Stored as the rejected tier number. clearRejectionIfDue() inspects
// the brother's current level and clears the flag once the next gate
// is reached.
::AuraPower.getRejectedTier <- function( _bro )
{
	local f = _bro.getFlags();
	return f.has("aura_rejected_tier") ? f.get("aura_rejected_tier") : -1;
}

::AuraPower.applyReject <- function( _bro, _tier )
{
	_bro.getFlags().set("aura_rejected_tier", _tier);
}

::AuraPower.clearRejectionIfDue <- function( _bro )
{
	local rejected = ::AuraPower.getRejectedTier(_bro);
	if (rejected < 0) return;
	local nextTierGate = ::AuraPower.getLevelGateForTier(rejected + 1);
	if (_bro.getLevel() >= nextTierGate)
	{
		local f = _bro.getFlags();
		if (f.has("aura_rejected_tier")) f.remove("aura_rejected_tier");
	}
}

// ---------------------------------------------------------------------
//  Eligibility + success-chance calculation
// ---------------------------------------------------------------------

// Returns the tier the brother could attempt for if a trial fired right
// now (their current tier + 1), or Tier.None if they are not eligible
// for any reason (max tier, level too low, on cooldown, rejected, etc).
::AuraPower.getNextTrialTier <- function( _bro )
{
	if (_bro == null || !_bro.isAlive()) return ::AuraPower.Tier.None;

	::AuraPower.clearRejectionIfDue(_bro);

	local tier = ::AuraPower.getTier(_bro);
	if (tier == ::AuraPower.Tier.Failed) return ::AuraPower.Tier.None;
	if (tier >= ::AuraPower.Tier.King) return ::AuraPower.Tier.None;

	local nextTier = tier + 1;

	// If the player rejected the current trial tier, skip ahead. The
	// rejection lasts until the brother reaches the NEXT gate; until then
	// they have no eligible trial.
	local rejected = ::AuraPower.getRejectedTier(_bro);
	if (rejected >= 0)
	{
		// Still rejected - either advance to the tier after the rejected
		// one, or stay ineligible if the next gate isn't reached.
		local nextAfterRejected = rejected + 1;
		if (nextAfterRejected > ::AuraPower.Tier.King) return ::AuraPower.Tier.None;
		if (_bro.getLevel() < ::AuraPower.getLevelGateForTier(nextAfterRejected))
			return ::AuraPower.Tier.None;
		nextTier = nextAfterRejected;
	}

	if (_bro.getLevel() < ::AuraPower.getLevelGateForTier(nextTier))
		return ::AuraPower.Tier.None;

	if (::AuraPower.isOnCooldown(_bro)) return ::AuraPower.Tier.None;
	if (::AuraPower.isPostponed(_bro)) return ::AuraPower.Tier.None;

	// King uniqueness rule: if another living brother already wears the
	// crown, this brother cannot attempt the T4 Trial of Steel until
	// the throne is empty (the current King dies or is dismissed).
	if (nextTier == ::AuraPower.Tier.King && ::AuraPower.hasLivingKing(_bro))
		return ::AuraPower.Tier.None;

	return nextTier;
}

// Base success chance from the lookup table.
::AuraPower.getBaseSuccessChance <- function( _tier, _potential )
{
	if (_tier < 1 || _tier > 4) return 0;
	if (_potential < 0 || _potential > 4) return 0;
	return ::AuraPower.SuccessRateTable[_tier][_potential];
}

// Final success chance INCLUDING the brother's current postpone bonus.
// Capped at 100%.
::AuraPower.getTrialSuccessChance <- function( _bro, _tier )
{
	// NOTE: 'base' is a reserved Squirrel keyword - using it as a local
	// variable name produces "expected 'IDENTIFIER'" at parse time and
	// breaks the entire mod load. Use baseChance instead.
	local baseChance = ::AuraPower.getBaseSuccessChance(_tier, ::AuraPower.getPotentialV2(_bro));
	local bonus = ::AuraPower.getPostponeBonus(_bro);
	local total = baseChance + bonus + ::AuraPower.Tunables.TrialSuccessBonus;
	if (total > 100) total = 100;
	if (total < 0) total = 0;
	return total;
}

// Up to _n distinct eligible brothers for the world-event lottery, drawn
// WITHOUT replacement (no brother appears twice). Returns an array of
// min(_n, eligible) brothers; empty array if nobody qualifies. The player
// then picks which one attempts the trial (user feedback item 2).
::AuraPower.findTrialCandidates <- function( _n )
{
	if (!::AuraPower.Tunables.EnableTrialEvent) return [];
	if (!("World" in ::getroottable()) || ::World == null) return [];
	if (!("getPlayerRoster" in ::World)) return [];

	// Gather every eligible brother into a pool first.
	local pool = [];
	foreach (bro in ::World.getPlayerRoster().getAll())
	{
		if (bro == null) continue;
		if (!bro.isAlive()) continue;
		if (::AuraPower.getNextTrialTier(bro) != ::AuraPower.Tier.None)
			pool.push(bro);
	}

	if (pool.len() == 0) return [];

	local want = _n;
	if (want < 1) want = 1;
	if (want > pool.len()) want = pool.len();

	// Draw-without-replacement: pull a random index out of the pool each
	// pass and remove() it so it can never be picked again. This guarantees
	// distinct brothers (no duplicate candidates).
	local picked = [];
	for (local i = 0; i < want; i++)
	{
		local idx = ::Math.rand(0, pool.len() - 1);
		picked.push(pool.remove(idx));
	}
	return picked;
}

// Random eligible brother for the world-event lottery (user spec D).
// Returns null if nobody qualifies. Kept for any single-pick callers;
// now just wraps findTrialCandidates(1).
::AuraPower.findTrialCandidate <- function()
{
	local picked = ::AuraPower.findTrialCandidates(1);
	if (picked.len() == 0) return null;
	return picked[0];
}

// ---------------------------------------------------------------------
//  Skill granting (no more Hollow Core - the v2 design has no permanent
//  fail state, every failure can be retried after cooldown).
// ---------------------------------------------------------------------
// Prunes temporary trial-failure effects whose UntilDay has passed.
// Called from refreshAuraSkills so we sweep on every world-state refresh.
::AuraPower.pruneExpiredTrialEffects <- function( _bro )
{
	local c = _bro.getSkills();
	if (c == null) return;
	local today = ::AuraPower.getCurrentDay();
	foreach (id in ["effects.aura_trial_sickness",
	                "effects.aura_trial_injury",
	                "effects.aura_trial_resolve_loss"])
	{
		if (c.hasSkill(id))
		{
			local s = c.getSkillByID(id);
			if (s != null && ("UntilDay" in s.m) && today >= s.m.UntilDay)
			{
				c.removeByID(id);
			}
		}
	}
}

::AuraPower.refreshAuraSkills <- function( _bro )
{
	local tier = ::AuraPower.getTier(_bro);
	local c = _bro.getSkills();

	// PERSISTENT aura-VFX scrub. Aura: Body Coating and Aura: Sense paint onto
	// the shared "miniboss" sprite layer (Visible=true). Both effects are
	// IsSerialized=false, so the buff is dropped on a save/load - but the
	// miniboss layer's Visible flag rides along on the ROSTER brother's
	// appearance, so it keeps rendering on the world map / character screen and
	// seeds the next tactical battle (proven 2026-06-13: a glow/eye survived
	// "Load campaign" with no buff). The tactical onCombatStarted scrubs only
	// fix the in-battle sprite; THIS is the one place that cleans the persistent
	// roster entity. refreshAuraSkills runs on every world_state.onShow, so the
	// glow is cleared the moment the player returns to the map. We only clear it
	// when no aura effect is genuinely active right now (so we never stomp a
	// legitimately-running glow), and player roster brothers never legitimately
	// use the miniboss/champion-glow layer anyway.
	// (a) The "miniboss" sprite layer is shared by FOUR effects: Body Coating,
	// Sense, Blood Surge and Undying. Any of them can leave it Visible=true with
	// a tint. We clear it whenever none of the layer-owning combat effects is
	// active (on the world map none ever are), resetting Visible/Alpha AND the
	// Color/Saturation tint so the next effect that paints it starts clean.
	try
	{
		if (c != null
			&& !c.hasSkill("effects.aura_body_coating")
			&& !c.hasSkill("effects.aura_sense")
			&& _bro.hasSprite("miniboss"))
		{
			local glow = _bro.getSprite("miniboss");
			if (glow.Visible)
			{
				glow.Visible = false;
				glow.Alpha = 255;
				glow.Saturation = 1.0;   // Blood Surge / Undying leave this raised; reset so the next glow is clean. (Color is re-set white by whichever effect paints next, so no createColor needed in this non-skill context.)
				::logInfo("Aura Power: scrubbed orphaned miniboss aura VFX off "
					+ _bro.getName() + " (persistent appearance).");
			}
		}
	}
	catch (e)
	{
		::logError("Aura Power: persistent miniboss VFX scrub - " + e);
	}

	// (b) Aura: Weapon Coating swaps the brother's PERSISTENT appearance.Weapon
	// to a baked "<weapon>_aura" sprite and only restores it in onRemoved (via a
	// non-serialized SavedWeapon). If a save/load drops the effect before
	// onRemoved runs, the glowing weapon sticks forever - on the world map, the
	// character screen, and the next battle. SavedWeapon is gone by then, so we
	// can't "restore" it - but the swap is just "<base>_aura", so stripping the
	// "_aura" suffix returns the clean base sprite. Only do this when no weapon
	// coating effect is actually active (on the world map it never is).
	try
	{
		if (c != null && !c.hasSkill("effects.aura_weapon_coating"))
		{
			local items = _bro.getItems();
			if (items != null)
			{
				local app = items.getAppearance();
				local w = (app != null && ("Weapon" in app)) ? app.Weapon : null;
				if (typeof w == "string" && w.len() >= 5 && w.slice(w.len() - 5) == "_aura")
				{
					app.Weapon = w.slice(0, w.len() - 5);
					items.updateAppearance();
					::logInfo("Aura Power: stripped orphaned weapon-aura sprite off "
						+ _bro.getName() + " (" + w + " -> " + app.Weapon + ").");
				}
			}
		}
	}
	catch (e)
	{
		::logError("Aura Power: persistent weapon-aura scrub - " + e);
	}

	// Always sweep expired trial-failure effects.
	::AuraPower.pruneExpiredTrialEffects(_bro);

	// Always make sure the Hidden Potential indicator skill is on every
	// living brother who hasn't reached the absolute top. _rollPotentialV2
	// persists the roll on first access, so this also seeds the flag.
	if (tier != ::AuraPower.Tier.Failed)
	{
		::AuraPower._rollPotentialV2(_bro);
		if (!c.hasSkill("effects.aura_potential"))
			c.add(::new("scripts/skills/effects/aura_potential"));
	}

	// Legacy Hollow Core / aura_scar cleanup - the v2 design has no permanent
	// fail state, so any leftover Hollow Core from 1.14.x is removed here
	// and the brother is reset to Unawakened so they can retry.
	if (tier == ::AuraPower.Tier.Failed)
	{
		_bro.getFlags().set("aura_tier", ::AuraPower.Tier.None);
		if (c.hasSkill("effects.aura_scar")) c.removeByID("effects.aura_scar");
		::AuraPower._rollPotentialV2(_bro);
		if (!c.hasSkill("effects.aura_potential"))
			c.add(::new("scripts/skills/effects/aura_potential"));
		return;
	}

	if (tier < ::AuraPower.Tier.Awakening) return;

	// Tier I (Awakening)
	if (!c.hasSkill("effects.aura_power"))
		c.add(::new("scripts/skills/effects/aura_power"));
	if (!c.hasSkill("actives.aura_weapon_coating"))
		c.add(::new("scripts/skills/actives/aura_weapon_coating_skill"));
	if (!c.hasSkill("actives.aura_sense"))
		c.add(::new("scripts/skills/actives/aura_sense_skill"));
	if (!c.hasSkill("actives.aura_pulse"))
		c.add(::new("scripts/skills/actives/aura_pulse_skill"));
	if (!c.hasSkill("actives.aura_ember"))
		c.add(::new("scripts/skills/actives/aura_ember_skill"));

	// Tier II (Warrior)
	if (tier >= ::AuraPower.Tier.Warrior)
	{
		if (!c.hasSkill("actives.aura_body_coating"))
			c.add(::new("scripts/skills/actives/aura_body_coating_skill"));
		if (!c.hasSkill("actives.aura_dash"))
			c.add(::new("scripts/skills/actives/aura_dash_skill"));
		if (!c.hasSkill("effects.aura_resolute"))
			c.add(::new("scripts/skills/effects/aura_resolute"));
	}

	// Tier III (Master)
	if (tier >= ::AuraPower.Tier.Master)
	{
		if (!c.hasSkill("actives.aura_mending"))
			c.add(::new("scripts/skills/actives/aura_mending_skill"));
		if (!c.hasSkill("actives.aura_heavenbreaker"))
			c.add(::new("scripts/skills/actives/aura_heavenbreaker_skill"));
		if (!c.hasSkill("effects.aura_bloodsurge"))
			c.add(::new("scripts/skills/effects/aura_bloodsurge"));
		if (!c.hasSkill("effects.aura_unbroken_form"))
			c.add(::new("scripts/skills/effects/aura_unbroken_form"));
	}

	// Tier IV (King)
	if (tier >= ::AuraPower.Tier.King)
	{
		if (!c.hasSkill("effects.aura_undying"))
			c.add(::new("scripts/skills/effects/aura_undying"));
		// Undying Will rides on the vanilla Nine Lives cheat-death so the King
		// survives a killing blow the ENGINE-NATIVE way (no AI disengage). The
		// perk_nine_lives hook upgrades the proc to Undying's 25% HP + effects.
		if (!c.hasSkill("perk.nine_lives"))
			c.add(::new("scripts/skills/perks/perk_nine_lives"));
		if (!c.hasSkill("effects.aura_abyssal_crown"))
			c.add(::new("scripts/skills/effects/aura_abyssal_crown"));
		if (!c.hasSkill("effects.aura_cataclysm_heart"))
			c.add(::new("scripts/skills/effects/aura_cataclysm_heart"));
	}
}

::AuraPower.setTier <- function( _bro, _tier )
{
	_bro.getFlags().set("aura_tier", _tier);
	::AuraPower.refreshAuraSkills(_bro);
}

// ---------------------------------------------------------------------
//  One-shot test action: promote every living roster brother straight
//  to Aura King. Separate from the Trial of Steel flow - completely
//  isolated code path, no shared state with the trial event. Called
//  directly by the TestMode MSU toggle (on flip from off->on) so the
//  player can test every King-tier skill the instant they enable it.
//
//  Returns a {promoted, skipped} table for the log line / caller.
// ---------------------------------------------------------------------
::AuraPower.bestowAuraKingOnAllNow <- function()
{
	local promotedKing   = 0;
	local promotedMaster = 0;
	local skipped        = 0;
	try
	{
		if (!("World" in ::getroottable()) || ::World == null)
		{
			::logInfo("Aura Power: BestowAuraKing - no World loaded; skipping.");
			return { promoted = 0, kings = 0, masters = 0, skipped = 0 };
		}
		if (!("getPlayerRoster" in ::World))
		{
			::logInfo("Aura Power: BestowAuraKing - no player roster; skipping.");
			return { promoted = 0, kings = 0, masters = 0, skipped = 0 };
		}

		// Uniqueness: at most one King may exist. If somebody is already
		// King (a previous TestMode run, for example), promote the rest
		// to Master only. Otherwise pick the first eligible brother to
		// crown, then promote the rest to Master.
		local canCrownOne = !::AuraPower.hasLivingKing();

		foreach (bro in ::World.getPlayerRoster().getAll())
		{
			if (bro == null || !bro.isAlive()) { skipped = skipped + 1; continue; }

			// Scrub residue state from any prior trial.
			try
			{
				local f = bro.getFlags();
				if (f.has("aura_rejected_tier"))            f.remove("aura_rejected_tier");
				if (f.has("aura_postpone_bonus"))           f.remove("aura_postpone_bonus");
				if (f.has("aura_postpone_until_day"))       f.remove("aura_postpone_until_day");
				if (f.has("aura_trial_cooldown_until_day")) f.remove("aura_trial_cooldown_until_day");

				local skills = bro.getSkills();
				if (skills != null)
				{
					foreach (id in ["effects.aura_scar",
					                "effects.aura_trial_sickness",
					                "effects.aura_trial_injury",
					                "effects.aura_trial_resolve_loss"])
					{
						if (skills.hasSkill(id)) skills.removeByID(id);
					}
				}
			}
			catch (e) {}

			local cur = ::AuraPower.getTier(bro);

			// Already King - nothing to do.
			if (cur >= ::AuraPower.Tier.King) { skipped = skipped + 1; continue; }

			// First eligible brother takes the crown if the throne is empty.
			if (canCrownOne)
			{
				try
				{
					::AuraPower.applyTrialSuccess(bro, ::AuraPower.Tier.King);
					promotedKing = promotedKing + 1;
					canCrownOne = false;
				}
				catch (e)
				{
					::logError("Aura Power: BestowAuraKing crown on " + bro.getName() + " - " + e);
				}
				continue;
			}

			// Everyone else maxes out at Master (Tier III).
			if (cur >= ::AuraPower.Tier.Master) { skipped = skipped + 1; continue; }
			try
			{
				::AuraPower.applyTrialSuccess(bro, ::AuraPower.Tier.Master);
				promotedMaster = promotedMaster + 1;
			}
			catch (e)
			{
				::logError("Aura Power: BestowAuraKing master on " + bro.getName() + " - " + e);
			}
		}

		// Only worth a log line when somebody actually moved - the TestMode
		// reconcile in refreshEntireRoster calls this on every world onShow,
		// and an all-skipped pass would otherwise spam the log.
		if (promotedKing + promotedMaster > 0)
		{
			::logInfo("Aura Power: BestowAuraKing - crowned " + promotedKing
				+ " King, raised " + promotedMaster + " to Master, skipped "
				+ skipped + ".");
		}
	}
	catch (e)
	{
		::logError("Aura Power: bestowAuraKingOnAllNow - " + e);
	}
	return {
		promoted = promotedKing + promotedMaster,
		kings    = promotedKing,
		masters  = promotedMaster,
		skipped  = skipped
	};
}

// ---------------------------------------------------------------------
//  Schema v2 migration. Idempotent. Two ways to short-circuit:
//   1. aura_potential_v2 already exists -> brother is already on the
//      new schema, just ensure the migrated marker is set and exit.
//   2. aura_potential_v2_migrated marker is set -> migration done.
//
//  Critical correctness note: this function may run BEFORE the user
//  saves the game (refreshEntireRoster fires on world_state.onShow,
//  which fires before the player has a chance to save). If the
//  migration was non-deterministic, the same brother would land on a
//  different potential each time the player reloaded the old save
//  without saving in between - which is exactly what 1.15.0 did. The
//  fix: map the OLD 3-tier potential into the new 5-tier table
//  deterministically, preserving the player's investment.
//
//  Mapping (old aura_potential -> new aura_potential_v2):
//      Dormant(0) -> Dormant(0)
//      Gifted(1)  -> Chosen(2)        - "could reach Master" tier mapped to upper-mid
//      SovSeed(2) -> SovereignSeed(4) - "could reach King" stays at the top
//
//  Brand-new brothers (no old flag at all) are rolled fresh against
//  the 5-tier weights; the roll is persisted immediately so it locks
//  in on first observation.
// ---------------------------------------------------------------------
::AuraPower.runSchemaV2Migration <- function( _bro )
{
	local f = _bro.getFlags();

	// Short-circuit if the new schema is already populated. We also
	// re-assert the marker in case it was somehow lost.
	if (f.has("aura_potential_v2"))
	{
		if (!f.has("aura_potential_v2_migrated"))
			f.set("aura_potential_v2_migrated", true);
		return;
	}
	if (f.has("aura_potential_v2_migrated"))
	{
		// Marker set but no v2 value yet (possible if migration ran but
		// the roll failed silently). Roll fresh now and exit.
		::AuraPower._rollPotentialV2(_bro);
		return;
	}

	// Deterministic legacy mapping if the old flag exists.
	local mappedFromOld = false;
	if (f.has("aura_potential"))
	{
		local oldVal = f.get("aura_potential");
		local newVal = -1;
		if      (oldVal == 0) newVal = ::AuraPower.Potential.Dormant;
		else if (oldVal == 1) newVal = ::AuraPower.Potential.Chosen;
		else if (oldVal == 2) newVal = ::AuraPower.Potential.SovereignSeed;
		if (newVal >= 0)
		{
			f.set("aura_potential_v2", newVal);
			mappedFromOld = true;
			try
			{
				::logInfo("Aura Power: migrated " + _bro.getName()
					+ " from old potential=" + oldVal + " to v2="
					+ ::AuraPower.getPotentialName(newVal)
					+ " (deterministic, same result on every reload).");
			}
			catch (e) {}
		}
	}

	// Wipe other 1.14.x flags (NOT aura_potential_v2 obviously).
	local legacyKeys = [
		"aura_potential",
		"aura_capped",
		"aura_proof_v6_migrated",
		"aura_proof_kills",
		"aura_proof_lowhp_survive",
		"aura_proof_mortal_survives",
		"aura_proof_noflee_streak",
		"aura_proof_nobreak_streak",
		"aura_proof_outnumbered_win",
		"aura_proof_outnumbered15x_win",
		"aura_proof_surrounded_survive",
		"aura_proof_elite_kill",
		"aura_proof_champion_kill",
		"aura_battle_mortal",
		"aura_battle_broken",
		"aura_battle_surrounded"
	];
	foreach (k in legacyKeys)
	{
		if (f.has(k)) f.remove(k);
	}

	// If the legacy mapping above didn't populate aura_potential_v2,
	// roll fresh. _rollPotentialV2 persists the result on first call,
	// so subsequent loads will hit the short-circuit at the top.
	if (!mappedFromOld)
	{
		local p = ::AuraPower._rollPotentialV2(_bro);
		try
		{
			::logInfo("Aura Power: fresh-rolled potential for " + _bro.getName()
				+ " (no legacy flag) -> " + ::AuraPower.getPotentialName(p));
		}
		catch (e) {}
	}

	// Mark migration done so we don't re-enter.
	f.set("aura_potential_v2_migrated", true);
}

// ---------------------------------------------------------------------
//  Trial-outcome appliers. Called by the Trial of Steel event screens.
// ---------------------------------------------------------------------

// Success path: promote the brother to the target tier and clear any
// per-attempt state (postpone bonus, postpone window, residual cooldown).
::AuraPower.applyTrialSuccess <- function( _bro, _tier )
{
	::AuraPower.setTier(_bro, _tier);
	::AuraPower.clearPostponeBonus(_bro);
	::AuraPower.clearPostpone(_bro);
	::AuraPower.clearCooldown(_bro);
	try { _bro.setDirty(true); } catch (e) {}
}

// Failure path: applies tier-appropriate sickness / injury / debuffs,
// sets the per-brother cooldown, clears any postpone window/bonus.
// Tier IV ("King's Judgment") rolls one of five outcomes; the result is
// returned via _bro.getFlags().get("aura_last_judgment") so the event
// can pull the right flavour line for the failure screen.
::AuraPower.applyTrialFailure <- function( _bro, _tier )
{
	local today = ::AuraPower.getCurrentDay();
	local sickDays = (_tier >= 1 && _tier <= 4) ? ::AuraPower.FailSicknessDays[_tier] : 2;
	if (::AuraPower.Tunables.TestMode) sickDays = 1;

	local c = _bro.getSkills();
	if (c == null)
	{
		::logError("Aura Power: applyTrialFailure - " + _bro.getName()
			+ " has no skill container, cannot apply consequences.");
		return;
	}

	local applied = [];   // for diagnostic log

	// Trial Record: count every failed attempt (single source of truth so
	// the tally can never double-count). Read back in the Hidden Potential
	// tooltip. Stored under flag "aura_proof_trials_failed".
	::AuraPower.incProof(_bro, "trials_failed");

	// Inline (not closures) so we know exactly what runs and can log
	// each piece. Closures in some Squirrel variants don't capture local
	// vars the way we expect - safer to be explicit.

	if (_bro.getFlags().has("aura_last_judgment"))
		_bro.getFlags().remove("aura_last_judgment");

	if (_tier == ::AuraPower.Tier.Awakening)
	{
		if (c.hasSkill("effects.aura_trial_sickness"))
			c.removeByID("effects.aura_trial_sickness");
		local s = ::new("scripts/skills/effects/aura_trial_sickness");
		s.m.UntilDay = today + sickDays;
		c.add(s);
		applied.push("Sickness " + sickDays + "d (until day " + s.m.UntilDay + ")");
	}
	else if (_tier == ::AuraPower.Tier.Warrior)
	{
		if (c.hasSkill("effects.aura_trial_sickness"))
			c.removeByID("effects.aura_trial_sickness");
		local s = ::new("scripts/skills/effects/aura_trial_sickness");
		s.m.UntilDay = today + sickDays;
		c.add(s);
		applied.push("Sickness " + sickDays + "d");

		if (c.hasSkill("effects.aura_trial_injury"))
			c.removeByID("effects.aura_trial_injury");
		local inj = ::new("scripts/skills/effects/aura_trial_injury");
		inj.m.Severity = 1;
		inj.m.UntilDay = today + sickDays;
		c.add(inj);
		applied.push("Medium injury " + sickDays + "d");
	}
	else if (_tier == ::AuraPower.Tier.Master)
	{
		if (c.hasSkill("effects.aura_trial_sickness"))
			c.removeByID("effects.aura_trial_sickness");
		local s = ::new("scripts/skills/effects/aura_trial_sickness");
		s.m.UntilDay = today + sickDays;
		c.add(s);
		applied.push("Sickness " + sickDays + "d");

		if (c.hasSkill("effects.aura_trial_injury"))
			c.removeByID("effects.aura_trial_injury");
		local inj = ::new("scripts/skills/effects/aura_trial_injury");
		inj.m.Severity = 2;
		inj.m.UntilDay = today + sickDays;
		c.add(inj);
		applied.push("Severe injury " + sickDays + "d");

		if (c.hasSkill("effects.aura_trial_resolve_loss"))
			c.removeByID("effects.aura_trial_resolve_loss");
		local r = ::new("scripts/skills/effects/aura_trial_resolve_loss");
		r.m.UntilDay = today + sickDays;
		c.add(r);
		applied.push("Resolve loss " + sickDays + "d");
	}
	else if (_tier == ::AuraPower.Tier.King)
	{
		local roll = ::Math.rand(1, 5);
		_bro.getFlags().set("aura_last_judgment", roll);
		if (roll == 1)
		{
			if (!c.hasSkill("effects.aura_judgment_scar"))
				c.add(::new("scripts/skills/effects/aura_judgment_scar"));
			applied.push("PERMANENT Crown's Scar (-1 Resolve)");
		}
		else if (roll == 2)
		{
			if (!c.hasSkill("effects.aura_judgment_fatigue"))
				c.add(::new("scripts/skills/effects/aura_judgment_fatigue"));
			applied.push("PERMANENT Crown's Weariness (-2 Max Fatigue)");
		}
		else if (roll == 3)
		{
			if (!c.hasSkill("effects.aura_judgment_resolve"))
				c.add(::new("scripts/skills/effects/aura_judgment_resolve"));
			applied.push("PERMANENT Crown's Doubt (-2 Resolve)");
		}
		else if (roll == 4)
		{
			if (!c.hasSkill("effects.aura_judgment_melee"))
				c.add(::new("scripts/skills/effects/aura_judgment_melee"));
			applied.push("PERMANENT Crown's Tremor (-1 Melee Skill)");
		}
		else if (roll == 5)
		{
			if (c.hasSkill("effects.aura_trial_sickness"))
				c.removeByID("effects.aura_trial_sickness");
			local s = ::new("scripts/skills/effects/aura_trial_sickness");
			s.m.UntilDay = today + 7;
			c.add(s);
			applied.push("Sickness 7d");
		}

		// Trial Record: rolls 1-4 leave a PERMANENT King's Judgment scar;
		// roll 5 is only temporary sickness, so it does not count as a
		// judgment borne. Stored under flag "aura_proof_judgments_taken".
		if (roll <= 4) ::AuraPower.incProof(_bro, "judgments_taken");
	}

	::AuraPower.applyCooldown(_bro, _tier);
	::AuraPower.clearPostponeBonus(_bro);
	::AuraPower.clearPostpone(_bro);
	try { _bro.setDirty(true); } catch (e) {}

	// Diagnostic log so the user can confirm in log.html that the
	// consequence was actually applied to the brother.
	try
	{
		local cdEnd = ::AuraPower.getCooldownUntilDay(_bro);
		local list = "";
		for (local i = 0; i < applied.len(); i = i + 1)
		{
			if (i > 0) list += ", ";
			list += applied[i];
		}
		::logInfo("Aura Power: applied failure to " + _bro.getName()
			+ " (Tier " + _tier + ") - [" + list + "]. "
			+ "Cooldown until day " + cdEnd + ".");
	}
	catch (e) {}
}

// Postpone path: bumps the bonus, sets the postpone window. Bonus
// persists across postpones/rejects per user spec A.
::AuraPower.applyTrialPostpone <- function( _bro )
{
	::AuraPower.applyPostpone(_bro);
}

// Reject path: marks this tier as skipped; the next eligible trial is
// the tier above. clearRejectionIfDue auto-clears when the brother
// reaches the next-tier gate.
::AuraPower.applyTrialReject <- function( _bro, _tier )
{
	::AuraPower.applyReject(_bro, _tier);
}

// ---------------------------------------------------------------------
//  Tooltip support: human-readable failure preview for the indicator.
// ---------------------------------------------------------------------
::AuraPower.getFailureConsequenceText <- function( _tier )
{
	switch (_tier)
	{
		case ::AuraPower.Tier.Awakening:
			return "Aura Rejection: Sickness 2 days, -10% Max Fatigue while sick";
		case ::AuraPower.Tier.Warrior:
			return "Spiritual Fracture: Sickness 3 days, random Medium injury";
		case ::AuraPower.Tier.Master:
			return "Soul Collapse: Sickness 5 days, Severe injury, -10 Resolve for 7 days";
		case ::AuraPower.Tier.King:
			return "King\'s Judgment: random permanent debuff or Sickness 7 days";
	}
	return "";
}

// ---------------------------------------------------------------------
//  Diagnostic: full list of aura sprite names, used by the one-time
//  brush-registration scan in aura_weapon_coating_effect.
// ---------------------------------------------------------------------
::AuraPowerSpriteList <- [
	"icon_axe_01_aura", "icon_axe_02_aura", "icon_cleaver_01_aura", "icon_crossbow_01_aura", "icon_dagger_01_aura", "icon_mace_01_aura",
	"icon_spear_01_aura", "icon_sword_01_aura", "icon_sword_02_aura", "icon_sword_03_aura", "icon_axe_two_handed_01_aura", "icon_club_01_aura",
	"icon_mace_02_aura", "icon_spear_02_aura", "icon_sword_04_aura", "icon_sword_two_handed_01_aura", "icon_warhammer_01_aura", "icon_sax_01_aura",
	"icon_bill_01_aura", "icon_flail_01_aura", "icon_orc_weapon_01_aura", "icon_orc_weapon_02_aura", "icon_orc_weapon_03_aura", "icon_orc_weapon_04_aura",
	"icon_orc_weapon_05_aura", "icon_javelin_01_aura", "icon_knife_01_aura", "icon_hunting_bow_aura", "icon_short_bow_aura", "icon_axe_03_aura",
	"icon_pickaxe_01_aura", "icon_pike_01_aura", "icon_pitchfork_01_aura", "icon_scythe_01_aura", "icon_axe_two_handed_02_aura", "icon_flail_02_aura",
	"icon_flail_03_aura", "icon_event_bow_01_aura", "icon_event_bow_02_aura", "icon_longaxe_01_aura", "icon_cleaver_02_aura", "icon_named_sword_01_aura",
	"icon_named_sword_02_aura", "icon_named_sword_03_aura", "icon_named_sword_04_aura", "icon_named_sword_05_aura", "icon_named_two_handed_axe_01_aura", "icon_named_two_handed_axe_02_aura",
	"icon_named_two_handed_axe_03_aura", "icon_named_two_handed_axe_04_aura", "icon_named_two_handed_axe_05_aura", "icon_named_mace_01_aura", "icon_named_mace_02_aura", "icon_named_mace_03_aura",
	"icon_named_mace_04_aura", "icon_named_mace_05_aura", "icon_named_axe_01_aura", "icon_named_axe_02_aura", "icon_named_axe_03_aura", "icon_named_flail_01_aura",
	"icon_named_flail_02_aura", "icon_named_flail_03_aura", "icon_throwing_net_aura", "icon_orc_weapon_06_aura", "icon_orc_weapon_07_aura", "icon_orc_weapon_02_named_01_aura",
	"icon_orc_weapon_02_named_02_aura", "icon_orc_weapon_02_named_03_aura", "icon_orc_weapon_04_named_01_aura", "icon_orc_weapon_04_named_02_aura", "icon_orc_weapon_04_named_03_aura", "icon_goblin_bow_01_aura",
	"icon_goblin_bow_02_aura", "icon_goblin_crossbow_01_aura", "icon_goblin_weapon_01_aura", "icon_goblin_weapon_02_aura", "icon_goblin_weapon_03_aura", "icon_goblin_weapon_04_aura",
	"icon_goblin_weapon_05_aura", "icon_goblin_weapon_06_aura", "icon_goblin_weapon_07_aura", "icon_morning_star_01_aura", "icon_javelin_02_aura", "icon_throwing_axes_01_aura",
	"icon_lute_aura", "icon_spear_03_aura", "icon_crossbow_02_aura", "icon_war_bow_aura", "icon_hammer_01_aura", "icon_named_axe_04_aura",
	"icon_named_axe_05_aura", "icon_named_axe_06_aura", "icon_named_bill_01_aura", "icon_named_bill_02_aura", "icon_named_bill_03_aura", "icon_named_bow_01_aura",
	"icon_named_bow_02_aura", "icon_named_bow_03_aura", "icon_named_cleaver_01_aura", "icon_named_cleaver_02_aura", "icon_named_cleaver_03_aura", "icon_named_crossbow_01_aura",
	"icon_named_crossbow_02_aura", "icon_named_crossbow_03_aura", "icon_named_dagger_01_aura", "icon_named_dagger_02_aura", "icon_named_dagger_03_aura", "icon_named_greatsword_01_aura",
	"icon_named_greatsword_02_aura", "icon_named_greatsword_03_aura", "icon_named_hammer_01_aura", "icon_named_hammer_02_aura", "icon_named_hammer_03_aura", "icon_named_javelin_01_aura",
	"icon_named_javelin_02_aura", "icon_named_javelin_03_aura", "icon_named_longaxe_01_aura", "icon_named_longaxe_02_aura", "icon_named_longaxe_03_aura", "icon_named_pike_01_aura",
	"icon_named_pike_02_aura", "icon_named_pike_03_aura", "icon_named_spear_01_aura", "icon_named_spear_02_aura", "icon_named_spear_03_aura", "icon_named_throwing_axes_01_aura",
	"icon_named_throwing_axes_02_aura", "icon_named_throwing_axes_03_aura", "icon_named_warbrand_01_aura", "icon_named_warbrand_02_aura", "icon_named_warbrand_03_aura", "icon_named_warhammer_01_aura",
	"icon_named_warhammer_02_aura", "icon_named_warhammer_03_aura", "icon_ancient_spear_01_aura", "icon_ancient_sword_02_aura", "icon_bladed_pike_01_aura", "icon_crypt_cleaver_01_aura",
	"icon_falx_01_aura", "icon_rhomphaia_01_aura", "icon_warscythe_01_aura", "icon_khopesh_01_aura", "icon_ancient_sword_01_aura", "icon_dagger_02_aura",
	"icon_pick_01_aura", "icon_bill_02_aura", "icon_crossbow_03_aura", "icon_bladed_pike_02_aura", "icon_acid_flask_01_aura", "icon_flail_three_headed_01_aura",
	"icon_spetum_01_aura", "icon_longsword_01_aura", "icon_goedendag_01_aura", "icon_flail_two_handed_01_aura", "icon_flail_two_handed_02_aura", "icon_hammer_02_aura",
	"icon_mace_two_handed_01_aura", "icon_mace_two_handed_02_aura", "icon_polehammer_01_aura", "icon_sword_fencing_01_aura", "icon_throwing_spear_01_aura", "icon_holy_water_01_aura",
	"icon_throwing_net_02_aura", "icon_sword_two_handed_02_aura", "icon_sword_legendary_01_aura", "icon_obsidian_dagger_aura", "icon_fencing_sword_01_named_01_aura", "icon_fencing_sword_01_named_02_aura",
	"icon_flail_three_headed_01_named_01_aura", "icon_flail_three_headed_01_named_02_aura", "icon_flail_two_handed_02_named_01_aura", "icon_flail_two_handed_02_named_02_aura", "icon_mace_two_handed_02_named_01_aura", "icon_mace_two_handed_02_named_02_aura",
	"icon_polehammer_01_named_01_aura", "icon_polehammer_01_named_02_aura", "icon_spetum_01_named_01_aura", "icon_spetum_01_named_02_aura", "icon_wildmen_01_aura", "icon_wildmen_02_aura",
	"icon_wildmen_03_aura", "icon_wildmen_04_aura", "icon_wildmen_05_aura", "icon_wildmen_06_aura", "icon_wildmen_07_aura", "icon_wildmen_08_aura",
	"icon_wildmen_09_aura", "icon_wildmen_11_aura", "icon_wildmen_10_aura", "icon_bladed_pike_named_01_aura", "icon_cryptcleaver_named_01_aura", "icon_khopesh_named_01_aura",
	"icon_warscythe_named_01_aura", "icon_wildmen_06_named_01_aura", "icon_wildmen_07_named_01_aura", "icon_wildmen_08_named_01_aura", "icon_wildmen_09_named_01_aura", "icon_goblin_bow_02_named_01_aura",
	"icon_goblin_weapon_02_named_01_aura", "icon_goblin_weapon_03_named_01_aura", "icon_goblin_weapon_04_named_01_aura", "icon_javelins_heavy_01_aura", "icon_throwing_axes_heavy_01_aura", "icon_bardiche_01_aura",
	"icon_scimitar_01_aura", "icon_sling_01_aura", "icon_warfork_01_aura", "icon_whip_01_aura", "icon_scimitar_02_aura", "icon_bardiche_01_named_01_aura",
	"icon_bardiche_01_named_02_aura", "icon_scimitar_01_named_01_aura", "icon_whip_01_named_01_aura", "icon_scimitar_01_named_02_aura", "icon_firelance_01_aura", "icon_firelance_01_empty_aura",
	"icon_handgonne_01_empty_aura", "icon_handgonne_01_loaded_aura", "icon_heavy_southern_mace_01_aura", "icon_light_southern_mace_01_aura", "icon_nomad_mace_01_aura", "icon_polemace_01_aura",
	"icon_qatal_dagger_aura", "icon_sling_02_aura", "icon_southern_short_sword_01_aura", "icon_swordlance_01_aura", "icon_two_handed_scimitar_01_aura", "icon_composite_bow_01_aura",
	"icon_daze_bomb_01_aura", "icon_fire_bomb_01_aura", "icon_smoke_bomb_01_aura", "icon_handgonne_01_named_01_empty_aura", "icon_handgonne_01_named_01_loaded_aura", "icon_handgonne_01_named_02_empty_aura",
	"icon_handgonne_01_named_02_loaded_aura", "icon_polemace_01_named_02_aura", "icon_polemace_01_named_01_aura", "icon_qatal_dagger_named_02_aura", "icon_qatal_dagger_named_01_aura", "icon_swordlance_01_named_01_aura",
	"icon_swordlance_01_named_02_aura", "icon_two_handed_scimitar_01_named_01_aura", "icon_two_handed_scimitar_01_named_02_aura", "icon_two_handed_saif_01_aura", "icon_necronomicon_aura", "icon_dual_cleaver_hammer_01_aura",
	"icon_dual_mace_flail_01_aura", "icon_dual_mace_hammer_01_aura", "icon_dual_spear_sword_01_aura", "icon_miasma_flail_01_aura",
];
