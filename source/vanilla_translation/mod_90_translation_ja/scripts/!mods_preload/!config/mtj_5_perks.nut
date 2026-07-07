local gt = this.getroottable();
gt.translation.perks<-{};
local t=gt.translation.perks;
t["perk.gifted"]<-{name="ギフテッド",
description="適性があるなら傭兵生活は楽になる。 即座にレベルアップし、指定した能力は最大ロール値で成長する。ただしタレントは含まない。"
};
t["perk.sundering_strikes"]<-{name="サンダリングストライク",
description="耐久値への有効性が使用武器の[color=${Const.UI.Color.PositiveValue}]+20％[/color]増加する。"
};
t["perk.reach_advantage"]<-{name="リーチアドバンテージ",
description="大型武器の優れたリーチを利用して、敵の攻撃が当たる距離まで近づいてくるのを防ぐ方法を学ぶ。\n\n両手近接武器が命中する度、リーチアドバンテージのスタックが追加され、このキャラクターの次ターンまで、近接防御[color=${Const.UI.Color.PositiveValue}]+5 [/color]が最大5スタックまで増加する。 複数の目標を攻撃する単一攻撃は、一度に複数のスタックを獲得可能。\n\n武器を納めると全スタックが失われる。"
,effectdescriptions= [{b="This character is using the superior reach of their melee weapon to keep opponents at bay, increasing Melee Defense by [color=${Const.UI.Color.PositiveValue}]+\"",t="このキャラクターは近接武器の優れたリーチを利用し敵を寄せ付けないようにしている。次ターンまで近接防御力が[color=${Const.UI.Color.PositiveValue}]+\""},
{b="[/color] until their next turn.",t="[/color]増加する。"}]
};
t["perk.steel_brow"]<-{name="スティールブロウ",
description="頭部に命中しても、このキャラクターが致命的ダメージを受けることはなくなり、後遺症となる頭部外傷を負うリスクも大幅に低下する。"
};
t["perk.mastery.throwing"]<-{name="投擲マスタリー",
description="敵が近づいてくる前に、敵を傷つけたり殺したりするために投擲について習熟する。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\n2タイルの距離で攻撃すると、ダメージが[color=${Const.UI.Color.PositiveValue}]40％[/color]増加する。\n\n3タイルの距離で攻撃すると、ダメージが[color=${Const.UI.Color.PositiveValue}]20％[/color]増加する。"
};
t["perk.mastery.crossbow"]<-{name="クロスボウ＆銃器マスタリー",
description="クロスボウと銃について習熟し、どこを狙うのが一番良いかを学ぶ。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\nクロスボウによる追加の[color=${Const.UI.Color.PositiveValue}]20％[/color]のダメージを得る。これはアーマーを無視する。\n\nハンドキャノンはリロードするために[color=${Const.UI.Color.NegativeValue}]6 [/color]アクションポイントを必要とし、1ターンおきではなく毎ターン発砲できるようになる。"
};
t["perk.coup_de_grace"]<-{name="死刑執行人",
description="腕の骨折などの怪我の影響を受けた目標に対し、追加で[color=${Const.UI.Color.PositiveValue}]20％[/color]のダメージを与える。"
};
t["perk.mastery.bow"]<-{name="ボウマスタリー",
description="弓術に習熟し、遠くから矢で敵を攻撃する。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\n弓使用時の表示範囲と最大射撃範囲が[color=${Const.UI.Color.PositiveValue}]+1 [/color]増加する。"
};
t["perk.duelist"]<-{name="デュエリスト",
description="己の武器と一体になり、弱点を狙え！ オフハンドが空もしくは投擲可能ツールを携帯している場合（例: 投網）、追加で[color=${Const.UI.Color.PositiveValue}]+25％[/color]のダメージを得る。これはアーマーを無視する。 両手武器では無効。"
};
t["perk.bags_and_belts"]<-{name="収納ベルト",
description="2つ分の拡張バッグスロットのロックを解除して、お気に入りのものを全て持ち運ぼう。 バッグに入れられたアイテムは、両手武器を除いて、疲労上限にペナルティを与えない。"
};
t["perk.fortified_mind"]<-{name="要塞化された心",
description="鋼の意志は真実の道から簡単に揺れ動くことはない。 決意が[color=${Const.UI.Color.PositiveValue}]25％[/color]増加する。"
};
t["perk.mastery.mace"]<-{name="メイスマスタリー",
description="メイスに習熟して、装甲の有無にかかわらず、対戦相手を打ち負かして屈服させる。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\nノックアウト、ノックオーバー、ストライクダウンは[color=${Const.UI.Color.PositiveValue}]100％[/color]の確率で、免疫がない場合でも目標を気絶させる。\n\nポールメイスは、直接隣接する目標を攻撃するためのペナルティがなくなる。"
};
t["perk.bullseye"]<-{name="ブルズアイ",
description="ど真ん中！ 遠隔武器使用時に遮蔽物に隠れた目標を撃ったときの命中率のペナルティが、[color=${Const.UI.Color.NegativeValue}]75％[/color]から[color=${Const.UI.Color.NegativeValue}]50％[/color]に軽減する。"
};
t["perk.mastery.flail"]<-{name="フレイルマスタリー",
description="フレイルの扱いに習熟し、対戦相手の盾を回避する。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\nラッシュとヘイルは盾の防御ボーナスを無視する。\n\nスレッシュは[color=${Const.UI.Color.PositiveValue}]+ 5％[/color]の確率で命中する。"
};
t["perk.shield_expert"]<-{name="シールドエキスパート",
description="攻撃を正面から防御するのではなく、横にそらす方法を学ぶ。\n\n盾の防御ボーナスは[color=${Const.UI.Color.PositiveValue}]25％[/color]増加する。 これは、シールドウォールスキルの追加の防御ボーナスにも適用される。\n\n盾の受けるダメージは[color=${Const.UI.Color.NegativeValue}]50％[/color]減少し、最小で1になる。\n\n「ノックバック」スキルは[color=${Const.UI.Color.PositiveValue}]+15％[/color]の確率で命中する。"
};
t["perk.overwhelm"]<-{name="圧倒",
description="高いイニシアチブを利用し、攻撃で敵を圧倒することによって敵が効果的に攻撃するのを防ぐ方法を学べ！\n\n現在のラウンドであなたの後に行動する対戦相手に対する攻撃が命中またはミスする度に、「圧倒」ステータス効果を与え、近接スキルと遠隔スキルの両方を1ターンの間[color=${Const.UI.Color.NegativeValue}]10％[/color]低下させる。 \n\nエフェクトは攻撃毎にスタックし、1回の攻撃で一度に複数の目標に適用可能。"
};
t["perk.rally_the_troops"]<-{name="士気高揚",
description="逃げる味方を鼓舞できる「ラリー」スキルのロックを解除し、近くにいる全ての味方の士気を安定したレベルに引き上げる。 スキルを使用するキャラクターの決意が高いほど、成功する可能性が高くなる。"
};
t["perk.battering_ram"]<-{name="破城槌",
description="スタンすることに対する免疫を得る。"
};
t["perk.nine_lives"]<-{name="九死に一生",
description="戦闘毎に1回だけ、致命的な打撃を受けた場合、代わりにいくつかのヒットポイントを残して生き残り、全ての継続ダメージ（例: 出血、中毒）も治癒する。 無論、次の攻撃で永久に殺される可能性もあるが、次ターンまで防御ステータスが改善され、それまで生き残ることを助ける。"
};
t["perk.berserk"]<-{name="ベルセルク",
description="RAAARGH！ 1ターンに1回、敵を倒すと[color=${Const.UI.Color.PositiveValue}]4 [/color]アクションポイントが即座に回復する。 1回の攻撃で最大アクションポイントを超えて回復したり、4ポイントを超えて回復することはできない。"
};
t["perk.killing_frenzy"]<-{name="殺戮の狂乱",
description="殺戮の狂乱に入る！ 敵を倒すと2ターンの間全ての与ダメージが[color=${Const.UI.Color.PositiveValue}]25％[/color]増加する。スタックしないが、敵を倒す度にターン数がリセットされる。"
};
t["perk.fast_adaption"]<-{name="瞬時の対応力",
description="対戦相手の動きに対応せよ！ 攻撃を外す毎に、追加で[color=${Const.UI.Color.PositiveValue}]+10％[/color]の命中率(累積)を獲得する。 攻撃が命中するとボーナスはリセットされる。"
,effectdescriptions= [{b="This character is adapting fast to their opponent's moves and gains an additional [color=${Const.UI.Color.PositiveValue}]",t="このキャラクターは相手の動きに素早く対応していて、攻撃毎に追加で[color=${Const.UI.Color.PositiveValue}]"},
{b="%[/color] chance to hit with any attack.",t="％[/color]の命中率を獲得している。"}]
};
t["perk.mastery.spear"]<-{name="槍マスタリー",
description="槍で戦い、敵を寄せ付けない達人となる。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労が減少する。\n\n対戦相手がなんとか克服した後、スピアウォールが無効になることはなくなる。 代わりにZoCに入ろうとするさらなる敵に対してコスト無しの攻撃を続ける。\n\nスペタムとウォーフォークは、直接隣接する目標を攻撃するためのペナルティがなくなった。"
};
t["perk.head_hunter"]<-{name="ヘッドハンター",
description="どタマに喰らえ！ 目標の頭部に攻撃が命中すると、次の攻撃でも頭部を確実に攻撃することができる。 次の攻撃が当たっても外れても効果はリセットされる。"
,effectdescriptions= [{b="This character is guaranteed to land a hit to the head if the next attack connects.",t="このキャラクターは、次の攻撃が命中すれば頭部に命中することが保証されている。"}]
};
t["perk.mastery.polearm"]<-{name="ポールアームマスタリー",
description="ポールウェポンの扱いに習熟し、敵を寄せ付けないようにする。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を減少させる。\n\nポールアームスキルのアクションポイントコストは[color=${Const.UI.Color.NegativeValue}]5 [/color]に減少し、直接隣接する目標を攻撃するためのペナルティはなくなった。"
};
t["perk.stalwart"]<-{name="スタルワート",
description="ノックバックされたり、近くに引き寄せられたりすることに対する耐性を得る。 ノックバック、フックなど、キャラクターの位置を変えるスキルに適用される。"
};
t["perk.inspiring_presence"]<-{name="感動的な存在",
description="偉大な指導者は、彼の信者に彼らの限界を克服するように促す。 味方は、キャラクターの特性によって禁止されていない限り、自信を持って高い士気ですべての戦闘を開始する。"
};
t["perk.crippling_strikes"]<-{name="欠損攻撃",
description="敵をカタワにしろ！ 近接攻撃と遠隔攻撃の両方で、負傷を負わせるしきい値を[color=${Const.UI.Color.NegativeValue}]33％[/color]下げる。"
};
t["perk.recover"]<-{name="リカバー",
description="蓄積疲労を[color=${Const.UI.Color.NegativeValue}]50％[/color]減らすことが可能な、ターンを休ませることができる「回復」スキルのロックを解除する。"
};
t["perk.fearsome"]<-{name="恐怖の存在",
description="敵をビビらせ追い散らせ！ ヒットポイントに少なくとも1ポイントのダメージを与える攻撃は、攻撃者の決意の[color=${Const.UI.Color.NegativeValue}]20％[/color]の判定ペナルティを加えた上で、対戦相手の士気チェックを行う。 (通常では15ポイント以上のダメージでのみ、ペナルティのない士気チェックが発生する)。"
};
t["perk.battle_flow"]<-{name="バトルフロー",
description="ターン毎に1回、対戦相手を倒すと、現在の疲労がベースの最大疲労の[color=${Const.UI.Color.NegativeValue}]-25％[/color]減少する（鎧によるペナルティの適用前）。"
};
t["perk.backstabber"]<-{name="バックスタバー",
description="名誉はあなたの戦いに勝つことはなく、それが痛いところに敵を刺します。 近接攻撃での命中率ボーナスが、目標を取り囲み、気を散らす味方ごとに2倍の[color=${Const.UI.Color.PositiveValue}]+10％[/color]になる。"
};
t["perk.dodge"]<-{name="ドッジ",
description="速すぎる！ 近接防御と遠隔防御のボーナスとして、キャラクターの現在のイニシアチブの[color=${Const.UI.Color.PositiveValue}]15％[/color]を獲得する。"
};
t["perk.taunt"]<-{name="挑発",
description="「挑発」スキルのロックを解除する。これにより、目標の対戦相手は防御的なアクションよりも攻撃的なアクションを優先して実行する。また、挑発するキャラクターを別のより脆弱なキャラクターよりも優先して攻撃する。"
};
t["perk.relentless"]<-{name="疲れ知らず",
description="速度を落とすな！ 常にイニシアチブペナルティを蓄積疲労の[color=${Const.UI.Color.NegativeValue}]50％[/color]に軽減する。 さらに、「待機」コマンドを使用しても次のラウンドでイニシアチブにペナルティが与えられることがなくなる。"
};
t["perk.shield_bash"]<-{name="シールドバッシュ",
description="ノックバックスキルは、通常の効果に加え[color=${Const.UI.Color.DamageValue}]10-25 [/color]ダメージ（鎧に対して50％有効）と[color=${Const.UI.Color.DamageValue}]10 [/color]疲労を与え、使用にかかる疲労が10減少する。"
};
t["perk.lone_wolf"]<-{name="一匹狼",
description="独りが一番いい。 3タイル以内に味方がいない場合、近接スキル、遠隔スキル、近接防御、遠隔防御、決意に[color=${Const.UI.Color.PositiveValue}]15％[/color]のボーナスを獲得する。"
};
t["perk.footwork"]<-{name="フットワーク",
description="巧みなフットワークで、フリーアタックを誘発せずにZoCを離れることができる「フットワーク」スキルをアンロックする。"
};
t["perk.mastery.cleaver"]<-{name="クリーバーマスタリー",
description="恐ろしい傷を負わせるクリーバーの扱いに習熟する。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労が減少する。\n\nクリーバーと鞭による出血ダメージは、1ターンあたりそれぞれ[color=${Const.UI.Color.PositiveValue}]10 [/color]と[color=${Const.UI.Color.PositiveValue}]20 [/color]に倍増する。\n\n武装解除には、命中に対するペナルティがなくなる。"
};
t["perk.steadfast"]<-{name="不動",
description="通常の攻撃に見舞われても、疲労感に襲われることはない。 特に疲労を狙う攻撃の影響を受けない。"
};
t["perk.captain"]<-{name="キャプテン",
description="あなたのリーダーシップの延長として、全員を一列に並べるために戦場でキャプテンを指揮しろ。 5タイル以内の範囲の味方は、このキャラクターの決意の最大値まで、自分に追加されるボーナスとして、このキャラクターの決意の[color=${Const.UI.Color.PositiveValue}]15％[/color]を獲得する。\n\nスタックしない。 決意が最も高いキャプテンがボーナスを適用する。"
};
t["perk.hold_out"]<-{name="強靭",
description="我慢しろ！ 期間が有限であるバッドステータス効果（例: 出血、魅了）の持続時間が[color=${Const.UI.Color.NegativeValue}]1[/color]ターンに短縮される。 数ターンにわたって効果が弱くなるステータス効果（例: ゴブリンポイズン）は、最初から最も弱い状態となる。"
};
t["perk.battle_forged"]<-{name="バトルフォージド",
description="重装甲専門！ アーマーとヘルムに対するダメージを、現在の合計耐久値の[color=${Const.UI.Color.PositiveValue}]5％[/color]と同数の割合で減少させる。 アーマーとヘルムが重いほど、より多くの利益が得られる。\n\n精神的攻撃やステータス効果によるダメージには影響しないが、それらを受けないようにするのに役立つ。"
,effectdescriptions= [{b="Specialize in heavy armor! Armor damage taken is reduced by a percentage equal to [color=${Const.UI.Color.PositiveValue}]5%[/color] of the current total armor value of both body and head armor. The heavier your armor and helmet, the more you benefit.",t="重装甲専門！ アーマーとヘルムに対するダメージを、現在の合計耐久値の[color=${Const.UI.Color.PositiveValue}]5％[/color] と同数の割合で減少させる。 アーマーとヘルムが重いほど、より多くの利益が得られる。"}]
};
t["perk.student"]<-{name="学生",
description="あなたがそれに心を置くならば、すべては学ぶことができる。 戦闘で追加の[color=${Const.UI.Color.PositiveValue}]20％[/color]の経験値を得る。 11レベル到達時に追加のParkポイントを獲得し、この特典は不活性になる。\n\n「マンハンターズ」の起源をプレイすると、7レベル到達時にParkポイントが払い戻される。"
};
t["perk.devastating_strikes"]<-{name="壊滅的な一撃",
description="与えられたすべてのダメージは、使用された武器毎に[color=${Const.UI.Color.PositiveValue}]+ 20％[/color]増加する。 今あなたの前に立っていられる者はいるだろうか？"
};
t["perk.quick_hands"]<-{name="クイックハンズ",
description="これを探してるのか？ 盾以外の装備を交換可能。1ラウンドに1回のみ、アクションポイントのコストなしのフリーアクションになる。"
};
t["perk.pathfinder"]<-{name="パスファインダー",
description="移動困難な地形で移動することを学ぶ。 全地形で移動するためのアクションポイントのコストが[color=${Const.UI.Color.NegativeValue}]-1 [/color]され、タイル毎に最低2アクションポイントに削減され、疲労蓄積は半分に削減される。 高低差のある移動でも、追加のアクションポイントコストがかからない。"
};
t["perk.rotation"]<-{name="ローテーション",
description="「ローテーション」スキルのロックを解除。これにより、2人のキャラクターが気絶や網等での移動不能状態でない限り、ZoCを無視して場所を入れ替え可能。"
};
t["perk.mastery.dagger"]<-{name="ダガーマスタリー",
description="迅速で致命的な短剣に習熟する。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\nスタブ、パンクチャー、デスブローはアクションポイントのコストが削減され、毎ターン追加の攻撃が可能になる。"
};
t["perk.colossus"]<-{name="コロッサス",
description="かかって来い！ 最大ヒットポイントが[color=${Const.UI.Color.PositiveValue}]25％[/color]増加する。これにより、敵の攻撃が命中したときに後遺症を負う可能性も低くなる。"
};
t["perk.mastery.axe"]<-{name="斧マスタリー",
description="斧で盾ごと相手を破壊する方法を学ぶ。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\n盾へのスプリットシールドのダメージは、軸と一緒に使用すると[color=${Const.UI.Color.PositiveValue}]50％[/color]増加する。\n\nラウンドスイングは[color=${Const.UI.Color.PositiveValue}]+ 5％[/color]の確率で命中する。\n\nロングアックスは、直接隣接する目標を攻撃するためのペナルティがなくなった。"
};
t["perk.underdog"]<-{name="アンダードッグ",
description="こんなことは慣れっこだ。 敵に包囲されていることによる命中バフは、このキャラクターには適用されなくなる。 攻撃者がバックスタバーのPerkを持っている場合、そのPerkの効果は無効になり通常の命中バフが適用される。"
};
t["perk.mastery.hammer"]<-{name="ハンマーマスタリー",
description="ハンマーの達人と重装甲の敵との戦い。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\nアーマーを破壊し、アーマーを破壊すると、アーマーに対して[color=${Const.UI.Color.PositiveValue}]33％[/color]多くのダメージを与える。\n\n粉砕は[color=${Const.UI.Color.PositiveValue}]+ 5％[/color]の確率で命中する。\n\nポールハンマーは、直接隣接する目標を攻撃するためのペナルティがなくなった。"
};
t["perk.adrenaline"]<-{name="アドレナリン",
description="「アドレナリン」スキルのロックを解除する。使用した次のラウンドで最初に行動できるようになる。 アドレナリンが血管を駆け抜けるのを感じろ！"
};
t["perk.nimble"]<-{name="ニンブル",
description="軽装甲専門！ 打撃を素早く回避またはそらすことにより、受けた打撃をかすり傷に変える。 受けるヒットポイントのダメージが最大[color=${Const.UI.Color.PositiveValue}]60％[/color]減少するが、アーマーとヘルムの最大疲労への合計ペナルティが[color=${Const.UI.Color.PositiveValue}]15[/color]を超えると指数関数的に減少する。 アーマーとヘルムが軽いほど、より多くの利益が得られる。\n\nBrawnyはこのParkには影響しない。\n\n精神的攻撃やステータス効果によるダメージには影響しないが、それらを受けないようにするのに役立つ。"
,effectdescriptions= [{b="Nimble like a cat! This character is able to partially evade or deflect attacks at the last moment, turning them into glancing hits. The lighter the armor, the more you benefit.",t="猫のような軽快さ！このキャラクターは土壇場での攻撃を部分的に回避するかそらして、かすり傷にすることができる。アーマーが軽いほど恩恵を受けられる。"}]
};
t["perk.mastery.sword"]<-{name="ソードマスタリー",
description="剣で戦う術に習熟し、対戦相手のミスを有効活用する。 スキルは[color=${Const.UI.Color.NegativeValue}]25％[/color]蓄積疲労を軽減する。\n\nリポストは、ヒットチャンスに対するペナルティがなくなった。\n\nGashには、怪我を負わせるための[color=${Const.UI.Color.NegativeValue}]50％[/color]の下限しきい値があります。\n\nスプリットとスイングは[color=${Const.UI.Color.PositiveValue}]+5％[/color]の確率で命中する。"
};
t["perk.indomitable"]<-{name="不屈",
description="使用すると1ラウンド間、[color=${Const.UI.Color.PositiveValue}]50％[/color]のダメージ軽減、気絶・ノックバック・グラブに対する耐性を付与する「不屈」スキルのロックを解除する。"
};
t["perk.anticipation"]<-{name="先読み",
description="遠隔武器で攻撃された場合、追加の遠隔防御として攻撃者までのタイル毎に[color=${Const.UI.Color.PositiveValue}]1+基本の遠隔防御の10％[/color]を獲得する。最小でも[color=${Const.UI.Color.PositiveValue}]+10[/color]を遠隔防御として獲得できる。"
};
t["perk.brawny"]<-{name="骨太",
description="アーマーとヘルムを着用することによる疲労とイニシアチブのペナルティが[color=${Const.UI.Color.NegativeValue}]30％[/color]減少する。"
};