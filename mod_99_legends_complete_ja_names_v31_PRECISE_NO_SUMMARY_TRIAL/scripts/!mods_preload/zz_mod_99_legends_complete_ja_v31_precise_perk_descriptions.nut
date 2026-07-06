::mods_registerMod("mod_99_legends_complete_ja_v31_precise_perk_descriptions", 3.1, "Legends Complete Japanese Patch v31 Precise Perk Descriptions");

local lcj_v31_rep = function(text, a, b) {
    if (text == null || typeof text != "string" || a == "") return text;
    local r = text;
    local out = "";
    local i = r.find(a);
    while (i != null) {
        out = out + r.slice(0, i) + b;
        r = r.slice(i + a.len());
        i = r.find(a);
    }
    return out + r;
};

local lcj_v31_tr = function(text) {
    if (text == null || typeof text != "string") return text;
    local out = text;
    local M = [];
    // Headers / common UI lines. These are literal replacements only; numbers are never touched.
    M.push(["[u]Passive:[/u]", "[u]パッシブ:[/u]"]);
    M.push(["[u]Active:[/u]", "[u]アクティブ:[/u]"]);
    M.push(["Passive:", "パッシブ:"]);
    M.push(["Active:", "アクティブ:"]);
    M.push(["Affected Skills:", "対象スキル:"]);
    M.push(["From the ", ""]);
    M.push([" perk group", "パークグループ"]);
    M.push(["Locked until ", "あと"]);
    M.push([" more perk points are spent", "パークポイントを消費するまでロック"]);
    M.push([" more perk point is spent", "パークポイントを消費するまでロック"]);

    // Core terms. Long phrases first to avoid bad partial translations.
    M.push(["Action Points", "AP"]);
    M.push(["Action Point", "AP"]);
    M.push(["Melee Skill", "近接攻撃スキル"]);
    M.push(["Ranged Skill", "遠隔攻撃スキル"]);
    M.push(["Melee Defense", "近接防御"]);
    M.push(["Ranged Defense", "遠隔防御"]);
    M.push(["Max Fatigue", "最大疲労"]);
    M.push(["Fatigue Recovery per turn", "ターンごとの疲労回復"]);
    M.push(["Fatigue Recovery", "疲労回復"]);
    M.push(["Fatigue Damage", "疲労ダメージ"]);
    M.push(["Fatigue", "疲労"]);
    M.push(["Resolve", "意思"]);
    M.push(["Initiative", "イニシアチブ"]);
    M.push(["Hitpoints", "ヒットポイント"]);
    M.push(["Hit Points", "ヒットポイント"]);
    M.push(["Damage Taken to Hitpoints", "ヒットポイントへの被ダメージ"]);
    M.push(["Damage Taken to Armor", "防具への被ダメージ"]);
    M.push(["Damage Taken", "被ダメージ"]);
    M.push(["Armor Penetration", "防具貫通"]);
    M.push(["Effectiveness vs. Armor", "防具への有効性"]);
    M.push(["effectiveness against armor", "防具への有効性"]);
    M.push(["ignores armor", "防具を無視する"]);
    M.push(["Hit Chance", "命中率"]);
    M.push(["chance to hit", "命中率"]);
    M.push(["Dodge Chance", "回避率"]);
    M.push(["Damage", "ダメージ"]);

    // Statuses.
    M.push(["Dazed", "朦朧"]);
    M.push(["Daze", "朦朧"]);
    M.push(["Staggered", "よろめき"]);
    M.push(["Stagger", "よろめき"]);
    M.push(["Stunned", "気絶"]);
    M.push(["Stun", "気絶"]);
    M.push(["Bleeding", "出血"]);
    M.push(["bleeding", "出血"]);
    M.push(["Poisoned", "毒"]);
    M.push(["Poison", "毒"]);
    M.push(["Charmed", "魅了"]);
    M.push(["charm", "魅了"]);
    M.push(["Charmed", "魅了"]);
    M.push(["Rooted", "拘束"]);
    M.push(["rooted", "拘束"]);
    M.push(["Confident", "自信満々"]);
    M.push(["Steady", "安定"]);

    // Common exact phrases. These preserve numbers and conditions.
    M.push(["Skills build up ", "スキルによる疲労の蓄積が"]);
    M.push(["skills build up ", "スキルによる疲労の蓄積が"]);
    M.push(["skill builds up ", "スキルによる疲労の蓄積が"]);
    M.push([" less 疲労", "減少する"]);
    M.push([" less Fatigue", "疲労減少"]);
    M.push(["builds up ", "蓄積する疲労 "]);
    M.push(["Costs ", "コスト "]);
    M.push(["costs ", "コスト "]);
    M.push(["Costs only ", "コストは"]);
    M.push(["Costs 1 less AP", "APコストが1減少する"]);
    M.push(["Costs 1 less Action Point", "APコストが1減少する"]);
    M.push(["cost 1 less Action Point", "APコストが1減少する"]);
    M.push(["cost 1 less AP", "APコストが1減少する"]);
    M.push(["costs 1 less Action Point", "APコストが1減少する"]);
    M.push(["costs 1 less AP", "APコストが1減少する"]);
    M.push(["The effect lasts for ", "効果は"]);
    M.push([" rounds", "ラウンド持続する"]);
    M.push([" round", "ラウンド持続する"]);
    M.push([" turns", "ターン"]);
    M.push([" turn", "ターン"]);
    M.push(["tiles", "マス"]);
    M.push(["tile", "マス"]);
    M.push(["adjacent", "隣接"]);
    M.push(["Adjacent", "隣接"]);
    M.push(["within ", "範囲 "]);
    M.push(["range of ", "射程 "]);
    M.push(["Has a range of ", "射程は"]);
    M.push(["Increases ", "増加する "]);
    M.push(["increases ", "増加する "]);
    M.push(["Reduces ", "減少する "]);
    M.push(["reduces ", "減少する "]);
    M.push(["Grants ", "付与する "]);
    M.push(["grants ", "付与する "]);
    M.push(["Gain ", "得る "]);
    M.push(["Gains ", "得る "]);
    M.push(["gain ", "得る "]);
    M.push(["Allows you to ", "可能になる："]);
    M.push(["allows you to ", "可能になる："]);
    M.push(["On use", "使用時"]);
    M.push(["on use", "使用時"]);
    M.push(["on hit", "命中時"]);
    M.push(["On hit", "命中時"]);
    M.push(["while using ", "使用中："]);
    M.push(["while equipped with ", "装備中："]);
    M.push(["while riding a mount", "騎乗中"]);
    M.push(["at the start of your turn", "ターン開始時"]);
    M.push(["At the start of each turn", "各ターン開始時"]);
    M.push(["if the attack lands on the head", "攻撃が頭部に命中した場合"]);
    M.push(["for each ", "ごとに"]);
    M.push(["for every ", "ごとに"]);
    M.push(["additional ", "追加の"]);
    M.push(["additional", "追加の"]);
    M.push(["maximum", "最大"]);
    M.push(["minimum", "最小"]);
    M.push(["immune to", "無効："]);
    M.push(["immunity to", "無効："]);

    // Skill/perk names used in common tooltip links. Keep as labels, not mechanics.
    M.push(["Polearm Mastery", "ポールアームマスタリー"]);
    M.push(["Mace Mastery", "メイスマスタリー"]);
    M.push(["Crossbow Mastery", "クロスボウマスタリー"]);
    M.push(["Bow Mastery", "弓マスタリー"]);
    M.push(["Cleaver Mastery", "鉈マスタリー"]);
    M.push(["Dagger Mastery", "短剣マスタリー"]);
    M.push(["Hammer Mastery", "ハンマーマスタリー"]);
    M.push(["Shieldwall", "シールドウォール"]);
    M.push(["Spearwall", "スピアウォール"]);
    M.push(["Riposte", "リポスト"]);
    M.push(["Knock Back", "ノックバック"]);
    M.push(["Knock Out", "ノックアウト"]);
    M.push(["Knock Over", "ノックオーバー"]);
    M.push(["Strike Down", "ストライクダウン"]);
    M.push(["Rupture", "破裂攻撃"]);
    M.push(["Leap", "跳躍"]);
    M.push(["Staff 朦朧", "杖の朦朧"]);
    M.push(["Staff Daze", "杖の朦朧"]);

    foreach(p in M) {
        try { out = lcj_v31_rep(out, p[0], p[1]); } catch(e) {}
    }
    return out;
};

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
    local gt = this.getroottable();

    // Explicit corrections for previous trial summaries. These are literal translations of the visible effect text; all numbers remain unchanged.
    local cP = gt.Const.UI.Color.PositiveValue;
    local cN = gt.Const.UI.Color.NegativeValue;
    local cD = gt.Const.UI.Color.DamageValue;
    local cA = ("povPerkDarkOrange" in gt.Const.UI) ? gt.Const.UI.Color.povPerkDarkOrange : gt.Const.UI.Color.Active;
    local cS = ("povPerkPurple" in gt.Const.UI) ? gt.Const.UI.Color.povPerkPurple : gt.Const.UI.Color.NegativeValue;

    lcj_v31_set_desc("SpecPolearm", "ポールアームを極め、敵を寄せ付けない。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]Rupture[/color]は、与える[color=" + cD + "]出血[/color]ダメージを[color=" + cP + "]10[/color]に増加させる。\n\n• 杖使用時、[color=" + cS + "]Staff Daze[/color]の朦朧付与確率が[color=" + cP + "]100%[/color]に増加し、[color=" + cS + "]Leap[/color]の射程が[color=" + cP + "]1[/color]増加する。\n\n• その他のポールアーム系スキルはAPコストが[color=" + cN + "]1[/color]減少し、隣接する対象を直接攻撃してもペナルティを受けなくなる。");
    lcj_v31_set_desc("PolearmMastery", gt.Const.Strings.PerkDescription.SpecPolearm);

    lcj_v31_set_desc("SpecMace", "メイスを極め、防具の有無に関わらず敵を屈服させる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]Knock Out[/color]、[color=" + cS + "]Knock Over[/color]、[color=" + cS + "]Strike Down[/color]は、対象が無効でない限り[color=" + cP + "]100%[/color]の確率で気絶させる。\n\n• Polemaceは隣接する対象を直接攻撃してもペナルティを受けなくなる。");
    lcj_v31_set_desc("MaceMastery", gt.Const.Strings.PerkDescription.SpecMace);

    // PoV replacement that was confirmed to overwrite vanilla/Legends descriptions.
    lcj_v31_set_desc("SpecCrossbow", "クロスボウと銃器を極め、最も効果的な狙い所を学ぶ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• クロスボウで与えたダメージの追加[color=" + cP + "]10%[/color]が防具を無視する。\n\n• ハンドゴンのリロードに必要なAPが[color=" + cN + "]6[/color]になり、2ターンに1回ではなく毎ターン発射できるようになる。");
    lcj_v31_set_desc("CrossbowMastery", gt.Const.Strings.PerkDescription.SpecCrossbow);

    // Apply literal phrase translations to every remaining existing perk description without removing numbers or clauses.
    try {
        if (("PerkDescription" in gt.Const.Strings)) {
            foreach(k, v in gt.Const.Strings.PerkDescription) {
                if (typeof v == "string") gt.Const.Strings.PerkDescription[k] = lcj_v31_tr(v);
            }
        }
    } catch(e) {}

    try {
        foreach(id, obj in gt.Const.Perks.PerkDefObjects) {
            if (obj == null) continue;
            if (("Tooltip" in obj) && typeof obj.Tooltip == "string") obj.Tooltip = lcj_v31_tr(obj.Tooltip);
            if (("Description" in obj) && typeof obj.Description == "string") obj.Description = lcj_v31_tr(obj.Description);
            if (("Name" in obj) && typeof obj.Name == "string") obj.Name = lcj_v31_tr(obj.Name);
        }
    } catch(e) {}
};

::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_legends", function() { lcj_v31_apply(); });
::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_PoV", function() { lcj_v31_apply(); });
::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_nggh_magic_concept", function() { lcj_v31_apply(); });
::mods_queue("mod_99_legends_complete_ja_v31_precise_perk_descriptions", "mod_fantasybro", function() { lcj_v31_apply(); });
