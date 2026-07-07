::mods_registerMod("mod_99_legends_complete_ja_unified_preload", 3.2, "Legends Complete JA Unified Preload");

// ============================================================
// SECTION 1: nameByID  (v16 source: clean PoV / FT skills)
// ============================================================
local _lcj_nameByID = {
    ["actives.pov_aard"] = "アードの印",
    ["actives.pov_axii"] = "アクスィーの印",
    ["actives.pov_beguile"] = "魅了",
    ["actives.pov_bront"] = "ブロントの印",
    ["actives.pov_coat_with_acid"] = "酸を塗布",
    ["actives.pov_coat_with_vattghern_poison"] = "ヴァットガーン毒油を使う",
    ["actives.pov_corpse_explosion"] = "死体爆破",
    ["actives.pov_darkflight"] = "闇の飛翔",
    ["actives.pov_dominant_bark"] = "支配の咆哮",
    ["actives.pov_donkey_kick"] = "強烈な蹴り",
    ["actives.pov_fire_handgonne"] = "火筒点火",
    ["actives.pov_ghastly_touch"] = "幽鬼の接触",
    ["actives.pov_glare"] = "睨み",
    ["actives.pov_gruesome_feast"] = "陰惨な饗宴",
    ["actives.pov_igni"] = "イグニの印",
    ["actives.pov_quen"] = "クエンの印",
    ["actives.pov_raise_banner"] = "旗を掲げろ！！",
    ["actives.pov_ranged_split_shield"] = "盾割り（遠隔）",
    ["actives.pov_serpent_hook"] = "蛇の鉤爪",
    ["actives.pov_silverslash"] = "銀の斬撃",
    ["actives.pov_thirdeye_skill"] = "第三の目",
    ["actives.pov_vomit"] = "嘔吐",
    ["actives.pov_whip_flail_skill"] = "鞭連撃",
    ["actives.pov_yrden"] = "イャーデンの印",
    ["actives.sb2_chokentoss_skill"] = "12-2. 怪力投げ（投げる）",
    ["actives.sb_acciattack_skill"] = "1. 偶発攻撃",
    ["actives.sb_acidbomb_skill"] = "2. 酸グレネード",
    ["actives.sb_backstab_skill"] = "3. バックスタブ",
    ["actives.sb_beartrap_skill"] = "4. ベアトラップ",
    ["actives.sb_bkcharge_skill"] = "5. 狂戦士の突撃",
    ["actives.sb_blackbomb_skill"] = "6. 黒魔術グレネード",
    ["actives.sb_blessing_skill"] = "7. 祝福",
    ["actives.sb_bloodletting_skill"] = "8. 瀉血療法",
    ["actives.sb_bloodlust_skill"] = "9. 血の渇望",
    ["actives.sb_bribe_skill"] = "10. 買収",
    ["actives.sb_cannon_skill"] = "11. 大砲斉射",
    ["actives.sb_chokentoss_skill"] = "12-1. 怪力投げ（目標指定）",
    ["actives.sb_command_skill"] = "13. 戦闘指揮",
    ["actives.sb_concent_skill"] = "14. 精神集中",
    ["actives.sb_cqcthrowing_skill"] = "15. 完全照準投擲",
    ["actives.sb_cure_skill"] = "16. 戦場治療",
    ["actives.sb_demon_skill"] = "17. 悪魔化",
    ["actives.sb_devablow_skill"] = "18. 壊滅打撃",
    ["actives.sb_drainblood_skill"] = "19. 吸血",
    ["actives.sb_earthquake_skill"] = "20. 地震",
    ["actives.sb_electric_skill"] = "21. 電撃",
    ["actives.sb_feast_skill"] = "22. 貪り食い",
    ["actives.sb_fireball_skill"] = "23. ファイアボール",
    ["actives.sb_firebomb_skill"] = "24. 地獄火グレネード",
    ["actives.sb_flamewave_skill"] = "25. 炎の波",
    ["actives.sb_flingback_skill"] = "26. 弾き飛ばし",
    ["actives.sb_fonature_skill"] = "27. 自然の力",
    ["actives.sb_frenzy_skill"] = "28. 邪悪な狂乱",
    ["actives.sb_frostblast_skill"] = "29. 凍結爆破",
    ["actives.sb_gale_skill"] = "30. 疾風怒濤",
    ["actives.sb_great_skill"] = "31. 大覚醒",
    ["actives.sb_headbutt_skill"] = "32. 頭突き",
    ["actives.sb_heal_skill"] = "33. 魔法治療",
    ["actives.sb_hide_skill"] = "34. 隠れる",
    ["actives.sb_holyspear_skill"] = "35. 聖槍",
    ["actives.sb_judo_skill"] = "36. 柔道投げ",
    ["actives.sb_kick_skill"] = "37. 蹴り",
    ["actives.sb_linebreaker_skill"] = "38. 戦線突破",
    ["actives.sb_lute_skill"] = "39. 魔法のリュート歌",
    ["actives.sb_manaforce_skill"] = "40. 雷嵐",
    ["actives.sb_march_skill"] = "41. 強行軍",
    ["actives.sb_mark_skill"] = "42. 標的指定",
    ["actives.sb_miracle_skill"] = "43. 奇跡",
    ["actives.sb_moneysteal_skill"] = "44. 窃盗",
    ["actives.sb_multishot_skill"] = "45. 連射",
    ["actives.sb_penshot_skill"] = "46. 貫通射撃",
    ["actives.sb_pincer_skill"] = "47. 挟撃突き",
    ["actives.sb_pull2_skill"] = "49. 深淵の掴み",
    ["actives.sb_pull_skill"] = "48. 念動爆発",
    ["actives.sb_puri_skill"] = "50. 浄化の炎",
    ["actives.sb_rain_skill"] = "51. 極端な天候",
    ["actives.sb_revel_skill"] = "52. 勇気鼓舞",
    ["actives.sb_rock_skill"] = "53. 岩石投げ",
    ["actives.sb_sand_skill"] = "54. 砂かけ",
    ["actives.sb_scream_skill"] = "55. バンシーの叫び",
    ["actives.sb_sguard_skill"] = "56. 盾の守護",
    ["actives.sb_shadowwalk_skill"] = "57. 影歩き",
    ["actives.sb_shieldbash_skill"] = "58. 盾打ち",
    ["actives.sb_shockwave_skill"] = "59. 衝撃波",
    ["actives.sb_slander_skill"] = "60. 呪詛",
    ["actives.sb_snake_skill"] = "61. 蛇縛り",
    ["actives.sb_snow_skill"] = "62. 諸刃",
    ["actives.sb_stormfury_skill"] = "63. 嵐の怒り",
    ["actives.sb_strike_skill"] = "64. 憤怒の一撃",
    ["actives.sb_sumfiend_skill"] = "65. 悪鬼召喚",
    ["actives.sb_sumskel_skill"] = "66. 死者蘇生",
    ["actives.sb_sumwolf_skill"] = "67. 霊狼召喚",
    ["actives.sb_swap_skill"] = "68. 強制入替",
    ["actives.sb_sweep_skill"] = "69. 組み付き",
    ["actives.sb_taichi_skill"] = "70. 太極武器術",
    ["actives.sb_tieup_skill"] = "71. 無音制圧",
    ["actives.sb_unlrage_skill"] = "72. 怒りの解放",
    ["actives.sb_warcrime_skill"] = "73. 戦争犯罪",
    ["actives.sb_warcry_skill"] = "74. 雄叫び",
    ["actives.sb_waterbomb_skill"] = "75. 洪水爆弾",
    ["actives.sb_whirlwind_skill"] = "76. 旋風攻撃",
    ["actives.sb_wolfride_skill"] = "77. 巨狼騎乗",
    ["actives.sb_zeroshot_skill"] = "78. 至近射撃",
    ["actives.sbp_agile_skill"] = "79. 機敏な殺し屋",
    ["actives.sbp_allrounder_skill"] = "80. 超越",
    ["actives.sbp_banner_skill"] = "81. 旗主",
    ["actives.sbp_battletrance_skill"] = "82. 戦闘恍惚",
    ["actives.sbp_beater_skill"] = "83. 復讐",
    ["actives.sbp_bondage_skill"] = "84. マナ熟達",
    ["actives.sbp_challenger_skill"] = "85. 挑戦者",
    ["actives.sbp_counter_skill"] = "86. 適応反撃",
    ["actives.sbp_desolator_skill"] = "87. 荒廃者",
    ["actives.sbp_drunk_skill"] = "88. 酔拳の達人",
    ["actives.sbp_goblin_skill"] = "89. ゴブリン武器学",
    ["actives.sbp_hardenskin_skill"] = "90. 皮膚硬化",
    ["actives.sbp_headcollector_skill"] = "91. 首狩り",
    ["actives.sbp_kensei_skill"] = "93. 剣聖",
    ["actives.sbp_laststand_skill"] = "94. 最後の抵抗",
    ["actives.sbp_lifestealer_skill"] = "95. 生命奪取者",
    ["actives.sbp_maso_skill"] = "96. 被虐嗜好",
    ["actives.sbp_oddball_skill"] = "97. 変わり者",
    ["actives.sbp_orc_skill"] = "98. オーク武器学",
    ["actives.sbp_outsider_skill"] = "99. アウトサイダー",
    ["actives.sbp_overwarmup_skill"] = "100. ウォームアップ",
    ["actives.sbp_prudence_skill"] = "101. 慎重さ",
    ["actives.sbp_rapid_skill"] = "102. 高速反射",
    ["actives.sbp_selfcare_skill"] = "103. 自己手当",
    ["actives.sbp_sharpshooter_skill"] = "104. 狙撃手",
    ["actives.sbp_skullsurgery_skill"] = "105. 頭蓋手術",
    ["actives.sbp_spear_skill"] = "106. 鋼の棘",
    ["actives.sbp_veteran_skill"] = "107. 歴戦兵",
    ["actives.sbq10p_bluff_skill"] = "117. 戦術的ブラフ",
    ["actives.sbq11_poking_skill"] = "118. 突きまくり",
    ["actives.sbq12_swipe_skill"] = "119. 霊撃薙ぎ",
    ["actives.sbq13p_rhythm_skill"] = "120. 戦闘リズム",
    ["actives.sbq1_propaganda_skill"] = "108. 宣伝工作",
    ["actives.sbq2p_honest_skill"] = "109. 正直な攻撃者",
    ["actives.sbq3p_shieldf_skill"] = "110. 信仰の盾",
    ["actives.sbq4_dragonkick_skill"] = "111. 龍牙蹴り",
    ["actives.sbq5_wrath_skill"] = "112. ダヴクルの憤怒",
    ["actives.sbq6_bigfire_skill"] = "113. アルマゲドン",
    ["actives.sbq7_bug_skill"] = "114. 虫の群れ",
    ["actives.sbq8_uproot_skill"] = "115. 根こそぎ",
    ["actives.sbq9_domi_skill"] = "116. 戦場支配",
    ["actives.vampire_darkflight"] = "闇の飛翔",
    ["effects.hex_master"] = "呪いの守護",
    ["effects.hex_slave"] = "呪い",
    ["effects.pov_acid_coat"] = "酸性血液を塗布した武器",
    ["effects.pov_adrenaline_rush"] = "アドレナリンラッシュ",
    ["effects.pov_alp_mutagen"] = "変異：アルプ",
    ["effects.pov_basilisk_mutagen"] = "変異：バシリスク",
    ["effects.pov_burning"] = "炎上！！",
    ["effects.pov_charm"] = "魅了",
    ["effects.pov_direwolf_mutagen"] = "変異：獣",
    ["effects.pov_direwolf_weak_mutagen"] = "獣の持久力",
    ["effects.pov_distracted"] = "目潰し砂",
    ["effects.pov_dog_mutagen"] = "変異：犬",
    ["effects.pov_donkey_mutagen"] = "変異：ロバ",
    ["effects.pov_enemy_vampire_day_effect"] = "弱体化した吸血鬼（昼）",
    ["effects.pov_enemy_vampire_night_effect"] = "渇いた吸血鬼（夜）",
    ["effects.pov_exhausted"] = "精神疲労",
    ["effects.pov_feasted"] = "満腹",
    ["effects.pov_ghost_mutagen"] = "変異：霊体",
    ["effects.pov_ghost_weak_mutagen"] = "霊体攻撃",
    ["effects.pov_ghoul_mutagen"] = "変異：ナハツェーラー",
    ["effects.pov_ghoul_weak_mutagen"] = "グールの飢え",
    ["effects.pov_goblin_mutagen"] = "変異：ゴブリン",
    ["effects.pov_hex"] = "魅了",
    ["effects.pov_hexe_curse_master"] = "呪いの守護",
    ["effects.pov_hexe_curse_slave"] = "呪い",
    ["effects.pov_hexe_mutagen"] = "変異：ヘクセ",
    ["effects.pov_learning_to_read"] = "読書学習中",
    ["effects.pov_lindwurm_mutagen"] = "変異：リンドヴルム",
    ["effects.pov_miasma"] = "瘴気雲",
    ["effects.pov_missing_hp_dmg_effect"] = "巨躯の怪力",
    ["effects.pov_mutant_poison"] = "変異体の毒！",
    ["effects.pov_near_ghost_hater"] = "ガイスト嫌いに鼓舞",
    ["effects.pov_necromancy_mutagen"] = "変異：屍術",
    ["effects.pov_non_vattghern_sword_effect"] = "扱えぬ担い手",
    ["effects.pov_orc_mutagen"] = "変異：オーク",
    ["effects.pov_orc_weak_mutagen"] = "オークの攻勢",
    ["effects.pov_paralyzed"] = "麻痺",
    ["effects.pov_quen"] = "クエンの盾",
    ["effects.pov_rot_mutagen"] = "変異：腐敗",
    ["effects.pov_rot_weak_mutagen"] = "腐敗のオーラ",
    ["effects.pov_sandgolem_mutagen"] = "変異：イフリート",
    ["effects.pov_schrat_mutagen"] = "変異：シュラート",
    ["effects.pov_schrat_no_shield"] = "盾なし！",
    ["effects.pov_schrat_weak_mutagen"] = "樹皮肌",
    ["effects.pov_serpent_mutagen"] = "変異：蛇",
    ["effects.pov_sign_cooldown"] = "印のクールダウン",
    ["effects.pov_skeleton_mutagen"] = "変異：不死",
    ["effects.pov_skeleton_weak_mutagen"] = "不死の呪い",
    ["effects.pov_spider_mutagen"] = "変異：蜘蛛",
    ["effects.pov_stench"] = "悪臭！",
    ["effects.pov_thirdeye_buff"] = "洞察上昇",
    ["effects.pov_unhold_mutagen"] = "変異：ウンホルト",
    ["effects.pov_vampire_day_effect"] = "吸血鬼：昼",
    ["effects.pov_vampire_mutagen"] = "変異：ネクロサヴァント",
    ["effects.pov_vampire_night_effect"] = "吸血鬼：夜！",
    ["effects.pov_vampire_weak_mutagen"] = "吸血性",
    ["effects.pov_vattghern_poison"] = "ヴァットガーン毒",
    ["effects.pov_vattghern_poison_coat"] = "ヴァットガーン毒を塗布した武器",
    ["effects.pov_vattghern_upgraded_poison"] = "強化ヴァットガーン毒",
    ["effects.pov_venom_mutagen"] = "変異：毒腺",
    ["effects.pov_weak_stench"] = "腐敗毒",
    ["effects.pov_yrden"] = "イャーデン拘束",
    ["effects.sb_unlrage_effect"] = "怒りの解放",
    ["injury.pov_sickness2"] = "変異の後遺症",
    ["special.pov_armor_changes_special"] = "防具保護",
    ["special.pov_rain"] = "過酷な天候",
    ["special.pov_scaling"] = "PoV敵スケーリング",
    ["spells.hex"] = "呪い",
    ["trait.pov_extremophile"] = "極限環境適応",
    ["trait.pov_fear_mutants"] = "変異体恐怖",
    ["trait.pov_hate_dogs"] = "犬嫌い",
    ["trait.pov_hate_everything"] = "万物嫌い",
    ["trait.pov_hate_ghosts"] = "ガイスト嫌い",
    ["trait.pov_hate_mutants"] = "変異体嫌い",
    ["trait.pov_misanthropist"] = "人間嫌い",
    ["trait.pov_monster_hunter"] = "怪物狩り",
    ["trait.pov_nyctophobia"] = "暗所恐怖症",
    ["trait.pov_oathsworn"] = "誓約者",
    ["trait.pov_old_vattghern"] = "老練なヴァットガーン",
    ["trait.pov_pluviophile"] = "雨好き",
    ["trait.pov_psychopath"] = "サイコパス",
    ["trait.pov_reader"] = "読書習得",
    ["trait.pov_seductive"] = "抗えぬ魅力",
    ["trait.pov_trailblazer"] = "先駆者",
    ["trait.pov_unstable_mutant"] = "不安定な変異体",
    ["weapon.pov_whip_mace"] = "鞭連撃",
};

// ============================================================
// SECTION 2: Trait / Skill name map
// (combined from v17/v18 names{} + v20/v21 M{})
// Applied to TraitName and SkillName tables (exact full-string match only).
// NOT applied to PerkDescription / Tooltip / Description.
// ============================================================
local _lcj_names = {
    ["Acid Coat"] = "酸塗り",
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
    ["Hexenjager"] = "魔女狩り",
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
    ["Vatt'ghern"] = "ヴァットガーン",
    ["Vattghern"] = "ヴァットガーン",
    ["Venom Mutagen"] = "変異：毒腺",
    ["Weak Stench"] = "薄い悪臭",
    ["Withering Aura"] = "衰弱のオーラ",
    ["Woodsman"] = "森人",
    ["Weapon coated with vattghern poison"] = "ヴァットゲルン毒を塗った武器",
    ["Reinforced Mutation: Alpha Beast"] = "強化変異：群れの長",
    ["Reinforced Mutation: Skin Ghoul"] = "強化変異：肉喰らいの皮膚",
    ["Weapon coated with acidic blood"] = "酸性血液を塗った武器",
    ["Reinforced Mutation: Direwolf"] = "強化変異：狼獣",
    ["Reinforced Mutation: Lindwurm"] = "強化変異：リンドヴルム",
    ["Reinforced Mutation: Schrat"] = "強化変異：シュラート",
    ["Reinforced Mutation: Spider"] = "強化変異：蜘蛛",
    ["Reinforced Mutation: Unhold"] = "強化変異：ウンホルト",
    ["Reinforced Mutation: Hexen"] = "強化変異：ヘクセン",
    ["Reinforced Mutation: Alp"] = "強化変異：アルプ",
    ["Thirsty Vampire (Night)"] = "飢えた吸血鬼（夜）",
    ["Vattghern Super Poison"] = "ヴァットゲルン猛毒",
    ["Weakened Vampire (Day)"] = "弱体化した吸血鬼（昼）",
    ["Mutation: Necrosavant"] = "変異：ネクロサヴァント",
    ["Mutation: Necromancy"] = "変異：死霊術",
    ["Sign Caster Cooldown"] = "印の再使用待ち",
    ["Hate for Greenskins"] = "グリーンスキン嫌い",
    ["120. Combat Rhythm (passive)"] = "120. 戦闘リズム（パッシブ）",
    ["120. Combat Rhythm"] = "120. 戦闘リズム",
    ["Fear of Greenskins"] = "グリーンスキン恐怖症",
    ["Mentally Exhausted"] = "精神疲労",
    ["Mutation: Basilisk"] = "変異：バジリスク",
    ["Protected by a Hex"] = "呪詛の守護",
    ["Beastly Endurance"] = "獣の持久力",
    ["Colossal Strength"] = "巨躯の怪力",
    ["Incapable Wielder"] = "扱えぬ担い手",
    ["Increased Insight"] = "洞察強化",
    ["Mutation: Serpent"] = "変異：大蛇",
    ["Mutation: Undeath"] = "変異：不死",
    ["Orcish Aggression"] = "オークの攻勢",
    ["Orcish Agression"] = "オークの攻勢",
    ["Serpent's Finesse"] = "大蛇の身のこなし",
    ["Alp's Resistance"] = "アルプの耐性",
    ["Basilisk's Focus"] = "バジリスクの集中",
    ["Curse Of Undeath"] = "不死の呪い",
    ["Ethereal Attacks"] = "霊体攻撃",
    ["Etherial Attacks"] = "霊体攻撃",
    ["Goblin's Cunning"] = "ゴブリンの悪知恵",
    ["Learning to Read"] = "読み書き学習中",
    ["Mutation: Donkey"] = "変異：ロバ",
    ["Mutation: Goblin"] = "変異：ゴブリン",
    ["Mutation: Schrat"] = "変異：シュラート",
    ["Mutation: Spider"] = "変異：蜘蛛",
    ["Mutation: Spirit"] = "変異：霊体",
    ["Mutation: Unhold"] = "変異：ウンホルト",
    ["Sand in the Eyes"] = "目潰しの砂",
    ["Spider's Glands"] = "蜘蛛の腺",
    ["Trapped By Yrden"] = "イャーデンの罠",
    ["Vattghern Poison"] = "ヴァットゲルン毒",
    ["58. Shield Bash"] = "58. 盾打撃",
    ["Adrenaline Rush"] = "アドレナリンラッシュ",
    ["Ghoulish Hunger"] = "肉喰らいの飢え",
    ["Hate for Beasts"] = "獣嫌い",
    ["Hate for Undead"] = "アンデッド嫌い",
    ["Mutation: Beast"] = "変異：獣",
    ["Mutation: Hexen"] = "変異：ヘクセン",
    ["Mutation: Ifrit"] = "変異：イフリート",
    ["Mutation: Venom"] = "変異：毒腺",
    ["Poisoned by Rot"] = "腐敗毒",
    ["Unhold's Vigor"] = "ウンホルトの活力",
    ["Vampire: Night!"] = "吸血鬼：夜！",
    ["Fear of Beasts"] = "獣恐怖症",
    ["Fear of Undead"] = "アンデッド恐怖症",
    ["Mutant Poison!"] = "変異毒！",
    ["Mutation: Wurm"] = "変異：リンドヴルム",
    ["Pack Mentality"] = "群れの本能",
    ["Combat Rhythm"] = "戦闘リズム",
    ["Mutation: Alp"] = "変異：アルプ",
    ["Mutation: Dog"] = "変異：犬",
    ["Mutation: Orc"] = "変異：オーク",
    ["Mutation: Rot"] = "変異：腐敗",
    ["Short Sighted"] = "近眼",
    ["Bloodthirsty"] = "血に飢えた",
    ["Fainthearted"] = "気弱",
    ["Foul Stench!"] = "悪臭！",
    ["Miasma Cloud"] = "瘴気雲",
    ["Vampire: Day"] = "吸血鬼：昼",
    ["Venom Glands"] = "毒腺",
    ["Aura of Rot"] = "腐敗のオーラ",
    ["Night Blind"] = "夜盲症",
    ["Quen Shield"] = "クエンの盾",
    ["Shield Bash"] = "盾打撃",
    ["Team Player"] = "チームプレイヤー",
    ["Venom Gland"] = "毒腺",
    ["Clubfooted"] = "内反足",
    ["Determined"] = "意志堅固",
    ["Eagle Eyes"] = "鷹の目",
    ["Gluttonous"] = "大食い",
    ["Iron Lungs"] = "鉄の肺",
    ["Irrational"] = "非合理",
    ["No Shield!"] = "盾なし！",
    ["Asthmatic"] = "喘息持ち",
    ["Burning!!"] = "炎上！！",
    ["Deathwish"] = "死にたがり",
    ["Dexterous"] = "器用",
    ["Impatient"] = "せっかち",
    ["Lone Wolf"] = "一匹狼",
    ["Paralyzed"] = "麻痺",
    ["Pessimist"] = "悲観的",
    ["Vampirism"] = "吸血性",
    ["Barkskin"] = "樹皮の肌",
    ["Beguiled"] = "魅了",
    ["Drunkard"] = "酒浸り",
    ["Fearless"] = "恐れ知らず",
    ["Hesitant"] = "躊躇いがち",
    ["Optimist"] = "楽観的",
    ["Paranoid"] = "偏執的",
    ["Survivor"] = "生存者",
    ["Dastard"] = "臆病者",
    ["Feasted"] = "飽食",
    ["Unlucky"] = "不運",
    ["Bright"] = "聡明",
    ["Clumsy"] = "不器用",
    ["Craven"] = "腰抜け",
    ["Greedy"] = "強欲",
    ["Strong"] = "強健",
    ["Brave"] = "勇敢",
    ["Cocky"] = "うぬぼれ屋",
    ["Lucky"] = "幸運",
    ["Quick"] = "俊敏",
    ["Tough"] = "頑丈",
    ["Dumb"] = "鈍才",
    ["Huge"] = "巨体",
    ["Tiny"] = "小柄",
    ["Fat"] = "肥満",
    ["Hex"] = "呪い",
    // BBForge UI category and creature names (v21)
    ["Weapons"] = "武器",
    ["Defense"] = "防御",
    ["Traits"] = "特性",
    ["Enemy"] = "敵",
    ["Magic"] = "魔法",
    ["Class"] = "クラス",
    ["Other"] = "その他",
    ["Background"] = "背景",
    ["Leftovers"] = "その他",
    ["Beast"] = "獣",
    ["SERPENT"] = "大蛇",
    ["Serpent"] = "大蛇",
    ["GHOUL"] = "グール",
    ["Ghoul"] = "グール",
    ["MISC"] = "その他",
    ["Misc"] = "その他",
    ["BEAST OF BEASTS"] = "獣の中の獣",
    ["???"] = "未分類",
    ["MOUNTING"] = "騎乗",
    ["Mounting"] = "騎乗",
    ["LINDWURM"] = "リンドヴルム",
    ["Lindwurm"] = "リンドヴルム",
    ["DEMONOLOGY"] = "悪魔学",
    ["Demonology"] = "悪魔学",
    ["ALP"] = "アルプ",
    ["Alp"] = "アルプ",
    ["CANINE"] = "犬科",
    ["Canine"] = "犬科",
    ["ARACHNID"] = "蜘蛛類",
    ["Arachnid"] = "蜘蛛類",
    ["UNHOLD"] = "ウンホルト",
    ["Unhold"] = "ウンホルト",
    ["SCHRAT"] = "シュラート",
    ["Schrat"] = "シュラート",
    ["Wolf"] = "狼",
    ["Direwolf"] = "狼獣",
    ["Hyena"] = "ハイエナ",
    ["Bear"] = "熊",
    ["Boar"] = "猪",
    ["Spider"] = "蜘蛛",
    ["Spider Eggs*"] = "蜘蛛の卵*",
    ["Nature"] = "自然",
    ["Basilisk"] = "バジリスク",
    ["Golem"] = "ゴーレム",
    ["Kraken"] = "クラーケン",
    ["Kraken*"] = "クラーケン*",
    ["Vampire"] = "吸血鬼",
    ["Hexe"] = "ヘクセ",
    ["Ghost*"] = "幽霊*",
    ["Ghost"] = "幽霊",
    ["Orc"] = "オーク",
    ["Goblin"] = "ゴブリン",
    ["Undead"] = "アンデッド",
    ["Human"] = "人間",
    ["Loyal"] = "忠義者",
    ["Athletic"] = "運動神経抜群",
    ["Night Owl"] = "夜型",
    ["Spartan"] = "質素",
    ["Sure Footing"] = "足腰安定",
    ["Weasel"] = "こそこそ屋",
    ["Superstitious"] = "迷信深い",
    ["Insecure"] = "自信なし",
    ["Bleeder"] = "出血しやすい",
    ["Fragile"] = "脆弱",
    ["Ailing"] = "病弱",
    ["Addict"] = "中毒者",
    ["Arena Fighter"] = "闘技場戦士",
    ["Arena Veteran"] = "闘技場古参兵",
    ["Pit Fighter"] = "闘技場の闘士",
    ["Old"] = "老齢",
    ["Player Character"] = "主人公",
    ["Oath of Camaraderie"] = "誓約：戦友愛",
    ["Oath of Distinction"] = "誓約：卓越",
    ["Oath of Endurance"] = "誓約：忍耐",
    ["Oath of Fortification"] = "誓約：堅牢",
    ["Oath of Honor"] = "誓約：名誉",
    ["Oath of Humility"] = "誓約：謙遜",
    ["Oath of Righteousness"] = "誓約：義憤",
    ["Oath of Sacrifice"] = "誓約：犠牲",
    ["Oath of Valor"] = "誓約：勇気",
    ["Oath of Vengeance"] = "誓約：復讐",
    ["Oath of Wrath"] = "誓約：憤怒",
    ["Missing Ear"] = "耳欠損",
    ["Missing Eye"] = "片目欠損",
    ["Missing Finger"] = "指欠損",
    ["Missing Hand"] = "手欠損",
    ["Missing Nose"] = "鼻欠損",
    ["Brain Damage"] = "脳損傷",
    ["Collapsed Lung"] = "肺虚脱",
    ["Weakened Heart"] = "心臓衰弱",
    ["Broken Elbow Joint"] = "肘関節損傷",
    ["Broken Knee"] = "膝損傷",
    ["Traumatized"] = "心的外傷",
    ["Maimed Foot"] = "足の損傷",
    ["Maimed Hand"] = "手の損傷",
    ["Pierced Chest"] = "胸部刺創",
    ["Pierced Side"] = "脇腹刺創",
    ["Horrible Scars"] = "ひどい傷跡",
    ["Sickness"] = "病気",
    ["Character Traits"] = "キャラクター特性",
    ["Permanent Injuries"] = "永続負傷",
    ["Unstable Traits"] = "不安定な特性",
    ["Active Effects"] = "有効な効果",
    ["Unstable Skills"] = "不安定なスキル",
};

// ============================================================
// SECTION 3: Apply trait/skill names and nameByID  (non-description)
// ============================================================
local _lcj_apply_names = function() {
    local gt = this.getroottable();
    local repFn = function(tab) {
        if (tab == null || typeof tab != "table") return;
        foreach(k, v in tab) {
            if (typeof v == "string" && (v in _lcj_names)) tab[k] = _lcj_names[v];
        }
    };
    try {
        if ("Const" in gt && "Strings" in gt.Const) {
            if ("TraitName" in gt.Const.Strings) repFn(gt.Const.Strings.TraitName);
            if ("SkillName" in gt.Const.Strings) repFn(gt.Const.Strings.SkillName);
        }
    } catch(e) {}
    // Patch skill/effect objects by ID
    try {
        if ("Const" in gt && "Perks" in gt.Const && "PerkDefObjects" in gt.Const.Perks) {
            foreach(p in gt.Const.Perks.PerkDefObjects) {
                if (p != null && "ID" in p && (p.ID in _lcj_nameByID)) {
                    p.Name = _lcj_nameByID[p.ID];
                }
            }
        }
    } catch(e) {}
};

// ============================================================
// SECTION 4: Apply perk names by key
// (v9 perkNameByKey as base; v18 values override specialist perks)
// ============================================================
local _lcj_apply_perk_names = function() {
    local gt = this.getroottable();
    if (!("Const" in gt) || !("Strings" in gt.Const) || !("PerkName" in gt.Const.Strings)) return;
    local P = gt.Const.Strings.PerkName;
    // --- vanilla BB perks (v9) ---
    P["Adrenaline"] <- "アドレナリン";
    P["Anticipation"] <- "予測";
    P["AxeMastery"] <- "斧術熟達";
    P["Backstabber"] <- "背面攻撃";
    P["BagsAndBelts"] <- "バッグとベルト";
    P["BatteringRam"] <- "破城槌";
    P["BattleFlow"] <- "戦闘の流れ";
    P["BattleForged"] <- "戦鍛え";
    P["Berserk"] <- "狂戦士";
    P["BowMastery"] <- "弓術熟達";
    P["Brawny"] <- "筋骨隆々";
    P["Bullseye"] <- "ブルズアイ";
    P["CleaverMastery"] <- "鉈術熟達";
    P["Colossus"] <- "巨人";
    P["CripplingStrikes"] <- "重傷攻撃";
    P["CrossbowMastery"] <- "弩術熟達";
    P["DaggerMastery"] <- "短剣術熟達";
    P["Dodge"] <- "回避";
    P["Duelist"] <- "決闘者";
    P["Executioner"] <- "処刑人";
    P["FastAdaptation"] <- "高速適応";
    P["Fearsome"] <- "恐怖を誘う";
    P["FlailMastery"] <- "フレイル術熟達";
    P["Footwork"] <- "足さばき";
    P["FortifiedMind"] <- "鋼の精神";
    P["Gifted"] <- "才能";
    P["HammerMastery"] <- "槌術熟達";
    P["HeadHunter"] <- "首狩り";
    P["HoldOut"] <- "持ちこたえる";
    P["Indomitable"] <- "不屈の構え";
    P["KillingFrenzy"] <- "殺戮の狂乱";
    P["LoneWolf"] <- "一匹狼";
    P["MaceMastery"] <- "メイス術熟達";
    P["Nimble"] <- "身軽";
    P["NineLives"] <- "九死に一生";
    P["Overwhelm"] <- "圧倒";
    P["Pathfinder"] <- "先駆者";
    P["PolearmMastery"] <- "長柄武器熟達";
    P["QuickHands"] <- "早業";
    P["RallyTheTroops"] <- "部隊鼓舞";
    P["ReachAdvantage"] <- "リーチの優位";
    P["Recover"] <- "回復";
    P["Relentless"] <- "執念";
    P["Resilient"] <- "強靭";
    P["Rotation"] <- "ローテーション";
    P["ShieldExpert"] <- "盾の達人";
    P["SpearMastery"] <- "槍術熟達";
    P["SteelBrow"] <- "鋼の額";
    P["Student"] <- "学生";
    P["SwordMastery"] <- "剣術熟達";
    P["Taunt"] <- "挑発";
    P["ThrowingMastery"] <- "投擲熟達";
    P["Underdog"] <- "劣勢知らず";
    // --- Legends perks (v9) ---
    P["LegendAdaptive"] <- "適応力";
    P["LegendAlbedo"] <- "白化";
    P["LegendAlcoholBrewing"] <- "醸造";
    P["LegendAlert"] <- "警戒";
    P["LegendAmbidextrous"] <- "両利き";
    P["LegendAmmoBinding"] <- "弾薬束ね";
    P["LegendAmmoBundles"] <- "弾薬束";
    P["LegendAnchor"] <- "踏ん張り";
    P["LegendAssassinate"] <- "暗殺";
    P["LegendAssuredConquest"] <- "確かな征服";
    P["LegendAthlete"] <- "運動能力";
    P["LegendBackflip"] <- "後方宙返り";
    P["LegendBackswing"] <- "返し打ち";
    P["LegendBackToBasics"] <- "基本回帰";
    P["LegendBalance"] <- "平衡感覚";
    P["LegendBallistics"] <- "弾道学";
    P["LegendBarrage"] <- "弾幕";
    P["LegendBarterConvincing"] <- "説得交渉";
    P["LegendBarterGreed"] <- "強欲";
    P["LegendBarterTrustworthy"] <- "信用できる態度";
    P["LegendBattleheart"] <- "戦心";
    P["LegendBearform"] <- "熊形態";
    P["LegendBecomeBerserker"] <- "狂戦士化";
    P["LegendBerserkerRage"] <- "狂戦士の怒り";
    P["LegendBetweenTheEyes"] <- "眉間撃ち";
    P["LegendBigGameHunter"] <- "大物狩り";
    P["LegendBlendIn"] <- "溶け込み";
    P["LegendBloodbath"] <- "血の海";
    P["LegendBloodyHarvest"] <- "血の収穫";
    P["LegendBoneBreaker"] <- "骨砕き";
    P["LegendBoondockBlade"] <- "辺境の刃";
    P["LegendBribe"] <- "賄賂";
    P["LegendBrinkOfDeath"] <- "死の淵";
    P["LegendBruiser"] <- "荒くれ者";
    P["LegendCallLightning"] <- "雷招き";
    P["LegendCampCook"] <- "野営料理";
    P["LegendCarnage"] <- "大殺戮";
    P["LegendChainLightning"] <- "連鎖雷撃";
    P["LegendChanneledPower"] <- "導かれし力";
    P["LegendCheerOn"] <- "声援";
    P["LegendCitrinitas"] <- "黄化（トランス）";
    P["LegendClarity"] <- "明晰";
    P["LegendClimb"] <- "登攀";
    P["LegendComposure"] <- "平静";
    P["LegendConservation"] <- "温存";
    P["LegendControlInstincts"] <- "本能制御";
    P["LegendCoordinatedVolleys"] <- "統制斉射";
    P["LegendCrusher"] <- "粉砕者";
    P["LegendDangerPay"] <- "危険手当";
    P["LegendDarkflight"] <- "闇飛翔";
    P["LegendDaze"] <- "朦朧化";
    P["LegendDeathtouch"] <- "死の接触";
    P["LegendDebilitate"] <- "弱体化";
    P["LegendDeflect"] <- "受け流し";
    P["LegendDistantVisions"] <- "遠き幻視";
    P["LegendDogBreeder"] <- "犬の繁殖家";
    P["LegendDogHandling"] <- "犬扱い";
    P["LegendDogMaster"] <- "犬使いの達人";
    P["LegendDogWhisperer"] <- "犬の調教師";
    P["LegendDoubleStrike"] <- "二連撃";
    P["LegendDrumsOfLife"] <- "生命の歌";
    P["LegendDrumsOfWar"] <- "戦歌";
    P["LegendEfficientPacking"] <- "効率梱包";
    P["LegendEnthrall"] <- "魅了";
    P["LegendEntice"] <- "誘惑";
    P["LegendEscapeArtist"] <- "脱出名人";
    P["LegendEvasion"] <- "回避術";
    P["LegendExtendendAura"] <- "拡張オーラ";
    P["LegendFashionable"] <- "洒落者";
    P["LegendFavouredEnemyBeast"] <- "得意敵：獣";
    P["LegendFavouredEnemyCivilization"] <- "得意敵：文明圏";
    P["LegendFavouredEnemyGreenskin"] <- "得意敵：グリーンスキン";
    P["LegendFavouredEnemyOccult"] <- "得意敵：オカルト";
    P["LegendFavouredEnemyOutlaw"] <- "得意敵：無法者";
    P["LegendFavouredEnemySwordmaster"] <- "得意敵：剣聖";
    P["LegendFavouredEnemyUndead"] <- "得意敵：アンデッド";
    P["LegendFeint"] <- "フェイント";
    P["LegendFieldRepairs"] <- "野戦修理";
    P["LegendFieldTreats"] <- "野戦手当";
    P["LegendFieldTriage"] <- "野戦救護";
    P["LegendFirefield"] <- "火炎地帯";
    P["LegendFirstBlood"] <- "先制の血";
    P["LegendForcefulSwing"] <- "力任せの一振り";
    P["LegendForwardPush"] <- "前進圧力";
    P["LegendFreedomOfMovement"] <- "自由な動き";
    P["LegendGatherer"] <- "採集者";
    P["LegendGrappler"] <- "組み討ち師";
    P["LegendGruesomeFeast"] <- "凄惨な饗宴";
    P["LegendGuideSteps"] <- "歩み導き";
    P["LegendHairSplitter"] <- "髪裂き";
    P["LegendHeightenedReflexes"] <- "強化反射";
    P["LegendHelpful"] <- "世話焼き";
    P["LegendHerbcraft"] <- "薬草術";
    P["LegendHex"] <- "呪詛";
    P["LegendHidden"] <- "迷彩";
    P["LegendHimshaw"] <- "ヒムショウ";
    P["LegendHippology"] <- "馬学";
    P["LegendHoldTheLine"] <- "戦列維持";
    P["LegendHolyFlame"] <- "聖なる炎";
    P["LegendHorrify"] <- "恐怖化";
    P["LegendHorseBitting"] <- "噛みつき";
    P["LegendHorseCharge"] <- "騎乗突撃";
    P["LegendHorseCollection"] <- "収縮";
    P["LegendHorseDesensitization"] <- "鈍感化";
    P["LegendHorseFlyingChange"] <- "空中踏歩変換";
    P["LegendHorseImpulsion"] <- "推進";
    P["LegendHorseLeadChange"] <- "手前変換";
    P["LegendHorseLegControl"] <- "脚制御";
    P["LegendHorseLiberty"] <- "自由運動";
    P["LegendHorseLongeing"] <- "調馬索";
    P["LegendHorseMovement"] <- "馬術機動";
    P["LegendHorseParthianShot"] <- "パルティアンショット";
    P["LegendHorsePassage"] <- "パッサージュ";
    P["LegendHorsePiaffe"] <- "ピアッフェ";
    P["LegendHorsePirouette"] <- "ピルエット";
    P["LegendHorseTempiChange"] <- "踏歩変換";
    P["LegendImmovableObject"] <- "不動の盾";
    P["LegendIncoming"] <- "飛来物！";
    P["LegendInfectiousRage"] <- "伝染する怒り";
    P["LegendInsects"] <- "虫の群れ";
    P["LegendInspire"] <- "鼓舞";
    P["LegendInTheZone"] <- "ゾーン突入";
    P["LegendInventorAnatomy"] <- "解剖学研究";
    P["LegendIronside"] <- "鉄壁";
    P["LegendKeenEyesight"] <- "鋭い視力";
    P["LegendLacerate"] <- "切り裂き";
    P["LegendLastStand"] <- "最後の抵抗";
    P["LegendLeap"] <- "跳躍";
    P["LegendLevitate"] <- "浮遊";
    P["LegendLionheart"] <- "獅子心";
    P["LegendLithe"] <- "しなやか";
    P["LegendLookout"] <- "見張り";
    P["LegendLurker"] <- "潜伏者";
    P["LegendMagicBurningHands"] <- "燃える手";
    P["LegendMagicChainLightning"] <- "連鎖雷撃";
    P["LegendMagicCircleOfProtection"] <- "防護円";
    P["LegendMagicDaze"] <- "朦朧化";
    P["LegendMagicHailstone"] <- "雹石";
    P["LegendMagicHealingWind"] <- "癒しの風";
    P["LegendMagicImbue"] <- "付与";
    P["LegendMagicLevitate"] <- "浮遊";
    P["LegendMagicMissile"] <- "魔法の矢";
    P["LegendMagicMissileFocus"] <- "魔法の矢集中";
    P["LegendMagicMissileMastery"] <- "魔法の矢熟達";
    P["LegendMagicPsybeam"] <- "精神光線";
    P["LegendMagicSleep"] <- "睡眠";
    P["LegendMagicSoothingWind"] <- "鎮静の風";
    P["LegendMagicTeleport"] <- "瞬間移動";
    P["LegendMagicWebBolt"] <- "蜘蛛糸弾";
    P["LegendMarkTarget"] <- "標的指定";
    P["LegendMasterAnger"] <- "怒りの制御";
    P["LegendMasterTrainer"] <- "熟練訓練士";
    P["LegendMasteryBurningHands"] <- "猛き炎";
    P["LegendMasteryChainLightning"] <- "極性化";
    P["LegendMasteryHailstone"] <- "高密度氷";
    P["LegendMasteryMusic"] <- "音楽熟達";
    P["LegendMasteryNets"] <- "網熟達";
    P["LegendMasterySlings"] <- "投石紐熟達";
    P["LegendMasteryStaves"] <- "魔法杖熟達";
    P["LegendMealPreperation"] <- "食事準備";
    P["LegendMedIngredients"] <- "薬材";
    P["LegendMedPackages"] <- "医療包み";
    P["LegendMeistersanger"] <- "マイスターゼンガー";
    P["LegendMiasma"] <- "瘴気";
    P["LegendMindOverBody"] <- "精神は肉体を超える";
    P["LegendMinnesanger"] <- "ミンネゼンガー";
    P["LegendMuscularity"] <- "筋骨隆々";
    P["LegendNetCasting"] <- "投網術";
    P["LegendNetRepair"] <- "網修理";
    P["LegendNightRaider"] <- "夜襲者";
    P["LegendNightvision"] <- "夜目";
    P["LegendNigredo"] <- "黒化";
    P["LegendOffBookDeal"] <- "裏取引";
    P["LegendOnslaught"] <- "猛攻";
    P["LegendOpportunist"] <- "機会主義者";
    P["LegendOreHunter"] <- "鉱石探し";
    P["LegendPacifist"] <- "平和主義者";
    P["LegendPackleader"] <- "群れの長";
    P["LegendPatientHunter"] <- "忍耐の狩人";
    P["LegendPaymaster"] <- "給金係";
    P["LegendPeaceful"] <- "平和主義的";
    P["LegendPerfectFit"] <- "完璧な適合";
    P["LegendPerfectFocus"] <- "完全集中";
    P["LegendPointBlank"] <- "至近射撃";
    P["LegendPoisonImmunity"] <- "毒無効";
    P["LegendPossession"] <- "憑依";
    P["LegendPossessUndead"] <- "アンデッド憑依";
    P["LegendPotionBrewer"] <- "調薬師";
    P["LegendPrayerOfFaith"] <- "信仰の祈り";
    P["LegendPrayerOfLife"] <- "希望の祈り";
    P["LegendPrepareBleed"] <- "失血処置";
    P["LegendPrepared"] <- "準備万端";
    P["LegendPreparedForAnything"] <- "万事に備える";
    P["LegendPrepareGraze"] <- "内臓裂き";
    P["LegendPromisedPotential"] <- "約束された素質";
    P["LegendPugilist"] <- "拳闘士";
    P["LegendPummelIntoSubmission"] <- "叩き伏せ";
    P["LegendPush"] <- "反発";
    P["LegendPushTheAdvantage"] <- "優勢を押し広げる";
    P["LegendQuartermaster"] <- "補給係";
    P["LegendQuickStep"] <- "軽快な足取り";
    P["LegendRaiseUndead"] <- "死者蘇生";
    P["LegendReadOmensTrance"] <- "兆し読み（トランス）";
    P["LegendRebound"] <- "反動";
    P["LegendReclamation"] <- "再生利用";
    P["LegendRecuperation"] <- "回復力";
    P["LegendRelax"] <- "息抜き";
    P["LegendResurrectionist"] <- "蘇生術師";
    P["LegendReturnFavor"] <- "仕返し";
    P["LegendRoots"] <- "根縛り";
    P["LegendRust"] <- "錆びつき";
    P["LegendScholar"] <- "学者";
    P["LegendScrollIngredients"] <- "解釈";
    P["LegendScry"] <- "遠見";
    P["LegendScryTrance"] <- "遠見領域（トランス）";
    P["LegendSecondWind"] <- "第二の息吹";
    P["LegendShieldsUp"] <- "盾を上げろ！";
    P["LegendSiphon"] <- "吸い上げ";
    P["LegendSkillfulStacking"] <- "巧みな積載";
    P["LegendSlaughterer"] <- "屠殺者";
    P["LegendSleep"] <- "睡眠";
    P["LegendSleightOfHand"] <- "手品師の手さばき";
    P["LegendSmackdown"] <- "叩き落とし";
    P["LegendSmashingShields"] <- "盾砕き";
    P["LegendSpawnSkeletonHigh"] <- "骸骨再構築";
    P["LegendSpawnSkeletonLow"] <- "骨組み";
    P["LegendSpawnSkeletonMed"] <- "関節整列";
    P["LegendSpawnZombieHigh"] <- "人造再生";
    P["LegendSpawnZombieLow"] <- "腐肉形成";
    P["LegendSpawnZombieMed"] <- "肉体形成";
    P["LegendSpecBandage"] <- "包帯熟達";
    P["LegendSpecCultArmor"] <- "苦行";
    P["LegendSpecCultHood"] <- "献身";
    P["LegendSpecDualWield"] <- "二刀流熟達";
    // Specialist perks — v18 values take priority over v9
    P["LegendSpecialistBlacksmith"] <- "鉄砕き";
    P["LegendSpecialistBodyguard"] <- "略奪者";
    P["LegendSpecialistButcher"] <- "屠殺人";
    P["LegendSpecialistClub"] <- "執行者";
    P["LegendSpecialistCultist"] <- "拷問者";
    P["LegendSpecialistFarmhand"] <- "大振り打撃";
    P["LegendSpecialistGravedigger"] <- "墓守";
    P["LegendSpecialistHerbalist"] <- "収穫者";
    P["LegendSpecialistInquisition"] <- "魔女狩り";
    P["LegendSpecialistInventor"] <- "爆撃手";
    P["LegendSpecialistMilitia"] <- "ファランクス";
    P["LegendSpecialistMiner"] <- "石砕き";
    P["LegendSpecialistMusician"] <- "魅惑の歌";
    P["LegendSpecialistPoacher"] <- "猟師";
    P["LegendSpecialistPrisoner"] <- "喉裂き";
    P["LegendSpecialistRaider"] <- "頭蓋割り";
    P["LegendSpecialistReaper"] <- "死神";
    P["LegendSpecialistSelfdefense"] <- "棒術";
    P["LegendSpecialistSharpshooter"] <- "狙撃手";
    P["LegendSpecialistShepherd"] <- "散兵";
    P["LegendSpecialistShieldPush"] <- "押し込め";
    P["LegendSpecialistShieldSkill"] <- "生まれつきの盾使い";
    P["LegendSpecialistSpearfisher"] <- "鳥撃ち";
    P["LegendSpecialistWoodsman"] <- "森人";
    P["LegendSpecPoison"] <- "毒物熟達";
    P["LegendSpecSpearWall"] <- "槍壁使い";
    P["LegendSpecStaffStun"] <- "杖回し";
    P["LegendSpecUnarmed"] <- "徒手熟達";
    P["LegendSprint"] <- "疾走";
    P["LegendStaffBlock"] <- "杖受け";
    P["LegendStrengthInNumbers"] <- "数の力";
    P["LegendStrictSermons"] <- "厳格な説教";
    P["LegendStun"] <- "気絶";
    P["LegendSummonBear"] <- "熊馴らし";
    P["LegendSummonCat"] <- "使い魔召喚";
    P["LegendSummonCatapult"] <- "投石機召喚";
    P["LegendSummonFalcon"] <- "隼召喚";
    P["LegendSummonHound"] <- "猟犬召喚";
    P["LegendSummonStorm"] <- "嵐召喚";
    P["LegendSummonWolf"] <- "狼召喚";
    P["LegendSurpressUrges"] <- "衝動抑制";
    P["LegendSwagger"] <- "威風";
    P["LegendTacticalManeuvers"] <- "戦術機動";
    P["LegendTasteThePain"] <- "痛みを味わえ";
    P["LegendTeacher"] <- "教師";
    P["LegendTeleport"] <- "瞬間移動";
    P["LegendTerrifyingVisage"] <- "恐るべき相貌";
    P["LegendThrowSand"] <- "砂かけ";
    P["LegendThrustMaster"] <- "刺突の達人";
    P["LegendToolsDrawers"] <- "工具引き出し";
    P["LegendToolsSpares"] <- "予備部品";
    P["LegendTrueBeliever"] <- "真の信者";
    P["LegendTrueForm"] <- "真の姿";
    P["LegendTumble"] <- "転がり";
    P["LegendTwirl"] <- "回転";
    P["LegendUberNimble"] <- "裸一貫";
    P["LegendUntouchable"] <- "不可触";
    P["LegendValaChantDisharmony"] <- "不協和（詠唱）";
    P["LegendValaChantFury"] <- "憤怒（詠唱）";
    P["LegendValaChantMastery"] <- "詠唱熟達";
    P["LegendValaChantSenses"] <- "感覚強化（詠唱）";
    P["LegendValaPremonition"] <- "予兆";
    P["LegendValaSpiritualBond"] <- "霊的絆";
    P["LegendValaThreads"] <- "運命の糸";
    P["LegendValaTranceMalevolent"] <- "悪霊（トランス）";
    P["LegendValaTranceMastery"] <- "トランス熟達";
    P["LegendValaTrancePerspective"] <- "非実体の視座（トランス）";
    P["LegendValaWarden"] <- "番人";
    P["LegendVengeance"] <- "復讐";
    P["LegendVersatile"] <- "万能";
    P["LegendViolentDecomposition"] <- "激しい分解";
    P["LegendWheelMaintenance"] <- "車輪整備";
    P["LegendWhipThemInShape"] <- "鍛え直し";
    P["LegendWindReader"] <- "風読み";
    P["LegendWither"] <- "萎縮";
    P["LegendWolfform"] <- "狼形態";
    P["LegendWoodworking"] <- "木工";
    P["LegendZombieBite"] <- "ゾンビ噛みつき";
    // Also patch PerkDefObjects.Name for specialist perks (v18)
    try { if (("Perks" in gt) && ("PerkDefObjects" in gt.Const.Perks)) {
        if (("Legends" in gt) && ("Perk" in gt.Legends)) {
            local PD = gt.Const.Perks.PerkDefObjects;
            local LP = gt.Legends.Perk;
            try { if (LP.LegendSpecialistButcher in PD) PD[LP.LegendSpecialistButcher].Name = "屠殺人"; } catch(e) {}
            try { if (LP.LegendSpecialistBlacksmith in PD) PD[LP.LegendSpecialistBlacksmith].Name = "鉄砕き"; } catch(e) {}
            try { if (LP.LegendSpecialistPrisoner in PD) PD[LP.LegendSpecialistPrisoner].Name = "喉裂き"; } catch(e) {}
            try { if (LP.LegendSpecialistMilitia in PD) PD[LP.LegendSpecialistMilitia].Name = "ファランクス"; } catch(e) {}
            try { if (LP.LegendSpecialistBodyguard in PD) PD[LP.LegendSpecialistBodyguard].Name = "略奪者"; } catch(e) {}
            try { if (LP.LegendSpecialistMiner in PD) PD[LP.LegendSpecialistMiner].Name = "石砕き"; } catch(e) {}
            try { if (LP.LegendSpecialistFarmhand in PD) PD[LP.LegendSpecialistFarmhand].Name = "大振り打撃"; } catch(e) {}
            try { if (LP.LegendSpecialistPoacher in PD) PD[LP.LegendSpecialistPoacher].Name = "猟師"; } catch(e) {}
            try { if (LP.LegendSpecialistGravedigger in PD) PD[LP.LegendSpecialistGravedigger].Name = "墓守"; } catch(e) {}
            try { if (LP.LegendSpecialistWoodsman in PD) PD[LP.LegendSpecialistWoodsman].Name = "森人"; } catch(e) {}
            try { if (LP.LegendSpecialistHerbalist in PD) PD[LP.LegendSpecialistHerbalist].Name = "収穫者"; } catch(e) {}
            try { if (LP.LegendSpecialistShepherd in PD) PD[LP.LegendSpecialistShepherd].Name = "散兵"; } catch(e) {}
            try { if (LP.LegendSpecialistCultist in PD) PD[LP.LegendSpecialistCultist].Name = "拷問者"; } catch(e) {}
            try { if (LP.LegendSpecialistReaper in PD) PD[LP.LegendSpecialistReaper].Name = "死神"; } catch(e) {}
            try { if (LP.LegendSpecialistSelfdefense in PD) PD[LP.LegendSpecialistSelfdefense].Name = "棒術"; } catch(e) {}
            try { if (LP.LegendSpecialistInventor in PD) PD[LP.LegendSpecialistInventor].Name = "爆撃手"; } catch(e) {}
            try { if (LP.LegendSpecialistInquisition in PD) PD[LP.LegendSpecialistInquisition].Name = "魔女狩り"; } catch(e) {}
            try { if (LP.LegendSpecialistClub in PD) PD[LP.LegendSpecialistClub].Name = "執行者"; } catch(e) {}
            try { if (LP.LegendSpecialistRaider in PD) PD[LP.LegendSpecialistRaider].Name = "頭蓋割り"; } catch(e) {}
            try { if (LP.LegendSpecialistSpearfisher in PD) PD[LP.LegendSpecialistSpearfisher].Name = "鳥撃ち"; } catch(e) {}
            try { if (LP.LegendSpecialistSharpshooter in PD) PD[LP.LegendSpecialistSharpshooter].Name = "狙撃手"; } catch(e) {}
        }
    }} catch(e) {}
};

// ============================================================
// SECTION 5: Helper — set perk name by string key
// ============================================================
local _lcj_setP = function(_key, _name) {
    local gt = this.getroottable();
    try { gt.Const.Strings.PerkName[_key] <- _name; } catch(e) {}
    try {
        if ((_key in gt.Const.Perks.PerkDefs) && (gt.Const.Perks.PerkDefs[_key] in gt.Const.Perks.PerkDefObjects)) {
            gt.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs[_key]].Name = _name;
        }
    } catch(e) {}
};

// ============================================================
// SECTION 6: Helper — set perk description (v31 pattern)
// Full-text Japanese; sets both Const.Strings.PerkDescription and PerkDefObjects.Tooltip/Description.
// ============================================================
local _lcj_setDesc = function(_key, _desc) {
    local gt = this.getroottable();
    try { if (!("PerkDescription" in gt.Const.Strings)) gt.Const.Strings.PerkDescription <- {}; } catch(e) {}
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

// ============================================================
// SECTION 7: v31 Precise perk descriptions (full-text Japanese)
// ============================================================
local _lcj_desc_applied = false;
local _lcj_apply_descriptions = function() {
    if (_lcj_desc_applied) return;
    _lcj_desc_applied = true;
    local gt = this.getroottable();
    local cP = gt.Const.UI.Color.PositiveValue;
    local cN = gt.Const.UI.Color.NegativeValue;
    local cD = gt.Const.UI.Color.DamageValue;
    local cA = ("povPerkDarkOrange" in gt.Const.UI) ? gt.Const.UI.Color.povPerkDarkOrange : gt.Const.UI.Color.Active;
    local cS = ("povPerkPurple" in gt.Const.UI) ? gt.Const.UI.Color.povPerkPurple : gt.Const.UI.Color.NegativeValue;

    _lcj_setDesc("SpecPolearm", "ポールアームを極め、敵を寄せ付けない。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]破裂攻撃[/color]は、与える[color=" + cD + "]出血[/color]ダメージを[color=" + cP + "]10[/color]に増加させる。\n\n• 杖使用時、[color=" + cS + "]杖の朦朧[/color]の朦朧付与確率が[color=" + cP + "]100%[/color]に増加し、[color=" + cS + "]跳躍[/color]の射程が[color=" + cP + "]1[/color]増加する。\n\n• その他のポールアーム系スキルはAPコストが[color=" + cN + "]1[/color]減少し、隣接する対象を直接攻撃してもペナルティを受けなくなる。");
    _lcj_setDesc("PolearmMastery", gt.Const.Strings.PerkDescription.SpecPolearm);

    _lcj_setDesc("SpecMace", "メイスを極め、防具の有無に関わらず敵を屈服させる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]ノックアウト[/color]、[color=" + cS + "]ノックオーバー[/color]、[color=" + cS + "]ストライクダウン[/color]は、対象が無効でない限り[color=" + cP + "]100%[/color]の確率で気絶させる。\n\n• ポールメイスは隣接する対象を直接攻撃してもペナルティを受けなくなる。");
    _lcj_setDesc("MaceMastery", gt.Const.Strings.PerkDescription.SpecMace);

    _lcj_setDesc("SpecCrossbow", "クロスボウと銃器を極め、最も効果的な狙い所を学ぶ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• クロスボウで与えたダメージの追加[color=" + cP + "]10%[/color]が防具を無視する。\n\n• ハンドゴンのリロードに必要なAPが[color=" + cN + "]6[/color]になり、2ターンに1回ではなく毎ターン発射できるようになる。");
    _lcj_setDesc("CrossbowMastery", gt.Const.Strings.PerkDescription.SpecCrossbow);

    _lcj_setDesc("Tenacious", "減速するな！\n\n疲労や負傷によるイニシアチブの低下量が、常に本来の値の[color=" + cP + "]50%[/color]に抑えられる。");

    _lcj_setDesc("LegendTenacious", "減速するな！\n\n疲労・負傷・その他の効果によるイニシアチブの低下量が、常に本来の値の[color=" + cP + "]50%[/color]に抑えられる。\n\n「待機」コマンドを使用してもイニシアチブが[color=" + cP + "]50%[/color]低下しなくなる。");

    _lcj_setDesc("NggHCharmEnemySpider", "「森の奥に潜む気味の悪い虫たちも、あなたの下僕や兵士にするにはお似合いね。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ウェブクネヒト[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]レッドバック・スパイダー[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• [color=" + cS + "]網[/color]、[color=" + cS + "]巣網[/color]、[color=" + cS + "]締め付ける蔦[/color]による拘束に対する[color=" + cP + "]免疫[/color]を得る。");
    _lcj_setDesc("NggHCharmEnemyDirewolf", "「5フィートもある大型犬をペットにしたくない人がいるかしら？あなたの敵を食い荒らす姿を見るより素敵なことはないわ。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ダイアウルフ[/color]、[color=" + cS + "]ハイエナ[/color]、[color=" + cS + "]熊[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]白毛ダイアウルフ[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• イニシアチブが[color=" + cP + "]8%[/color]増加し、移動した1マスごとに疲労の蓄積が[color=" + cP + "]2[/color]減少する。");
    _lcj_setDesc("NggHCharmEnemyAlp", "「夢喰いも悪夢を呼ぶ者も、あなたのような美女に仕えるべき存在よ。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]アルプ[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]デーモン・アルプ[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• 恐怖、パニック、精神支配効果に対する士気判定で意思が[color=" + cP + "]+15[/color]増加する。\n• [color=" + cS + "]睡眠[/color]スキルの対象を眠らせる確率が[color=" + cP + "]+10%[/color]増加する。");
    _lcj_setDesc("NggHCharmEnemyUnhold", "「最も背の高いオークすら見下ろすほどの巨人たち。そんな強大な存在をこそ、あなたの護衛にすべきね。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ウンホルト[/color]、[color=" + cS + "]フロスト・ウンホルト[/color]、[color=" + cS + "]スワンプ・ウンホルト[/color]、[color=" + cS + "]装甲ウンホルト[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]ロック・ウンホルト[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• 最大疲労が[color=" + cP + "]10%[/color]増加する。\n• ヒットポイントが[color=" + cP + "]15%[/color]増加する。");
    _lcj_setDesc("NggHCharmEnemySchrat", "「森の守護者と見なされる、意識を持つ古代の樹木たち。彼らこそあなたの守護者に相応しいわ！」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]シュラート[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]ハートウッド・シュラート[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• 近接防御と遠隔防御が[color=" + cP + "]5[/color]ポイント増加する。\n• 受けるダメージが[color=" + cP + "]10%[/color]減少する。精神攻撃や状態異常によるダメージには影響しない。");
    _lcj_setDesc("NggHCharmEnemyLindwurm", "「巨大な蛇と呼ぶ者もいれば、竜と呼ぶ者もいる。酸の血と聳え立つ体躯を持つ恐るべき獣たちを表す呼び名は様々。そんな一体を従えるところを想像してみて。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]リンドヴルム[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]ストールヴルム[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• 近接戦闘中のあらゆる敵の意思を、自身の現在の意思の[color=" + cP + "]10%[/color]に等しい値だけ減少させる。");
    _lcj_setDesc("NggHCharmEnemyOrk", "「人間には到底かなわない怪力を持つ戦士たち。その剛腕は、あなたの大義のために使われるべきよ。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]オーク・バーサーカー[/color]、[color=" + cS + "]オーク・ウォリアー[/color]、[color=" + cS + "]オーク・エリート[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]オーク・ウォーロード[/color]と[color=" + cS + "]オーク・ベヒーモス[/color]を永続的に魅了するための2つの条件のうち1つを満たす。\n• イニシアチブは蓄積した疲労の全量ではなく、その[color=" + cP + "]50%[/color]分だけ減少する。");
    _lcj_setDesc("NggHCharmEnemyGoblin", "「ゴブリンは小さく弱いけれど、袖の下にはたくさんの策を隠し持っている。そんな狡猾な生き物は、特定の仕事にうってつけね。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ゴブリン・オーバーシア[/color]と[color=" + cS + "]ゴブリン・シャーマン[/color]を永続的に魅了できるようになる。\n• [color=" + cS + "]圧倒[/color]状態に対する[color=" + cP + "]免疫[/color]を得る。\n• 遠隔防御が[color=" + cP + "]10[/color]ポイント増加する。");
    _lcj_setDesc("NggHCharmBasic", "「他人の心を盗む基本を学びなさい。まず最初のレッスン、熟れて瑞々しい果実をひと組見せれば、男はあなたの魅力に落ちるわ。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]魅了[/color]スキルと[color=" + cS + "]捕虜への魅了[/color]スキルの魅了確率が追加で[color=" + cP + "]5%[/color]増加する。\n• [color=" + cP + "]+10%[/color]の取引能力を得て、売却価格が上がり、購入価格が下がり、配送契約の報酬が増加する。");
    _lcj_setDesc("NggHCharmWords", "「地の底で眠るどんな蛇も目覚めさせる、魅惑の言葉。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• より強力な人間、たとえば騎士、軍曹、士官、遊牧民の長、山賊頭、バーバリアンの精鋭などにも魅了を行えるようになる。\n• 意思が[color=" + cP + "]5%[/color]増加する。\n• 最大疲労が[color=" + cP + "]5%[/color]増加する。");
    _lcj_setDesc("NggHCharmAppearance", "「どんな男も抗えない、豪奢な姿。これほどの美しさが存在していいのかしら？」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 剣術の達人、踊り手、達人級射手、砂漠の追跡者、ヘッジナイト、遊牧民の処刑人、バーバリアン王、山賊の将などを魅了できるようになる。\n• [color=" + cS + "]魅了[/color]効果の持続時間が[color=" + cP + "]1[/color]ターン増加する。この追加持続時間は[color=" + cS + "]強靭[/color]パークでは減少しない。");
    _lcj_setDesc("NggHCharmSpec", "「他人の心を掴む技を極めなさい。支配者気取りのお母さんが欲しくない？さあおいで！ママが慰めてあげる！」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]魅了[/color]スキルと[color=" + cS + "]捕虜への魅了[/color]スキルの魅了確率が追加で[color=" + cP + "]10%[/color]増加する。\n• 王者の敵を永続的に魅了できるようになる。\n• オーク・ウォーロード、オーク・ベヒーモス、伝説の獣を永続的に魅了するための最後の条件を満たす。");
    _lcj_setDesc("NggHCharmNudist", "「本物のふしだら者に、布切れなんて要らないわ。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 防具と兜の両方を装備していない間、以下の効果を得る。\n• [color=" + cS + "]ニンブル[/color]のスタックをさらに1つ得る。\n• [color=" + cS + "]魅了[/color]スキルと[color=" + cS + "]捕虜への魅了[/color]スキルの魅了確率が追加で[color=" + cP + "]5%[/color]増加する。");
};

// ============================================================
// SECTION 8: BBForge UI hooks  (v21 — exact-lookup only)
// ============================================================
local _lcj_bbforge_hooks = function() {
    local N = _lcj_names;
    local exact = function(text) {
        if (text == null || typeof text != "string") return text;
        return (text in N) ? N[text] : text;
    };
    local patchTooltipArr = function(arr) {
        if (arr == null) return arr;
        try {
            foreach(entry in arr) {
                try { if (("text" in entry) && typeof entry.text == "string") entry.text = exact(entry.text); } catch(e) {}
            }
        } catch(e) {}
        return arr;
    };
    try {
        ::mods_hookNewObject("ui/screens/bbforge/bbforge_screen", function(o) {
            try {
                local oldQP = o.queryPerks;
                o.queryPerks = function(_data) {
                    local r = oldQP(_data);
                    try {
                        if (r != null && ("Categories" in r)) {
                            foreach(c in r.Categories) {
                                try { if ("Perks" in c) foreach(p in c.Perks) { if (("Name" in p) && typeof p.Name == "string") p.Name = exact(p.Name); } } catch(e) {}
                            }
                        }
                    } catch(e) {}
                    return r;
                };
            } catch(e) {}
            try {
                local oldQT = o.queryTraits;
                o.queryTraits = function(_data) {
                    local r = oldQT(_data);
                    try {
                        if (r != null && ("Traits" in r)) {
                            foreach(t in r.Traits) {
                                try { if ("Name" in t) t.Name = exact(t.Name); } catch(e) {}
                            }
                        }
                    } catch(e) {}
                    return r;
                };
            } catch(e) {}
            try {
                local oldQS = o.querySkills;
                o.querySkills = function(_data) {
                    local r = oldQS(_data);
                    try {
                        if (r != null && ("Categories" in r)) {
                            foreach(c in r.Categories) {
                                try { if ("Name" in c) c.Name = exact(c.Name); } catch(e) {}
                                try { if ("Skills" in c) foreach(s in c.Skills) { if (("Name" in s) && typeof s.Name == "string") s.Name = exact(s.Name); } } catch(e) {}
                            }
                        }
                    } catch(e) {}
                    return r;
                };
            } catch(e) {}
        });
    } catch(e) { try { ::logError("[LCJ unified] BBForge screen hook failed: " + e); } catch(x) {} }
    try {
        ::mods_hookNewObject("ui/screens/tooltip/tooltip_events", function(o) {
            local oldTT = o.general_queryUIElementTooltipData;
            o.general_queryUIElementTooltipData = function(_entityId, _elementId, _elementOwner) {
                local r = oldTT(_entityId, _elementId, _elementOwner);
                try { if (_elementId != null && _elementId.len() >= 3 && _elementId.slice(0, 3) == "bf-") r = patchTooltipArr(r); } catch(e) {}
                return r;
            };
        });
    } catch(e) { try { ::logError("[LCJ unified] tooltip hook failed: " + e); } catch(x) {} }
};

// ============================================================
// SECTION 9: Core apply function (names + perk names + descriptions)
// ============================================================
local _lcj_core = function() {
    _lcj_apply_names();
    _lcj_apply_perk_names();
    _lcj_apply_descriptions();
};

// ============================================================
// SECTION 10: Queue registrations
// ============================================================

// Early queue (null) — patch TraitName/SkillName before any mod loads
::mods_queue("mod_99_legends_complete_ja_unified_preload", null, function() {
    _lcj_apply_names();
});

// mod_legends
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_legends", function() {
    _lcj_core();
});

// mod_msu (backup for MSU-only setups)
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_msu", function() {
    _lcj_apply_names();
    _lcj_apply_perk_names();
});

// mod_fantasybro
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_fantasybro", function() {
    _lcj_core();
});

// mod_aurapower
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_aurapower", function() {
    _lcj_core();
});

// mod_bbforge — core names + BBForge UI hooks
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_bbforge", function() {
    _lcj_apply_names();
    _lcj_apply_perk_names();
    _lcj_bbforge_hooks();
});

// mod_PoV — core + PoV-specific perk names (v27)
// This is the single authoritative place for these LegendSpecialist*/Pov* PerkName
// overrides; the redundant "Complete Japanese Patch v18 safety" copy that used to
// live in mod_PoV/afterHooks/config/perk_strings.nut has been removed to avoid
// multiple assignments for the same perk ID (PerkDescription for the Pov* perks
// below is still owned by mod_PoV/afterHooks/config/perk_strings.nut, since it is
// not duplicated here).
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_PoV", function() {
    _lcj_core();
    local setP = _lcj_setP;
    setP("PovSignsOffense", "印術・攻撃");
    setP("PovSignsDefense", "印術・防御");
    setP("PovSignsControl", "印術・制御");
    setP("PovSignMastery", "印術の極意");
    setP("PovChampionSlayer", "王者殺し");
    setP("PovStabilizedMutations", "安定化変異");
    // PoV-specific specialist perk name overrides (v27)
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
    // Direct PerkDefObjects entries for PoV perk keys (v27)
    local gt = this.getroottable();
    try { gt.Const.Strings.PerkName.PovSignsOffense <- "印術・攻撃"; } catch(e) {}
    try { gt.Const.Strings.PerkName.PovSignsDefense <- "印術・防御"; } catch(e) {}
    try { gt.Const.Strings.PerkName.PovSignsControl <- "印術・制御"; } catch(e) {}
    try { gt.Const.Strings.PerkName.PovSignMastery <- "印術の極意"; } catch(e) {}
    try { gt.Const.Strings.PerkName.PovChampionSlayer <- "王者殺し"; } catch(e) {}
    try { gt.Const.Strings.PerkName.PovStabilizedMutations <- "安定化変異"; } catch(e) {}
    try { gt.Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsOffense].Name = "印術・攻撃"; } catch(e) {}
    try { gt.Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsDefense].Name = "印術・防御"; } catch(e) {}
    try { gt.Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsControl].Name = "印術・制御"; } catch(e) {}
    try { gt.Const.Perks.PerkDefObjects[::Legends.Perk.PovSignMastery].Name = "印術の極意"; } catch(e) {}
    try { gt.Const.Perks.PerkDefObjects[::Legends.Perk.PovChampionSlayer].Name = "王者殺し"; } catch(e) {}
    try { gt.Const.Perks.PerkDefObjects[::Legends.Perk.PovStabilizedMutations].Name = "安定化変異"; } catch(e) {}
});

// mod_nggh_magic_concept — NgGH race perk names (v25) + charm/hex/BDSM names (v27)
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_nggh_magic_concept", function() {
    _lcj_core();
    local setP = _lcj_setP;
    // v25 NgGH race perk names
    setP("NggHEggBreedingMachine", "繁殖機械");
    setP("NggHEggInherit", "継承");
    setP("NggHEggNaturalSelection", "自然選択");
    setP("NggHEggAttachSpider", "乗せてくれ");
    setP("NggH_Spider_Bite", "穿つ咬みつき");
    setP("NggH_Spider_Venom", "毒の達人");
    setP("NggH_Spider_Web", "巣網の達人");
    setP("NggH_Spider_ToughCarapace", "硬化甲殻");
    setP("NggH_Basilisk_AimTheHead", "頭を狙え");
    setP("NggHSerpentBite", "丸呑み");
    setP("NggHSerpentDrag", "締めつけ");
    setP("NggHSerpentVenom", "毒腺");
    setP("NggHSerpentGiant", "巨大蛇");
    setP("NggHHyenaBite", "肉裂きの咬みつき");
    setP("NggHWolfBite", "強靭な犬歯");
    setP("NggHWolfThickHide", "厚い毛皮");
    setP("NggHWolfEnrage", "獲物を圧倒");
    setP("NggHWolfRabies", "狂犬病");
    setP("NggHAlpNightmareSpec", "夢喰らい");
    setP("NggHAlpSleepSpec", "寝過ごし");
    setP("NggHAlpAfterWake", "恐怖の目覚め");
    setP("NggHAlpAfterimage", "残影");
    setP("NggHAlpLivingNightmare", "生ける悪夢");
    setP("NggHAlpMindBreak", "精神崩壊");
    setP("NggHAlpControlFlame", "炎操り");
    setP("NggHAlpFieceFlame", "焦熱");
    setP("NggHAlpHellishFlame", "業火");
    setP("NggHAlpShadowCopy", "影写し");
    setP("NggHNacho", "グール");
    setP("NggHNachoEat", "強化食");
    setP("NggHNachoFrenzy", "狂乱");
    setP("NggHNachoVomit", "嘔吐");
    setP("NggHNachoBigTummy", "大きな胃袋");
    setP("NggHNachoScavenger", "屍肉漁り");
    setP("NggH_Unhold_Grapple", "組みつき");
    setP("NggH_Unhold_UnarmedAttack", "素手攻撃");
    setP("NggH_Unhold_UnarmedTraining", "素手訓練");
    setP("NggH_Unhold_SpecFists", "素手の達人");
    setP("NggH_Unhold_Fling", "力任せの投げ");
    setP("NggHSchratShield", "盾育成の達人");
    setP("NggHSchratSapling", "従順な若木");
    setP("NggHSchratUproot", "強靭な根");
    setP("NggHSchratUprootAoE", "大地砕き");
    setP("NggHLindwurmAcid", "酸性血液吐き");
    setP("NggHLindwurmIntimidate", "威嚇");
    setP("NggHLindwurmBody", "強大な体躯");
    setP("NggHKrakenBite", "破裂の咬みつき");
    setP("NggHKrakenDevour", "飽くなき飢餓");
    setP("NggHKrakenEnsnare", "骨砕きの拘束");
    setP("NggHKrakenMove", "ぬめる触腕");
    setP("NggHKrakenSwing", "薙ぎ払い");
    setP("NggHKrakenTentacle", "弾力の皮膚");
    setP("NggHGoblinMountTraining", "騎乗訓練");
    setP("NggHGoblinMountedArchery", "騎射");
    setP("NggHGhostGhastlyTouch", "死の接触");
    setP("NggHGhostSpectralBody", "形なき霊体");
    setP("NggHGhostVanish", "消失");
    setP("NggHGhostPhase", "すり抜け");
    setP("NggHGhostSoulEater", "魂喰らい");
    setP("NggHMiscLineBreaker", "戦列破り");
    setP("NggHMiscChampion", "王者");
    setP("NggHMiscDaytime", "陽光に耐える");
    setP("NggHMiscNighttime", "夜行性");
    setP("NggHMiscFairGame", "格好の獲物");
    setP("NggH_Simp_NoFoodOnlyLove", "愛さえあれば");
    setP("NggH_Simp_Bodyguard", "女王を守れ");
    setP("NggH_Simp_UndyingLove", "不滅の愛");
    setP("NggH_Simp_LevelUp", "永遠の奉仕者");
    // v27 extra NgGH charm/hex/BDSM perk names
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

// mod_dseForbiddenKnowledgeOrigin (v27)
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_dseForbiddenKnowledgeOrigin", function() {
    local setP = _lcj_setP;
    setP("ForbiddenKnowledgeNecroticScythe", "死霊の大鎌");
    setP("ForbiddenKnowledgeHemomancy", "血術");
});

// mod_LuftVampiresOrigin (v27)
::mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_LuftVampiresOrigin", function() {
    local setP = _lcj_setP;
    setP("VampireAncientWisdom", "古の知恵");
    setP("VampireMaintenance", "武具整備");
    setP("VampireDarkflight", "闇飛び");
    setP("VampireVileWeaponry", "穢れた武器術");
    setP("VampireApexPredator", "頂点捕食者");
    setP("VampireDemoralise", "士気崩し");
});

// Immediate call — runs at preload load time for any tables already available
_lcj_apply_names();
_lcj_apply_perk_names();
