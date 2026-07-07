// Things I ALWAYS want applied are done after the hasFotn check, the others are done alone

// Perks Reworks/Tweaks (replacements, less compatible) - Not applied with Fotn on

// For some perks, I do both compatible and not compatible changes (additions and overwrites)
// In that case, these perks will be edited two times, here. See LegendFieldTriage for example

if (!::TLW.hasFOTN)
{
	// Replacements (Less compatible)
	::Const.Strings.PerkDescription.LegendFieldTriage = "Spend medicine to heal a unit on the battlefield.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Field Triage[/color]スキルを習得する。このスキルは隣接する味方1人のヒットポイントを最大[color=" + this.Const.UI.Color.PositiveValue + "]20[/color]、さらにその最大ヒットポイントの[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]まで回復する。\n\n• 回復したヒットポイント[color=" + this.Const.UI.Color.PositiveValue + "]2 + 1%[/color]ごとに薬品を[color=" + this.Const.UI.Color.NegativeValue + "]1[/color]使用し、1回のスキル使用での上限は10。\n\n• AP[color=" + this.Const.UI.Color.NegativeValue + "]4[/color]、疲労[color=" + this.Const.UI.Color.NegativeValue + "]16[/color]を消費する。"
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendFieldTriage].Tooltip = ::Const.Strings.PerkDescription.LegendFieldTriage;

	::Const.Strings.PerkDescription.LegendPrayerOfFaith = "A prayer of devotion grants strength to your allies and baffles the undead.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Prayer of Faith[/color]スキルを習得する。\n\n• 発動時、隣接する味方は現在の意思の[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]を近接防御と遠隔防御へのボーナスとして得る。\n\n• 隣接するカルト信者とアンデッドは[color="+ ::Const.UI.Color.povPerkBurgundy + "]Baffled[/color]状態になる。\n\n• [color="+ ::Const.UI.Color.povPerkBurgundy + "]Baffled[/color]状態の敵は近接防御、イニシアチブ、最大疲労が[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]減少する。\n\n• AP[color=" + this.Const.UI.Color.NegativeValue + "]5[/color]、疲労[color=" + this.Const.UI.Color.NegativeValue + "]25[/color]を消費する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPrayerOfFaith].Tooltip = ::Const.Strings.PerkDescription.LegendPrayerOfFaith;

	::Const.Strings.PerkDescription.LegendPrayerOfLife = "A prayer of hope and love restores wellbeing to your allies and tears at the undead.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Active:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Prayer of Hope[/color]スキルを習得する。\n\n• 発動時、隣接する味方は現在の意思の[color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color]を数ターンに分けたヒットポイントとして得る。1ターンに10ヒットポイントを超えて回復することはできない。 \n\n• 隣接する各アンデッドに崩壊の病を与え、2ターンの間、1ターンごとに現在の意思の[color=" + this.Const.UI.Color.DamageValue + "]15%[/color]に等しいダメージを与える。\n\n• カルト信者には効果がない。\n\n• AP[color=" + this.Const.UI.Color.NegativeValue + "]5[/color]、疲労[color=" + this.Const.UI.Color.NegativeValue + "]30[/color]を消費する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPrayerOfLife].Tooltip = ::Const.Strings.PerkDescription.LegendPrayerOfLife;

	::Const.Strings.PerkDescription.LegendPugilist = "Hit\'em where it hurts!\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Hand to Hand[/color]のダメージが[color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]増加する。 \n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Kick[/color]は空いた手がなくても使用可能になり、[color=" + this.Const.UI.Color.PositiveValue + "]5-10、現在の胴体防具の + 10%[/color]ダメージを与える。防具への有効性は75%で、ダメージ上限は防具600。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPugilist].Tooltip = ::Const.Strings.PerkDescription.LegendPugilist;

	::Const.Strings.PerkDescription.ShieldBash = "'Knock them back!'\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Knock Back[/color]スキルは[color=" + this.Const.UI.Color.PositiveValue + "]10-25[/color]ダメージ（防具への有効性90%）と[color=" + this.Const.UI.Color.DamageValue + "]10[/color]疲労ダメージを与える。\n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Buckler Bash[/color]は[color=" + this.Const.UI.Color.PositiveValue + "]10-15[/color]ダメージを与える（防具への有効性115%）。\n\n• 両スキルのダメージは盾の最大耐久値の[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]に応じても増加し、最大ボーナスは15。\n\n• 両スキルは使用時の疲労コストが[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]少なくなり、APコストを[color=" + this.Const.UI.Color.NegativeValue + "]1[/color]だけ減少させる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.ShieldBash].Tooltip = ::Const.Strings.PerkDescription.ShieldBash;

	::Const.Strings.PerkDescription.SpecCrossbow = "Master crossbows and firearms, and learn where to aim best.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• スキル使用時の疲労の蓄積が[color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]減少する。\n\n• クロスボウで与えるダメージの追加[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]が防具を無視する。\n\n• Handgonnesのリロードに必要なAPが[color=" + this.Const.UI.Color.NegativeValue + "]6[/color]になり、2ターンに1回ではなく毎ターン発射できる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecCrossbow].Tooltip = ::Const.Strings.PerkDescription.SpecCrossbow;

	::Const.Strings.PerkDescription.LegendSpecialistPoacher = "From small game to big bounties.\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Passive:[/u][/color]\n• Wonky BowまたはShort Bow使用時、命中率が[color=" + this.Const.UI.Color.PositiveValue + "]+12[/color]増加する。\n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]Bow Mastery[/color]取得時、さらに[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]のボーナスダメージを得る。 \n\n• その他のBowに分類される武器では、これらのボーナスの割合効果を得る。割合はキャンペーン生成時の選択に応じて25%から始まり、徐々に100%まで増加する。 \n\n• WolvesとHyenasに対してはこのボーナスが2倍になる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistPoacher;

	// Replacements (Specialist Perks)

	::Const.Strings.PerkName.LegendSpecialistButcher = "屠殺人";
	::Const.Strings.PerkDescription.LegendSpecialistButcher = @"
	A brutal expert in carving flesh, now striking where armor fails and leaving wounds that refuse to close.

	[color=%passive%][u]Passive:[/u][/color]
	• Butcher's Cleaverまたはsaw使用時、命中率が[color=%positive%]+10[/color]増加し、防具を無視するダメージが[color=%positive%]+10%[/color]増加し、出血ダメージが[color=%positive%]+2[/color]増加する。

	• [color=%perk%]Cleaver Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• Whipsを除くその他のCleaver系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistButcher].Name = ::Const.Strings.PerkName.LegendSpecialistButcher;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistButcher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistButcher;


	::Const.Strings.PerkName.LegendSpecialistBlacksmith = "鉄砕き";
	::Const.Strings.PerkDescription.LegendSpecialistBlacksmith = @"
	A master of hammer and anvil, breaking armor apart with the same skill used to forge it.

	[color=%passive%][u]Passive:[/u][/color]
	• Blacksmith's Hammer使用時、命中率が[color=%positive%]+10[/color]増加し、防具への有効性が[color=%positive%]+20%[/color]増加する。

	• [color=%perk%]Hammer Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]Repairing[/color]と[color=%skill%]Scavenging[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他のOne Handed Hammer系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBlacksmith].Name = ::Const.Strings.PerkName.LegendSpecialistBlacksmith;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBlacksmith].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistBlacksmith;


	::Const.Strings.PerkName.LegendSpecialistPrisoner = "喉裂き";
	::Const.Strings.PerkDescription.LegendSpecialistPrisoner = @"
	A lurking predator, finding the smallest openings to drive steel where armor offers no protection.

	[color=%passive%][u]Passive:[/u][/color]
	• Knife使用時、命中率が[color=%positive%]+10[/color]増加し、防具を無視するダメージが[color=%positive%]+20%[/color]増加する。

	• [color=%perk%]Dagger Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• 隠れている間、近接防御と遠隔防御が[color=%positive%]+5[/color]増加する。

	• その他のDagger系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPrisoner].Name = ::Const.Strings.PerkName.LegendSpecialistPrisoner;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPrisoner].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistPrisoner;


	::Const.Strings.PerkName.LegendSpecialistMilitia = "ファランクス";
	::Const.Strings.PerkDescription.LegendSpecialistMilitia = @"
	A disciplined fighter trained to hold the line, striking swiftly at any who dare close the distance.

	[color=%passive%][u]Passive:[/u][/color]
	• Militia Spear、Wooden Spear、Ancient spear使用時、命中率が[color=%positive%]+10[/color]増加し、機会攻撃の近接ダメージが[color=%positive%]15%[/color]増加する。

	• [color=%perk%]Spear Mastery[/color]取得時、さらに[color=%positive%]8%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]Training[/color]に[color=%positive%]+10%[/color]を付与する。

	• その他のSpear系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMilitia].Name = ::Const.Strings.PerkName.LegendSpecialistMilitia;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMilitia].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistMilitia;

	::Const.Strings.PerkName.LegendSpecialistBodyguard = "略奪者";
	::Const.Strings.PerkDescription.LegendSpecialistBodyguard = @"
	One must have some guts to apprach a big raging dude with an even bigger sword.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Longsword使用時、命中率が[color=%positive%]+10[/color]増加し、すべての近接範囲攻撃のダメージが[color=%positive%]10%[/color]増加する。[color=%status%]Riposting[/color]中はダメージが[color=%positive%]15%[/color]増加する。

	• [color=%perk%]Sword Mastery[/color]取得時、ダメージが[color=%positive%]8%[/color]増加する。

	• その他のTwo-Handed Sword系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";

	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBodyguard].Name = ::Const.Strings.PerkName.LegendSpecialistBodyguard;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBodyguard].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistBodyguard;

	::Const.Strings.PerkName.LegendSpecialistMiner = "石砕き";
	::Const.Strings.PerkDescription.LegendSpecialistMiner = @"
	Trained to shatter stone and armor alike, striking with force that few defenses can withstand.

	[color=%passive%][u]Passive:[/u][/color]
	• PickaxeまたはMilitary Pick使用時、命中率が[color=%positive%]+10[/color]増加し、常に最低でも[color=%positive%]10[/color]ダメージを与える。

	• [color=%perk%]Hammer Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• その他のTwo Handed Hammer系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• IfritsとRock Unholdsに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMiner].Name = ::Const.Strings.PerkName.LegendSpecialistMiner;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMiner].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistMiner;


	::Const.Strings.PerkName.LegendSpecialistFarmhand = "大振り打撃";
	::Const.Strings.PerkDescription.LegendSpecialistFarmhand = @"
	A worker of the fields turned killer, wielding long tools to reap both harvest and heads alike.

	[color=%passive%][u]Passive:[/u][/color]
	• Pitchfork、Wooden Pitchfork、Hoe、Scythe使用時、命中率が[color=%positive%]+10[/color]増加し、防具ダメージが[color=%positive%]+20%[/color]増加し、頭部命中率が[color=%positive%]+5%[/color]増加する。

	• [color=%perk%]Polearm Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• ワールドマップの[color=%skill%]farmlands[/color]上での移動速度に[color=%positive%]+1%[/color]を付与する。

	• その他のPolearm系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistFarmhand].Name = ::Const.Strings.PerkName.LegendSpecialistFarmhand;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistFarmhand].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistFarmhand;

	::Const.Strings.PerkName.LegendSpecialistPoacher = "猟師";
	::Const.Strings.PerkDescription.LegendSpecialistPoacher = @"
	ALiving off forbidden kills, striking true and finishing beasts before they can flee.

	[color=%passive%][u]Passive:[/u][/color]
	• Wonky Bow、Short Bow、goblin bow使用時、命中率が[color=%positive%]+10[/color]増加し、最低ダメージが[color=%positive%]+10[/color]増加する。

	• [color=%perk%]Bow Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]Hunting[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他のBowに分類される武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• WolvesとHyenasに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Name = ::Const.Strings.PerkName.LegendSpecialistPoacher;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistPoacher;


	::Const.Strings.PerkName.LegendSpecialistGravedigger = "墓守";
	::Const.Strings.PerkDescription.LegendSpecialistGravedigger = @"
	Used to burying the dead, now thrives among them, growing stronger as bodies pile up.

	[color=%passive%][u]Passive:[/u][/color]
	• Shovel使用時、命中率が[color=%positive%]+12[/color]増加する。

	• [color=%perk%]Mace Mastery[/color]取得時、さらに[color=%positive%]12%[/color]のボーナスダメージを得る。

	• その他のTwo Handed Mace系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• Shovel使用時は、さらにKnock Outスキルを得る。

	• Two Handed Mace使用時は、さらにGravedigging効果を得る。この効果は戦場にある死体の数に応じて、イニシアチブ、ダメージ、意思にボーナスを付与する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistGravedigger].Name = ::Const.Strings.PerkName.LegendSpecialistGravedigger;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistGravedigger].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistGravedigger;


	::Const.Strings.PerkName.LegendSpecialistWoodsman = "森人";
	::Const.Strings.PerkDescription.LegendSpecialistWoodsman = @"
	Timbeeeer!

	[color=%passive%][u]Passive:[/u][/color]
	• Woodcutter's AxeまたはHandsaw使用時、命中率が[color=%positive%]+10[/color]増加する。

	• [color=%perk%]Axe Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• 専用武器以外のTwo Handed Axe系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• このキャラクターはキャンプでの採集中に木材を収穫できる。

	• Schratsに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistWoodsman].Name = ::Const.Strings.PerkName.LegendSpecialistWoodsman;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistWoodsman].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistWoodsman;


	::Const.Strings.PerkName.LegendSpecialistHerbalist = "収穫者";
	::Const.Strings.PerkDescription.LegendSpecialistHerbalist = @"
	Used to gathering the yield of the land, now reaps the wounded with precise and merciless cuts.

	[color=%passive%][u]Passive:[/u][/color]
	• Sickleまたはgoblin notched blade使用時、命中率が[color=%positive%]+10[/color]増加し、負傷を与えるためのしきい値低下分の[color=%positive%]30%[/color]をヒットポイントへの追加ダメージとして得る。

	• [color=%perk%]Sword Mastery[/color]取得時、さらに[color=%positive%]12%[/color]のボーナスダメージを得る。さらにSickle使用時、[color=%skill%]Slash[/color]のAPコストを[color=%negative%]1[/color]だけ減少させる。

	• キャンプ中、[color=%skill%]Gathering[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他のOne Handed Sword系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistHerbalist].Name = ::Const.Strings.PerkName.LegendSpecialistHerbalist;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistHerbalist].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistHerbalist;


	::Const.Strings.PerkName.LegendSpecialistShepherd = "散兵";
	::Const.Strings.PerkDescription.LegendSpecialistShepherd = @"
	Fights at range with speed and awareness, pelting enemies and exploiting weaknesses in their defenses.

	[color=%passive%][u]Passive:[/u][/color]
	• Sling、Slingshot、Sturdy Sling使用時、命中率が[color=%positive%]+10[/color]増加し、追加の防具ダメージが[color=%positive%]20%[/color]増加する。

	• [color=%perk%]Sling Mastery[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]Scouting[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他のSling系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShepherd].Name = ::Const.Strings.PerkName.LegendSpecialistShepherd;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShepherd].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistShepherd;


	::Const.Strings.PerkName.LegendSpecialistCultist = "拷問者";
	::Const.Strings.PerkDescription.LegendSpecialistCultist = @"
	A ruthless wielder of lash and chain, striking past defenses to deliver pain where it hurts most.

	[color=%passive%][u]Passive:[/u][/color]
	• Cat o nine tailsまたはwooden flail使用時、命中率が[color=%positive%]+10[/color]増加し、頭部命中率と防具への有効性が[color=%positive%]+10%[/color]増加し、防具を無視するダメージが[color=%positive%]+5%[/color]増加する。

	• [color=%perk%]Flail Mastery[/color]または[color=%positive%]Cleaver Mastery[/color]取得時、さらに[color=%positive%]12%[/color]のボーナスダメージを得る。

	• その他のFlailまたはWhip系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistCultist].Name = ::Const.Strings.PerkName.LegendSpecialistCultist;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistCultist].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistCultist;


	::Const.Strings.PerkName.LegendSpecialistReaper = "死神";
	::Const.Strings.PerkDescription.LegendSpecialistReaper = @"
	Once used to harvest the fields, now swings with practiced ease to cut down the living.

	[color=%passive%][u]Passive:[/u][/color]
	• ScytheまたはWarscythe使用時、命中率が[color=%positive%]+15[/color]増加する。

	• さらにScytheまたはWarscythe使用時、防具への有効性が[color=%positive%]+25%[/color]増加し、防具貫通が[color=%positive%]+10%[/color]増加する。

	• 近くの敵の意思が[color=%negative%]5[/color]減少する。

	• [color=%perk%]Polearm Mastery[/color]または[color=%perk%]Cleaver Mastery[/color]取得時、さらに[color=%positive%]15%[/color]のボーナスダメージを得る。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistReaper].Name = ::Const.Strings.PerkName.LegendSpecialistReaper;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistReaper].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistReaper;


	::Const.Strings.PerkName.LegendSpecialistSelfdefense = "棒術";
	::Const.Strings.PerkDescription.LegendSpecialistSelfdefense = @"
	Twist and thrust with your staff to deflect blows and intercept strikes.

	[color=%passive%][u]Passive:[/u][/color]
	• stavesまたはmagic staves装備時、近接攻撃スキルが[color=%positive%]+16[/color]増加し、防御が[color=%positive%]+16[/color]増加する。

	• slingstaves、楽器、その他の混成staff装備時、このボーナスは[color=%positive%]+8[/color]のみになる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSelfdefense].Name = ::Const.Strings.PerkName.LegendSpecialistSelfdefense;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSelfdefense].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistSelfdefense;


	::Const.Strings.PerkName.LegendSpecialistInventor = "爆撃手";
	::Const.Strings.PerkDescription.LegendSpecialistInventor = @"
	A trained wielder of crude gunpowder weapons, striking with thunderous force and deadly precision.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Firearm使用時、命中率が[color=%positive%]+10[/color]増加する。

	• Handgonneの[color=%skill%]Reload[/color]のAPコストを[color=%negative%]1[/color]だけ減少させ、[color=%perk%]Crossbow Mastery[/color]取得時に[color=%positive%]10%[/color]のボーナスダメージを得る。

	• Firelance使用時、命中率が[color=%positive%]+10[/color]増加する。

	• [color=%perk%]Spear Mastery[/color]取得時、さらに[color=%positive%]14%[/color]のボーナスダメージを得る。

	• その他のFirearm系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInventor].Name = ::Const.Strings.PerkName.LegendSpecialistInventor;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInventor].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistInventor;


	::Const.Strings.PerkName.LegendSpecialistInquisition = "魔女狩り";
	::Const.Strings.PerkDescription.LegendSpecialistInquisition = @"
	A hardened hunter of the unnatural, striking down witches and spirits with steady aim and an unbreakable will.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Wooden Stakes、Hand Crossbows、Spiked Impaler使用時、命中率が[color=%positive%]+8[/color]増加する。

	• Wooden Stake使用時、命中率が[color=%positive%]+10[/color]増加する。

	• [color=%perk%]Crossbow Mastery[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• 恐怖、パニック、精神支配効果に対する士気判定で意思が[color=%positive%]+5[/color]増加する。

	• その他のCrossbow系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• Crossbow使用時、HexeとAlpsに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInquisition].Name = ::Const.Strings.PerkName.LegendSpecialistInquisition;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInquisition].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistInquisition;


	::Const.Strings.PerkName.LegendSpecialistClub = "執行者";
	::Const.Strings.PerkDescription.LegendSpecialistClub = @"
	A rough fighter who batters opponents into exhaustion, breaking their strength with relentless blows.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Wooden StickまたはBludgeon使用時、命中率が[color=%positive%]+10[/color]増加し、命中ごとの疲労ダメージが[color=%positive%]+5[/color]増加する。

	• [color=%perk%]Mace Mastery[/color]取得時、ダメージが[color=%positive%]14%[/color]増加する。

	• その他のOne-Handed Mace系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistClub].Name = ::Const.Strings.PerkName.LegendSpecialistClub;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistClub].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistClub;


	::Const.Strings.PerkName.LegendSpecialistRaider = "頭蓋割り";
	::Const.Strings.PerkDescription.LegendSpecialistRaider = @"
	Trained to aim for the head, delivering deadly blows that few can survive.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Hatchet、Crude Axe、Throwing Axe使用時、命中率が[color=%positive%]+10[/color]増加し、頭部命中時のダメージが[color=%positive%]+15%[/color]増加する。

	• [color=%perk%]Axe Mastery[/color]または[color=%perk%]Throwing Mastery[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• その他のOne-Handed Axe系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistRaider].Name = ::Const.Strings.PerkName.LegendSpecialistRaider;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistRaider].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistRaider;


	::Const.Strings.PerkName.LegendSpecialistSpearfisher = "鳥撃ち";
	::Const.Strings.PerkDescription.LegendSpecialistSpearfisher = @"
	Throwing a spear and throwing a net is just muscle memory at this point.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Javelins使用時、命中率が[color=%positive%]+12[/color]増加し、最大ダメージが[color=%positive%]+6[/color]増加する。

	• [color=%perk%]Throwing Specialization[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• 投擲武器を使うたび、[color=%skill%]Throw Net[/color]を無料で使用できる。

	• その他のThrowing系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSpearfisher].Name = ::Const.Strings.PerkName.LegendSpecialistSpearfisher;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSpearfisher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistSpearfisher;

	::Const.Strings.PerkName.LegendSpecialistSharpshooter = "狙撃手";
	::Const.Strings.PerkDescription.LegendSpecialistSharpshooter = @"
	Hitting a mark at distance is second nature, with shots that rarely miss their target.

	[color=%passive%][u]Specialist Weapon Perk:[/u][/color]
	• Warbow使用時、命中率が[color=%positive%]+12[/color]増加し、追加射程を[color=%positive%]1[/color]得る。

	• [color=%perk%]Bow Mastery[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• その他のLongbow系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• 得た追加射程は引き続き視界ペナルティの影響を受ける。
	";

::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSharpshooter].Name = ::Const.Strings.PerkName.LegendSpecialistSharpshooter;
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSharpshooter].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistSharpshooter;

	// Additions to Perks (very compatible)
	::Const.Strings.PerkDescription.SpecCrossbow +=@"
	• [color="+ ::Const.UI.Color.povPerkPurple + "]\"Improvised Strike\"[/color]スキルは使用時の疲労の蓄積が50%減少し、ダメージが[color="+ ::Const.UI.Color.PositiveValue + "]5 - 10[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecCrossbow].Tooltip = ::Const.Strings.PerkDescription.SpecCrossbow;

	::Const.Strings.PerkDescription.SpecThrowing +=@"
	• 投擲武器での[color="+ ::Const.UI.Color.povPerkPurple + "]Melee Attacks[/color]のダメージが[color="+ ::Const.UI.Color.PositiveValue + "]15%[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecThrowing].Tooltip = ::Const.Strings.PerkDescription.SpecThrowing;

	::Const.Strings.PerkDescription.LegendMedIngredients +=@"
	• 失ったヒットポイントの回復が[color="+ ::Const.UI.Color.PositiveValue + "]25%[/color]速くなる。 \n\n• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMedIngredients].Tooltip = ::Const.Strings.PerkDescription.LegendMedIngredients;

	::Const.Strings.PerkDescription.LegendMedPackages +=@"
	• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+15%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMedPackages].Tooltip = ::Const.Strings.PerkDescription.LegendMedPackages;

	::Const.Strings.PerkDescription.LegendMealPreperation +=@"
	• キャンプキッチンに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+5%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Hunting[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMealPreperation].Tooltip = ::Const.Strings.PerkDescription.LegendMealPreperation;

	::Const.Strings.PerkDescription.LegendHerbcraft +=@"
	• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color]を付与する。 \n\n• 治療テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Healing[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendHerbcraft].Tooltip = ::Const.Strings.PerkDescription.LegendHerbcraft;

	::Const.Strings.PerkDescription.LegendOreHunter +=@"
	• 最大疲労が[color="+ ::Const.UI.Color.PositiveValue + "]5%[/color]増加する。 \n\n• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendOreHunter].Tooltip = ::Const.Strings.PerkDescription.LegendOreHunter;

	::Const.Strings.PerkDescription.LegendWoodworking +=@"
	• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Gathering[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendWoodworking].Tooltip = ::Const.Strings.PerkDescription.LegendWoodworking;

	::Const.Strings.PerkDescription.LegendRebound +=@"
	• 最大疲労が[color="+ ::Const.UI.Color.PositiveValue + "]5%[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendRebound].Tooltip = ::Const.Strings.PerkDescription.LegendRebound;

	::Const.Strings.PerkDescription.LegendCampCook +=@"
	• クラフトテントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Crafting[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendCampCook].Tooltip = ::Const.Strings.PerkDescription.LegendCampCook;

	::Const.Strings.PerkDescription.LegendAlcoholBrewing +=@"
	• キャンプキッチンに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+5%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Hunting[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendAlcoholBrewing].Tooltip = ::Const.Strings.PerkDescription.LegendAlcoholBrewing;

	::Const.Strings.PerkDescription.LegendSummonFalcon +=@"
	• 偵察テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Scouting[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSummonFalcon].Tooltip = ::Const.Strings.PerkDescription.LegendSummonFalcon;

	::Const.Strings.PerkDescription.LegendSpecBandage +=@"
	• 治療テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Healing[/color]と[color="+ ::Const.UI.Color.PositiveValue + "]+3%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Injury Treatment[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecBandage].Tooltip = ::Const.Strings.PerkDescription.LegendSpecBandage;

	::Const.Strings.PerkDescription.BagsAndBelts +=@"
	• さらに[color="+ ::Const.UI.Color.PositiveValue + "]+4[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Stash[/color]サイズを付与する。[color="+ ::Const.UI.Color.povTooltipGray + "](この効果を反映するにはインベントリ画面を開き直してください)[/color]";
	::Const.Perks.PerkDefObjects[::Legends.Perk.BagsAndBelts].Tooltip = ::Const.Strings.PerkDescription.BagsAndBelts;

	::Const.Strings.PerkDescription.Pathfinder +=@"
	[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]Additional Effect:[/u][/color]\n• さらに、ワールドマップの悪路で[color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Travel Speed[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.Pathfinder].Tooltip = ::Const.Strings.PerkDescription.Pathfinder;

	::Const.Strings.PerkDescription.LegendMinnesanger +=@"• 意思が[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]増加する。\n\n• さらに、[color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Barter[/color]倍率を得る";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMinnesanger].Tooltip = ::Const.Strings.PerkDescription.LegendMinnesanger;

	::Const.Strings.PerkDescription.LegendSpecialistMusician +=@"
	• 楽器を持っている間、遠隔防御が[color="+ ::Const.UI.Color.PositiveValue + "]+5[/color]増加する。\n\n• [color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]Barter[/color]倍率を得る";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMusician].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistMusician;

	::Const.Strings.PerkDescription.LegendThrustMaster +=@"
	• ジャベリンと投擲槍の遠隔攻撃時、最低ダメージが[color="+ ::Const.UI.Color.PositiveValue + "]+5[/color]増加する";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendThrustMaster].Tooltip = ::Const.Strings.PerkDescription.LegendThrustMaster;

	::Const.Strings.PerkDescription.LegendHolyFlame +=@"
	• さらに、聖別効果は一部のアンデッド/スピリット系の敵の固有能力を[color="+ ::Const.UI.Color.PositiveValue + "]妨害[/color]できる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendHolyFlame].Tooltip = ::Const.Strings.PerkDescription.LegendHolyFlame;

	::Const.Strings.PerkDescription.LegendRecuperation +=@"
	• [color="+ ::Const.UI.Color.NegativeValue + "]酔い[/color]にくくなり、その後の二日酔いの効果にも[color="+ ::Const.UI.Color.PositiveValue + "]免疫[/color]を得る。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendRecuperation].Tooltip = ::Const.Strings.PerkDescription.LegendRecuperation;

	::Const.Strings.PerkDescription.LegendSmashingShields +=@"
	• 投擲斧使用時、敵の盾を狙って破壊する[color="+ ::Const.UI.Color.povPerkPurple + "]Split Shield (Ranged)[/color]スキルを得る。盾を持つ敵には必ず命中し、それ以外には通常の投擲斧攻撃として扱われる。通常攻撃より疲労消費がやや多い。このパークのダメージボーナスは適用されるが、斧熟練のボーナスは適用されない。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSmashingShields].Tooltip = ::Const.Strings.PerkDescription.LegendSmashingShields;

	::Const.Strings.PerkDescription.ShieldExpert +=@"
	• さらに、ダメージを与える盾スキルのダメージが[color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.ShieldExpert].Tooltip = ::Const.Strings.PerkDescription.ShieldExpert;

	::Const.Strings.PerkDescription.LegendScholar +=@"
	• [color="+ ::Const.UI.Color.PositiveValue + "]無制限[/color]に本を読めるようになり、燃え尽き状態は15日しか続かない。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendScholar].Tooltip = ::Const.Strings.PerkDescription.LegendScholar;

	::Const.Strings.PerkDescription.Student +=@"
	• このパーク取得時、キャラクターは[color="+ ::Const.UI.Color.PositiveValue + "]Learning to Read[/color]を開始する（まだ習得していない場合）。数日後、スキルブックの恩恵を受けられるようになる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.Student].Tooltip = ::Const.Strings.PerkDescription.Student;
}

// Aditions (Very Compatible)
::Const.Strings.PerkDescription.LegendPotionBrewer +=@"
• クラフトメニューで[color="+ ::Const.UI.Color.povPerkBlue + "]魔力を帯びた遺骸と死体の調査が可能になる[/color]";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPotionBrewer].Tooltip = ::Const.Strings.PerkDescription.LegendPotionBrewer;

	// Double enter here, cause its edited above too!
::Const.Strings.PerkDescription.LegendFieldTriage +=@"

• クラフトメニューで[color="+ ::Const.UI.Color.povPerkBlue + "]非超自然の死体の解剖が可能になる[/color]";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendFieldTriage].Tooltip = ::Const.Strings.PerkDescription.LegendFieldTriage;

::Const.Strings.PerkDescription.Adrenaline +=@"
• 使用時に[color="+ ::Const.UI.Color.povPainEffect + "]\"Severe Pain\"[/color]効果（負傷由来）を打ち消し、発動中はそれに対する免疫を得る";
::Const.Perks.PerkDefObjects[::Legends.Perk.Adrenaline].Tooltip = ::Const.Strings.PerkDescription.Adrenaline;

::Const.Strings.PerkDescription.LegendToolsSpares +=@"
• 溶かした銀くず（silver bowlとsilverware）から銀のインゴットを作成できる";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendToolsSpares].Tooltip = ::Const.Strings.PerkDescription.LegendToolsSpares;

::Const.Strings.PerkDescription.InspiringPresence +=@"
• [color="+ ::Const.UI.Color.povPerkBlue + "]Raise the Banner!![/color]スキルのクールダウンを1日短縮する";
::Const.Perks.PerkDefObjects[::Legends.Perk.InspiringPresence].Tooltip = ::Const.Strings.PerkDescription.InspiringPresence;

// Conditional edits
if (!::TLW.hasSSU)
{
	::Const.Strings.PerkDescription.LegendSpecialistShieldSkill +=@"
	• [color="+ ::Const.UI.Color.povPerkPurple + "]shieldwall[/color]使用時のダメージ耐性が[color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color]に増加し、[color="+ ::Const.UI.Color.povPerkPurple + "]fortify[/color]使用時は[color="+ ::Const.UI.Color.PositiveValue + "]+25%[/color]に増加する";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShieldSkill].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistShieldSkill;
}

// Legends Favorite Enemy Pekrs (Edited here, all togeather) (done like the additions above, compatible)
// only active without SSU, as SSU already does that
// Maybe I overengineered this idk
if (!::TLW.hasSSU && !::TLW.hasFOTN)
{
	// List of all Favoured Enemy types (for this perk)
	local enemies = [
		"Schrat", // test
		"Ghoul",
		"Hexen",
		"Alps",
		"Unhold",
		"Lindwurm",
		"Direwolf",
		"Spider",
		"Ork",
		"Goblin",
		"Vampire",
		"Skeleton",
		"Zombie",
		"Noble",
		"Bandit",
		"Barbarian",
		"Archer",
		"Swordmaster",
		"Mercenary",
		"Caravan",
		"Southerner",
		"Nomad",
		"Beasts", // this is where new shit starts
		"Occult",
		"Greenskin",
		"Undead",
		"Civilization",
		"Outlaw",
		"Swordmaster"
	];

	// preparation for new legends versions, list above merged into this one
	// LIST ALREADY INCLUDED ABOVE, KEPT THIS FOR REFERENCE!
	local enemiesNew = [
		"Beasts",
		"Occult",
		"Greenskin",
		"Undead",
		"Civilization",
		"Outlaw",
		"Swordmaster" //old, kept
	];

	// The bonus description to append
	local bonusText = "\n• [color=" + ::Const.UI.Color.povPerkPurple + "]15%[/color]ボーナス時、このスキルに消費したパークポイントは[color=" + ::Const.UI.Color.PositiveValue + "]返還[/color]される";

	// Apply the tooltip update to all enemies
	foreach (enemy in enemies)
	{
		local key = "LegendFavouredEnemy" + enemy;

		// Schizo fallback (might actually turn out to be useful :D)
		// It WAS useful after all...
		if (!(key in ::Const.Strings.PerkDescription))
		{
			// if this floods peoples logs comment it out lel
		    //::logInfo("[PoV] Tried to edit the following perk text and failed (not a fatal error): " + key);
		    continue;
		}

		::Const.Strings.PerkDescription[key] += bonusText;
		::Const.Perks.PerkDefObjects[::Legends.Perk[key]].Tooltip = ::Const.Strings.PerkDescription[key];
	}
}

// ---- Complete Japanese Patch v18 safety: class perk display names ----
try {
  ::Const.Strings.PerkName.LegendSpecialistButcher = "屠殺人";
  if ((::Legends.Perk.LegendSpecialistButcher in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistButcher].Name = "屠殺人";
  ::Const.Strings.PerkName.LegendSpecialistBlacksmith = "鉄砕き";
  if ((::Legends.Perk.LegendSpecialistBlacksmith in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBlacksmith].Name = "鉄砕き";
  ::Const.Strings.PerkName.LegendSpecialistPrisoner = "喉裂き";
  if ((::Legends.Perk.LegendSpecialistPrisoner in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPrisoner].Name = "喉裂き";
  ::Const.Strings.PerkName.LegendSpecialistMilitia = "ファランクス";
  if ((::Legends.Perk.LegendSpecialistMilitia in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMilitia].Name = "ファランクス";
  ::Const.Strings.PerkName.LegendSpecialistBodyguard = "略奪者";
  if ((::Legends.Perk.LegendSpecialistBodyguard in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBodyguard].Name = "略奪者";
  ::Const.Strings.PerkName.LegendSpecialistMiner = "石砕き";
  if ((::Legends.Perk.LegendSpecialistMiner in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMiner].Name = "石砕き";
  ::Const.Strings.PerkName.LegendSpecialistFarmhand = "大振り打撃";
  if ((::Legends.Perk.LegendSpecialistFarmhand in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistFarmhand].Name = "大振り打撃";
  ::Const.Strings.PerkName.LegendSpecialistPoacher = "猟師";
  if ((::Legends.Perk.LegendSpecialistPoacher in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Name = "猟師";
  ::Const.Strings.PerkName.LegendSpecialistGravedigger = "墓守";
  if ((::Legends.Perk.LegendSpecialistGravedigger in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistGravedigger].Name = "墓守";
  ::Const.Strings.PerkName.LegendSpecialistWoodsman = "森人";
  if ((::Legends.Perk.LegendSpecialistWoodsman in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistWoodsman].Name = "森人";
  ::Const.Strings.PerkName.LegendSpecialistHerbalist = "収穫者";
  if ((::Legends.Perk.LegendSpecialistHerbalist in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistHerbalist].Name = "収穫者";
  ::Const.Strings.PerkName.LegendSpecialistShepherd = "散兵";
  if ((::Legends.Perk.LegendSpecialistShepherd in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShepherd].Name = "散兵";
  ::Const.Strings.PerkName.LegendSpecialistCultist = "拷問者";
  if ((::Legends.Perk.LegendSpecialistCultist in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistCultist].Name = "拷問者";
  ::Const.Strings.PerkName.LegendSpecialistReaper = "死神";
  if ((::Legends.Perk.LegendSpecialistReaper in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistReaper].Name = "死神";
  ::Const.Strings.PerkName.LegendSpecialistSelfdefense = "棒術";
  if ((::Legends.Perk.LegendSpecialistSelfdefense in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSelfdefense].Name = "棒術";
  ::Const.Strings.PerkName.LegendSpecialistInventor = "爆撃手";
  if ((::Legends.Perk.LegendSpecialistInventor in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInventor].Name = "爆撃手";
  ::Const.Strings.PerkName.LegendSpecialistInquisition = "魔女狩り";
  if ((::Legends.Perk.LegendSpecialistInquisition in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInquisition].Name = "魔女狩り";
  ::Const.Strings.PerkName.LegendSpecialistClub = "執行者";
  if ((::Legends.Perk.LegendSpecialistClub in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistClub].Name = "執行者";
  ::Const.Strings.PerkName.LegendSpecialistRaider = "頭蓋割り";
  if ((::Legends.Perk.LegendSpecialistRaider in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistRaider].Name = "頭蓋割り";
  ::Const.Strings.PerkName.LegendSpecialistSpearfisher = "鳥撃ち";
  if ((::Legends.Perk.LegendSpecialistSpearfisher in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSpearfisher].Name = "鳥撃ち";
  ::Const.Strings.PerkName.LegendSpecialistSharpshooter = "狙撃手";
  if ((::Legends.Perk.LegendSpecialistSharpshooter in ::Const.Perks.PerkDefObjects)) ::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSharpshooter].Name = "狙撃手";
} catch(e) {}

// ---- Complete Japanese Patch: PoV perk gameplay effect descriptions ----
try {
  ::Const.Strings.PerkDescription.PovSignsOffense <- "イグニとブロントのサインスキルを習得する。サイン強度が+2%上昇する。";
  ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsOffense].Tooltip = ::Const.Strings.PerkDescription.PovSignsOffense;
  ::Const.Strings.PerkDescription.PovSignsDefense <- "クエンとイルデンのサインスキルを習得する。サイン強度が+2%上昇する。";
  ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsDefense].Tooltip = ::Const.Strings.PerkDescription.PovSignsDefense;
  ::Const.Strings.PerkDescription.PovSignsControl <- "アードとアクシィのサインスキルを習得する。サイン強度が+2%上昇する。";
  ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignsControl].Tooltip = ::Const.Strings.PerkDescription.PovSignsControl;
  ::Const.Strings.PerkDescription.PovSignMastery <- "サイン強度が+20%上昇する。全サインのAPコストが4から3に軽減され、疲労消費が25%軽減される。";
  ::Const.Perks.PerkDefObjects[::Legends.Perk.PovSignMastery].Tooltip = ::Const.Strings.PerkDescription.PovSignMastery;
  ::Const.Strings.PerkDescription.PovChampionSlayer <- "出身職のトレーニング修正が+20%上昇する。ミニボスとの戦闘時、サイン強度・ダメージ・近接スキル・遠隔スキルがそれぞれ+15%上昇する。";
  ::Const.Perks.PerkDefObjects[::Legends.Perk.PovChampionSlayer].Tooltip = ::Const.Strings.PerkDescription.PovChampionSlayer;
  ::Const.Strings.PerkDescription.PovStabilizedMutations <- "このパーク習得時、即座にレベルアップ1回分の能力値配分ポイントを付与する。";
  ::Const.Perks.PerkDefObjects[::Legends.Perk.PovStabilizedMutations].Tooltip = ::Const.Strings.PerkDescription.PovStabilizedMutations;
} catch(e) {}
