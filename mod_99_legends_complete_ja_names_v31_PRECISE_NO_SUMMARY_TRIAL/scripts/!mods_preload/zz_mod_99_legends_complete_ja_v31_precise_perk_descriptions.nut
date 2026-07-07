::mods_registerMod("mod_99_legends_complete_ja_v31_precise_perk_descriptions", 3.1, "Legends Complete Japanese Patch v31 Precise Perk Descriptions");

local lcj_v31_applied = false;

local lcj_v31_set_desc = function(_key, _desc) {
    local gt = this.getroottable();
    try { if (! ("PerkDescription" in gt.Const.Strings)) gt.Const.Strings.PerkDescription <- {}; } catch(e) {}
    try { gt.Const.Strings.PerkDescription[_key] <- _desc; } catch(e) {}
    try {
        if ((_key in gt.Const.Perks.PerkDefs) && (gt.Const.Perks.PerkDefs[_key] in gt.Const.Perks.PerkDefObjects)) {
            gt.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs[_key]].Tooltip = _desc;
            gt.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs[_key]].Description = _desc;
        }
    } catch(e) {}
    try {
        if (("Legends" in gt) && ("Perk" in gt.Legends) && (_key in gt.Legends.Perk) && (gt.Legends.Perk[_key] in gt.Const.Perks.PerkDefObjects)) {
            gt.Const.Perks.PerkDefObjects[gt.Legends.Perk[_key]].Tooltip = _desc;
            gt.Const.Perks.PerkDefObjects[gt.Legends.Perk[_key]].Description = _desc;
        }
    } catch(e) {}
};

local lcj_v31_apply = function() {
    if (lcj_v31_applied) return;
    lcj_v31_applied = true;
    local gt = this.getroottable();

    // Explicit corrections for previous trial summaries. These are literal translations of the visible effect text; all numbers remain unchanged.
    local cP = gt.Const.UI.Color.PositiveValue;
    local cN = gt.Const.UI.Color.NegativeValue;
    local cD = gt.Const.UI.Color.DamageValue;
    local cA = ("povPerkDarkOrange" in gt.Const.UI) ? gt.Const.UI.Color.povPerkDarkOrange : gt.Const.UI.Color.Active;
    local cS = ("povPerkPurple" in gt.Const.UI) ? gt.Const.UI.Color.povPerkPurple : gt.Const.UI.Color.NegativeValue;

    lcj_v31_set_desc("SpecPolearm", "ポールアームを極め、敵を寄せ付けない。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]破裂攻撃[/color]は、与える[color=" + cD + "]出血[/color]ダメージを[color=" + cP + "]10[/color]に増加させる。\n\n• 杖使用時、[color=" + cS + "]杖の朦朧[/color]の朦朧付与確率が[color=" + cP + "]100%[/color]に増加し、[color=" + cS + "]跳躍[/color]の射程が[color=" + cP + "]1[/color]増加する。\n\n• その他のポールアーム系スキルはAPコストが[color=" + cN + "]1[/color]減少し、隣接する対象を直接攻撃してもペナルティを受けなくなる。");
    lcj_v31_set_desc("PolearmMastery", gt.Const.Strings.PerkDescription.SpecPolearm);

    lcj_v31_set_desc("SpecMace", "メイスを極め、防具の有無に関わらず敵を屈服させる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]ノックアウト[/color]、[color=" + cS + "]ノックオーバー[/color]、[color=" + cS + "]ストライクダウン[/color]は、対象が無効でない限り[color=" + cP + "]100%[/color]の確率で気絶させる。\n\n• ポールメイスは隣接する対象を直接攻撃してもペナルティを受けなくなる。");
    lcj_v31_set_desc("MaceMastery", gt.Const.Strings.PerkDescription.SpecMace);

    // PoV replacement that was confirmed to overwrite vanilla/Legends descriptions.
    lcj_v31_set_desc("SpecCrossbow", "クロスボウと銃器を極め、最も効果的な狙い所を学ぶ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• クロスボウで与えたダメージの追加[color=" + cP + "]10%[/color]が防具を無視する。\n\n• ハンドゴンのリロードに必要なAPが[color=" + cN + "]6[/color]になり、2ターンに1回ではなく毎ターン発射できるようになる。");
    lcj_v31_set_desc("CrossbowMastery", gt.Const.Strings.PerkDescription.SpecCrossbow);

    // Vanilla: Tenacious (執念)
    lcj_v31_set_desc("Tenacious", "減速するな！\n\n疲労や負傷によるイニシアチブの低下量が、常に本来の値の[color=" + cP + "]50%[/color]に抑えられる。");

    // Legends: LegendTenacious (執念)
    lcj_v31_set_desc("LegendTenacious", "減速するな！\n\n疲労・負傷・その他の効果によるイニシアチブの低下量が、常に本来の値の[color=" + cP + "]50%[/color]に抑えられる。\n\n「待機」コマンドを使用してもイニシアチブが[color=" + cP + "]50%[/color]低下しなくなる。");
};

::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_legends", function() { lcj_v31_apply(); });
::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_PoV", function() { lcj_v31_apply(); });
::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_nggh_magic_concept", function() { lcj_v31_apply(); });
::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_fantasybro", function() { lcj_v31_apply(); });
