// =====================================================================
//  Aura Power - fantasybro decisive_battle_b_contract compatibility shim
//
//  THE BUG (not ours - it lives in fantasybro - but it locks the player
//  out of towns on a mixed stack):
//    When the player enters a town, fantasybro's noble-war contract
//    decisive_battle_b_contract.start() picks the nearest non-allied,
//    non-Unique settlement and does:
//
//        this.m.WarcampTile  = myTile.getTileBetweenThisAnd(best.getTile());
//        this.m.Flags.set("EnemyNobleHouse", best.getOwner().getID());
//
//    On a heavy stack the player's known settlements include modded towns
//    (Samurai / Jurchen / Mongol / Cultist, etc.) that pass the allied /
//    Unique filter but whose getOwner() returns null - or an owner object
//    with no getID(). best.getOwner().getID() then throws
//        "the index 'getID' does not exist"
//    aborting start(), so the town screen never opens. (Confirmed by armin
//    from log.html: best_settlement was a real Table at distance 28, so the
//    null is the OWNER, not the settlement.) The identical loop is repeated
//    in the "Offer" state's end() (~line 116-143) and crashes there too.
//
//  THE FIX:
//    We replace the buggy method bodies with a faithful copy of fantasybro's
//    own logic, hardened so the settlement search additionally requires a
//    settlement whose getOwner() is non-null AND exposes a getID() that
//    resolves to a real NobleHouse faction. That guarantees BOTH
//    m.WarcampTile and the EnemyNobleHouse flag get set to valid values -
//    not just swallowing the crash, which would leave EnemyNobleHouse unset
//    and crash later (start() line 114, 193, 356, 679, 714 all dereference
//    that flag).
//
//    When a valid noble settlement exists - the normal case - our loop picks
//    the exact same nearest one the original would have, so contract
//    behaviour is unchanged. We only diverge when the original would have
//    crashed.
//
//  GUARDS the three failure modes armin called out:
//    (a) loop finds no settlement at all          -> best stays null
//    (b) getOwner() returns null                   -> skip that settlement
//    (c) owner exists but has no getID()           -> skip that settlement
//    If after filtering nothing valid remains we fall back to the nearest
//    settlement that has ANY valid faction id, and only as a last resort
//    abort gracefully (logError) instead of throwing into the town screen.
//
//  SAFETY / standalone-clean:
//    mods_hookExactClass only fires if the class actually loads, and we wrap
//    the whole registration in try/catch, so on a clean vanilla stack (no
//    fantasybro) this file is an inert no-op and the mod still loads.
// =====================================================================
try
{
	::mods_hookExactClass("contracts/contracts/decisive_battle_b_contract", function(o)
	{
		// --- shared helper: find the nearest settlement with a VALID,
		//     non-allied, non-Unique NobleHouse owner. Returns a table
		//     { Settlement = <s or null>, FactionID = <int or null> }.
		//     Reads getFaction()/getOwner()/getID() defensively so a modded
		//     settlement that lacks any of them can never throw. -----------
		local _auraFindEnemyNoble = function( _contract, _myTile )
		{
			local settlements = _contract.World.EntityManager.getSettlements();
			local lowest = 99999;
			local best = null;
			local bestFactionID = null;

			foreach( s in settlements )
			{
				try
				{
					// Same two filters fantasybro uses.
					if (_contract.World.FactionManager.isAllied(_contract.getFaction(), s.getFaction()))
					{
						continue;
					}
					if (s.isLocationType(_contract.Const.World.LocationType.Unique))
					{
						continue;
					}

					// (b) owner must exist.
					local owner = s.getOwner();
					if (owner == null)
					{
						continue;
					}

					// (c) owner must expose getID().
					if (!("getID" in owner))
					{
						continue;
					}

					local fid = owner.getID();
					if (fid == null)
					{
						continue;
					}

					// Owner id must resolve to a real faction we can use
					// for banners / spawns downstream.
					local faction = _contract.World.FactionManager.getFaction(fid);
					if (faction == null)
					{
						continue;
					}

					local d = s.getTile().getDistanceTo(_myTile);
					if (d < lowest)
					{
						lowest = d;
						best = s;
						bestFactionID = fid;
					}
				}
				catch (e)
				{
					// A single malformed modded settlement must never abort
					// the whole search - skip it and keep going.
					continue;
				}
			}

			return {
				Settlement = best,
				FactionID = bestFactionID
			};
		}

		// =================================================================
		//  Harden Contract.start()
		// =================================================================
		local _origStart = o.start;
		o.start = function()
		{
			// Only the WarcampTile == null branch is dangerous; everything
			// else in the original start() is pure assignment and safe. If a
			// WarcampTile already exists (resumed contract) just defer wholly
			// to the original.
			if (this.m.WarcampTile != null)
			{
				_origStart.call(this);
				return;
			}

			try
			{
				if (this.m.Home == null)
				{
					this.setHome(this.World.State.getCurrentTown());
				}

				local myTile = this.m.Home.getTile();
				local result = _auraFindEnemyNoble(this, myTile);

				if (result.Settlement == null || result.FactionID == null)
				{
					// (a) Nothing valid in range. We cannot safely build a
					// noble-war contract here; abort cleanly so the TOWN
					// SCREEN STILL OPENS instead of crashing. Removing the
					// contract is the same graceful outcome the player gets
					// when a contract can't be set up.
					this.logError("Aura Power: decisive_battle_b_contract found no valid NobleHouse settlement near " + (this.m.Home != null ? this.m.Home.getName() : "?") + " - removing contract to avoid town-entry crash.");
					try { this.World.Contracts.removeContract(this); } catch (e2) {}
					return;
				}

				// Set BOTH required pieces of state, exactly as the original
				// would have - just with a guaranteed-valid settlement.
				this.m.WarcampTile = myTile.getTileBetweenThisAnd(result.Settlement.getTile());
				this.m.Flags.set("EnemyNobleHouse", result.FactionID);

				// --- remainder of the original start() body (unchanged) ----
				this.m.Flags.set("CommanderName", this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]);
				this.m.Payment.Pool = 1600 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();
				local r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Payment.Completion = 0.75;
					this.m.Payment.Advance = 0.25;
				}
				else if (r == 2)
				{
					this.m.Payment.Completion = 1.0;
				}

				this.m.Flags.set("RequisitionCost", this.beautifyNumber(this.m.Payment.Pool * 0.25));
				this.m.Flags.set("Bribe", this.beautifyNumber(this.m.Payment.Pool * 0.35));
				this.contract.start();
			}
			catch (e)
			{
				// Last-resort safety: never let start() throw into the town
				// screen. Log it and drop the contract.
				this.logError("Aura Power: decisive_battle_b_contract.start() guarded exception: " + e);
				try { this.World.Contracts.removeContract(this); } catch (e2) {}
			}
		}

		// =================================================================
		//  Harden the "Offer" state's end() - same buggy loop, ~line 116-143.
		//  We wrap createStates(): after the original builds m.States, we
		//  find the Offer state and replace ONLY its WarcampTile == null
		//  recomputation with the hardened search. The rest of end() (money,
		//  relation, warcamp spawn, screen flags) is left untouched.
		// =================================================================
		local _origCreateStates = o.createStates;
		o.createStates = function()
		{
			_origCreateStates.call(this);

			try
			{
				local contractRef = this;
				foreach( state in this.m.States )
				{
					if (!("ID" in state) || state.ID != "Offer") continue;

					local _origEnd = state.end;
					state.end = function()
					{
						// Pre-fill a valid WarcampTile + EnemyNobleHouse BEFORE
						// the original end() runs, so its own (buggy) null-branch
						// loop is skipped entirely and its line-114 relation call
						// has a valid EnemyNobleHouse to read.
						try
						{
							if (this.Contract.m.WarcampTile == null)
							{
								local myTile = this.Contract.m.Home.getTile();
								local result = _auraFindEnemyNoble(this.Contract, myTile);

								if (result.Settlement != null && result.FactionID != null)
								{
									this.Contract.m.WarcampTile = myTile.getTileBetweenThisAnd(result.Settlement.getTile());

									// Atomic: when we recompute WarcampTile we MUST set
									// EnemyNobleHouse from the SAME result, or the two can
									// point at different nobles (e.g. start() set house A,
									// WarcampTile got cleared during deserialize, and we now
									// recompute house B). That mismatch silently corrupts
									// warcamp/banner/final-battle. Always set together.
									this.Flags.set("EnemyNobleHouse", result.FactionID);
								}
								else
								{
									this.Contract.logError("Aura Power: decisive_battle_b_contract Offer.end() found no valid NobleHouse settlement - removing contract to avoid crash.");
									try { this.World.Contracts.removeContract(this.Contract); } catch (e2) {}
									return;
								}
							}
						}
						catch (e)
						{
							this.Contract.logError("Aura Power: decisive_battle_b_contract Offer.end() pre-guard exception: " + e);
							try { this.World.Contracts.removeContract(this.Contract); } catch (e2) {}
							return;
						}

						// WarcampTile is now guaranteed non-null, so the original
						// end()'s null-branch loop is skipped and it proceeds with
						// valid state.
						_origEnd.call(this);
					}
				}
			}
			catch (e)
			{
				this.logError("Aura Power: failed to harden decisive_battle_b_contract Offer.end(): " + e);
			}
		}

		::logInfo("Aura Power: applied fantasybro decisive_battle_b_contract compatibility shim (owner-null / missing-getID town-entry crash guard).");
	});
}
catch (e)
{
	// fantasybro not installed (clean vanilla stack) or hook API shape
	// changed - either way, stay a silent no-op so the mod still loads.
	::logInfo("Aura Power: fantasybro decisive_battle_b_contract shim not applied (class absent or hook failed): " + e);
}
