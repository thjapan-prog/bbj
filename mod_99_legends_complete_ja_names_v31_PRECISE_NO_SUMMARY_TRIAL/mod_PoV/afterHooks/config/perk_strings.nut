// Things I ALWAYS want applied are done after the hasFotn check, the others are done alone

// Perks Reworks/Tweaks (replacements, less compatible) - Not applied with Fotn on

// For some perks, I do both compatible and not compatible changes (additions and overwrites)
// In that case, these perks will be edited two times, here. See LegendFieldTriage for example

if (!::TLW.hasFOTN)
{
	// Replacements (Less compatible)
	::Const.Strings.PerkDescription.LegendFieldTriage = "薬品を使って戦場でユニット1体を治療する。\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]アクティブ:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]野戦救護[/color]スキルを習得する。このスキルは隣接する味方1人のヒットポイントを最大[color=" + this.Const.UI.Color.PositiveValue + "]20[/color]、さらにその最大ヒットポイントの[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]まで回復する。\n\n• 回復したヒットポイント[color=" + this.Const.UI.Color.PositiveValue + "]2 + 1%[/color]ごとに薬品を[color=" + this.Const.UI.Color.NegativeValue + "]1[/color]使用し、1回のスキル使用での上限は10。\n\n• AP[color=" + this.Const.UI.Color.NegativeValue + "]4[/color]、疲労[color=" + this.Const.UI.Color.NegativeValue + "]16[/color]を消費する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendFieldTriage].Tooltip = ::Const.Strings.PerkDescription.LegendFieldTriage;

	::Const.Strings.PerkDescription.LegendPrayerOfFaith = "献身の祈りは味方に力を与え、アンデッドを惑わせる。\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]アクティブ:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]信仰の祈り[/color]スキルを習得する。\n\n• 発動時、隣接する味方は現在の意思の[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]を近接防御と遠隔防御へのボーナスとして得る。\n\n• 隣接するカルト信者とアンデッドは[color="+ ::Const.UI.Color.povPerkBurgundy + "]狼狽[/color]状態になる。\n\n• [color="+ ::Const.UI.Color.povPerkBurgundy + "]狼狽[/color]状態の敵は近接防御、イニシアチブ、最大疲労が[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]減少する。\n\n• AP[color=" + this.Const.UI.Color.NegativeValue + "]5[/color]、疲労[color=" + this.Const.UI.Color.NegativeValue + "]25[/color]を消費する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPrayerOfFaith].Tooltip = ::Const.Strings.PerkDescription.LegendPrayerOfFaith;

	::Const.Strings.PerkDescription.LegendPrayerOfLife = "希望と慈愛の祈りは味方を癒やし、アンデッドを苛む。\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]アクティブ:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]希望の祈り[/color]スキルを習得する。\n\n• 発動時、隣接する味方は現在の意思の[color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color]を数ターンに分けたヒットポイントとして得る。1ターンに10ヒットポイントを超えて回復することはできない。 \n\n• 隣接する各アンデッドに崩壊の病を与え、2ターンの間、1ターンごとに現在の意思の[color=" + this.Const.UI.Color.DamageValue + "]15%[/color]に等しいダメージを与える。\n\n• カルト信者には効果がない。\n\n• AP[color=" + this.Const.UI.Color.NegativeValue + "]5[/color]、疲労[color=" + this.Const.UI.Color.NegativeValue + "]30[/color]を消費する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPrayerOfLife].Tooltip = ::Const.Strings.PerkDescription.LegendPrayerOfLife;

	::Const.Strings.PerkDescription.LegendPugilist = "痛いところを突いてやれ！\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]パッシブ:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]徒手格闘[/color]のダメージが[color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]増加する。 \n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]蹴り[/color]は空いた手がなくても使用可能になり、[color=" + this.Const.UI.Color.PositiveValue + "]5-10、現在の胴体防具の + 10%[/color]ダメージを与える。防具への有効性は75%で、ダメージ上限は防具600。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendPugilist].Tooltip = ::Const.Strings.PerkDescription.LegendPugilist;

	::Const.Strings.PerkDescription.ShieldBash = "『ノックバック！』\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]パッシブ:[/u][/color]\n• [color="+ ::Const.UI.Color.povPerkPurple + "]ノックバック[/color]スキルは[color=" + this.Const.UI.Color.PositiveValue + "]10-25[/color]ダメージ（防具への有効性90%）と[color=" + this.Const.UI.Color.DamageValue + "]10[/color]疲労ダメージを与える。\n\n• [color="+ ::Const.UI.Color.povPerkPurple + "]バックラーバッシュ[/color]は[color=" + this.Const.UI.Color.PositiveValue + "]10-15[/color]ダメージを与える（防具への有効性115%）。\n\n• 両スキルのダメージは盾の最大耐久値の[color=" + this.Const.UI.Color.PositiveValue + "]20%[/color]に応じても増加し、最大ボーナスは15。\n\n• 両スキルは使用時の疲労コストが[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]少なくなり、APコストを[color=" + this.Const.UI.Color.NegativeValue + "]1[/color]だけ減少させる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.ShieldBash].Tooltip = ::Const.Strings.PerkDescription.ShieldBash;

	::Const.Strings.PerkDescription.SpecCrossbow = "クロスボウと銃器を極め、最も効果的な狙い所を学ぶ。\n\n[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]パッシブ:[/u][/color]\n• スキル使用時の疲労の蓄積が[color=" + this.Const.UI.Color.NegativeValue + "]25%[/color]減少する。\n\n• クロスボウで与えるダメージの追加[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color]が防具を無視する。\n\n• ハンドゴンのリロードに必要なAPが[color=" + this.Const.UI.Color.NegativeValue + "]6[/color]になり、2ターンに1回ではなく毎ターン発射できる。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecCrossbow].Tooltip = ::Const.Strings.PerkDescription.SpecCrossbow;

	// NOTE: LegendSpecialistPoacher used to be assigned here too (with an
	// un-translated English intro line), but that value was immediately and
	// unconditionally overwritten a few lines below by the "Replacements
	// (Specialist Perks)" block, making it dead code. Removed to keep a
	// single assignment per perk ID; see below for the actual description.

	// Replacements (Specialist Perks)

	::Const.Strings.PerkName.LegendSpecialistButcher = "屠殺人";
	::Const.Strings.PerkDescription.LegendSpecialistButcher = @"
	肉を切り裂く残忍な達人は、防具の隙を突いて塞がらぬ傷を刻む。

	[color=%passive%][u]パッシブ:[/u][/color]
	• ブッチャークリーバーまたはソー使用時、命中率が[color=%positive%]+10[/color]増加し、防具を無視するダメージが[color=%positive%]+10%[/color]増加し、出血ダメージが[color=%positive%]+2[/color]増加する。

	• [color=%perk%]鉈マスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• 鞭を除くその他の鉈系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistButcher].Name = ::Const.Strings.PerkName.LegendSpecialistButcher;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistButcher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistButcher;


	::Const.Strings.PerkName.LegendSpecialistBlacksmith = "鉄砕き";
	::Const.Strings.PerkDescription.LegendSpecialistBlacksmith = @"
	槌と金床の達人は、鎧を鍛えたのと同じ技で鎧を打ち砕く。

	[color=%passive%][u]パッシブ:[/u][/color]
	• ブラックスミスハンマー使用時、命中率が[color=%positive%]+10[/color]増加し、防具への有効性が[color=%positive%]+20%[/color]増加する。

	• [color=%perk%]ハンマーマスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]修理[/color]と[color=%skill%]漁り[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他の片手ハンマー系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBlacksmith].Name = ::Const.Strings.PerkName.LegendSpecialistBlacksmith;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBlacksmith].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistBlacksmith;


	::Const.Strings.PerkName.LegendSpecialistPrisoner = "喉裂き";
	::Const.Strings.PerkDescription.LegendSpecialistPrisoner = @"
	潜む捕食者は、防具が守り切れないわずかな隙間を見つけ出し、そこへ鋼を突き立てる。

	[color=%passive%][u]パッシブ:[/u][/color]
	• ナイフ使用時、命中率が[color=%positive%]+10[/color]増加し、防具を無視するダメージが[color=%positive%]+20%[/color]増加する。

	• [color=%perk%]短剣マスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• 隠れている間、近接防御と遠隔防御が[color=%positive%]+5[/color]増加する。

	• その他の短剣系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPrisoner].Name = ::Const.Strings.PerkName.LegendSpecialistPrisoner;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPrisoner].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistPrisoner;


	::Const.Strings.PerkName.LegendSpecialistMilitia = "ファランクス";
	::Const.Strings.PerkDescription.LegendSpecialistMilitia = @"
	陣形を守るべく鍛えられた規律ある戦士は、間合いを詰めてくる者を素早く迎え撃つ。

	[color=%passive%][u]パッシブ:[/u][/color]
	• ミリティアスピア、木製スピア、エインシェントスピア使用時、命中率が[color=%positive%]+10[/color]増加し、機会攻撃の近接ダメージが[color=%positive%]15%[/color]増加する。

	• [color=%perk%]槍マスタリー[/color]取得時、さらに[color=%positive%]8%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]訓練[/color]に[color=%positive%]+10%[/color]を付与する。

	• その他の槍系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMilitia].Name = ::Const.Strings.PerkName.LegendSpecialistMilitia;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMilitia].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistMilitia;

	::Const.Strings.PerkName.LegendSpecialistBodyguard = "略奪者";
	::Const.Strings.PerkDescription.LegendSpecialistBodyguard = @"
	さらに大きな剣を持つ、激怒した大男に近づくには、それなりの度胸が要る。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• ロングソード使用時、命中率が[color=%positive%]+10[/color]増加し、すべての近接範囲攻撃のダメージが[color=%positive%]10%[/color]増加する。[color=%status%]リポスト中[/color]中はダメージが[color=%positive%]15%[/color]増加する。

	• [color=%perk%]剣マスタリー[/color]取得時、ダメージが[color=%positive%]8%[/color]増加する。

	• その他の両手剣系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";

	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBodyguard].Name = ::Const.Strings.PerkName.LegendSpecialistBodyguard;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistBodyguard].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistBodyguard;

	::Const.Strings.PerkName.LegendSpecialistMiner = "石砕き";
	::Const.Strings.PerkDescription.LegendSpecialistMiner = @"
	石も鎧も同様に打ち砕くよう鍛えられ、並みの防御では耐えられない一撃を放つ。

	[color=%passive%][u]パッシブ:[/u][/color]
	• つるはしまたはミリタリーピック使用時、命中率が[color=%positive%]+10[/color]増加し、常に最低でも[color=%positive%]10[/color]ダメージを与える。

	• [color=%perk%]ハンマーマスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• その他の両手ハンマー系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• イフリートとロックアンホールドに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMiner].Name = ::Const.Strings.PerkName.LegendSpecialistMiner;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistMiner].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistMiner;


	::Const.Strings.PerkName.LegendSpecialistFarmhand = "大振り打撃";
	::Const.Strings.PerkDescription.LegendSpecialistFarmhand = @"
	畑仕事から殺人者へと転じた者は、長柄の道具を振るい、作物と首を同じように刈り取る。

	[color=%passive%][u]パッシブ:[/u][/color]
	• ピッチフォーク、木製ピッチフォーク、鍬、サイズ使用時、命中率が[color=%positive%]+10[/color]増加し、防具ダメージが[color=%positive%]+20%[/color]増加し、頭部命中率が[color=%positive%]+5%[/color]増加する。

	• [color=%perk%]ポールアームマスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• ワールドマップの[color=%skill%]農地[/color]上での移動速度に[color=%positive%]+1%[/color]を付与する。

	• その他のポールアーム系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistFarmhand].Name = ::Const.Strings.PerkName.LegendSpecialistFarmhand;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistFarmhand].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistFarmhand;

	::Const.Strings.PerkName.LegendSpecialistPoacher = "猟師";
	::Const.Strings.PerkDescription.LegendSpecialistPoacher = @"
	禁じられた狩りで生計を立て、逃げる間もなく獣を確実に仕留める。

	[color=%passive%][u]パッシブ:[/u][/color]
	• ウォンキーボウ、ショートボウ、ゴブリンボウ使用時、命中率が[color=%positive%]+10[/color]増加し、最低ダメージが[color=%positive%]+10[/color]増加する。

	• [color=%perk%]弓マスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]狩猟[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他の弓に分類される武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• オオカミとハイエナに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Name = ::Const.Strings.PerkName.LegendSpecialistPoacher;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistPoacher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistPoacher;


	::Const.Strings.PerkName.LegendSpecialistGravedigger = "墓守";
	::Const.Strings.PerkDescription.LegendSpecialistGravedigger = @"
	死者を葬ることに慣れた者は、今や死者たちの中でこそ力を増していく。死体が積み上がるほどに強くなる。

	[color=%passive%][u]パッシブ:[/u][/color]
	• シャベル使用時、命中率が[color=%positive%]+12[/color]増加する。

	• [color=%perk%]メイスマスタリー[/color]取得時、さらに[color=%positive%]12%[/color]のボーナスダメージを得る。

	• その他の両手メイス系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• シャベル使用時は、さらにノックアウトスキルを得る。

	• 両手メイス使用時は、さらに墓掘り効果を得る。この効果は戦場にある死体の数に応じて、イニシアチブ、ダメージ、意思にボーナスを付与する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistGravedigger].Name = ::Const.Strings.PerkName.LegendSpecialistGravedigger;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistGravedigger].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistGravedigger;


	::Const.Strings.PerkName.LegendSpecialistWoodsman = "森人";
	::Const.Strings.PerkDescription.LegendSpecialistWoodsman = @"
	木ぃ、倒れるぞぉぉぉ！

	[color=%passive%][u]パッシブ:[/u][/color]
	• 木こりの斧またはハンドソー使用時、命中率が[color=%positive%]+10[/color]増加する。

	• [color=%perk%]斧マスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• 専用武器以外の両手斧系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• このキャラクターはキャンプでの採集中に木材を収穫できる。

	• シュラートに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistWoodsman].Name = ::Const.Strings.PerkName.LegendSpecialistWoodsman;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistWoodsman].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistWoodsman;


	::Const.Strings.PerkName.LegendSpecialistHerbalist = "収穫者";
	::Const.Strings.PerkDescription.LegendSpecialistHerbalist = @"
	大地の実りを刈り取ることに慣れた者は、今や正確で容赦のない一撃で負傷者を刈り取る。

	[color=%passive%][u]パッシブ:[/u][/color]
	• シックルまたはゴブリンノッチドブレード使用時、命中率が[color=%positive%]+10[/color]増加し、負傷を与えるためのしきい値低下分の[color=%positive%]30%[/color]をヒットポイントへの追加ダメージとして得る。

	• [color=%perk%]剣マスタリー[/color]取得時、さらに[color=%positive%]12%[/color]のボーナスダメージを得る。さらにシックル使用時、[color=%skill%]斬りつけ[/color]のAPコストを[color=%negative%]1[/color]だけ減少させる。

	• キャンプ中、[color=%skill%]採集[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他の片手剣系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistHerbalist].Name = ::Const.Strings.PerkName.LegendSpecialistHerbalist;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistHerbalist].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistHerbalist;


	::Const.Strings.PerkName.LegendSpecialistShepherd = "散兵";
	::Const.Strings.PerkDescription.LegendSpecialistShepherd = @"
	速さと観察眼を武器に遠距離で戦い、敵を打ちのめしながら防御の弱点を突く。

	[color=%passive%][u]パッシブ:[/u][/color]
	• スリング、スリングショット、スターディスリング使用時、命中率が[color=%positive%]+10[/color]増加し、追加の防具ダメージが[color=%positive%]20%[/color]増加する。

	• [color=%perk%]スリングマスタリー[/color]取得時、さらに[color=%positive%]10%[/color]のボーナスダメージを得る。

	• キャンプ中、[color=%skill%]偵察[/color]に[color=%positive%]+5%[/color]を付与する。

	• その他のスリング系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShepherd].Name = ::Const.Strings.PerkName.LegendSpecialistShepherd;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistShepherd].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistShepherd;


	::Const.Strings.PerkName.LegendSpecialistCultist = "拷問者";
	::Const.Strings.PerkDescription.LegendSpecialistCultist = @"
	鞭と鎖を容赦なく操り、防御をかいくぐって最も痛いところに苦痛を刻み込む。

	[color=%passive%][u]パッシブ:[/u][/color]
	• キャット・オ・ナインテイルズまたは木製フレイル使用時、命中率が[color=%positive%]+10[/color]増加し、頭部命中率と防具への有効性が[color=%positive%]+10%[/color]増加し、防具を無視するダメージが[color=%positive%]+5%[/color]増加する。

	• [color=%perk%]フレイルマスタリー[/color]または[color=%positive%]鉈マスタリー[/color]取得時、さらに[color=%positive%]12%[/color]のボーナスダメージを得る。

	• その他のフレイルまたは鞭系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistCultist].Name = ::Const.Strings.PerkName.LegendSpecialistCultist;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistCultist].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistCultist;


	::Const.Strings.PerkName.LegendSpecialistReaper = "死神";
	::Const.Strings.PerkDescription.LegendSpecialistReaper = @"
	かつて畑の収穫に使われた得物を、今や熟練の手さばきで振るい、生者を刈り倒す。

	[color=%passive%][u]パッシブ:[/u][/color]
	• サイズまたはウォーサイズ使用時、命中率が[color=%positive%]+15[/color]増加する。

	• さらにサイズまたはウォーサイズ使用時、防具への有効性が[color=%positive%]+25%[/color]増加し、防具貫通が[color=%positive%]+10%[/color]増加する。

	• 近くの敵の意思が[color=%negative%]5[/color]減少する。

	• [color=%perk%]ポールアームマスタリー[/color]または[color=%perk%]鉈マスタリー[/color]取得時、さらに[color=%positive%]15%[/color]のボーナスダメージを得る。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistReaper].Name = ::Const.Strings.PerkName.LegendSpecialistReaper;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistReaper].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistReaper;


	::Const.Strings.PerkName.LegendSpecialistSelfdefense = "棒術";
	::Const.Strings.PerkDescription.LegendSpecialistSelfdefense = @"
	杖を捻り、突き出し、打撃を逸らして攻撃を迎え撃つ。

	[color=%passive%][u]パッシブ:[/u][/color]
	• 杖または魔法の杖装備時、近接攻撃スキルが[color=%positive%]+16[/color]増加し、防御が[color=%positive%]+16[/color]増加する。

	• スリング杖、楽器、その他の混成杖装備時、このボーナスは[color=%positive%]+8[/color]のみになる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSelfdefense].Name = ::Const.Strings.PerkName.LegendSpecialistSelfdefense;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSelfdefense].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistSelfdefense;


	::Const.Strings.PerkName.LegendSpecialistInventor = "爆撃手";
	::Const.Strings.PerkDescription.LegendSpecialistInventor = @"
	粗製の火薬兵器を鍛え上げた使い手は、雷鳴の如き衝撃と致命的な精密さで打ち据える。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• 銃器使用時、命中率が[color=%positive%]+10[/color]増加する。

	• ハンドゴンの[color=%skill%]リロード[/color]のAPコストを[color=%negative%]1[/color]だけ減少させ、[color=%perk%]クロスボウマスタリー[/color]取得時に[color=%positive%]10%[/color]のボーナスダメージを得る。

	• ファイアランス使用時、命中率が[color=%positive%]+10[/color]増加する。

	• [color=%perk%]槍マスタリー[/color]取得時、さらに[color=%positive%]14%[/color]のボーナスダメージを得る。

	• その他の銃器系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInventor].Name = ::Const.Strings.PerkName.LegendSpecialistInventor;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInventor].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistInventor;


	::Const.Strings.PerkName.LegendSpecialistInquisition = "魔女狩り";
	::Const.Strings.PerkDescription.LegendSpecialistInquisition = @"
	不自然なものを狩る歴戦の狩人は、揺るがぬ狙いと不屈の意志で魔女と霊を打ち倒す。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• 木の杭、ハンドクロスボウ、スパイクドインペイラー使用時、命中率が[color=%positive%]+8[/color]増加する。

	• 木の杭使用時、命中率が[color=%positive%]+10[/color]増加する。

	• [color=%perk%]クロスボウマスタリー[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• 恐怖、パニック、精神支配効果に対する士気判定で意思が[color=%positive%]+5[/color]増加する。

	• その他のクロスボウ系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• クロスボウ使用時、ヘクセとアルプに対してはこのボーナスが2倍になる。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInquisition].Name = ::Const.Strings.PerkName.LegendSpecialistInquisition;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistInquisition].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistInquisition;


	::Const.Strings.PerkName.LegendSpecialistClub = "執行者";
	::Const.Strings.PerkDescription.LegendSpecialistClub = @"
	荒々しい戦士は、絶え間ない打撃で敵を疲弊させ、その力を打ち砕く。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• 木の棒またはブラッジオン使用時、命中率が[color=%positive%]+10[/color]増加し、命中ごとの疲労ダメージが[color=%positive%]+5[/color]増加する。

	• [color=%perk%]メイスマスタリー[/color]取得時、ダメージが[color=%positive%]14%[/color]増加する。

	• その他の片手メイス系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistClub].Name = ::Const.Strings.PerkName.LegendSpecialistClub;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistClub].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistClub;


	::Const.Strings.PerkName.LegendSpecialistRaider = "頭蓋割り";
	::Const.Strings.PerkDescription.LegendSpecialistRaider = @"
	頭部を狙うよう鍛えられ、生き残れる者などほとんどいない致命の一撃を放つ。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• 手斧、粗末な斧、投擲斧使用時、命中率が[color=%positive%]+10[/color]増加し、頭部命中時のダメージが[color=%positive%]+15%[/color]増加する。

	• [color=%perk%]斧マスタリー[/color]または[color=%perk%]投擲マスタリー[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• その他の片手斧系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistRaider].Name = ::Const.Strings.PerkName.LegendSpecialistRaider;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistRaider].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistRaider;


	::Const.Strings.PerkName.LegendSpecialistSpearfisher = "鳥撃ち";
	::Const.Strings.PerkDescription.LegendSpecialistSpearfisher = @"
	槍を投げるのも網を投げるのも、もはや体が覚えた動作に過ぎない。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• ジャベリン使用時、命中率が[color=%positive%]+12[/color]増加し、最大ダメージが[color=%positive%]+6[/color]増加する。

	• [color=%perk%]投擲特化[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• 投擲武器を使うたび、[color=%skill%]投網[/color]を無料で使用できる。

	• その他の投擲系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。
	";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSpearfisher].Name = ::Const.Strings.PerkName.LegendSpecialistSpearfisher;
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSpearfisher].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistSpearfisher;

	::Const.Strings.PerkName.LegendSpecialistSharpshooter = "狙撃手";
	::Const.Strings.PerkDescription.LegendSpecialistSharpshooter = @"
	遠距離で的を射抜くことは、もはや第二の天性。放つ矢が的を外すことは滅多にない。

	[color=%passive%][u]専門武器パーク:[/u][/color]
	• ウォーボウ使用時、命中率が[color=%positive%]+12[/color]増加し、追加射程を[color=%positive%]1[/color]得る。

	• [color=%perk%]弓マスタリー[/color]取得時、ダメージが[color=%positive%]10%[/color]増加する。

	• その他のロングボウ系武器では、これらのボーナスの一定割合を得る。割合はキャラクターのレベルに応じて10%から始まり、レベル10までに50%まで増加する。

	• 得た追加射程は引き続き視界ペナルティの影響を受ける。
	";

::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSharpshooter].Name = ::Const.Strings.PerkName.LegendSpecialistSharpshooter;
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecialistSharpshooter].Tooltip = ::Const.Strings.PerkDescription.LegendSpecialistSharpshooter;

	// Additions to Perks (very compatible)
	::Const.Strings.PerkDescription.SpecCrossbow +=@"
	• [color="+ ::Const.UI.Color.povPerkPurple + "]\"即席打撃\"[/color]スキルは使用時の疲労の蓄積が50%減少し、ダメージが[color="+ ::Const.UI.Color.PositiveValue + "]5 - 10[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecCrossbow].Tooltip = ::Const.Strings.PerkDescription.SpecCrossbow;

	::Const.Strings.PerkDescription.SpecThrowing +=@"
	• 投擲武器での[color="+ ::Const.UI.Color.povPerkPurple + "]近接攻撃[/color]のダメージが[color="+ ::Const.UI.Color.PositiveValue + "]15%[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.SpecThrowing].Tooltip = ::Const.Strings.PerkDescription.SpecThrowing;

	::Const.Strings.PerkDescription.LegendMedIngredients +=@"
	• 失ったヒットポイントの回復が[color="+ ::Const.UI.Color.PositiveValue + "]25%[/color]速くなる。 \n\n• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]採集[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMedIngredients].Tooltip = ::Const.Strings.PerkDescription.LegendMedIngredients;

	::Const.Strings.PerkDescription.LegendMedPackages +=@"
	• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+15%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]採集[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMedPackages].Tooltip = ::Const.Strings.PerkDescription.LegendMedPackages;

	::Const.Strings.PerkDescription.LegendMealPreperation +=@"
	• キャンプキッチンに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+5%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]狩猟[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMealPreperation].Tooltip = ::Const.Strings.PerkDescription.LegendMealPreperation;

	::Const.Strings.PerkDescription.LegendHerbcraft +=@"
	• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]採集[/color]を付与する。 \n\n• 治療テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]治療[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendHerbcraft].Tooltip = ::Const.Strings.PerkDescription.LegendHerbcraft;

	::Const.Strings.PerkDescription.LegendOreHunter +=@"
	• 最大疲労が[color="+ ::Const.UI.Color.PositiveValue + "]5%[/color]増加する。 \n\n• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]採集[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendOreHunter].Tooltip = ::Const.Strings.PerkDescription.LegendOreHunter;

	::Const.Strings.PerkDescription.LegendWoodworking +=@"
	• 採集テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]採集[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendWoodworking].Tooltip = ::Const.Strings.PerkDescription.LegendWoodworking;

	::Const.Strings.PerkDescription.LegendRebound +=@"
	• 最大疲労が[color="+ ::Const.UI.Color.PositiveValue + "]5%[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendRebound].Tooltip = ::Const.Strings.PerkDescription.LegendRebound;

	::Const.Strings.PerkDescription.LegendCampCook +=@"
	• クラフトテントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]クラフト[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendCampCook].Tooltip = ::Const.Strings.PerkDescription.LegendCampCook;

	::Const.Strings.PerkDescription.LegendAlcoholBrewing +=@"
	• キャンプキッチンに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+5%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]狩猟[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendAlcoholBrewing].Tooltip = ::Const.Strings.PerkDescription.LegendAlcoholBrewing;

	::Const.Strings.PerkDescription.LegendSummonFalcon +=@"
	• 偵察テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]偵察[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSummonFalcon].Tooltip = ::Const.Strings.PerkDescription.LegendSummonFalcon;

	::Const.Strings.PerkDescription.LegendSpecBandage +=@"
	• 治療テントに配置されている間、[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]治療[/color]と[color="+ ::Const.UI.Color.PositiveValue + "]+3%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]負傷治療[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSpecBandage].Tooltip = ::Const.Strings.PerkDescription.LegendSpecBandage;

	::Const.Strings.PerkDescription.BagsAndBelts +=@"
	• さらに[color="+ ::Const.UI.Color.PositiveValue + "]+4[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]保管庫[/color]サイズを付与する。[color="+ ::Const.UI.Color.povTooltipGray + "](この効果を反映するにはインベントリ画面を開き直してください)[/color]";
	::Const.Perks.PerkDefObjects[::Legends.Perk.BagsAndBelts].Tooltip = ::Const.Strings.PerkDescription.BagsAndBelts;

	::Const.Strings.PerkDescription.Pathfinder +=@"
	[color="+ ::Const.UI.Color.povPerkDarkOrange + "][u]追加効果:[/u][/color]\n• さらに、ワールドマップの悪路で[color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]移動速度[/color]を付与する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.Pathfinder].Tooltip = ::Const.Strings.PerkDescription.Pathfinder;

	::Const.Strings.PerkDescription.LegendMinnesanger +=@"• 意思が[color="+ ::Const.UI.Color.PositiveValue + "]+10%[/color]増加する。\n\n• さらに、[color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]交易[/color]倍率を得る";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendMinnesanger].Tooltip = ::Const.Strings.PerkDescription.LegendMinnesanger;

	::Const.Strings.PerkDescription.LegendSpecialistMusician +=@"
	• 楽器を持っている間、遠隔防御が[color="+ ::Const.UI.Color.PositiveValue + "]+5[/color]増加する。\n\n• [color="+ ::Const.UI.Color.PositiveValue + "]+0.75%[/color]の[color="+ ::Const.UI.Color.povPerkOrange + "]交易[/color]倍率を得る";
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
	• 投擲斧使用時、敵の盾を狙って破壊する[color="+ ::Const.UI.Color.povPerkPurple + "]シールドスプリット（遠隔）[/color]スキルを得る。盾を持つ敵には必ず命中し、それ以外には通常の投擲斧攻撃として扱われる。通常攻撃より疲労消費がやや多い。このパークのダメージボーナスは適用されるが、斧熟練のボーナスは適用されない。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendSmashingShields].Tooltip = ::Const.Strings.PerkDescription.LegendSmashingShields;

	::Const.Strings.PerkDescription.ShieldExpert +=@"
	• さらに、ダメージを与える盾スキルのダメージが[color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color]増加する。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.ShieldExpert].Tooltip = ::Const.Strings.PerkDescription.ShieldExpert;

	::Const.Strings.PerkDescription.LegendScholar +=@"
	• [color="+ ::Const.UI.Color.PositiveValue + "]無制限[/color]に本を読めるようになり、燃え尽き状態は15日しか続かない。";
	::Const.Perks.PerkDefObjects[::Legends.Perk.LegendScholar].Tooltip = ::Const.Strings.PerkDescription.LegendScholar;

	::Const.Strings.PerkDescription.Student +=@"
	• このパーク取得時、キャラクターは[color="+ ::Const.UI.Color.PositiveValue + "]読書習得[/color]を開始する（まだ習得していない場合）。数日後、スキルブックの恩恵を受けられるようになる。";
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
• 使用時に[color="+ ::Const.UI.Color.povPainEffect + "]\"激痛\"[/color]効果（負傷由来）を打ち消し、発動中はそれに対する免疫を得る";
::Const.Perks.PerkDefObjects[::Legends.Perk.Adrenaline].Tooltip = ::Const.Strings.PerkDescription.Adrenaline;

::Const.Strings.PerkDescription.LegendToolsSpares +=@"
• 溶かした銀くず（銀のボウルと銀食器）から銀のインゴットを作成できる";
::Const.Perks.PerkDefObjects[::Legends.Perk.LegendToolsSpares].Tooltip = ::Const.Strings.PerkDescription.LegendToolsSpares;

::Const.Strings.PerkDescription.InspiringPresence +=@"
• [color="+ ::Const.UI.Color.povPerkBlue + "]旗を掲げよ！！[/color]スキルのクールダウンを1日短縮する";
::Const.Perks.PerkDefObjects[::Legends.Perk.InspiringPresence].Tooltip = ::Const.Strings.PerkDescription.InspiringPresence;

// Conditional edits
if (!::TLW.hasSSU)
{
	::Const.Strings.PerkDescription.LegendSpecialistShieldSkill +=@"
	• [color="+ ::Const.UI.Color.povPerkPurple + "]シールドウォール[/color]使用時のダメージ耐性が[color="+ ::Const.UI.Color.PositiveValue + "]+20%[/color]に増加し、[color="+ ::Const.UI.Color.povPerkPurple + "]フォーティファイ[/color]使用時は[color="+ ::Const.UI.Color.PositiveValue + "]+25%[/color]に増加する";
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

// NOTE: The former "Complete Japanese Patch v18 safety: class perk display names" block
// that used to re-assign LegendSpecialist* PerkName/Name here has been removed.
// It duplicated the names already set above (Replacements (Specialist Perks)) in this
// same file, and is also centralized/kept in sync in unified_preload.nut
// (mods_queue("mod_99_legends_complete_ja_unified_preload", "mod_PoV", ...)).
// Keeping a single authoritative assignment per perk ID avoids conflicting overrides.

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
