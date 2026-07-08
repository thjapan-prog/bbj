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
    P["Captain"] <- "キャプテン";
    P["SpecCrossbow"] <- "クロスボウ＆銃器マスタリー";
    P["SpecMace"] <- "メイスマスタリー";
    P["SpecPolearm"] <- "ポールアームマスタリー";
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
    // --- Legends Vala inscription perks (v32) ---
    P["LegendValaInscribeArmor"] <- "鎧の刻文";
    P["LegendValaInscribeHelmet"] <- "兜の刻文";
    P["LegendValaInscribeShield"] <- "盾の刻文";
    P["LegendValaInscribeWeapon"] <- "武器の刻文";
    P["LegendValaInscriptionMastery"] <- "刻文熟達";
    // --- Legend perks missing from v9 (v32) ---
    P["LegendArtfulDodger"] <- "巧みな回避";
    P["LegendUnarmedLunge"] <- "素手突き";
    // --- Vanilla perks with Legends description overrides (v32) ---
    P["CoupDeGrace"] <- "死刑執行人";
    P["DevastatingStrikes"] <- "壊滅的な一撃";
    P["FastAdaption"] <- "瞬時の対応力";
    P["InspiringPresence"] <- "感動的な存在";
    P["ShieldBash"] <- "シールドバッシュ";
    P["Stalwart"] <- "スタルワート";
    P["Steadfast"] <- "不動";
    P["SunderingStrikes"] <- "サンダリングストライク";
    // --- Legends weapon mastery perks by Spec key (v32) ---
    P["SpecAxe"] <- "斧術熟達";
    P["SpecBow"] <- "弓術熟達";
    P["SpecCleaver"] <- "鉈術熟達";
    P["SpecDagger"] <- "短剣術熟達";
    P["SpecFlail"] <- "フレイル術熟達";
    P["SpecHammer"] <- "槌術熟達";
    P["SpecSpear"] <- "槍術熟達";
    P["SpecSword"] <- "剣術熟達";
    P["SpecThrowing"] <- "投擲熟達";
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

    _lcj_setDesc("Captain", "あなたのリーダーシップの延長として、全員を一列に並べるために戦場でキャプテンを指揮しろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 半径5タイル以内の味方は、このキャラクターの意思の[color=" + cP + "]15%[/color]をボーナスとして得る。\n\n• このボーナスは重複せず、最も意思が高いキャプテンのみが適用される。");

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

    // ---- v32: missing Legends description overrides ----

    // Vanilla perks with Legends-enhanced descriptions
    _lcj_setDesc("CoupDeGrace", "弱き獲物を狩る猛獣のように、傷ついた敵を仕留める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]衰弱[/color]、[color=" + cS + "]転倒[/color]、または骨折などの負傷効果を受けている対象に追加で[color=" + cP + "]20%[/color]のダメージを与える。\n\n• さらに、以下のいずれかの効果を受けている対象に追加で[color=" + cP + "]10%[/color]のダメージを与える：[color=" + cS + "]混乱[/color]、[color=" + cS + "]朦朧[/color]、[color=" + cS + "]注意散漫[/color]、[color=" + cS + "]掴まれ[/color]、[color=" + cS + "]網捕縛[/color]、[color=" + cS + "]根縛り[/color]、[color=" + cS + "]シェルショック[/color]、[color=" + cS + "]睡眠[/color]、[color=" + cS + "]よろめき[/color]、[color=" + cS + "]気絶[/color]、[color=" + cS + "]脆弱化[/color]、[color=" + cS + "]蜘蛛糸捕縛[/color]、[color=" + cS + "]萎縮[/color]。");

    _lcj_setDesc("DevastatingStrikes", "今や誰がお前の前に立てるというのか？\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 与えるすべてのダメージが[color=" + cP + "]10%[/color]増加する。");

    _lcj_setDesc("FastAdaption", "相手の動きに素早く適応せよ！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 攻撃が外れるたびに、命中率が累積で[color=" + cP + "]+10%[/color]増加する。\n\n• 攻撃が命中すると、スタック数に応じて最大[color=" + cP + "]3[/color]アクションポイントが回復し、ボーナスはリセットされる。回復量は最大アクションポイントを超えない。");

    _lcj_setDesc("InspiringPresence", "戦闘開始時に鼓舞的な演説で味方を奮い立たせる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 軍旗を持っている間、与えるダメージが[color=" + cD + "]+10[/color]増加する。\n\n• 味方がキャラクター特性によって禁止されていない限り、このキャラクターの意思の[color=" + cP + "]33%[/color]の確率で戦闘を[color=" + cS + "]自信[/color]士気で開始する。\n\n• 意思が100を下回るごとに[color=" + cN + "]1%[/color]の確率で演説が裏目に出て[color=" + cS + "]動揺[/color]士気を引き起こす。");

    _lcj_setDesc("ShieldBash", "「吹き飛ばせ！」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ノックバック[/color]スキルが[color=" + cP + "]10-25[/color]ダメージ（防具への有効性50%）と[color=" + cD + "]10[/color]疲労ダメージを与えるようになる。\n\n• さらに、盾の最大耐久値の[color=" + cP + "]10%[/color]に応じてダメージが増加し、最大ボーナスは10。\n\n• [color=" + cS + "]バックラーバッシュ[/color]は[color=" + cP + "]8-15[/color]ダメージを与える。\n\n• 両スキルの疲労コストが[color=" + cN + "]25%[/color]減少し、APコストが[color=" + cN + "]1[/color]減少する。");

    _lcj_setDesc("Stalwart", "逆境に屈しない不屈の戦士は、いかなる状況でも揺るぎなく立ち続ける。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ノックバック[/color]、[color=" + cS + "]引き寄せ[/color]、[color=" + cS + "]掴まれ[/color]、[color=" + cS + "]飲み込まれ[/color]に対して受動的な免疫を得る。\n• ノックバック、フック、その他キャラクターの位置を変えるスキルに適用される。");

    _lcj_setDesc("Steadfast", "堅固で決意に満ちた戦士。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 通常の攻撃で命中または回避した際の疲労コストが[color=" + cN + "]90%[/color]減少する。疲労を特に標的とする攻撃には影響しない。\n\n• さらに、すべてのスロットの装備重量[color=" + cN + "]10[/color]ポイントごとに近接防御が[color=" + cP + "]1[/color]増加する。");

    _lcj_setDesc("SunderingStrikes", "騎士たちもお前の重い一撃を恐れるがよい。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 使用するすべての武器の防具への有効性が[color=" + cP + "]+20%[/color]増加する。");

    // Legends weapon mastery perks (Spec keys)
    _lcj_setDesc("SpecAxe", "斧術を極め、盾を破壊する戦い方を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• 斧使用時、[color=" + cS + "]盾割り[/color]のダメージが[color=" + cP + "]50%[/color]増加する。\n\n• [color=" + cS + "]ラウンドスウィング[/color]の命中率が[color=" + cP + "]+5%[/color]増加する。\n\n• 長斧は隣接する対象を直接攻撃してもペナルティを受けなくなる。");

    _lcj_setDesc("SpecBow", "弓術を極め、遠くから矢で敵を攻め立てる技を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• 弓使用時の視野と最大射程が[color=" + cP + "]+1[/color]増加する。");

    _lcj_setDesc("SpecCleaver", "鉈術を極め、凄惨な傷を与える戦い方を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• 鉈と鞭で与える[color=" + cD + "]出血[/color]ダメージがそれぞれ[color=" + cP + "]10[/color]と[color=" + cP + "]20[/color]に倍増する。\n\n• [color=" + cS + "]武器落とし[/color]の命中ペナルティが半減する。");

    _lcj_setDesc("SpecDagger", "迅速で致命的な短剣術を極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]刺突[/color]、[color=" + cS + "]穿刺[/color]、[color=" + cS + "]連刺[/color]、[color=" + cS + "]貫刺[/color]、[color=" + cS + "]必殺刺[/color]のAPコストが[color=" + cN + "]3[/color]に減少し、1ターンに追加の攻撃が可能になる。\n\n• [color=" + cS + "]ナイフ投げ[/color]の頭部命中時に注意を散漫させる確率が[color=" + cP + "]25%[/color]増加する。");

    _lcj_setDesc("SpecFlail", "フレイル術を極め、対戦相手の盾を回避する術を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]ラッシュ[/color]と[color=" + cS + "]ヘイル[/color]は盾の防御ボーナスを無視する。\n\n• [color=" + cS + "]スレッシュ[/color]の命中率が[color=" + cP + "]+5%[/color]増加する。\n\n• [color=" + cS + "]パウンド[/color]は頭部命中時にさらに[color=" + cP + "]+10%[/color]の防具貫通ボーナスを得る。");

    _lcj_setDesc("SpecHammer", "槌術を極め、重装甲の敵との戦い方を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]アーマー破壊[/color]と[color=" + cS + "]アーマー粉砕[/color]は防具へのダメージが[color=" + cP + "]33%[/color]増加する。\n\n• [color=" + cS + "]シャッター[/color]の命中率が[color=" + cP + "]+5%[/color]増加する。\n\n• [color=" + cS + "]オブリタレート[/color]の命中率が[color=" + cP + "]+25%[/color]増加する。\n\n• ポールハンマーは隣接する対象を直接攻撃してもペナルティを受けなくなる。");

    _lcj_setDesc("SpecSpear", "槍術を極め、敵を寄せ付けない戦い方を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• [color=" + cS + "]スピアウォール[/color]が一度克服されても無効にならなくなり、支配領域へ進入しようとする敵へのフリーアタックを継続する。\n\n• 両手槍スキルである[color=" + cS + "]突き[/color]、[color=" + cS + "]貫刺[/color]、[color=" + cS + "]心臓狙い[/color]のAPコストが[color=" + cN + "]1[/color]減少する。[color=" + cS + "]突き[/color]と[color=" + cS + "]心臓狙い[/color]は隣接する対象を直接攻撃してもペナルティを受けなくなる。\n\n• [color=" + cS + "]心臓狙い[/color]の防具貫通率が[color=" + cP + "]+5%[/color]増加する。");

    _lcj_setDesc("SpecSword", "剣術を極め、相手の隙を突く戦い方を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少し、命中率が[color=" + cP + "]+5%[/color]増加する。\n\n• [color=" + cS + "]リポスト中[/color]の命中ペナルティがなくなる。\n\n• 剣使用時、[color=" + cS + "]スウィング[/color]の命中率が[color=" + cP + "]+10%[/color]増加する。\n\n• [color=" + cS + "]斬り裂き[/color]は負傷を負わせる閾値が[color=" + cN + "]50%[/color]低下する。\n\n• 剣二刀流時、[color=" + cS + "]リポスト[/color]が両手の武器から発動可能になり、敵の攻撃ミス1回につき最大2回の反撃ができる。");

    _lcj_setDesc("SpecThrowing", "投擲術を極め、敵が近づく前に傷つけるか仕留める技を体得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スキルによる疲労の蓄積が[color=" + cN + "]25%[/color]減少する。\n\n• 投擲武器使用時、防具貫通率が追加で[color=" + cP + "]+20%[/color]増加し、防具への有効性が[color=" + cP + "]+25%[/color]増加し、負傷を負わせる閾値が[color=" + cN + "]33%[/color]低下する。");

    // Legends new perks
    _lcj_setDesc("LegendArtfulDodger", "近接戦闘で敵から離れる際、支配領域が無視される。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接の敵の支配領域を離れる際、支配領域によるフリーアタックを誘発しない。");

    _lcj_setDesc("LegendUnarmedLunge", "一連の動作で一歩踏み込み、敵に一撃を加える。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]素手突き[/color]スキルが解放され、素手の状態で1マス移動しながら1アクションで攻撃できる。\n\n• 素手訓練なしで[color=" + cP + "]10-20[/color]ダメージを与える。\n\n• [color=" + cN + "]6[/color] APと[color=" + cN + "]30[/color]疲労を消費する。");

    // Vala inscription perks
    _lcj_setDesc("LegendValaInscribeArmor", "防具向けのルーン紋様を刻む術を習得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヴァーラが野営中に防具専用のルーン紋様を岩に刻み、強力なルーン石を作成できるようになる。\n\n• 可能な刻文：持久、靭性、安全。");

    _lcj_setDesc("LegendValaInscribeHelmet", "兜向けのルーン紋様を刻む術を習得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヴァーラが野営中に兜専用のルーン紋様を岩に刻み、強力なルーン石を作成できるようになる。\n\n• 可能な刻文：勇気、明晰、幸運。");

    _lcj_setDesc("LegendValaInscribeShield", "盾向けのルーン紋様を刻む術を習得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヴァーラが野営中に盾専用のルーン紋様を岩に刻み、強力なルーン石を作成できるようになる。\n\n• 可能な刻文：防御、輝光。");

    _lcj_setDesc("LegendValaInscribeWeapon", "武器向けのルーン紋様を刻む術を習得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヴァーラが野営中に武器専用のルーン紋様を岩に刻み、強力なルーン石を作成できるようになる。\n\n• 可能な刻文：精度、出血、給養、毒、威力。");

    _lcj_setDesc("LegendValaInscriptionMastery", "ヴァーラは複雑で失われた刻文の技を極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ポールアームマスタリー[/color]を取得すると、盾と武器に刻文できるようになる。\n\n• [color=" + cS + "]ニンブル[/color]または[color=" + cS + "]しなやかさ[/color]を取得すると、防具と兜に刻文できるようになる。\n\n• レベル11に達すると、ルーン制作速度が[color=" + cP + "]30%[/color]増加する。");

    _lcj_setDesc("LegendSpawnSkeletonMed", "骨を呼び起こす前に適切な位置へ配置することで、崩壊しにくくなる。形状と機能の両面でより頑丈になる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 儀式を行うには小規模な肉の生贄が必要。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]15[/color] 疲労を消費する。");

    _lcj_setDesc("LegendSpawnSkeletonHigh", "各骨を念入りに再配置し、呼び起こされた際に足根骨一つとして正しい位置を外れないようにする。骨で作られた大傑作であり、その力は比類なき高みにある。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 儀式を行うには中程度の肉の生贄が必要。\n\n• [color=" + cN + "]5[/color] APと[color=" + cN + "]20[/color] 疲労を消費する。");

    _lcj_setDesc("LegendExtendendAura", "暗黒の力に身を委ね、その力が毛穴から滲み出るままにせよ。今や解き放たれた邪悪なエネルギーにより、死者を呼び覚ます術をより遠くへ投影できる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 死者を蘇らせる全てのスキルの射程が1タイル増加する。");

    _lcj_setDesc("LegendChanneledPower", "術をより上手く集中させ、身体への消耗を軽減する方法を習得する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 死者を蘇らせる全てのスキルが蓄積する疲労が[color=" + cN + "]30%[/color]減少する。");

    _lcj_setDesc("LegendReclamation", "死体の廃物に少しの魔力を織り込むことで、より多くの素材を回収できるようになる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 人間の腐肉と人間の骨を戦利品として入手する頻度が増加する。");

    _lcj_setDesc("LegendConservation", "時の経過を食い止めるための冒涜的な儀式を執り行い、術の手段をさらに保存する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 人間の死体、骨、その他の腐肉を維持するための日々の薬品コストが[color=" + cN + "]50%[/color]減少する。");

    _lcj_setDesc("LegendEnthrall", "一体の創造物の糸を引き、従順な守護者としてあなたのそばに留まるよう強いる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 魅了された死者は防御的に行動し、脅威からあなたを守ろうとする。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]15[/color] 疲労を消費する。");

    _lcj_setDesc("LegendViolentDecomposition", "自分が作り出した下僕の一体を維持する力を腐敗させる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]激烈な腐敗[/color]スキルを解放する。このスキルは腐敗が蓄積する時間を経た後、下僕を破壊的に爆発させる。影響を受けた死者は次のラウンドのターン終了時に爆発し、1タイル半径内にダメージを与える。HPが低いほど、爆発が与えるダメージが増加する。爆発前に倒された場合、効果は発動しない。\n\n• 死体から作られた下僕にのみ機能する。");

    _lcj_setDesc("LegendPossession", "望む者も望まぬ者も、獲物を支配下に置く。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]憑依[/color]スキルを解放する。このスキルは生きているターゲットを永続的に魅了する。\n\n• [color=" + cN + "]6[/color] APと[color=" + cN + "]35[/color] 疲労を消費する。");

    _lcj_setDesc("LegendSiphon", "敵の生命力を吸い取り、自己を維持する。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]サイフォン[/color]スキルを解放する。このスキルはターゲットから[color=" + cP + "]10-20[/color]ヒットポイントを吸い取り、あなたに転送する。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]20[/color] 疲労を消費する。");

    _lcj_setDesc("LegendGuideSteps", "険しい地形を先導する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 隣接する味方があなたのパスファインダーパークの恩恵を受け、困難な地形での移動コストが減少する。");

    _lcj_setDesc("LegendBerserkerRage", "内なる野獣を解き放て。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]狂戦士の怒り[/color]スキルを解放する。このスキルはダメージに[color=" + cP + "]+25%[/color]のボーナスを与えるが、[color=" + cP + "]2[/color]ターンの間、味方敵を問わず最も近いターゲットを攻撃するようになる。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]20[/color] 疲労を消費する。");

    _lcj_setDesc("LegendBecomeBerserker", "内なる怒りを完全に受け入れる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]狂戦士の怒り[/color]状態の間、全ての戦闘スキルに[color=" + cP + "]+15[/color]のボーナスを得る。");

    _lcj_setDesc("LegendSkillfulStacking", "インベントリを最大効率に最適化する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• インベントリ内のスタック可能なアイテムが占有するスロット数が[color=" + cP + "]1[/color]減少する。");

    _lcj_setDesc("LegendEfficientPacking", "より賢く荷物をまとめる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• バッグとベルトに[color=" + cP + "]1[/color]個追加でアイテムを収納できる。");

    _lcj_setDesc("LegendAmmoBinding", "戦場での効率のために弾薬を束ねる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 矢、ボルト、投擲武器が[color=" + cP + "]2[/color]個ではなく[color=" + cP + "]3[/color]個でスタックされる。");

    _lcj_setDesc("LegendAmmoBundles", "弾薬を束ねて持ち運びやすくする。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 矢とボルトを束にして持ち運べるようになり、1束あたりインベントリスロット[color=" + cP + "]1[/color]個のみを占有する。");

    _lcj_setDesc("LegendMedPackages", "医療用品を事前に準備しておく。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 医療用品のスタック効率が向上し、インベントリスペースの占有が減少する。");

    _lcj_setDesc("LegendMedIngredients", "どのハーブや植物に薬効があるかを知っている。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 薬草と材料のスタック効率が向上する。");

    _lcj_setDesc("LegendToolsDrawers", "道具を整理しておく。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 道具と修理キットのスタック効率が向上する。");

    _lcj_setDesc("LegendToolsSpares", "常に予備の部品を携帯する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 修理キットと予備部品のインベントリスペースの占有が減少する。");

    _lcj_setDesc("LegendBarterConvincing", "巧みな話術で買い手をより受け入れやすくする。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 売却価格が[color=" + cP + "]10%[/color]増加する。");

    _lcj_setDesc("LegendBarterTrustworthy", "誠実さの評判が商人を取引に前向きにさせる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 購入価格が[color=" + cP + "]10%[/color]減少する。");

    _lcj_setDesc("LegendBribe", "適切な相手に賄賂を渡す。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]賄賂[/color]スキルを解放する。このスキルは特定の敵を撤退または降伏するよう説得できる。");

    _lcj_setDesc("LegendOffBookDeal", "時として取引は通常の経路の外で行われる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 他者には入手不可能な特別な取引品と取引へのアクセスを得る。");

    _lcj_setDesc("LegendSpecialistMusician", "あなたの音楽の技術は比類なき高みにある。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 音楽スキルの効果が大幅に強化され、疲労コストが減少する。");

    _lcj_setDesc("LegendBigGameHunter", "最も危険な獲物を追跡し、仕留める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 大型の生物に対してダメージ[color=" + cP + "]+15%[/color]を得る。\n\n• 大型の生物に対して近接技術[color=" + cP + "]+10[/color]を得る。");

    _lcj_setDesc("LegendSecondWind", "深く掘り下げ、戦い続ける力を見つける。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]セカンドウィンド[/color]スキルを解放する。このスキルは最大疲労の[color=" + cP + "]50%[/color]を回復する。\n\n• 戦闘につき1回のみ使用可能。\n\n• [color=" + cN + "]4[/color] APを消費する。");

    _lcj_setDesc("LegendMarkTarget", "味方が攻撃を集中させるべき敵をマークする。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]ターゲットマーク[/color]スキルを解放する。このスキルはターゲットをマークし、全ての味方がそのターゲットに対して[color=" + cP + "]+15%[/color]多くのダメージを[color=" + cP + "]2[/color]ターンの間与えるようになる。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]15[/color] 疲労を消費する。");

    _lcj_setDesc("LegendFieldRepairs", "装備を戦闘可能な状態に保つ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]野戦修理[/color]スキルを解放する。このスキルは装備している防具の一つの耐久度を[color=" + cP + "]25[/color]回復する。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]20[/color] 疲労を消費する。");

    _lcj_setDesc("LegendDangerPay", "命をかけた報酬を多く稼ぐ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 契約報酬が[color=" + cP + "]10%[/color]増加する。");

    _lcj_setDesc("LegendValaWarden", "織物の守護者となる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 特別なヴァーラ守護者の能力へのアクセスを得る。\n\n• 魔法的な脅威に対する詠唱の有効性が向上する。");

    _lcj_setDesc("LegendValaThreads", "運命の糸を読み取る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 存在間の魔法的なつながりを感知する能力を得る。\n\n• 魔法攻撃に対して意思[color=" + cP + "]+15[/color]を得る。");

    _lcj_setDesc("LegendValaPremonition", "他者には見えないものを見る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 視界[color=" + cP + "]+1[/color]を得る。\n\n• 伏兵を発見する確率[color=" + cP + "]+15%[/color]を得る。");

    _lcj_setDesc("LegendValaChantMastery", "詠唱技術を極めた。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 詠唱スキルの効果が高まり、疲労コストが減少する。");

    _lcj_setDesc("LegendValaTranceMastery", "トランスの術を極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• トランススキルの効果が高まり、コストが減少する。");

    _lcj_setDesc("LegendValaChantDisharmony", "不協和音を織り交ぜ、敵を乱す。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]不和の詠唱[/color]を解放する。これは近くの敵の戦闘効率を低下させる。");

    _lcj_setDesc("LegendValaSpiritualBond", "味方と霊的なつながりを結ぶ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 絆を結んだ味方と戦闘ボーナスを共有する。");

    _lcj_setDesc("LegendValaTrancePerspective", "トランスを通じて視点を変化させる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• トランス中に周囲への認識が強化される。");

    _lcj_setDesc("LegendValaTranceMalevolent", "トランスを通じて暗黒のエネルギーを導く。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• トランス能力が攻撃的な能力を獲得する。");

    _lcj_setDesc("LegendPreparedForAnything", "常に予期せぬ事態に備える。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 各戦闘を追加の[color=" + cP + "]+1[/color] APを持った状態で開始する。");

    _lcj_setDesc("LegendBrinkOfDeath", "死と向き合い、より強くなって戻る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヒットポイントが[color=" + cN + "]25%[/color]を下回ると、[color=" + cP + "]2[/color]ターンの間、全ての戦闘スキルに[color=" + cP + "]+20%[/color]のボーナスを得る。");

    _lcj_setDesc("LegendStrictSermons", "あなたの説教が部隊に規律を吹き込む。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 隣接する味方が意思[color=" + cP + "]+10[/color]を得る。");

    _lcj_setDesc("LegendInfectiousRage", "あなたの怒りは伝染する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒すと、隣接する味方が[color=" + cP + "]1[/color]ターンの間、ダメージ[color=" + cP + "]+10%[/color]を得る。");

    _lcj_setDesc("LegendResurrectionist", "より強大な力で死者を蘇らせる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• あなたが蘇らせた不死はヒットポイントが[color=" + cP + "]+20%[/color]増加し、ダメージが[color=" + cP + "]+10%[/color]増加する。");

    _lcj_setDesc("LegendLevitate", "地面から浮き上がる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]浮遊[/color]スキルを解放する。このスキルは障害物や困難な地形の上を漂うことを可能にする。\n\n• [color=" + cN + "]4[/color] APと[color=" + cN + "]20[/color] 疲労を消費する。");

    _lcj_setDesc("LegendSpecialistShieldSkill", "盾を攻撃武器として極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 盾打撃スキルのダメージが[color=" + cP + "]+25%[/color]増加する。\n\n• 盾スキルの疲労コストが[color=" + cN + "]-25%[/color]減少する。");

    _lcj_setDesc("LegendMasteryNets", "投網の技術を極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 網をより遠くから投げることができる。\n\n• 網スキルの疲労コストが[color=" + cN + "]-25%[/color]減少する。");

    _lcj_setDesc("LegendValaChantSenses", "詠唱を通じて感覚を強化する。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]感覚強化の詠唱[/color]を解放する。これは近くの味方に強化された知覚を付与する。");

    _lcj_setDesc("LegendInventorAnatomy", "敵の解剖学を研究する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 解剖スキルにより敵の種類についてより多くの情報が明らかになる。\n\n• 研究した敵の種類に対してダメージ[color=" + cP + "]+10%[/color]を得る。");

    _lcj_setDesc("LegendStaffBlock", "容赦するな！\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]杖のリポスト[/color]能力を付与する。これは近接攻撃を外した全ての敵に反撃することを可能にする。\n\n• [color=" + cS + "]杖のリポスト[/color]は[color=" + cN + "]3[/color] APと[color=" + cN + "]15[/color] 疲労を消費する。");

    _lcj_setDesc("LegendFavouredEnemyBeast", "獣の生態を研究し、それらとの戦い方を学んだ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 獣に対してダメージ[color=" + cP + "]+15%[/color]を得る。\n\n• 獣に対して近接技術[color=" + cP + "]+10[/color]を得る。");

    _lcj_setDesc("LegendFavouredEnemyGreenskin", "緑肌族の生態を研究し、それらとの戦い方を学んだ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 緑肌族に対してダメージ[color=" + cP + "]+15%[/color]を得る。\n\n• 緑肌族に対して近接技術[color=" + cP + "]+10[/color]を得る。");

    _lcj_setDesc("LegendFavouredEnemyCivilization", "文明的な敵の生態を研究し、それらとの戦い方を学んだ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 人間の敵に対してダメージ[color=" + cP + "]+15%[/color]を得る。\n\n• 人間の敵に対して近接技術[color=" + cP + "]+10[/color]を得る。");

    _lcj_setDesc("LegendFavouredEnemySwordmaster", "剣の達人の技を打ち破る方法を学んだ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 剣の達人と決闘者に対してダメージ[color=" + cP + "]+15%[/color]を得る。\n\n• 剣の達人と決闘者に対して近接防御[color=" + cP + "]+15[/color]を得る。");

    _lcj_setDesc("LegendPerfectFit", "防具の優れた装着感を活かし、このキャラクターは速度と持久力が向上する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 防具着用によるイニシアチブへのペナルティが[color=" + cP + "]50%[/color]減少する。\n\n• 防具着用による疲労へのペナルティが[color=" + cP + "]25%[/color]減少する。");

    _lcj_setDesc("LegendHidden", "周囲に溶け込み、敵から見えなくなる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]カモフラージュ[/color]スキルを解放する。このスキルは戦闘開始時にこのキャラクターを敵から見えなくする。\n\n• キャラクターが移動または攻撃するまで持続する。\n\n• [color=" + cN + "]0[/color] APを消費する。");

    _lcj_setDesc("LegendBallistics", "武器への習熟と訓練を通じて、あなたは自分の飛び道具がどのように飛ぶかを正確に知っている。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• クロスボウは目標との距離に応じてスケーリングする防具貫通ボーナスを得る。近接距離で最高、関連スキルの最大射程で最低となる。[color=" + cS + "]ボルト射撃[/color]は最大20%まで、[color=" + cS + "]重ボルト射撃[/color]と[color=" + cS + "]杭射撃[/color]は代わりに最大[color=" + cP + "]+30%[/color]まで得る。\n\n• すべての遠隔武器において、射程による命中率ペナルティがタイルごとに[color=" + cN + "]-2[/color]軽減される。\n\n• さらに、ハンドガンが[color=" + cP + "]+1[/color]の射程を得る。");
    _lcj_setDesc("LegendDebilitate", "足首、手、肘、膝——勝利を確実にするための汚い戦い方を学んだ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]デビリテート[/color]スキルを解放する。次の攻撃を強化して目標を3ターン間[color=" + cS + "]弱体化[/color]させ、与えるダメージを[color=" + cN + "]-25%[/color]減少させ、受けるダメージを[color=" + cP + "]+20%[/color]増加させる。\n\n• また、目標への[color=" + cS + "]弱体化[/color]の効果を、ダメージアウトをさらに[color=" + cN + "]-10%[/color]、ダメージインをさらに[color=" + cP + "]+10%[/color]増強する。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]15[/color]疲労");
    _lcj_setDesc("LegendReturnFavor", "倍返しで反撃せよ！\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]返礼[/color]スキルを解放する。発動時、このキャラクターへの近接攻撃を外した相手を[color=" + cS + "]気絶[/color]させる確率が[color=" + cP + "]75%[/color]となる。\n\n• [color=" + cS + "]気絶[/color]への免疫および耐性は引き続き適用される。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]15[/color]疲労");
    _lcj_setDesc("LegendDaze", "鮮やかな動きと音の連続で目標の感覚を揺さぶれ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]朦朧[/color]スキルを解放する。命中時に[color=" + cP + "]100%[/color]の確率で[color=" + cS + "]朦朧[/color]を与え、目標を1ターン間スキルを能動的に使用できない状態にする。\n\n• このスキルによる[color=" + cS + "]朦朧[/color]効果は抵抗できない。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendStun", "目標の目に向けて眩い白光を放ち、目を眩ませ戦闘不能にしようとする。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]気絶[/color]スキルを解放する。命中時に[color=" + cP + "]100%[/color]の確率で[color=" + cS + "]気絶[/color]を与え、目標を1ターン間完全に行動不能にする。\n\n• このスキルによる[color=" + cS + "]気絶[/color]効果は抵抗できない。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]15[/color]疲労");
    _lcj_setDesc("LegendHorrify", "耳をつんざくような異世界の音を響かせ、それを聞いた不運な者を間違いなく動揺させる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]戦慄[/color]スキルを解放する。目標に[color=" + cS + "]恐怖[/color]を引き起こそうとする。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]25[/color]疲労");
    _lcj_setDesc("LegendEntice", "光の技を使い、目標を魅了して思わず近づかずにはいられなくさせる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]誘惑[/color]スキルを解放する。目標をあなたの方へ引き寄せる。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]15[/color]疲労");
    _lcj_setDesc("LegendPush", "悪臭と有毒な臭いの混合物を調合し、目標が呼吸できるよう強制的に後退させる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]嫌悪[/color]スキルを解放する。目標を1タイルノックバックさせ、[color=" + cP + "]10[/color]疲労を与える。\n\n• ノックバックの確率は[color=" + cP + "]40%[/color]に加え、目標を上回る意思の各ポイントにつき[color=" + cP + "]2%[/color]追加される。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendPerfectFocus", "深呼吸して、仕事に取り掛かれ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]完全集中[/color]スキルを解放する。スタック式の[color=" + cS + "]完全集中[/color]を付与する。各スタックは使用時にAPを[color=" + cP + "]3[/color]増加させる。\n\n• アンデッドキャラクターも疲労がある場合はスタックを得ることができる。\n\n• コスト：[color=" + cN + "]6[/color] APおよび[color=" + cN + "]40[/color]疲労");
    _lcj_setDesc("LegendFirefield", "目標地点に猛烈な炎を放ち、爆発させて地面を燃え上がらせる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]炎の野[/color]スキルを解放する。目標タイルに[color=" + cP + "]3[/color]ターン持続する炎の野を生成し、その上に立つ者に[color=" + cP + "]10-25[/color]の燃焼ダメージを与える。\n\n• 生成時に爆発が起こり、[color=" + cP + "]5-15[/color]のダメージを与え、隣接タイルに[color=" + cS + "]燃焼[/color]を付与する。\n\n• [color=" + cS + "]炎の野[/color]は1日3回使用でき、[color=" + cS + "]休憩[/color]で補充される。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]15[/color]疲労");
    _lcj_setDesc("LegendSleep", "目標を短いが深い眠りに誘う。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]睡眠[/color]スキルを解放する。[color=" + cP + "]80%[/color]の基本確率で目標を[color=" + cP + "]2[/color]ターン間[color=" + cS + "]睡眠[/color]状態にする。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendImmovableObject", "踏ん張れ、嵐を耐え忍べ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 自分のターン中に移動しなかった場合、近接防御に[color=" + cP + "]+15[/color]を得る。このボーナスはキャラクターが攻撃すると失われる。\n\n• このボーナスは[color=" + cS + "]フットワーク[/color]のパッシブボーナスと重複する。");
    _lcj_setDesc("LegendLookout", "あなたはいつも最初に何かがおかしいと気づく。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 視界が[color=" + cP + "]+1[/color]増加する。\n\n• 待ち伏せを発見する確率が[color=" + cP + "]+10%[/color]増加し、敵との交戦前に1ラウンド余分な警告を受ける。");
    _lcj_setDesc("LegendSprint", "回避が唯一の選択肢の時、素早い足が役立つ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]疾走[/color]スキルを解放する。支配領域攻撃を発動させずに直線上を[color=" + cP + "]3[/color]タイル移動できる。コスト：[color=" + cN + "]6[/color] APおよび[color=" + cN + "]30[/color]疲労");
    _lcj_setDesc("LegendQuickStep", "素早い横歩きが大きな差を生む。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]クイックステップ[/color]スキルを解放する。APを消費せずに現在いるタイルに隣接するタイルへ移動できる。1ターンに1回限り。\n\n• コスト：[color=" + cN + "]0[/color] APおよび[color=" + cN + "]10[/color]疲労");
    _lcj_setDesc("LegendAthlete", "優雅さではなく、持久力とパフォーマンスのために作られた体。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 戦闘中の行動による疲労増加が[color=" + cP + "]10%[/color]軽減される。\n\n• このキャラクターの最大疲労が[color=" + cP + "]10%[/color]増加する。");
    _lcj_setDesc("LegendDoubleStrike", "腕に考えさせろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]薙ぎ払い[/color]、[color=" + cS + "]突き[/color]、[color=" + cS + "]叩き切り[/color]、[color=" + cS + "]斬り[/color]、[color=" + cS + "]打撃[/color]、[color=" + cS + "]断割り[/color]は[color=" + cN + "]-50%[/color]のダメージで[color=" + cN + "]-33%[/color]のAPと[color=" + cN + "]-33%[/color]の疲労コストで2回連続して使用できる。\n\n• この効果は他のスキルには適用されない。");
    _lcj_setDesc("LegendSpecPoison", "敵を毒殺する技術を極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 毒スキルの毒付与確率が[color=" + cP + "]+10%[/color]増加する。\n\n• あなたが付与する毒効果はスタックごとに[color=" + cP + "]+1[/color]ダメージを与える。");
    _lcj_setDesc("LegendPointBlank", "間近で接近戦を行え。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 隣接した敵への遠隔攻撃は命中率ペナルティを受けなくなる。\n\n• 隣接した目標への遠隔攻撃は防具の[color=" + cP + "]10%[/color]を無視する。");
    _lcj_setDesc("LegendEvasion", "被弾しにくくする方法を学んだ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接防御に[color=" + cP + "]+10[/color]、遠隔防御に[color=" + cP + "]+5[/color]を得る。");
    _lcj_setDesc("LegendRust", "相手の武器を破壊する方法を学んだ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]錆び[/color]スキルを解放する。目標の武器耐久値を[color=" + cN + "]-20[/color]減少させる。\n\n• コスト：[color=" + cN + "]3[/color] APおよび[color=" + cN + "]15[/color]疲労");
    _lcj_setDesc("LegendDeathtouch", "あなたの触れた者は死の運命を辿る。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]死の手[/color]スキルを解放する。防具を無視して目標の体力に直接[color=" + cN + "]-15[/color]のHPダメージを与える。この攻撃で対象を死亡させることはできない。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendPossessUndead", "アンデッドの心を支配せよ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]アンデッド支配[/color]スキルを解放する。アンデッドの目標を永続的に魅了する。\n\n• コスト：[color=" + cN + "]6[/color] APおよび[color=" + cN + "]30[/color]疲労");
    _lcj_setDesc("LegendMiasma", "有毒な煙の雲を吐き出し、吸い込んだ者の命を奪う。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]ミアズマ[/color]スキルを解放する。目標タイルに[color=" + cP + "]3[/color]ターン持続する有毒ガスの雲を生成し、踏み入った者に[color=" + cP + "]3[/color]の直接ダメージを与える。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendHex", "敵を呪え！\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]ヘックス[/color]スキルを解放する。目標に[color=" + cS + "]ヘックス[/color]を付与する。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendDarkflight", "空へ飛び立ち、上から死を降り注がせろ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]闇の飛翔[/color]スキルを解放する。最大[color=" + cP + "]4[/color]タイル先の目標地点まで飛翔し、隣接するすべての敵を攻撃する。\n\n• コスト：[color=" + cN + "]6[/color] APおよび[color=" + cN + "]30[/color]疲労");
    _lcj_setDesc("LegendSpecBandage", "野戦で傷を手当てする方法を学ぶ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]包帯[/color]が追加で[color=" + cP + "]+15[/color]ヒットポイントを回復する。\n\n• [color=" + cS + "]包帯[/color]の出血を止める確率が[color=" + cP + "]+20%[/color]増加する。");
    _lcj_setDesc("LegendHoldTheLine", "陣地を守り、味方を護れ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]戦線維持[/color]スキルを解放する。1ターン間、隣接する味方に近接防御[color=" + cP + "]+15[/color]を付与する。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendInspire", "あなたの励ましの言葉は最も意気消沈した兵士さえも奮い立たせることができる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]鼓舞[/color]スキルを解放する。隣接する味方の士気を1段階上げる。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendBloodyHarvest", "戦闘に突入し、報酬を刈り取れ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒すたびに疲労を[color=" + cP + "]10[/color]回復する。");
    _lcj_setDesc("LegendSlaughterer", "生き残りを出すな。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 最大ヒットポイントの[color=" + cN + "]50%[/color]以下を残す目標へのダメージが[color=" + cP + "]+25%[/color]増加する。");
    _lcj_setDesc("LegendVengeance", "倒れた者の仇を取れ！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 味方が倒されるかノックアウトされた時、[color=" + cP + "]2[/color]ターン間ダメージが[color=" + cP + "]+25%[/color]増加する。");
    _lcj_setDesc("LegendIronside", "敵の打撃に対して体を鍛え上げる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 有効防具値に[color=" + cP + "]+10[/color]を得る。このボーナスは防具へのすべての他の修正後に適用される。");
    _lcj_setDesc("LegendLastStand", "最後まで戦え！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヒットポイントが[color=" + cN + "]25%[/color]を下回った時、全ダメージが[color=" + cP + "]+25%[/color]増加する。");
    _lcj_setDesc("LegendRaiseUndead", "死者に立ち上がって仕えるよう命じろ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]アンデッド召喚[/color]スキルを解放する。隣接する死体をアンデッドの手下として蘇らせる。\n\n• コスト：[color=" + cN + "]6[/color] APおよび[color=" + cN + "]30[/color]疲労");
    _lcj_setDesc("LegendWither", "敵の力を奪え。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]ウィザー[/color]スキルを解放する。目標の近接技術、遠隔技術、イニシアチブを[color=" + cP + "]2[/color]ターン間[color=" + cN + "]-15[/color]減少させる。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendRebound", "あなたの体は衝撃を吸収する方法を覚えている。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 被弾するたびに疲労を[color=" + cP + "]5[/color]回復する。");
    _lcj_setDesc("LegendCoordinatedVolleys", "味方と連携して致命的な十字砲火を作り出せ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• そのターンにすでに別の味方が攻撃した目標への遠隔攻撃は追加で[color=" + cP + "]+10%[/color]のダメージを与える。");
    _lcj_setDesc("LegendForwardPush", "前進する時、守るべき陣線などない。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]前進押し込み[/color]スキルを解放する。目標を[color=" + cP + "]1[/color]タイルノックバックさせ、使用者が[color=" + cP + "]1[/color]タイル前進する。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendInsects", "虫の群れを放ち、敵の注意を散らし弱体化させる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]虫の大群[/color]スキルを解放する。目標に[color=" + cS + "]注意散漫[/color]を付与し、[color=" + cP + "]2[/color]ターン間すべての戦闘スキルを[color=" + cN + "]-5[/color]減少させる。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendChainLightning", "嵐の怒りを解き放て。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]連鎖雷撃[/color]スキルを解放する。目標と最大[color=" + cP + "]2[/color]体の隣接する追加目標に[color=" + cP + "]10-20[/color]の直接ダメージ（防具無視）を与える。\n\n• コスト：[color=" + cN + "]6[/color] APおよび[color=" + cN + "]35[/color]疲労");
    _lcj_setDesc("LegendComposure", "戦闘の激しさの中でも平静を保て。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 意思が[color=" + cP + "]+20[/color]増加する。");
    _lcj_setDesc("LegendNightvision", "あなたの目は暗闇でも見えるよう適応している。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 暗闇による視界ペナルティをすべて無視する。\n\n• 夜間に視界が[color=" + cP + "]+1[/color]増加する。");
    _lcj_setDesc("LegendMasteryStaves", "杖の技術を極める。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 杖スキルの疲労コストが[color=" + cN + "]-25%[/color]軽減される。\n\n• 特殊な杖技術へのアクセスを得る。");
    _lcj_setDesc("LegendMasteryMusic", "あなたの音楽の才能が頂点に達した。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 高度な音楽能力を解放する。\n\n• あなたの歌の効果が[color=" + cP + "]+25%[/color]増加する。");
    _lcj_setDesc("LegendRelax", "一息ついて気を取り直せ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]休憩[/color]スキルを解放する。疲労を[color=" + cP + "]30[/color]回復する。\n\n• コスト：[color=" + cN + "]4[/color] APで、戦闘中1回のみ使用可能。");
    _lcj_setDesc("LegendGruesomeFeast", "敵の肉を食らい、体力を回復する。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]凄惨な饗宴[/color]スキルを解放する。隣接する死体を食らい、[color=" + cP + "]10-20[/color]ヒットポイントを回復する。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendUberNimble", "防具の重荷から解放され、自由に戦え。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 胴体防具も兜も装備していない間、追加で[color=" + cP + "]+2[/color]ニンブルスタックを得る。");
    _lcj_setDesc("LegendMuscularity", "あなたの強靭な体格が戦闘で優位をもたらす。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接技術に[color=" + cP + "]+10[/color]、近接防御に[color=" + cP + "]+5[/color]を得る。\n\n• 最大疲労が[color=" + cP + "]10[/color]増加する。");
    _lcj_setDesc("LegendBattleheart", "あなたの心は戦いのリズムで鼓動する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒した後、APを[color=" + cP + "]3[/color]回復する。");
    _lcj_setDesc("LegendTrueBeliever", "あなたの信仰が耐え忍ぶ力を与えてくれる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 意思が[color=" + cP + "]+20[/color]増加する。\n\n• 祈祷スキルの効果が[color=" + cP + "]+25%[/color]増加する。");
    _lcj_setDesc("LegendPoisonImmunity", "あなたの体はあらゆる毒に対する耐性を身につけた。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• すべての毒効果に完全な免疫を得る。");
    _lcj_setDesc("LegendSummonCat", "忠実な猫の仲間を呼び寄せろ。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]猫召喚[/color]スキルを解放する。あなたの傍らで戦う猫の仲間を召喚する。\n\n• コスト：[color=" + cN + "]4[/color] APおよび[color=" + cN + "]20[/color]疲労");
    _lcj_setDesc("LegendSpawnZombieLow", "最近死んだ者をよろめく手下として蘇らせる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒した時、[color=" + cP + "]25%[/color]の確率でゾンビとして蘇らせる。");
    _lcj_setDesc("LegendSpawnZombieMed", "より強力なアンデッドの僕を蘇らせる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒した時、[color=" + cP + "]40%[/color]の確率でゾンビとして蘇らせる。");
    _lcj_setDesc("LegendSpawnZombieHigh", "ネクロマンシーの習熟により、最も強力なアンデッドを蘇らせることができる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒した時、[color=" + cP + "]60%[/color]の確率でゾンビとして蘇らせる。");
    _lcj_setDesc("LegendSpawnSkeletonLow", "倒れた者の骨を動かせ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を倒した時、[color=" + cP + "]25%[/color]の確率でスケルトンとして蘇らせる。");
    _lcj_setDesc("LegendTeacher", "あなたが習得した技術は感化力があり、それを目にした者の好奇心を刺激する。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• あなたと共に戦った全ての者に「Student」パークを付与する。");
    _lcj_setDesc("LegendScry", "他の誰にも見えないものを感知するあなたの卓越した感覚を活かす。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]スクライ[/color]スキルを解放する。12タイル以内の全てを明らかにする。\n\n• コスト：AP [color=" + cN + "]3[/color]、疲労 [color=" + cN + "]15[/color]。");
    _lcj_setDesc("LegendTeleport", "この世界を渡り歩き、ある場所から消えて即座に別の場所に現れる。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 最大8タイルのテレポートが可能な[color=" + cS + "]テレポート[/color]スキルを解放する。\n\n• コスト：AP [color=" + cN + "]4[/color]、疲労 [color=" + cN + "]40[/color]。");
    _lcj_setDesc("LegendSpecialistShieldPush", "無駄な動きなしに盾を使う方法を習得する。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ノックバック[/color]スキルの疲労とAPコストが[color=" + cP + "]25%[/color]軽減される。");
    _lcj_setDesc("LegendValaChantFury", "血が沸き立つような詠唱で、味方を戦いに駆り立てる。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]憤怒の詠唱[/color]スキルを解放する。ヴァーラ自身を含むヴァーラの3タイル以内の全ての味方に、ヴァーラの意思の[color=" + cP + "]5%[/color]に基づくスケーリングダメージ増加を付与する。\n\n• さらに、近接範囲で攻撃を受けた際に反撃する確率がヴァーラの意思の[color=" + cP + "]40%[/color]に等しい確率で付与される。\n\n• 反撃ダメージはヴァーラの意思の[color=" + cP + "]30%[/color]に基づいてスケーリングされる。\n\n• この詠唱の効果はヴァーラから1タイル離れるごとに[color=" + cN + "]25%[/color]減少する。\n\n• コスト：AP [color=" + cN + "]3[/color]、疲労 [color=" + cN + "]30[/color]。");
    _lcj_setDesc("LegendMasterySlings", "遠方からの投石器の難しい角度とタイミングを極める。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• スリングスキルの疲労コストが[color=" + cN + "]25%[/color]軽減される。\n\n• スリングとスリングショットの命中率が[color=" + cP + "]+10%[/color]増加し、スタッフスリングの命中率が[color=" + cP + "]+5%[/color]増加し、スリングとスリングショットの最大射程が[color=" + cP + "]+1[/color]増加する。\n\n• 片手スリング使用中にターン中に待機するか[color=" + cS + "]Wind Up[/color]を使用すると、[color=" + cS + "]Prepare Bullet[/color]効果が追加され、イニシアチブの[color=" + cP + "]10%[/color]分ダメージが増加し、攻撃射程が[color=" + cP + "]+1[/color]増加する。\n\n• さらに、スタッフスリングで爆弾とフラスコを投擲できるようになる。");
    _lcj_setDesc("LegendBarrage", "敵が影の中で戦うことを楽しんでくれると良いが。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]スリング投石[/color]は頭部命中で[color=" + cS + "]衰弱[/color]を、体部命中で[color=" + cS + "]困惑[/color]を与え、盾ボーナスを無視するようになる。\n\n• [color=" + cS + "]ハンドガン射撃[/color]は頭部命中で[color=" + cS + "]砲撃恐怖症[/color]を与える。\n\n• [color=" + cS + "]重投石[/color]は頭部命中で気絶を与える。\n\n• [color=" + cS + "]ボルト射撃[/color]、[color=" + cS + "]貫通ボルト射撃[/color]、[color=" + cS + "]杭射撃[/color]の頭部命中は[color=" + cS + "]ボルト装填[/color]のコストをAP [color=" + cN + "]0[/color]、疲労 [color=" + cN + "]10[/color]に下げる。");
    _lcj_setDesc("LegendFavouredEnemyOccult", "懐疑的な精神はオカルトの術策を断ち切り、鋼鉄に立ち向かう脆い形だけを残す。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• オカルトと戦う際に近接技術、遠隔技術、最大ダメージ、意思にボーナスを付与する。このボーナスはキャラクターがオカルトを倒すたびに増加する。\n\n• 倒すごとの増加量：\n  - Alp | [color=" + cP + "]+0.25%[/color]\n  - Demon Alp | [color=" + cP + "]+1%[/color]\n  - Hexe | [color=" + cP + "]+0.5%[/color]\n  - Coven Leader | [color=" + cP + "]+2%[/color]\n  - Geist | [color=" + cP + "]+0.125%[/color]\n  - Höllenhound | [color=" + cP + "]+0.125%[/color]\n  - Winselmutter | [color=" + cP + "]+0.25%[/color]\n  - Schrat | [color=" + cP + "]+1%[/color]\n  - Sapling | [color=" + cP + "]+0.2%[/color]\n  - Ifrit | [color=" + cP + "]+0.125%[/color]\n  - Greenwood Schrat | [color=" + cP + "]+1%[/color]\n  - Greenwood Sapling | [color=" + cP + "]+0.4%[/color]\n\n• 15%以上になると、以下のオカルトの指導者を狩る極めて難しい伝説的契約を受ける可能性が高まる：Demon Alps、Greenwood Schrats、Hexe Coven Leaders。");
    _lcj_setDesc("LegendFavouredEnemyUndead", "よたよたとした死体が波のように押し寄せ、眠ることなく墓から蘇る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• アンデッドと戦う際に近接技術、遠隔技術、最大ダメージ、意思にボーナスを付与する。このボーナスはキャラクターがアンデッドを倒すたびに増加する。\n\n• 倒すごとの増加量：\n  - Wiederganger | [color=" + cP + "]+0.01%[/color]\n  - Wiederganger Yeoman | [color=" + cP + "]+0.1%[/color]\n  - Fallen Hero | [color=" + cP + "]+0.2%[/color]\n  - Necromancer | [color=" + cP + "]+0.25%[/color]\n  - Ancient Auxiliary | [color=" + cP + "]+0.01%[/color]\n  - Ancient Legionary | [color=" + cP + "]+0.2%[/color]\n  - Honor Guard | [color=" + cP + "]+0.5%[/color]\n  - Ancient Priest | [color=" + cP + "]+0.5%[/color]\n  - Phylactery | [color=" + cP + "]+1%[/color]\n  - Ancient Gladiator | [color=" + cP + "]+0.5%[/color]\n  - Flying Skull | [color=" + cP + "]+0.04%[/color]\n  - Necrosavant | [color=" + cP + "]+0.25%[/color]\n  - Necrosavant Lord | [color=" + cP + "]+0.5%[/color]\n  - Höllenhound | [color=" + cP + "]+0.125%[/color]\n  - Embalmed Slave | [color=" + cP + "]+0.25%[/color]\n  - Embalmed Soldier | [color=" + cP + "]+0.5%[/color]\n  - Embalmed Noble | [color=" + cP + "]+1%[/color]\n  - Embalmed Priest | [color=" + cP + "]+1.25%[/color]\n  - Embalmed Queen | [color=" + cP + "]+2%[/color]\n\n• アンデッドのチャンピオンに遭遇する可能性が高まる。");
    _lcj_setDesc("LegendFavouredEnemyOutlaw", "野蛮な者たちは根絶やしにすべき疫病だ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 無法者や犯罪者と戦う際に近接技術、遠隔技術、最大ダメージにボーナスを付与する。このボーナスはキャラクターがアウトローを倒すたびに増加する。\n\n• 倒すごとの増加量：\n  - Rabble | [color=" + cP + "]+0.025%[/color]\n  - Thug | [color=" + cP + "]+0.0625%[/color]\n  - Poacher | [color=" + cP + "]+0.0625%[/color]\n  - Marksman | [color=" + cP + "]+0.125%[/color]\n  - Raider | [color=" + cP + "]+0.125%[/color]\n  - Veteran | [color=" + cP + "]+0.2%[/color]\n  - Bandit Leader | [color=" + cP + "]+0.25%[/color]\n  - Warlord | [color=" + cP + "]+1%[/color]\n  - Warhound | [color=" + cP + "]+0.0625%[/color]\n  - Thrall | [color=" + cP + "]+0.1%[/color]\n  - Reaver | [color=" + cP + "]+0.25%[/color]\n  - Chosen | [color=" + cP + "]+0.25%[/color]\n  - Drummer | [color=" + cP + "]+0.25%[/color]\n  - Beastmaster | [color=" + cP + "]+0.125%[/color]\n  - King | [color=" + cP + "]+1%[/color]\n  - Indebted | [color=" + cP + "]+0.04%[/color]\n  - Cutthroat | [color=" + cP + "]+0.0625%[/color]\n  - Outlaw | [color=" + cP + "]+0.125%[/color]\n  - Nomad Slinger | [color=" + cP + "]+0.1%[/color]\n  - Nomad Archer | [color=" + cP + "]+0.0625%[/color]\n  - Nomad Leader | [color=" + cP + "]+0.25%[/color]\n\n• アウトローのチャンピオンに遭遇する可能性が高まる。\n\n• 15%以上になると、山賊軍が集落を占領するのを阻止する契約や重要なバーバリアンの囚人を護送する極めて難しい伝説的契約を受ける可能性が高まる。");
    _lcj_setDesc("LegendForcefulSwing", "腰と体幹の力を使い、振りにさらなる力を込めろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接AOEスキルのダメージが[color=" + cP + "]+10%[/color]増加する。");
    _lcj_setDesc("LegendBalance", "防具のバランスを整えることで、様々な脅威への防御が可能になる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 遠隔防御が[color=" + cP + "]+15[/color]増加する。防具と兜の重量ペナルティの合計5ポイントごとに、このボーナスが[color=" + cN + "]1[/color]減少するが、代わりに近接防御が最大15まで[color=" + cP + "]1[/color]増加する。");
    _lcj_setDesc("LegendInTheZone", "防具の防護力と機動性を活かし、敵のミスに乗じろ！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接技術と近接ダメージを[color=" + cP + "]0.5%[/color]ずつ増加させる（最大[color=" + cP + "]12.5%[/color]）スタック型バフを得る。\n\n• 近接攻撃を回避すると[color=" + cP + "]0.5%[/color]増加し、いかなる攻撃を受けると[color=" + cN + "]1%[/color]減少する。\n\n• 近接戦闘中は近接ダメージボーナスが2倍になり、最大[color=" + cP + "]25%[/color]まで増加する。\n\n• イニシアチブが防具の重量（最大疲労へのペナルティ）の2倍を上回る場合、防具の重量が15を超えた分のスタック数でバトルを開始する。");
    _lcj_setDesc("LegendSpecSpearWall", "スピアウォールで防線を維持する無数の訓練が、それを第二の本能とした。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]スピアウォール[/color]の疲労コストが[color=" + cN + "]-50%[/color]軽減される。\n\n• [color=" + cS + "]スピアウォール[/color]のAPコストが[color=" + cN + "]1[/color]軽減される。\n\n• [color=" + cS + "]スピアウォール[/color]のダメージが[color=" + cP + "]+25%[/color]増加する。");
    _lcj_setDesc("LegendThrustMaster", "突くべきでない場所を突くのは、ある者にとって自然な性分だ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]突き[/color]、[color=" + cS + "]二叉突き[/color]、[color=" + cS + "]串刺し[/color]、[color=" + cS + "]貫き[/color]、[color=" + cS + "]破砕突き[/color]、[color=" + cS + "]心臓狙い[/color]、[color=" + cS + "]グレイブ斬り[/color]のダメージが[color=" + cP + "]+15%[/color]増加する。\n\n• また、スピアやジャベリンを投擲する際のタイルごとの命中率ペナルティも除去される。");
    _lcj_setDesc("LegendAssuredConquest", "自信はパフォーマンスに影響する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]自信[/color]の士気状態にある時、近接技術、遠隔技術、近接防御、遠隔防御が[color=" + cP + "]+10%[/color]増加する。\n\n• これらのボーナスは士気状態の低下に応じて減少する：[color=" + cS + "]安定[/color]時は[color=" + cP + "]+5%[/color]、[color=" + cS + "]崩壊[/color]時は[color=" + cN + "]-5%[/color]、[color=" + cS + "]逃走[/color]時は[color=" + cN + "]-10%[/color]。「高慢」特性のマイナス効果を除去する。");
    _lcj_setDesc("LegendBlendIn", "関わるのが割に合わないと思わせる振る舞いをし、木に寄りかかり、敵との間に物を置き、仲間の後ろに隠れろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 仲間の代わりに自分が攻撃される可能性が[color=" + cP + "]50%[/color]低下する。\n\n• 遠隔防御が[color=" + cP + "]+5[/color]、近接防御が[color=" + cP + "]+3[/color]増加する。");
    _lcj_setDesc("LegendSpecStaffStun", "杖を大きく回転させ、追加の力を込めて打ち込むための動きを極めろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 通常[color=" + cS + "]朦朧[/color]を与えるはずの杖での攻撃は、[color=" + cS + "]気絶[/color]と[color=" + cS + "]よろめき[/color]も与えるようになる。");
    _lcj_setDesc("LegendMinnesanger", "「我が城壁の外へ出よ、高価な上衣を纏いて。汝は高貴の身と申すが、我には宦官と聞こえるぞ。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 歌スキルの疲労コストが[color=" + cN + "]25%[/color]、APコストが[color=" + cN + "]1[/color]軽減される。\n\n• [color=" + cS + "]命の歌[/color]の効果を[color=" + cP + "]3[/color]ヒットポイント、[color=" + cS + "]軍歌[/color]の効果を[color=" + cP + "]2[/color]疲労それぞれ増加させる。");
    _lcj_setDesc("LegendSpecUnarmed", "素手格闘の武術を極めろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]素手[/color]、[color=" + cS + "]蹴り[/color]、[color=" + cS + "]組み付き[/color]、[color=" + cS + "]絞め技[/color]、[color=" + cS + "]タックル[/color]の疲労コストを[color=" + cN + "]25%[/color]軽減する。\n\n• [color=" + cS + "]素手[/color]で与える疲労を[color=" + cP + "]5[/color]増加させ、APコストを[color=" + cN + "]1[/color]軽減する。\n\n• [color=" + cS + "]蹴り[/color]の[color=" + cS + "]朦朧[/color]確率が[color=" + cP + "]50%[/color]に増加し、命中率が[color=" + cP + "]15%[/color]増加する。\n\n• [color=" + cS + "]組み付き[/color]の命中率が[color=" + cP + "]100%[/color]になる。");
    _lcj_setDesc("LegendGrappler", "敵との組み技の達人になれ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]組み付き[/color]と[color=" + cS + "]絞め技[/color]の疲労コストが[color=" + cN + "]25%[/color]軽減される。\n\n• [color=" + cS + "]組み付き[/color]の持続時間が[color=" + cP + "]1[/color]ターン延長される。");
    _lcj_setDesc("LegendPugilist", "拳を致死的な武器として鍛えろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]素手[/color]のダメージが[color=" + cP + "]+25%[/color]増加する。\n\n• 素手攻撃の防具貫通が[color=" + cP + "]+10%[/color]増加する。");
    _lcj_setDesc("LegendPummelIntoSubmission", "敵を打ちのめして屈服させろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 同じ目標への[color=" + cS + "]素手[/color]の連続攻撃は、攻撃ごとに[color=" + cP + "]+10%[/color]の追加ダメージを与える。");
    _lcj_setDesc("LegendAmbidextrous", "両手を同等に使いこなす。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 副手の武器攻撃がダメージ減少なしでフルダメージを与える。\n\n• 二刀流時の命中率ペナルティが[color=" + cP + "]5%[/color]軽減される。");
    _lcj_setDesc("LegendFieldTreats", "兵士たちを戦闘可能な状態に保つための特製食糧を準備せよ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 野営中に特製野戦食を準備する能力を解放する。準備した野戦食を兵士に与えることで戦闘ボーナスを付与できる。");
    _lcj_setDesc("LegendSmashingShields", "強力な一撃はいかなる防御も砕く。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 盾での殴り攻撃が盾に対して[color=" + cP + "]+20%[/color]の追加ダメージを与える。\n\n• 敵の盾を破壊すると、その敵が[color=" + cS + "]よろめき[/color]状態になる。");
    _lcj_setDesc("LegendSmackdown", "地面に叩きつけろ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵を[color=" + cS + "]転倒[/color]状態にする打撃武器による攻撃は、追加で[color=" + cP + "]20%[/color]のダイレクトダメージ（防具無視）を与える。");
    _lcj_setDesc("LegendBoneBreaker", "壊滅的な力で骨を砕け。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 敵に対して少なくとも[color=" + cP + "]20[/color]HPのダイレクトダメージを与える攻撃は、ランダムな[color=" + cS + "]負傷[/color]を与える確率が[color=" + cP + "]20%[/color]ある。\n\n• この確率は武器やスキルによる既存の負傷確率と重複する。");
    _lcj_setDesc("LegendClarity", "研ぎ澄まされた精神は瞬間をより鮮明に捉え、必要な重要な瞬間に時間がゆっくりと流れるように感じさせる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• あらゆるダメージの追加[color=" + cP + "]+10%[/color]が防具を無視する。\n\n• [color=" + cS + "]朦朧[/color]、[color=" + cS + "]酔い[/color]、[color=" + cS + "]二日酔い[/color]、[color=" + cS + "]挑発[/color]、[color=" + cS + "]よろめき[/color]、[color=" + cS + "]恐怖[/color]、[color=" + cS + "]脳震盪[/color]、または[color=" + cS + "]動揺[/color]状態では機能しない。\n\n• 以下のポーションの効果下では防具無視ボーナスが2倍になる：鉄の意思、獅子心、猫、第二の風、またはヘクセン・イコール。");
    _lcj_setDesc("LegendAlert", "常に細心の注意を払い、周囲を観察してあらゆる手がかりから洞察を得る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• イニシアチブが[color=" + cP + "]+20%[/color]上昇する。");
    _lcj_setDesc("LegendBloodbath", "他者の苦しみに喜びを見出す。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• フィールド上で[color=" + cS + "]出血[/color]しているか一時的な[color=" + cS + "]負傷[/color]を持つキャラクターごとに、近接技術、遠隔技術、疲労回復、意思を獲得する。出血している敵に隣接している場合、ボーナスが2倍になる。\n\n• 疲労回復ボーナスは5を超えることができない。");
    _lcj_setDesc("LegendTerrifyingVisage", "このキャラクターを見ただけで敵は逃げ出す。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 隣接する敵の意思を[color=" + cN + "]-15[/color]低下させる。");
    _lcj_setDesc("LegendFreedomOfMovement", "熟練した傭兵は防具に関わらず自由に動くことができる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]クライム[/color]、[color=" + cS + "]突進[/color]、[color=" + cS + "]フットワーク[/color]、[color=" + cS + "]ローテーション[/color]、[color=" + cS + "]跳躍[/color]、[color=" + cS + "]クイックステップ[/color]、[color=" + cS + "]回避[/color]の疲労コストを[color=" + cN + "]50%[/color]削減する。\n\n• [color=" + cS + "]クライム[/color]、[color=" + cS + "]フットワーク[/color]、[color=" + cS + "]ローテーション[/color]のアクションポイントコストを[color=" + cN + "]1[/color]、[color=" + cS + "]跳躍[/color]を[color=" + cN + "]3[/color]、[color=" + cS + "]回避[/color]を[color=" + cN + "]2[/color]削減する。\n\n• このパークを取得すると、[color=" + cS + "]戦術的機動[/color]と[color=" + cS + "]クイックステップ[/color]がパークツリーに追加される。");
    _lcj_setDesc("LegendOnslaught", "速度を落とすな！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 自分のイニシアチブが相手より高い場合、あらゆる武器のヒットごとに[color=" + cS + "]困惑[/color]を付与する[color=" + cP + "]50%[/color]の確率を得る。\n\n• [color=" + cS + "]困惑[/color]した敵はダメージ、最大疲労、イニシアチブが[color=" + cN + "]-15%[/color]低下する。\n\n• 防具100ポイントごとに近接ダメージが[color=" + cP + "]2%[/color]増加する。");
    _lcj_setDesc("LegendBackToBasics", "長年の鍛錬により、このキャラクターは極度のストレス下で本能と基本訓練に立ち返る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• このキャラクターがダメージを受けると、次のターン開始まで近接防御が[color=" + cP + "]+5[/color]スタック累積する。\n\n• [color=" + cS + "]逃走[/color]中にダメージを受けた場合、立て直すチャンスがある。確率は意思の半分に等しい。\n\n• キャンプでのトレーニング速度が[color=" + cP + "]+10%[/color]増加する。");
    _lcj_setDesc("LegendPushTheAdvantage", "頸静脈を掴め！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]衰弱[/color]、[color=" + cS + "]転倒[/color]、または骨折した腕のような負傷効果を受けている対象への頭部ヒットダメージと頭部命中率が追加で[color=" + cP + "]20%[/color]上昇する。\n\n• また、以下の効果のいずれかを受けている対象への頭部ヒットダメージと頭部命中率が[color=" + cP + "]+10%[/color]上昇する：[color=" + cS + "]困惑[/color]、[color=" + cS + "]朦朧[/color]、[color=" + cS + "]気散じ[/color]、[color=" + cS + "]組み付かれ[/color]、[color=" + cS + "]網拘束[/color]、[color=" + cS + "]根拘束[/color]、[color=" + cS + "]砲撃恐怖症[/color]、[color=" + cS + "]睡眠[/color]、[color=" + cS + "]よろめき[/color]、[color=" + cS + "]気絶[/color]、[color=" + cS + "]脆弱[/color]、[color=" + cS + "]蜘蛛の巣拘束[/color]、または[color=" + cS + "]萎縮[/color]。");
    _lcj_setDesc("LegendBruiser", "あなたの筋肉は止めることのできない力であり、あらゆる一撃で防具を粉砕する！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 使用するあらゆる武器の防具への有効性が[color=" + cP + "]+10%[/color]増加する。");
    _lcj_setDesc("LegendMindOverBody", "純粋な意思の力で、人間の限界を超えて身体を追い込む。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 意思が60を超えるポイントごとに、スキルの疲労コストと被弾時の疲労コストが段階的に削減される。\n\n70 意思：[color=" + cN + "]7%[/color]疲労削減\n80 意思：[color=" + cN + "]10%[/color]疲労削減\n90 意思：[color=" + cN + "]18%[/color]疲労削減\n100 意思：[color=" + cN + "]22%[/color]疲労削減\n120 意思：[color=" + cN + "]29%[/color]疲労削減\n140 意思：[color=" + cN + "]34%[/color]疲労削減\n160 意思：[color=" + cN + "]39%[/color]疲労削減");
    _lcj_setDesc("LegendEscapeArtist", "他者には魔法に見えるが、その器用な手先は異なることを知っている。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 網や蜘蛛の巣などの拘束効果からの[color=" + cS + "]拘束解除[/color]に99%のベース確率を付与する。\n\n• [color=" + cS + "]拘束解除[/color]のアクションポイントコストを[color=" + cN + "]1[/color]削減する。");
    _lcj_setDesc("LegendGatherer", "地形と植生の知識により、キャンプでの採集時に豊富な機会をもたらす。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• キャンプで採集に割り当てられた際、このパークを持つキャラクターが特殊アイテムを見つけるボーナスが[color=" + cP + "]2倍[/color]になる。\n\n• このパークの有無に関わらず採集に割り当てられた全キャラクターの合計ボーナスが10%を超えると、きのこ、毒薬、解毒剤、粉末を調合せずに見つけることができる。");
    _lcj_setDesc("LegendPotionBrewer", "ポーションと薬液の専門知識により、キャンプでの採集中にポーションを作成できる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• このスキルは採集中にライオンハート、鉄の意思、回復、猫ポーションを作成する確率を解放する。薬剤師、ドルイド、錬金術師またはヴァーラがポーション醸造師のための素材を採集しなければならない。\n\n• 全醸造師（[color=" + cS + "]ポーション醸造師[/color]パーク）の合計レベルが[color=" + cP + "]35[/color]を超え、薬剤師（背景または[color=" + cS + "]採集[/color]パーク）が[color=" + cP + "]45[/color]を超えると、採集テントがアップグレードされた際に知識のポーションを作成する確率を得る。\n\n• 調合テントでのアルコール醸造を解放する。");
    _lcj_setDesc("LegendSpecCultHood", "苦痛の中に私たちは自己の真実を見出す。奉仕を超えた我々のアイデンティティはなく、我々の栄光は苦悶である。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• カルティストフードで顔を隠している間、合計意思の[color=" + cP + "]+15%[/color]が近接防御と遠隔防御のボーナスとして加算される。\n\n• カルティストレザーフード、レザーヘルメット、袋、腐敗した袋兜、ウォーロックフード、またはダヴクールの仮面でも機能する。\n\n• カルティストフードと袋を作成するための調合レシピを解放する。");
    _lcj_setDesc("LegendSpecCultArmor", "苦しみの中にのみ真実を知ることができる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• カルティストローブ、蛮族の皮、骨防具、またはウォーロックローブを着用している間、失ったヒットポイントの[color=" + cP + "]+75%[/color]を意思として獲得する。\n\n• 隣接する敵対エンティティごとに最大ダメージが[color=" + cP + "]+5%[/color]増加する。\n\n• カルティストローブを作成するための調合レシピを解放する。");
    _lcj_setDesc("LegendPrepareBleed", "敵を見定め、動脈を探す時間は、戦場での流血として報われる。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 次の一撃を次の2ターン間、[color=" + cD + "]5[/color]の[color=" + cS + "]出血[/color]ダメージを与えるように準備する[color=" + cS + "]出血準備[/color]スキルを解放する。\n\n• [color=" + cN + "]2[/color] APと[color=" + cN + "]15[/color]疲労を消費する。\n\n• クリーバーまたはムチで[color=" + cS + "]二刀流[/color]している場合、両方の攻撃が[color=" + cS + "]出血[/color]を付与する。");
    _lcj_setDesc("LegendPrepareGraze", "長く、ゆっくりと、深く切り刻む傷が多くの出血傷を残す。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 次の一撃を次の5ターン間、[color=" + cD + "]2[/color]の[color=" + cS + "]出血[/color]ダメージを与えるように準備する[color=" + cS + "]掠り傷準備[/color]スキルを解放する。\n\n• [color=" + cN + "]2[/color] APと[color=" + cN + "]15[/color]疲労を消費する。");
    _lcj_setDesc("LegendCarnage", "出血しているなら、殺せる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]出血[/color]している敵を攻撃する際、ダメージが[color=" + cP + "]20%[/color]増加する。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 次の一撃を次の2ターン間、[color=" + cD + "]5[/color]の[color=" + cS + "]出血[/color]ダメージを与えるように準備する[color=" + cS + "]出血準備[/color]スキルを解放する。\n\n• [color=" + cN + "]2[/color] APと[color=" + cN + "]15[/color]疲労を消費する。\n\n• クリーバーまたはムチで[color=" + cS + "]二刀流[/color]している場合、両方の攻撃が[color=" + cS + "]出血[/color]を付与する。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 次の一撃を次の5ターン間、[color=" + cD + "]2[/color]の[color=" + cS + "]出血[/color]ダメージを与えるように準備する[color=" + cS + "]掠り傷準備[/color]スキルを解放する。\n\n• [color=" + cN + "]2[/color] APと[color=" + cN + "]15[/color]疲労を消費する。");
    _lcj_setDesc("LegendUntouchable", "隠れ続けることは巧みな変装以上のものであり、戦いの混乱の中で流れ弾や矢を避ける準備が必要だ。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• カムフラージュを2ターン延長する。");
    _lcj_setDesc("LegendOpportunist", "戦いで提示される機会を最大限に活用する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]出血[/color]または[color=" + cS + "]毒状態[/color]の敵にヒットが成功した際、[color=" + cS + "]朦朧[/color]を付与する。\n\n• 煙幕の中にいる場合、近接技術が[color=" + cP + "]+10%[/color]上昇し、遠隔技術にペナルティがなくなる。");
    _lcj_setDesc("LegendPrepared", "刃に毒を塗る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ダガーを使用中、敵にヒットポイントダメージを与えた際に[color=" + cP + "]+33%[/color]の確率で毒状態にする。\n\n• メインハンドにダガーを持っている間、近接技術が[color=" + cP + "]+12[/color]、ターンごとの疲労回復が[color=" + cP + "]+3[/color]増加する。");
    _lcj_setDesc("LegendLurker", "「一人の方がうまくいく。」\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 味方も敵も2タイル以内にいない場合、遠隔防御が[color=" + cP + "]+30%[/color]、イニシアチブが[color=" + cP + "]+20[/color]、アクションポイントが[color=" + cP + "]+3[/color]増加する。\n\n• [color=" + cS + "]隠密[/color]状態の場合、ターンごとの疲労回復が[color=" + cP + "]+10[/color]、遠隔技術が[color=" + cP + "]+20%[/color]増加する。\n\n• 煙幕の中にいる場合、最大アクションポイントが[color=" + cP + "]+2[/color]増加する。");
    _lcj_setDesc("LegendNightRaider", "夜間に強化された視野と戦術的優位を得る。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 視野が[color=" + cP + "]+1[/color]増加し、夜間ペナルティの影響を受けなくなる。\n\n• 夜間に攻撃する際、隣接する敵の意思が[color=" + cN + "]10[/color]低下する。\n\n• 夜間の戦闘中、近接および遠隔技術が[color=" + cP + "]+10%[/color]増加する。");
    _lcj_setDesc("LegendAdaptive", "老犬に新しい芸が教えられないと誰が言った？\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n 手に装備しているものに基づいて、このキャラクターのパークツリーに新しいパークグループを追加する。以下の順序で確認される...\n\n• [color=" + cP + "]メインハンドアイテム：[/color]常に最初に確認され、武器パークグループよりも「スペシャリスト」クラスが優先される。\n\n• [color=" + cP + "]ハイブリッド武器：[/color]キャラクターが持っていないパークグループが付与されるか、どちらも持っていない場合は該当する武器タイプからランダムに付与される。\n\n• [color=" + cP + "]オフハンドアイテム：[/color]上記と同様。\n\n• [color=" + cP + "]素手：[/color]アイテムが装備されていない場合、素手パークグループを持っていなければ素手パークグループが付与される。\n\n•[color=" + cP + "]防具：[/color]防具の重量が[color=" + cN + "]0[/color]から[color=" + cN + "]15[/color]の場合、軽防具パークグループを受け取る。重量が[color=" + cN + "]16[/color]から[color=" + cN + "]35[/color]の場合、中防具パークグループを受け取る。重量が[color=" + cN + "]35[/color]を超える場合、重防具パークグループを受け取る。\n\n• [color=" + cN + "]装備しているアイテムの全パークグループを持っている場合、持っていないランダムな特性パークグループが付与される。[/color]\n\n• このキャラクターがレベル[color=" + cP + "]15[/color]に達すると、消費したパークポイントが返還される。");
    _lcj_setDesc("LegendRecuperation", "時間をかけてより効果的に回復する。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 戦闘終了時に失ったヒットポイントの[color=" + cP + "]30%[/color]を回復し、負傷の回復が[color=" + cP + "]1[/color]日速くなる。");
    _lcj_setDesc("LegendClimb", "比類なき速度で崖を登ることを習得する！\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 一つのアクションで最大5段階の高さの絶壁を登ることができる[color=" + cS + "]クライム[/color]スキルを解放する。\n\n• 支配領域攻撃を発動しない。\n\n• [color=" + cN + "]3[/color] APと[color=" + cN + "]20[/color]疲労を消費する。");
    _lcj_setDesc("LegendFashionable", "実質より見た目。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• タバード、クローク、兜の装飾レイヤーの重量が0になる。これは[color=" + cS + "]ニンブル[/color]と[color=" + cS + "]ライズ[/color]に影響する。");
    _lcj_setDesc("LegendHelpful", "戦いでの兵站支援を強化する。\n\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• バッグからアイテムを渡すことができる[color=" + cS + "]アイテム受け渡し[/color]スキルを解放する。[color=" + cS + "]クイックハンズ[/color]を取得するとアクションポイントコストが[color=" + cN + "]2[/color]削減される。\n\n• アイテムを受け取る際には機能しない。\n\n• [color=" + cN + "]2[/color] APと[color=" + cN + "]5[/color]疲労を消費する。");
    _lcj_setDesc("LegendAssassinate", "影から攻撃することで敵の防御を回避し、無防備な弱点を突くことができる。\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 茂みや煙の中での[color=" + cS + "]隠密[/color]状態の間、最大および最小ダメージが[color=" + cP + "]+20%[/color]増加する。\n\n• 隠密の技に特化した暗殺者は代わりに[color=" + cP + "]+30%[/color]を得る。\n\n• 隠密と暗殺においてより致命的なマスター暗殺者は[color=" + cP + "]+50%[/color]を得る。");
    _lcj_setDesc("LegendMealPreperation", "優秀な一座のコックは、手に入るものから何でも料理を作り、野営を撤収する前に腹を満たしてくれる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• このキャラクターをキャンプのCamp Kitchenに配属すると、より良い食料報酬を得るチャンスが解放される。\n\n• チャンスと報酬はレベルアップとともに増加する。お粥、パイ、プリンなどが含まれる。");
    _lcj_setDesc("LegendAlcoholBrewing", "まともな野営には、あり合わせで作った蒸留器が欠かせない。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• このキャラクターをキャンプのCamp Kitchenに配属すると、報酬としてアルコールを得るチャンスが解放される。\n\n• 報酬はレベルアップとともに増加する。ビール、ワイン、ミードなどが含まれる。\n\n• クラフトテントでのアルコール醸造が可能になる。");
    _lcj_setDesc("LegendHorseCharge", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 馬の重さと速さを活かして前方に突進する。最大4マス移動して敵を攻撃する。");
    _lcj_setDesc("LegendHorsePirouette", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 素早く向きを変えることを学ぶことで、敵から逃げる際に必要な方向転換が素早くできるようになる。");
    _lcj_setDesc("LegendHorseBitting", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 馬をビットとブライドルの感触に慣れさせることで、動きのコントロールが容易になる。戦闘中の防御値が騎乗者の近接防御の25%分増加する。");
    _lcj_setDesc("LegendHorseDesensitization", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 大きな音や突然の動作を使って、騎乗者が指示するまで馬が戦場の音に反応しないよう訓練する。戦闘中の近接攻撃が騎乗者の近接攻撃の25%分増加する。");
    _lcj_setDesc("LegendHippology", "動物の生理学の知識を活かして、より良い食事、運動、世話を提供できる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 一座のロバのヒットポイントを[color=" + cP + "]25%[/color]増加し、積載量を[color=" + cP + "]+12[/color]増加する。\n\n• 複数の傭兵が同じパークを所持していても効果は重複しない。");
    _lcj_setDesc("LegendHorseImpulsion", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 馬術の生理学を効果的に活用することで、脊椎がリラックスし後肢が効果的に機能するようになる。イニシアチブが25%増加する。");
    _lcj_setDesc("LegendHorseLeadChange", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 馬の前脚は疲れることがある。馬に脚の入れ替えを訓練することで、疲れを防ぐことができる。移動に必要な疲労が25%減少する。");
    _lcj_setDesc("LegendHorseLegControl", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 弓を射る際に手綱を持つことはできない。馬と騎乗者は足を使ってコミュニケーションを取ることを学ばなければならない。戦闘中の遠隔攻撃が25%増加する。");
    _lcj_setDesc("LegendHorseLongeing", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• ロングラインで調教することで、馬と騎乗者の信頼関係が深まる。意思が25%増加する。");
    _lcj_setDesc("LegendHorseParthianShot", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 動く馬から射撃することは容易ではなく、安定してこの技を習得するには徹底した練習が必要だ。遠隔攻撃が25%増加する。");
    _lcj_setDesc("LegendHorsePiaffe", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 馬を動かし続けることで集中力を維持し、迫りくる戦闘への準備ができる。戦闘中の近接攻撃が25%増加する。");
    _lcj_setDesc("LegendHorseTempiChange", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 最も難易度の高い脚の入れ替え技術であるテンピチェンジは、前脚を前後に入れ替える動作を必要とする。この訓練により、馬は状況に応じて前脚を変えることができ、射撃を受けている際に役立つ。遠隔防御が25%増加する。");
    _lcj_setDesc("LegendHorseCollection", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 馬の姿勢を鍛えることで、高度な動作が容易になり疲労が少なくなる。疲労が25%増加する。");
    _lcj_setDesc("LegendHorseFlyingChange", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 高速での脚の入れ替えは高度な技で、馬がより長い距離をカバーできるようにする。アクションポイントが1増加する。");
    _lcj_setDesc("LegendHorsePassage", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 脚をより高く上げ、より力強く踏み込む訓練をすることで、馬が荒地や泥地に備えられる。荒地での移動コストが減少する。");
    _lcj_setDesc("LegendMeistersanger", "恥ずかしい歌を歌って貴族を馬鹿にするような段階は卒業した。今やあなたは名声を博した音楽家であり、その見事なメロディは一座を戦場の熱狂へと駆り立てることができる。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]Martial March[/color]スキルを解放する。8タイル以内の全ての味方のAPを[color=" + cN + "]1[/color]増加する（1ターン）。\n\n• コスト：AP [color=" + cN + "]9[/color]、疲労 [color=" + cN + "]45[/color]。");
    _lcj_setDesc("LegendLacerate", "血への渇望が身体を駆け巡り、一撃一撃が比類なき獰猛さで引き裂く。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• あらゆる武器でヒットポイントに直接ダメージを与えた対象に、軽微だが長続きする[color=" + cS + "]出血[/color]を引き起こす。\n\n• この[color=" + cS + "]出血[/color]は1ターンあたり[color=" + cD + "]2[/color]ダメージを与え、5ターン継続する。\n\n• この効果は重複する。");
    _lcj_setDesc("LegendPeaceful", "誰もが戦いに向いているわけではない。思索や職人仕事に充足感を見出す者もいる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cP + "]+20[/color]の意思と[color=" + cP + "]+5%[/color]の経験値獲得を付与する代わりに、近接技術と遠隔技術が[color=" + cN + "]-20[/color]減少する。\n\n• 控えに回ることに満足し、控え中の食料消費が半減する。\n\n• 戦闘中、このキャラクターは味方に[color=" + cP + "]+3[/color]の意思と[color=" + cP + "]+1%[/color]のXP獲得を付与する。");
    _lcj_setDesc("LegendSummonHound", "猟犬との絆を深めることで、その呼び声に応える能力が身につく。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 忠実な猟犬を戦闘に召喚する。\n\n• コスト：AP [color=" + cN + "]5[/color]、疲労 [color=" + cN + "]15[/color]。");
    _lcj_setDesc("LegendSummonWolf", "オオカミとの関係を築くことで、彼らを傍に呼ぶことができるようになる。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• オオカミを戦闘の援軍として召喚する。\n\n• コスト：AP [color=" + cN + "]7[/color]、疲労 [color=" + cN + "]15[/color]。");
    _lcj_setDesc("LegendSummonFalcon", "長年タカに餌を与え世話をすることで、彼らはあなたの友となる。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• タカを戦闘の先導役として召喚する。\n\n• コスト：AP [color=" + cN + "]6[/color]、疲労 [color=" + cN + "]15[/color]。");
    _lcj_setDesc("LegendSummonBear", "動物との絶え間ない交流により、クマの信頼を勝ち取った。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• ペットのクマを貯蔵庫に追加する。このパークを取る前にスペースを確認すること。\n\n• 森でクマを手懐けるイベントを解放する。");
    _lcj_setDesc("LegendSummonCatapult", "攻城兵器の製造と整備に関するスキルを役立てる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n クラフトテントでカタパルトの製造が可能になる。");
    _lcj_setDesc("LegendNetRepair", "長年の網の修理と梱包の経験により、網を製作しより効果的に扱えるようになる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 網の補充コストを10に削減する。\n\n• 網を持っている間、[color=" + cP + "]+10[/color]の近接防御を付与する。\n\n• 装備中および鞄の中の網の重量を無視する。");
    _lcj_setDesc("LegendNetCasting", "網を投げる技術を極める。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 網と強化網の投擲射程を[color=" + cP + "]2[/color]増加し、爆弾の投擲射程を[color=" + cP + "]1[/color]増加する。\n\n• 網を投擲する際に、遠隔技術と遠隔防御に基づくチャンスで追加の隣接目標を捕らえる。捕らえる目標が増えるほどチャンスは低下する。");
    _lcj_setDesc("LegendPacifist", "戦争は残忍で粗暴な趣味だ。多くの人々は激しい暴力に頻繁に遭遇しない生活を好む。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cP + "]+10%[/color]の意思を付与する。\n\n• このキャラクターは控えにいながら戦闘から経験値を獲得できるようになる。\n\n• さらに、ゲーム難易度の決定においてこのキャラクターはパーティの戦力としてカウントされない。\n\n• 控えに回ることに満足するが、やむなく攻撃に出るたびに気分が悪化する。");
    _lcj_setDesc("LegendHorseMovement", "[color=" + cA + "][u]パッシブ:[/u][/color]\n馬のように、平地では素早く、沼地や山岳地では遅く移動する。");
    _lcj_setDesc("LegendCampCook", "料理には素人目にはわからない巧みな技術と食材があり、それが味の世界を広げ、食料をより長く保存することを可能にする。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• クラフトテントでの食料製造が可能になる。\n\n• お粥、プリン、パイ、肉の塩漬け、果物の乾燥、携行食の製造が可能になる。");
    _lcj_setDesc("LegendPackleader", "犬は本能的にパックのリーダーを見分ける。彼らの習性を知ることで、あなた自身がパックのリーダーになれる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 追加の犬アイテムを鞄に保管し、戦闘で使用できるようになる。");
    _lcj_setDesc("LegendDogWhisperer", "あなたは犬との対話に長けており、あなたとの絆が各犬に自信と強さを与え、あなたがいることで彼らに力が宿る。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• あなたが放った犬それぞれに、[color=" + cS + "]コロッサス[/color]、[color=" + cS + "]堅固な精神[/color]、[color=" + cS + "]アンダードッグ[/color]のパークを付与する。");
    _lcj_setDesc("LegendDogBreeder", "犬の世話と繁殖に必要な条件についての深い知識で、犬の繁殖に成功できる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• クラフトテントで犬の繁殖レシピが解放される。");
    _lcj_setDesc("LegendDogHandling", "犬の訓練技術を極めた。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• 戦闘の最中、猟犬はあなたの命令に応答し反応する。味方を攻撃させるか守らせるかを命令する。\n\n• コスト：AP [color=" + cN + "]3[/color]、疲労 [color=" + cN + "]0[/color]。");
    _lcj_setDesc("LegendDogMaster", "動物との対話能力は、あなたに害を与えようとする犬さえも引き込むほどに達している。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cN + "]1[/color]個の食料を消費することで、犬を戦闘から逃走させることができる。\n\n• 食料は無作為に選ばれ、食料が25未満の場合このパークは機能しない。\n\n• コスト：AP [color=" + cN + "]4[/color]、疲労 [color=" + cN + "]0[/color]。");
    _lcj_setDesc("LegendHeightenedReflexes", "研ぎ澄まされた感覚が、攻撃を急所へと導く。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 現在のイニシアチブの[color=" + cP + "]15%[/color]がダメージに変換される。");
    _lcj_setDesc("LegendWindReader", "不確かな状況での矢の軌跡を見積もる風読みの技を習得した。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• キャラクターの基本遠隔防御の3分の1を遠隔技術として獲得し、最低でも[color=" + cP + "]3[/color]のボーナスを得る。\n\n• 高地の優位がある場合、レベル差1つにつき[color=" + cP + "]+5%[/color]の遠隔ダメージを獲得する。");
    _lcj_setDesc("LegendPaymaster", "数字を操ることは一種の芸術だ。支払い条件と高利貸しを交渉することで、傭兵の報酬を引き下げることができる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 一座の全傭兵の日当をバータースキルの値に等しいパーセンテージ分引き下げる。\n\n• このパークは一座につき1人分しかカウントされない。");
    _lcj_setDesc("LegendQuartermaster", "大量料理、残り物の活用、食べ残しの保存によって一座の食料を節約できる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 傭兵1人あたりの食料消費を[color=" + cN + "]1[/color]削減する。\n\n• このパークは一座につき1人分しかカウントされない。");
    _lcj_setDesc("LegendBarterGreed", "このキャラクターは一座が蓄えた黄金の山を守ることに執着しており、命懸けでそれを守ろうとしている。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 貯蔵庫の10,000クラウンごとに：\n- 近接技術と遠隔技術に[color=" + cP + "]+1[/color]獲得。\n- 近接防御と遠隔防御に[color=" + cP + "]+1[/color]獲得。\n- 意思に[color=" + cP + "]+1.5[/color]獲得。\n- イニシアチブに[color=" + cP + "]+1.5[/color]獲得。\n\n• クラウンによるボーナスの上限は160000クラウンである。\n\n• さらに、グローバルのバータースキルは常に[color=" + cN + "](1 + このパークを持つ傭兵数)[/color]で割られる。");
    _lcj_setDesc("LegendHolyFlame", "古の神々があなたにその光を操る力を授けた。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]Holy Flame[/color]スキルを解放する。\n\n• 発動すると、あるタイルとその周囲のタイルに2ターンの間、浄化の地の効果を付与する。\n\n• エリア内の人間の味方は[color=" + cS + "]浄化済み[/color]になり、ダメージを受けた際の[color=" + cS + "]負傷[/color]、[color=" + cS + "]出血[/color]、[color=" + cS + "]毒状態[/color]、[color=" + cS + "]士気チェック[/color]に対して免疫を得る。\n\n• カルティストとアンデッドは[color=" + cS + "]聖別[/color]状態になり、毎ターン[color=" + cD + "]10[/color]から[color=" + cD + "]20[/color]のダメージを受け、[color=" + cS + "]負傷[/color]、[color=" + cS + "]出血[/color]、[color=" + cS + "]毒[/color]への免疫を失う。\n\n• 聖別されたウィクトは[color=" + cS + "]歴戦の強靭[/color]を失う。\n\n• さらに、炎が活性化している間、エリア内でアンデッドは復活できない。\n\n• コスト：AP [color=" + cN + "]7[/color]、疲労 [color=" + cN + "]30[/color]。");
    _lcj_setDesc("LegendShieldsUp", "シールドウォールの訓練で部下の反応速度を高め、戦場での早期の死を防ぐ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• このパークを取ると、盾を持つ全傭兵が各戦闘開始前に[color=" + cS + "]シールドウォール[/color]を使用するようになる。");
    _lcj_setDesc("LegendIncoming", "一斉攻撃するよう味方を誘導し、強化されたスキルと防御を付与する。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]Incoming![/color]スキルを解放する。4タイル以内の全ての味方に1ターンの間、[color=" + cP + "]+5[/color]の遠隔技術、[color=" + cP + "]+5[/color]の意思、[color=" + cP + "]+10[/color]の遠隔防御を付与する。\n\n• コスト：AP [color=" + cN + "]5[/color]、疲労 [color=" + cN + "]20[/color]。");
    _lcj_setDesc("LegendZombieBite", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• のうみそ…");
    _lcj_setDesc("LegendCheerOn", "歌の才能を活かして味方を鼓舞する。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]Cheer On[/color]スキルを解放する。隣接する味方に[color=" + cP + "]+2[/color]のアクションポイントを付与する。\n\n• 楽器またはバナーを装備している場合のみ使用可能。\n\n• コスト：AP [color=" + cN + "]4[/color]、疲労 [color=" + cN + "]30[/color]。");
    _lcj_setDesc("LegendLeap", "運動能力を活かして高く遠くへ跳躍する。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]跳躍[/color]スキルを解放する。2タイルの距離を素早くカバーできる。\n\n• 疲労コストは防具の重量に応じて増加する。\n\n• コスト：AP [color=" + cN + "]6[/color]、疲労 [color=" + cN + "]15[/color]。");
    _lcj_setDesc("LegendTumble", "アクロバット技術を活かして攻撃を回避し、危機から脱出する。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 隣接するタイルが空いている限り、攻撃者がヒットするために2回の成功ロールを必要とするチャンスを付与する。遠隔攻撃の場合は近接防御、近接攻撃の場合は遠隔防御を再ロールに使用する。再ロールに成功すると、ランダムなタイルへ移動する。\n\n• 根拘束または気絶中は無効。\n\n• 「Lucky」または[color=" + cS + "]プレモニション[/color]と重複し、どちらかのチャンスが再ロールのチャンスに加算される。");
    _lcj_setDesc("LegendHairSplitter", "長年の練習で頭上のリンゴを的に物を投げ続けた結果、頭蓋骨への吸引力が身についた。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 頭部への命中率が[color=" + cP + "]+30%[/color]増加する。");
    _lcj_setDesc("LegendBearform", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 強力なクマに変身し、ヒットポイントが2倍になる。手が空いている必要がある。");
    _lcj_setDesc("LegendRoots", "根と蔓を召喚して敵を拘束する。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]根拘束[/color]スキルを解放する。8タイル以内の任意の敵を[color=" + cS + "]根拘束[/color]状態にできる。\n\n• [color=" + cS + "]根拘束[/color]された敵の近接防御、遠隔防御、イニシアチブが[color=" + cN + "]35%[/color]減少する。\n\n• 雨の影響下では、APコストが[color=" + cN + "]1[/color]、疲労コストが[color=" + cN + "]10[/color]減少する。\n\n• コスト：AP [color=" + cN + "]6[/color]、疲労 [color=" + cN + "]15[/color]。");
    _lcj_setDesc("LegendWolfform", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 敏捷なオオカミに変身し、移動コストが減少する。手が空いている必要がある。");
    _lcj_setDesc("LegendTrueForm", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 変身の持続時間を6ターンに延長する。");
    _lcj_setDesc("LegendSummonStorm", "元素を操り、雨を降らせる。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]嵐の召喚[/color]スキルを解放する。\n\n• 最初の詠唱で小雨をもたらし、2回目の詠唱で激しい嵐をもたらす。\n\n• 素手でなければならない。\n\n• コスト：AP [color=" + cN + "]4[/color]、疲労 [color=" + cN + "]20[/color]。");
    _lcj_setDesc("LegendCallLightning", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 敵に雷を呼び落とす。4タイル以内の各ユニットに10%の確率で落雷する。素手でなければならず、雨が降っている必要がある。");
    _lcj_setDesc("LegendScryTrance", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 使用者の周囲12タイルの範囲を透視する。キャンセルするまでトランス状態の間、使用者は移動も行動もできない。最低1ターンのチャネリングが必要。");
    _lcj_setDesc("LegendReadOmensTrance", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 使用者がトランス状態に入り、全ての味方に彼らの未来を告げる。攻撃者がヒットするために2回の成功ロールを必要とする[color=" + cP + "]10%[/color]のチャンスを付与する。");
    _lcj_setDesc("LegendDistantVisions", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• このキャラクターはキャンプの外で長時間一人過ごし、遠くを見つめながら奇妙な樹皮を吸っている。使用者が町の遠視を見ることができるようになる。コンティに控えているこのキャラクターが毎朝、特定の町の現在のイベントと建物について洞察を与えてくれる。");
    _lcj_setDesc("LegendScrollIngredients", "長年にわたる古代語の研究がついに役立つ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 布と染料が与えられた際に巻物を作成できる。\n\n• 作成される巻物はランダムで以下のいずれかになる：「Scroll of .Nut'in」、「Scroll of Natural Talent」、「Battle Scroll」、「Scroll of Experience」、「Scroll of Training」。それぞれ交易品になる、使用者にGiftedレベルアップを付与する、3戦闘の間[color=" + cP + "]50%[/color]の追加経験値を得る、即座に[color=" + cP + "]100-150[/color]経験値を得る、または即座に[color=" + cP + "]1[/color]トレーニングポイントを得る効果を持つ。\n\n• これらの巻物は使用者を[color=" + cS + "]Irritable[/color]状態にするが、本や巻物を読む場合よりも日数クールダウンが大幅に短い。また、読める本や巻物の数に悪影響を与えない。");
    _lcj_setDesc("LegendScholar", "勉学に全力を注ぐ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 他の条件が満たされているか「dumb」特性を持っているかに関わらず、使用者をイベントにおいて「educated」とみなす。\n\n• 倒した敵から通常では手に入らないアイテムを[color=" + cP + "]10%[/color]の確率で獲得する。\n\n• 自身と同様の効果と重複する。戦闘中でなくてもこのパークは機能する。");
    _lcj_setDesc("LegendCitrinitas", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 強力な成分の混合物がトランス状態を引き起こし、使用者のターン終了時に一座の全員にバナー効果と戦太鼓効果を付与する。");
    _lcj_setDesc("LegendAlbedo", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 秘密の素材から作られた調合物により、目標の防具を最大25回復させることができる。");
    _lcj_setDesc("LegendNigredo", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 酸性蒸気の錬金術的混合物をフラスコに封入し、敵に投げつけて防具を溶かす。");
    _lcj_setDesc("LegendHerbcraft", "様々な根草や薬草の特性についての知識を活かして、基本的な素材から薬を作ることができる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• クラフトテントで薬、解毒剤、毒の製造が可能になる。");
    _lcj_setDesc("LegendWoodworking", "木を切り削る能力は、習得する者が少ない技芸だ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• クラフトテントで粗木から上質な木材の製造が可能になる。\n\n• このキャラクターがキャンプ中に木材を収穫できるようになる。");
    _lcj_setDesc("LegendOreHunter", "「さあ若者よ、若く立派な君よ、暗い陰気な鉱山では幸運を求めるな」\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• キャンプでSupply Tentに配属されている間、このキャラクターが鉱物を採掘できるようになる。");
    _lcj_setDesc("LegendSurpressUrges", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• このキャラクターがある程度の範囲で変身を制御できるようになり、変身中に味方と敵を無差別に攻撃しなくなる。");
    _lcj_setDesc("LegendControlInstincts", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• 変身中にキャラクターが自制心を持てるようになる。");
    _lcj_setDesc("LegendMasterAnger", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• キャラクターが任意に変身できるようになり、戦闘中にランダムで変身しなくなる。");
    _lcj_setDesc("LegendMagicBurningHands", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 手のひらから灼熱の熱を放ち、最大9つの目標に10〜15のダメージを与える。");
    _lcj_setDesc("LegendMagicChainLightning", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 敵に向けて雷を放ち、隣接する2体の敵に連鎖させる。");
    _lcj_setDesc("LegendMagicCircleOfProtection", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 詠唱範囲内の全ての味方を守る魔法の円を形成する。円を離れると守護が消える。");
    _lcj_setDesc("LegendMagicDaze", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 召喚したカラフルな火花、回転音、爆発音の連続で目標の感覚を攻撃する。この圧倒的な演示は誰でも[color=" + cS + "]困惑[/color]させ、効果的に戦えなくする。\n\n ダメージを与えない。");
    _lcj_setDesc("LegendMagicHailstone", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 重い氷の塊を召喚して敵を打ち砕く。");
    _lcj_setDesc("LegendMagicHealingWind", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 4タイル以内の全ての味方のヒットポイントを回復する。魔法の杖を持っている必要がある。");
    _lcj_setDesc("LegendMagicImbue", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 誰かに魔法の力を吹き込み、一時的に命中率とダメージを向上させる。");
    _lcj_setDesc("LegendMagicLevitate", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 誰かを空中に浮かせ、短時間の間あらゆる地形を自由に移動できるようにする。");
    _lcj_setDesc("LegendMagicMissile", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 敵に向かって力の奔流を放つ。");
    _lcj_setDesc("LegendMagicPsybeam", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 敵にビームの形で精神攻撃を放ち、[color=" + cS + "]気絶[/color]または[color=" + cS + "]朦朧[/color]状態にする。ダメージを与えない。");
    _lcj_setDesc("LegendMagicSleep", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 心地よい蒸気を使って敵を眠りに誘う。成功確率は使用者と目標の意思によって決まる。");
    _lcj_setDesc("LegendMagicSoothingWind", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 4タイル以内の全ての味方の疲労を回復する。魔法の杖を持っている必要がある。");
    _lcj_setDesc("LegendMagicTeleport", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 短距離テレポートする。");
    _lcj_setDesc("LegendMagicWebBolt", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 蜘蛛の巣のネットを放って対手を捕らえ、根拘束させ、ダメージ、防御、イニシアチブを半減させる。");
    _lcj_setDesc("LegendMasteryBurningHands", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 熱の強度を増し、Burning Handsのダメージを2倍にする。");
    _lcj_setDesc("LegendMasteryChainLightning", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• 雷が命中率+10%と射程+1を得る。");
    _lcj_setDesc("LegendMasteryHailstone", "[color=" + cA + "][u]アクティブ:[/u][/color]\n• Hailstoneが防具を65%無視できるようになり、防具に対して125%のダメージを与える。");
    _lcj_setDesc("LegendMagicMissileFocus", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• Magic MissileのAPコストを1減少させる。");
    _lcj_setDesc("LegendMagicMissileMastery", "[color=" + cA + "][u]パッシブ:[/u][/color]\n• Magic MissileのAPコストを1減少させる。Magic Missileの基本疲労コストを6減少させる。");
    _lcj_setDesc("LegendBoondockBlade", "隠れた場所で敵を不意打ちにする。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 草むらなどの隠れ場所にいる間、近接技術、遠隔技術、近接防御、遠隔防御に[color=" + cP + "]+10[/color]のボーナスを得る。");
    _lcj_setDesc("LegendThrowSand", "目に砂が入っては戦えない。\n[color=" + cA + "][u]アクティブ:[/u][/color]\n• [color=" + cS + "]Throw Dirt[/color]スキルを解放する。敵の目に土を投げつけて気散じ状態にする。\n\n• [color=" + cS + "]気散じ[/color]状態の敵はイニシアチブとダメージが[color=" + cN + "]35%[/color]減少する。\n\n• 1戦闘につき1回しか使用できない。\n\n• コスト：AP [color=" + cN + "]3[/color]、疲労 [color=" + cN + "]5[/color]。");
    _lcj_setDesc("LegendBackflip", "サーカスの動作における徹底した訓練により、驚異的な速さで危険から逃れることができる。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]フットワーク[/color]または[color=" + cS + "]跳躍[/color]パークを持っている場合、それらの射程が[color=" + cP + "]1[/color]増加する。");
    _lcj_setDesc("LegendTwirl", "パートナーとの身体動作の練習により、相手の体を旋回させるリードができるようになった。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ローテーション[/color]が敵を対象にできるようになる。");
    _lcj_setDesc("LegendDeflect", "直接受け止めるのではなく、横に払いのける方法を学ぶ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 盾が受けるダメージが最低[color=" + cD + "]1[/color]を下限に[color=" + cN + "]-50%[/color]減少する。");
    _lcj_setDesc("LegendTasteThePain", "痛みによって活力がみなぎる。\n[color=" + cA + "][u]パッシブ:[/u][/color]負傷によって通常士気チェックが発生する場合、代わりに士気が[color=" + cP + "]10[/color]上昇する。");
    _lcj_setDesc("LegendLionheart", "獅子の心は揺るぎない強さで打ち続け、あらゆる試練に恐れなく立ち向かう！\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 意思が[color=" + cP + "]10%[/color]増加する。\n\n• 敵に囲まれても士気に影響しなくなる。");
    _lcj_setDesc("LegendStrengthInNumbers", "包囲し、気散じさせ、確実に攻撃する。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接での命中率ボーナスが、目標を包囲・気散じさせている味方1人につき[color=" + cP + "]+10%[/color]と2倍になる。");
    _lcj_setDesc("LegendBackswing", "蓄積した慣性を活かして2撃目で大打撃を与える。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]円弧斬り[/color]、[color=" + cS + "]スイング[/color]、[color=" + cS + "]打ち込み[/color]、[color=" + cS + "]刈り払い[/color]、[color=" + cS + "]懲罰打[/color]、[color=" + cS + "]粉砕[/color]、[color=" + cS + "]収穫[/color]、[color=" + cS + "]連続スイング[/color]を行った後、[color=" + cN + "]-50%[/color]の疲労とAPでフォローアップを行える。[color=" + cS + "]スイング[/color]のダメージは[color=" + cN + "]-25%[/color]、他のスキルのダメージは[color=" + cN + "]-50%[/color]減少する。\n\n• 移動、ターン終了、または待機するとこの効果は消える。");
    _lcj_setDesc("LegendHimshaw", "「つまるところ、我々は仕立て屋だ。」\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• この傭兵は自分の装備を自ら手入れする。1日1回、戦闘終了時に胴体防具とヘルメットを[color=" + cN + "]20%[/color]修理する。\n\n• 毎日の開始時にも、胴体防具とヘルメットをさらに[color=" + cN + "]10%[/color]修理する。");
    _lcj_setDesc("LegendSwagger", "高価でよく磨かれた防具は攻撃をそらし、矢を払い除けるようだ。少なくともほとんどの傭兵はそう思っている。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 戦闘開始時にヘルメットと防具の価値の[color=" + cP + "]0.2%[/color]を防具耐久として獲得し、その半分をヘルメットに付与する。戦闘終了時に取り除かれる。\n\n• 最終的な防具ボーナスは防具の重量1ポイントにつき[color=" + cP + "]1%[/color]増加する（防具重量が50なら50%多く受け取る）。");
    _lcj_setDesc("LegendKeenEyesight", "優れた視力を活かして最小限の動作を捉え、対手の次の攻撃を予測し、遠くの目標を狙い、飛んでくる飛び道具を回避する方法を学ぶ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 視力が7を超えるポイントごとに、近接技術[color=" + cP + "]+3[/color]・遠隔技術[color=" + cP + "]+5[/color]のボーナスを得る。\n\n• 視力が7を超えるポイントごとに、近接防御[color=" + cP + "]+3[/color]・遠隔防御[color=" + cP + "]+4[/color]のボーナスを得る。\n\n• ヘルメットが視力スコアを少なくとも3/5ポイント下げる場合、これらのボーナスが[color=" + cN + "]10%/20%[/color]減少する。\n\n• このパークの目的上、現在の視力はヘルメットなしで計算され、上記のペナルティのみが適用される。");
    _lcj_setDesc("LegendSleightOfHand", "袖の中のエース。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 現在装備しているアモを使用する投擲アイテムが毎ターン1アモ回復する。");
    _lcj_setDesc("LegendPromisedPotential", "生まれ持った才能、開花する。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 取得時に、各属性の星の数に応じて全属性を[color=" + cP + "]1-6[/color]増加させる。才能なしの属性は[color=" + cP + "]1[/color]、才能ありは星1つにつき[color=" + cP + "]2[/color]増加する。");
    _lcj_setDesc("LegendWheelMaintenance", "真のキャラバン使いは、道路や荒野での定期的な車輪整備が不可欠であることを知っている。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ワールドマップの移動速度が[color=" + cP + "]5%[/color]増加する。重複する。");
    _lcj_setDesc("LegendMasterTrainer", "「剣は我が親友。それは我が命。命を極めるように剣を極めなければならない。」\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• このキャラクターがトレーニングテントにいる間、訓練中の全キャラクターがキャンプでの訓練速度に追加[color=" + cP + "]+10%[/color]を得る。");
    _lcj_setDesc("LegendWhipThemInShape", "「この虫けらどもにも、まだ私を尊重させることができるかもしれない。」\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 一座のベテラン傭兵が行うキルは、まだベテランでない傭兵に[color=" + cP + "]+100%[/color]の共有XPを獲得させる。\n\n• ベテランはレベル12以上の傭兵。このキャラクターは戦闘に参加していなくてもこの効果は機能する。");
    _lcj_setDesc("LegendTacticalManeuvers", "全ての戦いはダンスのようなものだ。あなたにはまさに適切な動きがある。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• [color=" + cS + "]ローテーション[/color]スキルを解放する。どちらのキャラクターも[color=" + cS + "]気絶[/color]、[color=" + cS + "]根拘束[/color]、その他行動不能でない限り、2体のキャラクターが支配領域を無視して場所を入れ替えることができる。\n\n• [color=" + cS + "]フットワーク[/color]スキルを解放する。支配領域から自由攻撃を受けずに離れることができる。\n\n• コスト：AP [color=" + cN + "]3[/color]、疲労 [color=" + cN + "]20[/color]。");
    _lcj_setDesc("LegendVersatile", "しばしば、一つのことの達人よりも優れている。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 近接攻撃で攻撃する際に次の攻撃の遠隔ダメージに[color=" + cP + "]25%[/color]のボーナスを付与し、遠隔攻撃で攻撃する際に次の攻撃の近接ダメージに[color=" + cP + "]25%[/color]のボーナスを付与する。攻撃が外れると効果は消える。\n\n• 基本遠隔技術の[color=" + cP + "]10%[/color]を近接技術として、基本近接技術の[color=" + cP + "]10%[/color]を遠隔技術として獲得する。");
    _lcj_setDesc("LegendAnchor", "陣地を守れ！\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ターン中に移動していない間、スタック式の近接技術、遠隔技術、近接防御ボーナスを得る。戦闘開始時に1スタックからスタートする。\n\n• 最初のスタックで[color=" + cP + "]5[/color]のボーナス、以降スタックごとに1少なく最大5スタックで[color=" + cP + "]15[/color]まで付与される。\n\n• [color=" + cS + "]よろめき[/color]を受けると代わりにスタックが1減少する。");
    _lcj_setDesc("LegendFirstBlood", "早起きは三文の徳！\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ヒットポイントが満タンの敵に対して、近接と遠隔攻撃両方でダメージが[color=" + cP + "]20%[/color]増加し、[color=" + cS + "]負傷[/color]を与えるしきい値が[color=" + cN + "]50%[/color]下がる。");
    _lcj_setDesc("LegendPatientHunter", "敵を慎重に評価し、好機を待つ。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• ターン終了時に余剰アクションポイントが最大3まで次のターンに持ち越される。");
    _lcj_setDesc("LegendSpecDualWield", "両手に武器を持って戦う技術を極める。\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 二刀流の際、オフハンド武器のダメージペナルティが[color=" + cN + "]-66%[/color]から[color=" + cN + "]-50%[/color]に軽減される。");
    _lcj_setDesc("LegendFeint", "うまく配置された陽動は敵を脆弱にする！\n\n[color=" + cA + "][u]パッシブ:[/u][/color]\n• 攻撃を外した場合、通常より疲労コストが[color=" + cN + "]-20%[/color]少なくなる。\n\n• 攻撃を外した後、相手を[color=" + cS + "]受け流し[/color]状態にし、防御を[color=" + cN + "]10[/color]低下させる。");
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
