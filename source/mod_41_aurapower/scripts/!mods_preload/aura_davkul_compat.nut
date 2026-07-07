// =====================================================================
//  Aura Power - davkul / Reforged spawnEntity arity compatibility shim
//
//  THE BUG (not ours, but it crashes/spams the player's stack):
//    Reforged's nested_tooltips hookTree on scripts/factions/faction wraps
//    spawnEntity and always calls __original with SIX arguments
//    (_tile, _name, _uniqueName, _template, _resources, _minibossify).
//    zmod_davkul_rising's cultist_faction overrides spawnEntity with only
//    FIVE parameters, so when Reforged's wrapper calls it as __original the
//    engine throws "wrong number of parameters" on every Cultist Roamers /
//    Raiders / Camp spawn. On the world map this is a recoverable runtime
//    error (log spam + the cultist party fails to spawn); during a save
//    deserialize it becomes the unrecoverable "Corrupt data before FoW".
//
//  WHY WE FIX IT FROM HERE INSTEAD OF EDITING DAVKUL:
//    The fix must live entirely inside mod_aurapower so the davkul zip
//    stays pristine. We load AFTER Reforged, so a naive wrapper that calls
//    __original is unreliable - Reforged's 6-arg wrapper is already the
//    inner layer and re-introduces the 6-arg call to davkul's 5-param body.
//    The robust, hook-order-independent move is to REPLACE the subclass's
//    spawnEntity with a 6-parameter reimplementation of davkul's own body
//    (which never used _minibossify anyway) and simply accept-and-ignore
//    the extra argument. We also keep Reforged's only meaningful behaviour
//    - stripping nested-tooltip tags from the spawned party's name during
//    event nesting - so nothing regresses.
//
//  SAFETY:
//    - mods_hookExactClass only fires if factions/cultist_faction actually
//      loads, so this is a no-op when davkul is not installed.
//    - davkul (zmod_davkul_rising v395, 2022) is long stable; the only
//      maintenance risk is davkul changing this method, which is unlikely.
// =====================================================================
::mods_hookExactClass("factions/cultist_faction", function(o)
{
	if (!("spawnEntity" in o)) return;

	// Full 6-parameter replacement. _minibossify is accepted and ignored,
	// exactly matching davkul's original (which had no concept of it). The
	// body is a faithful copy of davkul's cultist_faction.spawnEntity.
	o.spawnEntity = function( _tile, _name, _uniqueName, _template, _resources, _minibossify = 0 )
	{
		// Preserve Reforged's name cleanup so event-nested spawns don't keep
		// raw tooltip tags in the world-map label. Guarded - if the Reforged
		// API isn't present for any reason, just skip it.
		try
		{
			if ("Reforged" in ::getroottable()
				&& "NestedTooltips" in ::Reforged
				&& ::Reforged.NestedTooltips.isApplyingNestingForEvents())
			{
				_name = ::Reforged.Mod.Tooltips.removeAllFromString(_name);
			}
		}
		catch (e) {}

		this.recomputeFanatics(_template);

		// Cultist party instead of a normal party.
		local party = this.World.spawnEntity("scripts/entity/world/cultist_party", _tile.Coords);
		party.setFaction(this.getID());

		if (_uniqueName)
		{
			_name = this.getUniqueName(_name);
		}

		party.setName(_name);
		local t;

		if (_template != null)
		{
			t = this.Const.World.Common.assignTroops(party, _template, _resources);
		}

		party.getSprite("base").setBrush(this.m.Base);

		if (t != null)
		{
			party.getSprite("body").setBrush(t.Body);
		}
		if (_resources <= 150) party.getSprite("body").setBrush("figure_cultists_mod_02");
		else if (_resources <= 300) party.getSprite("body").setBrush("figure_cultists_mod_03");
		else party.getSprite("body").setBrush("figure_cultists_mod_01");

		if (this.m.BannerPrefix != "")
		{
			party.getSprite("banner").setBrush(this.m.BannerPrefix + (this.m.Banner < 10 ? "0" + this.m.Banner : this.m.Banner));
		}

		this.addUnit(party);
		return party;
	}

	::logInfo("Aura Power: applied davkul cultist_faction.spawnEntity 6-arg compatibility shim (Reforged arity fix).");
});
