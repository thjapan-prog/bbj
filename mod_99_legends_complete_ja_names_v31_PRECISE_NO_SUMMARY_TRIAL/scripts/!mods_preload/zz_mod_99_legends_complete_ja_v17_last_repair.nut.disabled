::mods_registerMod("mod_99_legends_complete_ja_v17_last_repair", 1.7, "Legends Complete Japanese Patch v17 Last Repair");
local _lcj_v17 = function() {
 local gt = this.getroottable();
 local map = {};
 map["Invictus"] <- "不屈の闘士";
 map["Fear of Nobles"] <- "貴族恐怖症";
 map["Hate for Nobles"] <- "貴族嫌い";
 map["Noble Killer"] <- "貴族殺し";
 map["Lumbering"] <- "鈍重";
 map["Charming"] <- "魅力的";
 map["Martial"] <- "武勇";
 map["Light"] <- "軽快";
 map["Cutthroat"] <- "喉裂き";
 map["Slaughterman"] <- "屠殺人";
 map["毒腺"] <- "毒腺";
 map["毒腺"] <- "毒腺";
 map["Hates Everything"] <- "万物嫌い";
 map["Gaisthasser"] <- "ガイスト嫌い";
 map["グリーンスキン嫌い"] <- "グリーンスキン嫌い";

 local patchSkill = function(o) {
   if (o == null) return;
   try { if (("m" in o) && ("Name" in o.m) && (o.m.Name in map)) o.m.Name = map[o.m.Name]; } catch(e) {}
   try { if (("m" in o) && ("Name" in o.m) && (typeof o.m.Name == "string")) {
       foreach(k,v in map) if (o.m.Name == k) o.m.Name = v;
   }} catch(e) {}
 };
 local patchTableStrings = function(t) { if (t == null || typeof t != "table") return; foreach(k,v in t) { if (typeof v == "string" && (v in map)) t[k] = map[v]; } };
 if (("Const" in gt) && ("Strings" in gt.Const)) {
   if (("TraitName" in gt.Const.Strings)) patchTableStrings(gt.Const.Strings.TraitName);
   if (("SkillName" in gt.Const.Strings)) patchTableStrings(gt.Const.Strings.SkillName);
   if (("PerkName" in gt.Const.Strings)) {
      foreach(k,v in map) if (!(k in gt.Const.Strings.PerkName)) {} // noop, keeps parser gentle
      patchTableStrings(gt.Const.Strings.PerkName);
      gt.Const.Strings.PerkName.LegendSpecialistPrisoner <- "喉裂き";
      gt.Const.Strings.PerkName.LegendSpecialistButcher <- "屠殺人";
   }
 }
 if (("Const" in gt) && ("Perks" in gt.Const)) {
   local patchPerk = function(p) { if (p == null || typeof p != "table") return; if (("Name" in p) && (p.Name in map)) p.Name = map[p.Name]; };
   if (("PerkDefObjects" in gt.Const.Perks)) foreach(p in gt.Const.Perks.PerkDefObjects) patchPerk(p);
   if (("PerkDefs" in gt.Const.Perks)) foreach(k,p in gt.Const.Perks.PerkDefs) patchPerk(p);
 }
};
::mods_queue("mod_99_legends_complete_ja_v17_last_repair", "mod_msu", _lcj_v17);
::mods_queue("mod_99_legends_complete_ja_v17_last_repair", "mod_legends", _lcj_v17);
::mods_queue("mod_99_legends_complete_ja_v17_last_repair", "mod_PoV", _lcj_v17);
_lcj_v17();
