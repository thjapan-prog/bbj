::mods_registerMod("mod_99_legends_complete_ja_v18_direct_bbf_repair", 1.8, "Legends Complete Japanese Patch v18 Direct BBF Repair");
local _lcj_v18 = function() {
  local gt = this.getroottable();
  local names = {
    ["Acid Coat"] = "酸塗り",
    ["アドレナリンラッシュ"] = "アドレナリン奔流",
    ["Aggressive"] = "攻撃的",
    ["Alp Mutagen"] = "変異：アルプ",
    ["Ambitious"] = "野心家",
    ["Appetite of a donkey"] = "ロバ並みの食欲",
    ["Arena Champion"] = "闘技場の王者",
    ["Bark Skin"] = "樹皮肌",
    ["Basilisk Mutagen"] = "変異：バシリスク",
    ["Beast Endurance"] = "獣の持久力",
    ["Beast Mutagen"] = "変異：獣",
    ["Bombardier"] = "爆撃手",
    ["Burning"] = "炎上",
    ["Cannibalistic"] = "食人嗜好",
    ["Charming"] = "魅力的",
    ["Corpsewarden"] = "墓守",
    ["Cutthroat"] = "喉裂き",
    ["Deathly spectre"] = "死の幻影",
    ["Disciple of the Inquisition"] = "異端審問の弟子",
    ["Distracted"] = "気逸れ",
    ["Dog Mutagen"] = "変異：犬",
    ["Donkey Mutagen"] = "変異：ロバ",
    ["Double tongued"] = "二枚舌",
    ["Enforcer"] = "執行者",
    ["Exhausted"] = "疲労困憊",
    ["Extremophile"] = "極限環境適応",
    ["Fear of Mutants"] = "変異体恐怖症",
    ["Fear of Nobles"] = "貴族恐怖症",
    ["飽食"] = "満腹",
    ["Fleshless"] = "肉なき身",
    ["Fowler"] = "鳥撃ち",
    ["Gaisthasser"] = "ガイスト嫌い",
    ["Game Hunter"] = "猟師",
    ["Geisthasser"] = "ガイスト嫌い",
    ["Ghost Mutagen"] = "変異：霊体",
    ["Ghostly Strike"] = "霊体攻撃",
    ["Ghoul Hunger"] = "グールの飢え",
    ["Goblin Mutagen"] = "変異：ゴブリン",
    ["Grand Oath of Rabbitslaying!"] = "大誓約：兎殺し！",
    ["Harvester"] = "収穫者",
    ["Hate for Mutants"] = "変異体嫌い",
    ["Hate for Nobles"] = "貴族嫌い",
    ["Hates Dogs"] = "犬嫌い",
    ["Hates Everything"] = "万物嫌い",
    ["Haymaker"] = "大振り打撃",
    ["Hexe Mutagen"] = "変異：ヘクセ",
    ["Hexenjäger"] = "魔女狩り",
    ["Horse"] = "馬",
    ["Ifrit Mutagen"] = "変異：イフリート",
    ["Invictus"] = "不屈の闘士",
    ["Ironbreaker"] = "鉄砕き",
    ["Irresistible Allure"] = "抗えぬ魅力",
    ["Learned to Read"] = "読書習得",
    ["Light"] = "軽快",
    ["Lindwurm Mutagen"] = "変異：リンドヴルム",
    ["Lumbering"] = "鈍重",
    ["Martial"] = "武勇",
    ["Miasma"] = "瘴気",
    ["Minor Oath of Camaderie"] = "小誓約：戦友愛",
    ["Minor Oath of Distinction"] = "小誓約：卓越",
    ["Minor Oath of Endurance"] = "小誓約：忍耐",
    ["Minor Oath of Fortification"] = "小誓約：堅牢",
    ["Minor Oath of Humility"] = "小誓約：謙遜",
    ["Minor Oath of Sacrifice"] = "小誓約：犠牲",
    ["Minor Oath of Valor"] = "小誓約：勇気",
    ["Minor Oath of Wrath"] = "小誓約：憤怒",
    ["Misanthropist"] = "人間嫌い",
    ["Monster Hunter"] = "怪物狩り",
    ["Mutant Poison"] = "変異毒",
    ["Nachzehrer Mutagen"] = "変異：ナハツェーラー",
    ["Natural Order"] = "自然の摂理",
    ["Necromancer"] = "死霊術師",
    ["Necromancy Mutagen"] = "変異：屍術",
    ["Necrosavant Mutagen"] = "変異：ネクロサヴァント",
    ["Noble Killer"] = "貴族殺し",
    ["Nomad"] = "遊牧民",
    ["Nyctophobia"] = "暗所恐怖症",
    ["Oathsworn"] = "誓約者",
    ["Old Vattghern"] = "老練なヴァットガーン",
    ["Orc Mutagen"] = "変異：オーク",
    ["オークの猛攻"] = "オークの攻勢",
    ["麻痺"] = "麻痺",
    ["Peasant"] = "農民",
    ["Phalanx"] = "ファランクス",
    ["Pluviophile"] = "雨好き",
    ["Pragmatic"] = "実利主義",
    ["Predictable"] = "読みやすい",
    ["Prosthetic Ear"] = "義耳",
    ["Prosthetic Eye"] = "義眼",
    ["Prosthetic Finger"] = "義指",
    ["Prosthetic Foot"] = "義足",
    ["Prosthetic Forearm"] = "義前腕",
    ["Prosthetic Hand"] = "義手",
    ["Prosthetic Leg"] = "義脚",
    ["Prosthetic Nose"] = "義鼻",
    ["Psychopath"] = "サイコパス",
    ["Reaper"] = "死神",
    ["Reaver"] = "略奪者",
    ["Relationship"] = "関係",
    ["Rot Aura"] = "腐敗のオーラ",
    ["Rot Mutagen"] = "変異：腐敗",
    ["Rotting Flesh"] = "腐敗した肉体",
    ["Schrat Mutagen"] = "変異：シュラート",
    ["Seductive"] = "魅惑的",
    ["Serpent Mutagen"] = "変異：蛇",
    ["Sharpshooter"] = "狙撃手",
    ["Skirmisher"] = "散兵",
    ["Skullsplitter"] = "頭蓋割り",
    ["Slack"] = "怠惰",
    ["Slaughterman"] = "屠殺人",
    ["Spider Mutagen"] = "変異：蜘蛛",
    ["Steady Hands"] = "安定した手先",
    ["Stench"] = "悪臭",
    ["Stick Fighting"] = "棒術",
    ["Stonebreaker"] = "石砕き",
    ["Sureshot"] = "必中の射手",
    ["Talented"] = "才能あり",
    ["Third Eye"] = "第三の目",
    ["Tormentor"] = "拷問者",
    ["Trailblazer"] = "先駆者",
    ["Training progress"] = "訓練の進捗",
    ["Undead Curse"] = "不死の呪い",
    ["Undead Killer"] = "アンデッド殺し",
    ["Undead Mutagen"] = "変異：不死",
    ["Unhold Mutagen"] = "変異：ウンホルト",
    ["United in Chains"] = "鎖の結束",
    ["Unpredictable"] = "読めない動き",
    ["Unstable Mutant"] = "不安定な変異体",
    ["吸血性"] = "吸血性",
    ["Vatt'ghern"] = "ヴァットガーン",
    ["毒腺"] = "毒腺",
    ["毒腺"] = "毒腺",
    ["Venom Mutagen"] = "変異：毒腺",
    ["Weak Stench"] = "薄い悪臭",
    ["Withering Aura"] = "衰弱のオーラ",
    ["Woodsman"] = "森人",
  };
  local patchObj = function(o) {
    if (o == null) return;
    try { if (("m" in o) && ("Name" in o.m) && (o.m.Name in names)) o.m.Name = names[o.m.Name]; } catch(e) {}
    try { if (("Name" in o) && (o.Name in names)) o.Name = names[o.Name]; } catch(e) {}
  };
  local patchTable = function(t) {
    if (t == null || typeof t != "table") return;
    foreach(k,v in t) {
      if (typeof v == "string" && (v in names)) t[k] = names[v];
      else if (typeof v == "table") patchObj(v);
    }
  };
  try {
    if (("Const" in gt) && ("Strings" in gt.Const)) {
      if (("TraitName" in gt.Const.Strings)) patchTable(gt.Const.Strings.TraitName);
      if (("SkillName" in gt.Const.Strings)) patchTable(gt.Const.Strings.SkillName);
      if (("PerkName" in gt.Const.Strings)) patchTable(gt.Const.Strings.PerkName);
      gt.Const.Strings.PerkName.LegendSpecialistButcher <- "屠殺人";
      gt.Const.Strings.PerkName.LegendSpecialistBlacksmith <- "鉄砕き";
      gt.Const.Strings.PerkName.LegendSpecialistPrisoner <- "喉裂き";
      gt.Const.Strings.PerkName.LegendSpecialistMilitia <- "ファランクス";
      gt.Const.Strings.PerkName.LegendSpecialistBodyguard <- "略奪者";
      gt.Const.Strings.PerkName.LegendSpecialistMiner <- "石砕き";
      gt.Const.Strings.PerkName.LegendSpecialistFarmhand <- "大振り打撃";
      gt.Const.Strings.PerkName.LegendSpecialistPoacher <- "猟師";
      gt.Const.Strings.PerkName.LegendSpecialistGravedigger <- "墓守";
      gt.Const.Strings.PerkName.LegendSpecialistWoodsman <- "森人";
      gt.Const.Strings.PerkName.LegendSpecialistHerbalist <- "収穫者";
      gt.Const.Strings.PerkName.LegendSpecialistShepherd <- "散兵";
      gt.Const.Strings.PerkName.LegendSpecialistCultist <- "拷問者";
      gt.Const.Strings.PerkName.LegendSpecialistReaper <- "死神";
      gt.Const.Strings.PerkName.LegendSpecialistSelfdefense <- "棒術";
      gt.Const.Strings.PerkName.LegendSpecialistInventor <- "爆撃手";
      gt.Const.Strings.PerkName.LegendSpecialistInquisition <- "魔女狩り";
      gt.Const.Strings.PerkName.LegendSpecialistClub <- "執行者";
      gt.Const.Strings.PerkName.LegendSpecialistRaider <- "頭蓋割り";
      gt.Const.Strings.PerkName.LegendSpecialistSpearfisher <- "鳥撃ち";
      gt.Const.Strings.PerkName.LegendSpecialistSharpshooter <- "狙撃手";
    }
    if (("Const" in gt) && ("Perks" in gt.Const)) {
      if (("PerkDefs" in gt.Const.Perks)) patchTable(gt.Const.Perks.PerkDefs);
      if (("PerkDefObjects" in gt.Const.Perks)) {
        foreach(p in gt.Const.Perks.PerkDefObjects) patchObj(p);
        try { if ((::Legends.Perk.LegendSpecialistButcher in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistButcher].Name = "屠殺人"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistBlacksmith in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBlacksmith].Name = "鉄砕き"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistPrisoner in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPrisoner].Name = "喉裂き"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistMilitia in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMilitia].Name = "ファランクス"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistBodyguard in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBodyguard].Name = "略奪者"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistMiner in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMiner].Name = "石砕き"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistFarmhand in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistFarmhand].Name = "大振り打撃"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistPoacher in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Name = "猟師"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistGravedigger in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistGravedigger].Name = "墓守"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistWoodsman in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistWoodsman].Name = "森人"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistHerbalist in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistHerbalist].Name = "収穫者"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistShepherd in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShepherd].Name = "散兵"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistCultist in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistCultist].Name = "拷問者"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistReaper in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistReaper].Name = "死神"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistSelfdefense in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSelfdefense].Name = "棒術"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistInventor in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInventor].Name = "爆撃手"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistInquisition in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInquisition].Name = "魔女狩り"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistClub in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistClub].Name = "執行者"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistRaider in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistRaider].Name = "頭蓋割り"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistSpearfisher in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSpearfisher].Name = "鳥撃ち"; } catch(e) {}
        try { if ((::Legends.Perk.LegendSpecialistSharpshooter in gt.Const.Perks.PerkDefObjects)) gt.Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSharpshooter].Name = "狙撃手"; } catch(e) {}
      }
    }
  } catch(e) {}
};
::mods_queue("mod_99_legends_complete_ja_v18_direct_bbf_repair", "mod_legends", _lcj_v18);
::mods_queue("mod_99_legends_complete_ja_v18_direct_bbf_repair", "mod_PoV", _lcj_v18);
::mods_queue("mod_99_legends_complete_ja_v18_direct_bbf_repair", "mod_bbforge", _lcj_v18);
_lcj_v18();
