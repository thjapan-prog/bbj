::mods_registerMod("mod_99_legends_complete_ja_v27_hotfix_queue_pov_names", 2.7, "Legends Complete Japanese Patch v27 HOTFIX Queue PoV Names");

local lcj_v26_set_perk_name = function(_key, _name) {
  local gt = this.getroottable();
  try { gt.Const.Strings.PerkName[_key] <- _name; } catch(e) {}
  try {
    if ((_key in gt.Const.Perks.PerkDefs) && (gt.Const.Perks.PerkDefs[_key] in gt.Const.Perks.PerkDefObjects)) {
      gt.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs[_key]].Name = _name;
    }
  } catch(e) {}
};

::mods_queue("mod_99_legends_complete_ja_v27_hotfix_queue_pov_names", "mod_nggh_magic_concept", function() {
  local setP = lcj_v26_set_perk_name;
  setP("NggHCharmEnemySpider", "魅了獣・蜘蛛類");
  setP("NggHCharmEnemyDirewolf", "魅了獣・肉食獣");
  setP("NggHCharmEnemyAlp", "魅了獣・アルプ");
  setP("NggHCharmEnemyGhoul", "魅了獣・グール");
  setP("NggHCharmEnemyUnhold", "魅了獣・ウンホルト");
  setP("NggHCharmEnemySchrat", "魅了獣・シュラート");
  setP("NggHCharmEnemyLindwurm", "魅了獣・リンドヴルム");
  setP("NggHCharmEnemyOrk", "捕虜の剛腕・オーク");
  setP("NggHCharmEnemyGoblin", "捕虜の策士・ゴブリン");
  setP("NggHCharmBasic", "魅了入門");
  setP("NggHCharmWords", "蠱惑の言葉");
  setP("NggHCharmAppearance", "妖艶な姿");
  setP("NggHCharmSpec", "魅了の極意");
  setP("NggHCharmNudist", "裸身主義");
  setP("NggHHexHexer", "呪詛師");
  setP("NggHHexMastery", "呪詛の極意");
  setP("NggHHexSharePain", "痛みの共有");
  setP("NggHHexSuffering", "苦痛の呪詛");
  setP("NggHHexWeakening", "弱体の呪詛");
  setP("NggHHexVulnerability", "脆弱の呪詛");
  setP("NggHHexMisfortune", "不運の呪詛");
  setP("NggH_BDSM_WhipLash", "鞭打ち");
  setP("NggH_BDSM_WhipMastery", "鞭の極意");
  setP("NggH_BDSM_MaskOn", "仮面装着");
  setP("NggH_BDSM_Bondage", "拘束遊戯");
  setP("NggH_BDSM_WhipPunish", "懲罰の鞭");
  setP("NggH_BDSM_WhipLove", "痛みは愛");
  setP("NggH_BDSM_DommyMommy", "支配者の風格");
  setP("NggHLuftPattingSpec", "撫で上手");
  setP("NggHLuftUnholyFruits", "背徳の果実");
  setP("NggHLuftInnocentLook", "無垢な顔");
  setP("NggHLuftGhoulBeauty", "グールの美貌");
});

::mods_queue("mod_99_legends_complete_ja_v27_hotfix_queue_pov_names", "mod_PoV", function() {
  local setP = lcj_v26_set_perk_name;
  setP("PovSignsOffense", "印術・攻撃");
  setP("PovSignsDefense", "印術・防御");
  setP("PovSignsControl", "印術・制御");
  setP("PovSignMastery", "印術の極意");
  setP("PovChampionSlayer", "王者殺し");
  setP("PovStabilizedMutations", "安定化変異");
  setP("LegendSpecialistButcher", "屠殺人");
  setP("LegendSpecialistBlacksmith", "鉄砕き");
  setP("LegendSpecialistPrisoner", "喉裂き");
  setP("LegendSpecialistMilitia", "密集陣");
  setP("LegendSpecialistBodyguard", "略奪者");
  setP("LegendSpecialistMiner", "石砕き");
  setP("LegendSpecialistFarmhand", "干草打ち");
  setP("LegendSpecialistPoacher", "猟師");
  setP("LegendSpecialistGravedigger", "死体番");
  setP("LegendSpecialistHerbalist", "収穫者");
  setP("LegendSpecialistShepherd", "散兵");
  setP("LegendSpecialistCultist", "責め苛む者");
  setP("LegendSpecialistReaper", "刈り手");
  setP("LegendSpecialistSelfdefense", "棒術");
  setP("LegendSpecialistInventor", "爆撃手");
  setP("LegendSpecialistInquisition", "魔女狩り");
  setP("LegendSpecialistClub", "執行人");
  setP("LegendSpecialistRaider", "頭蓋割り");
  setP("LegendSpecialistSpearfisher", "鳥猟師");
  setP("LegendSpecialistSharpshooter", "狙撃手");

  // PoV defines these in mod_PoV/!!config/perk_defs.nut; set both string table and perk objects.
  try { ::Const.Strings.PerkName.PovSignsOffense <- "印術・攻撃"; } catch(e) {}
  try { ::Const.Strings.PerkName.PovSignsDefense <- "印術・防御"; } catch(e) {}
  try { ::Const.Strings.PerkName.PovSignsControl <- "印術・制御"; } catch(e) {}
  try { ::Const.Strings.PerkName.PovSignMastery <- "印術の極意"; } catch(e) {}
  try { ::Const.Strings.PerkName.PovChampionSlayer <- "王者殺し"; } catch(e) {}
  try { ::Const.Strings.PerkName.PovStabilizedMutations <- "安定化変異"; } catch(e) {}
  try { ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsOffense].Name = "印術・攻撃"; } catch(e) {}
  try { ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsDefense].Name = "印術・防御"; } catch(e) {}
  try { ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsControl].Name = "印術・制御"; } catch(e) {}
  try { ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignMastery].Name = "印術の極意"; } catch(e) {}
  try { ::Const.Perks.PerkDefObjects[::Legends.Perk.PovChampionSlayer].Name = "王者殺し"; } catch(e) {}
  try { ::Const.Perks.PerkDefObjects[::Legends.Perk.PovStabilizedMutations].Name = "安定化変異"; } catch(e) {}
});

::mods_queue("mod_99_legends_complete_ja_v27_hotfix_queue_pov_names", "mod_dseForbiddenKnowledgeOrigin", function() {
  local setP = lcj_v26_set_perk_name;
  setP("ForbiddenKnowledgeNecroticScythe", "死霊の大鎌");
  setP("ForbiddenKnowledgeHemomancy", "血術");
});

::mods_queue("mod_99_legends_complete_ja_v27_hotfix_queue_pov_names", "mod_LuftVampiresOrigin", function() {
  local setP = lcj_v26_set_perk_name;
  setP("VampireAncientWisdom", "古の知恵");
  setP("VampireMaintenance", "武具整備");
  setP("VampireDarkflight", "闇飛び");
  setP("VampireVileWeaponry", "穢れた武器術");
  setP("VampireApexPredator", "頂点捕食者");
  setP("VampireDemoralise", "士気崩し");
});

