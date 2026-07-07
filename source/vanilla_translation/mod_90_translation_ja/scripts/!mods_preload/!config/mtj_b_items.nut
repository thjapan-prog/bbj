local gt = this.getroottable();
gt.translation.items<-{};
local t=gt.translation.items;
t["armor.body.blotched_gambeson"]<-{name="しみ付きギャンベゾン",
description="何度も補修されたパッド入ギャンベゾン。"
};
t["weapon.named_handgonne"]<-{description="長い木製の柄が付いた巧妙に鋳造された鉄の樽。 榴散弾を円錐状に発射し、1回の射撃で複数の目標を攻撃できる。 近接攻撃中は使用不可。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射前にリロードが必要[/color]"}]
};
t["armor_upgrade.lindwurm_scales"]<-{name="リンドヴルムスケイルマント",
description="リンドヴルムの鱗で作られたマント。 それは希少で印象的なトロフィーであるだけでなく、追加の防護を提供し、リンドヴルムの血の腐食効果を受けない。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+40[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+40[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-2[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-2[/color] 最大疲労"},
{b="Unaffected by acidic Lindwurm blood",t="リンドヴルムの血液の酸の影響を受けない"}]
};
t["armor.head.ancient_priest_diadem"]<-{name="",
description=""
};
t["weapon.smoke_bomb"]<-{name="煙幕ツボ",
description="地面で割れるとすぐに濃い煙が出る小さなツボ。 移動を隠すのに便利。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Covers [color=${Const.UI.Color.DamageValue}]7[/color] tiles in smoke for one round, allowing anyone inside to move freely and ignore zones of control",t="[color=${Const.UI.Color.DamageValue}]7[/color]タイルを煙で覆い、内部の誰もが自由に移動してZoCを無視可能にする"},
{b="Is destroyed on use",t="使い捨て"}]
};
t["armor.head.orc_young_light_helmet"]<-{name="ヘルム",
description=""
};
t["armor.body.light_scale_armor"]<-{name="ライトスケイルアーマー",
description="重なり合う小さな金属製の鱗で構成された、頑丈だが柔軟性のある鎧。"
};
t["misc.silver_bowl"]<-{name="銀のボウル",
description="重量感のある大きな銀のボウル。 都市ではいい値が付くはずだ。"
};
t["weapon.two_handed_wooden_hammer"]<-{name="両手木槌",
description="両手で持つ大きな木槌。 装甲を持つ敵でさえもノックアウトしたり地面に倒したりする可能性のある壊滅的な打撃を与える。"
};
t["accessory.antidote"]<-{name="解毒剤",
description="様々な種類の毒に対する解毒剤。 味はかなり苦い。"
};
t["weapon.goblin_pike"]<-{name="ギザギザのパイク",
description="出血している傷を引き裂き、長いリーチで敵を寄せ付けない長いギザギザのパイク。"
};
t["misc.glittering_rock"]<-{name="光り輝く岩",
description="敗北したイフリートの残骸の中には、金色にきらめく岩が散在していることがある。 それは貴重なトロフィーになる。"
};
t["armor.head.bascinet_with_mail"]<-{name="メイル付バシネット",
description="分厚いメイルコイフの上に身に着けられている金属製バシネット。"
};
t["misc.goblin_rank_insignia"]<-{name="黄金階級記章",
description="このような黄金階級章は、ゴブリンの高官が着用している。 収集家にとっては何か価値があるはずだ。"
};
t["armor.body.mail_and_lamellar_plating"]<-{name="ラメラーメッキメイル",
description="メイルシャツの上に重ね着した金属板を重ね合わせたラメラーシャツ。"
};
t["supplies.rice"]<-{name="米",
description="食糧。  米は安く南方ではすぐに手に入る。 様々なハーブでスパイスを効かせた、美味しい一品になる。"
};
t["weapon.flail"]<-{name="フレイル",
description="打撃部が鎖で持ち手に取り付けられている。 かなり予測不可能な武器だが、シールドカバーの上または周りを攻撃するのに役立つ。"
};
t["weapon.ancient_sword"]<-{name="古代の剣",
description="古代起源の真っ直ぐな刃。 柄は奇妙な装飾で覆われているため、歴史家やその他の学者にとって価値のあるものになる可能性がある。"
};
t["armor.body.noble_tunic"]<-{name="貴族のチュニック",
description="美しい模様が刺繍された、上質なリネンチュニック。お洒落だが、防護性は低い。"
};
t["weapon.rondel_dagger"]<-{name="ロンデルダガー",
description="鎧の弱点を突き抜けるように設計された長い四角形のスパイク。"
};
t["armor.head.witchhunter_hat"]<-{name="魔女狩りの帽子",
description="傷からしっかりと守ってくれる丈夫な革製の帽子。"
};
t["armor.body.reinforced_mail_hauberk"]<-{name="強化メイルホーバーク",
description="肩のポールドロンと鋲で補強された革の鎧で防御力を高めたメイルホーバーク。"
};
t["armor.body.unhold_armor_light"]<-{name="鎧",
description=""
};
t["supplies.cured_rations"]<-{name="完全に硬化したレーション",
description="食糧。  このレーションは、小さな箱に密封された、しっかり硬化した肉と野菜の詰め合わせで構成されている。 長旅や遠征に出るための理想的な食糧。"
};
t["weapon.shamshir"]<-{name="シャムシール",
description="この南方の巧妙に作られたエキゾチックな刃は、深い傷を簡単に切ることができるように湾曲した刃を持っているが、鎧を突き刺したり貫通したりするのにはあまり適していない。 これらの土地では珍しいもの。"
};
t["weapon.broken_bladed_pike"]<-{name="折れた古代の刃のパイク",
description="先端が折れた刃のついたパイク。 すべての武器が時の試練に耐えられるわけではない。 かつては、ある程度の距離を攻撃し、敵を寄せ付けないために使用されていた。"
};
t["weapon.noble_sword"]<-{name="貴族の剣",
description="両刃のバランスのとれた長刀。"
};
t["shield.named_dragon"]<-{description="図面で覆われた大きなカイトシールド。 並外れた職人技がこの作品を作り上げた。"
};
t["shield.worn_heater_shield"]<-{name="使い古したヒーターシールド",
description="革、帆布、苔で覆われた腐った三角形の木製の盾。"
};
t["armor.head.headscarf"]<-{name="ヘッドスカーフ",
description="頭に巻く分厚い布。"
};
t["armor.head.feathered_hat"]<-{name="羽の帽子",
description="通常吟遊詩人や貴族が着用する派手な羽毛の帽子。"
};
t["weapon.named_cleaver"]<-{description="巧みな鍛冶屋は、通常の剣のように扱う方法でこの軍用包丁を作成することができたが、その壊滅的な力を失うことはない。"
};
t["armor.body.leather_scale"]<-{name="レザースケイルアーマー",
description="保護を強化するために厚い革の鱗の鎧の下に着用されたメイルシャツ。"
};
t["ammo.powder"]<-{name="火薬袋",
description="エキゾチックな銃を武装させるために使用される黒色火薬の袋。 十分な弾薬がある場合、各戦闘後に自動的に補充される。"
,gettooltips= [{b="Contains powder for [color=${Const.UI.Color.PositiveValue}]",t="残り火薬[color=${Const.UI.Color.PositiveValue}]"},
{b="[color=${Const.UI.Color.NegativeValue}]Is empty and useless[/color]",t="[color=${Const.UI.Color.NegativeValue}]弾薬が空で使用不可能[/color]"},
{b="[/color] uses",t="[/color]"}]
};
t["accessory.warwolf"]<-{description="戦いの忠実な仲間になるように飼いならされた、強い野生のオオカミ。ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。"
,names= [{b="\" the Wolf\"",t="- オオカミ"}]
};
t["armor.body.black_and_gold"]<-{description="このユニークな鎧一式を鍛造する際、古代の知識が使用された。 金色の添え木と重なったその軽いメイルは、扱いやすい邪魔で高い保護を提供する。"
};
t["shield.named_sipar_shield"]<-{description="精巧な装飾が施された南方風の金属製ラウンドシールド。 かなり重いが、耐久性もある。"
};
t["armor.body.padded_surcoat"]<-{name="パッド入サーコート",
description="ウールの詰め物で埋められた布のマントル。"
};
t["shield.faction_kite_shield"]<-{name="カイトシールド",
description="下半身にも優れた保護を提供する革で覆われた細長い木製の盾。 接近戦で扱うにはややかさばる。"
};
t["misc.golden_goose"]<-{name="金のガチョウ",
description="純金で作られた小さなガチョウの像。 小さな金の卵が不思議なことに1日1回像から現れる。"
,gettooltips= [{b="Generates [color=${Const.UI.Color.PositiveValue}]15[/color] crowns daily.",t="毎日 [color=${Const.UI.Color.PositiveValue}]15[/color] クラウンを生み出す。"}]
};
t["armor.head.noble_headgear"]<-{name="",
description=""
};
t["armor_upgrade.hyena_fur"]<-{name="ハイエナファーマント",
description="猛烈なハイエナから取った毛皮を硬化させて縫い合わせ、首に獣狩りのトロフィーとして着用する。 このような獣の皮を身につけることは、行動への意欲を高める。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+15[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+15[/color] 耐久度"},
{b="[color=${Const.UI.Color.PositiveValue}]+15[/color] Initiative",t="[color=${Const.UI.Color.PositiveValue}]+15[/color] イニシアチブ"}]
};
t["weapon.saif"]<-{name="サイフ",
description="通常、南方圏でのみ見られる湾曲した剣。 斬撃には最適だが、鎧を突き刺したり貫通したりすることはできない。"
};
t["shield.heater_shield"]<-{name="ヒーターシールド",
description="革と帆布で覆われた三角形の木製の盾。"
};
t["armor.body.assassin_robe"]<-{name="暗殺者のローブ",
description="暗殺者の暗いローブ。 細い鎖帷子が結ばれ、生地にしっかりと織り込まれている。"
};
t["weapon.dagger"]<-{name="ダガー",
description="近接戦闘用に作られた先のとがった短剣。"
};
t["tool.throwing_net"]<-{name="投網",
description="投網は、目標を効果的に移動したり防御する能力を妨げることを目的に、目標に投げつけるために使用される。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"},
{b="Will root a target in place and reduce their defenses",t="目標をその場に拘束し、防御を減らす"},
{b="Is destroyed on use",t="使い捨て"}]
};
t["misc.wardog_heavy_armor_upgrade"]<-{name="軍用犬用重鎧",
description="戦闘で保護するために軍用犬が着用できる厚手のハイドコート。"
,gettooltips= [{b="Right-click or drag onto a wardog equipped by the currently selected character in order to use. This item will be consumed in the process.",t="現在選択されているキャラクターが持っている軍用犬を右クリックまたはドラッグして、ペイントします。このアイテムは消費されます。"}]
};
t["misc.frost_unhold_fur"]<-{name="厚い白い毛皮",
description="以前は凍てつく北方のアンホールドがまとっていた厚い白い毛皮。"
};
t["supplies.smoked_ham"]<-{name="薫製ハム",
description="食糧。  食物を保存する方法は数多くある。 このハムは燻製小屋で処理されている。"
};
t["shield.named_undead_heater_shield"]<-{description="革と帆布で覆われた三角形の木製の盾。古いが非常にバランスが取れている。"
};
t["accessory.ghoul_trophy"]<-{name="ナハツェーラートロフィーネックレス",
description="様々なナハツェーラーのトロフィーから作られたこのネックレスは、それを身に着けているものが野生の獣との戦いのベテランであり、簡単に心が揺らぐことはないと示している。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+4[/color] Resolve",t="[color=${Const.UI.Color.PositiveValue}]+4[/color] 決意"}]
};
t["misc.black_book"]<-{name="黒の書",
description="肉付きのカバーが付いた古くて不気味な表紙の本。その頁は理解しがたい文章と謎めいた絵で埋め尽くされている。見れば見るほど不安になる。古代の言語に詳しい者ならこの本の意味を理解できるかもしれない。"
};
t["weapon.warscythe"]<-{name="ウォーサイス",
description="鋭い湾曲したブレードに取り付けられた長いポールは、ある距離にわたって深いスイープストライクを提供するために使用される。"
};
t["weapon.light_southern_mace"]<-{name="ライトサザンメイス",
description="鎧に対する効果を高めるために翼を伸ばした金属製メイス。"
};
t["misc.snake_oil"]<-{name="スネークオイル",
description="脱毛、梅毒、難聴、インポテンス、皮膚の発疹、痘瘡、ライターズブロックに役立つと言われている不思議な調合。 あなただけがそれを信じるなら、真の奇跡のポーション。 適正な金額でどこでも売却できる。"
};
t["supplies.ground_grains"]<-{name="挽いた穀物",
description="食糧。  毎日の食事のために水や牛乳で調理されるさまざまな種類の挽いた穀物。 味がなく皆飽き飽きしている。"
};
t["weapon.two_handed_spiked_mace"]<-{name="両手スパイクメイス",
description="頭蓋骨を備えた巨大なクラブ。 この武器から打撃を受けると、鎧に関係なく、誰もがぼんやりと息を切らしてしまう。"
};
t["armor.body.leather_nomad_robe"]<-{name="革の遊牧民のローブ",
description="保護を強化するために革の部分が追加された厚い布のローブ。"
};
t["accessory.goblin_trophy"]<-{name="ゴブリントロフィー",
description="このゴブリンの耳のネックレスは、それを身に着けている人が緑の脅威との多くの戦いのベテランであり、もはやヤツらの卑怯な策略に陥ることはないと示している。"
,gettooltips= [{b="Grants immunity to being rooted by nets or grasping vines",t="網や蔓によって拘束されなくなる"}]
};
t["weapon.morning_star"]<-{name="モーニングスター",
description="鈍い力とパンクする打撃の組み合わせを提供するために使用されるトゲ付きの金属製頭部を備えた木製の柄。"
};
t["armor.body.stitched_nomad_armor"]<-{name="ステッチ付遊牧民の鎧",
description="さまざまな皮やスクラップから縫い合わされた革の遊牧民の鎧。"
};
t["shield.gilders_embrace"]<-{name="ギルダーの抱擁",
description="太陽の力でほんの少しの光線でも反射する明るい金色の輝きを持つ華やかな金属製の盾。"
,gettooltips= [{b="Melee Defense [color=${Const.UI.Color.PositiveValue}]+",t="近接防御 [color=${Const.UI.Color.PositiveValue}]+"},
{b="Ranged Defense [color=${Const.UI.Color.PositiveValue}]",t="遠隔防御 [color=${Const.UI.Color.PositiveValue}]"},
{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"},
{b="Is indestructible",t="破壊不能"},
{b="Everyone striking this shield receives the 'Dazed' effect",t="この盾を攻撃したものは全員 「朦朧」 効果を受る"}]
};
t["armor.head.decayed_full_helm"]<-{name="腐敗したフルヘルム",
description="このフルヘルムは、錆びた金属部品と脆い革の象眼細工に悩まされているが、悪臭を無視しても優れた防護を提供する。"
};
t["supplies.dried_fruits"]<-{name="ドライフルーツ",
description="食糧。  果樹園の果物は美味しくて栄養価が高い。 それらは長期保存するために乾燥される。"
};
t["armor.head.gladiator_helmet"]<-{name="剣闘士のヘルム",
description="南方の都市国家の闘技場でピットファイターの敵を威嚇するために作られた印象的な金属製ヘルム。"
};
t["misc.potion_of_knowledge"]<-{name="知識のポーション",
description="不可解でありふれた世界の知識は、このポーションに蒸留されていると言われている。 それを飲むと、レッスンはより簡単に学ぶことができます。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+100%[/color] Experience Gain",t="[color=${Const.UI.Color.PositiveValue}]+100%[/color] 経験値増加"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"}]
};
t["misc.salt"]<-{name="塩",
description="食品の調理や硬化に使用される岩塩。 商人はこれに良いコインを支払うだろう。"
};
t["weapon.named_warhammer"]<-{description="装甲板を簡単に叩く、巧妙に作られたウォーハンマー。"
};
t["supplies.dates"]<-{name="デーツ",
description="食糧。  乾燥したナツメヤシは南方では一般的。 この甘いドライフルーツは高エネルギーで保存状態もいい。"
};
t["armor.head.ancient_household_helmet"]<-{name="古代の貴族家ヘルム",
description="この古代の軽いヘルムは何年にもわたって犠牲を払ってきた。"
};
t["supplies.mead"]<-{name="ミード",
description="食糧。  はちみつから作られたアルコール飲料。 耐久性と美味しさを兼ね備えながら、未精製の水よりもはるかに安全に飲むことができる。"
};
t["armor.head.closed_flat_top_with_mail"]<-{name="メイルクローズドフラットトップ",
description="完全なフェイスガードと首を覆うメイルコイフを備えたクローズドヘルム。 防護の点では優れているが、息を吸い込みにくく、視野を制限する。"
};
t["armor.head.beastmasters_headpiece"]<-{name="獣使いのヘッドピース",
description="何世代にもわたって野蛮な獣使いの伝統で作られた、長い角のあるヘッドピース。"
};
t["armor.body.named_plated_fur_armor"]<-{description="金属板の厚い層が上に鋲で留められたシンプルな毛皮と革の鎧。 非常にシンプルで重いデザインだが、戦闘には非常に効果的。"
};
t["shield.orc_light_shield"]<-{name="野生の盾",
description="革で覆われた軽い木製の盾。 サイズが大きいため、遠隔攻撃に対して優れた防護を提供するが、非常に壊れやすい。"
};
t["armor.body.emperors_armor"]<-{name="皇帝の鎧",
description="かつて皇帝が身につけていた、最も傷ついた素材で作られた、神秘的なエネルギーが染み込んだ輝く鎧。 光は磨かれた鎧で簡単に反射し、日中は着用者をきらめく光の姿に変える。"
,gettooltips= [{b="Reflects [color=${Const.UI.Color.PositiveValue}]25%[/color] of damage taken in melee back to the attacker",t="近接攻撃で受けたダメージの[color=${Const.UI.Color.PositiveValue}]25%[/color]を攻撃者に反射する"}]
};
t["armor.head.barbarian_ritual_helmet"]<-{name="儀式用ヘルム",
description=""
};
t["misc.uncut_gems"]<-{name="未カットの宝石",
description="カットやポリッシュをしていない粗い宝石。 商人はこれに良いコインを支払うだろう。"
};
t["armor.head.turban_helmet"]<-{name="ターバンヘルム",
description="伝統的な南方のヘッドラップの形をした長い金属製の添え木を重ね合わせて作られたフルヘルム。"
};
t["armor.head.lindwurm_helmet"]<-{description="このヘルムは、恐ろしいリンドヴルムの鱗で覆われているため、かつては大胆で熟練した狩人のものだったに違いない。 このヘルムは打撃をそらすだけでなく、酸性のリンドヴルムの血でも無傷のままだ。"
,gettooltips= [{b="Unaffected by acidic Lindwurm blood",t="リンドヴルムの血液の酸に影響を受けない"}]
};
t["armor.head.closed_flat_top_helmet"]<-{name="クローズドフラットトップヘルム",
description="完全なフェイスガード付きのクローズドヘルム。 息を吸うのが難しく、視野が制限される。"
};
t["armor.head.engineer_hat"]<-{name="技術者の帽子",
description="着用者が都市国家から学んだ技術者であることを示す記章が付いた細かく包まれた布ターバン。"
};
t["weapon.barbarian_drum"]<-{name="蛮族のドラム",
description=""
};
t["armor.head.orc_warrior_light_helmet"]<-{name="略奪されたノーズヘルム",
description=""
};
t["weapon.knife"]<-{name="ナイフ",
description="戦闘用に作られていない短いナイフ。"
};
t["armor.body.scale_armor"]<-{name="スケイルアーマー",
description="小さなメイルシャツの上にスケイルが重なっているボディベスト。"
};
t["supplies.roots_and_berries"]<-{name="ルーツとベリー",
description="食糧。  乾燥した根と果実は、最も素晴らしい食糧ではないが、入手しやすく、耐久性がある。"
};
t["weapon.obsidian_dagger"]<-{name="黒曜石の短剣",
description="隠者の魔女は君の血でそれを和らげた後君にこの石の短剣を与えた。 ガラスの反射は自然に動くように見えるが、これは明らかに目の錯覚である。 しかし、非常に不思議なことに、黒曜石の上に血がかかっていると、血が乾くようには見えない。"
,gettooltips= [{b="Resurrects any human killed with it as a Wiederganger fighting for you",t="この武器で殺した任意の人間を君の側で戦うWiedergangerとして復活させる"}]
};
t["accessory.undead_trophy"]<-{name="アンデッドトロフィー",
description="骨の山から取られたこの古代のネックレスは、それを身に着けている者がアンデッドの惨劇との多くの戦いのベテランであり、彼らの恐怖に直面しても簡単には動揺しないことを示す。"
,gettooltips= [{b="Doubles your Resolve if defending against fear and mind control abilities",t="恐怖とマインドコントロール能力から防御する場合、君の決意を2倍にする"}]
};
t["weapon.heavy_southern_mace"]<-{name="ヘビーサザンメイス",
description="南方の装備の整った兵士が一般的に使用する重い翼のあるメイス。"
};
t["armor.body.black_leather"]<-{description="パッド入のギャンベゾンとチェーンメイルで支えられた、巧みに作られた硬化した革の鎧。 着心地は軽いが、非常に頑丈。"
};
t["armor.head.wrapped_southern_helmet"]<-{name="ラップドサザンヘルム",
description="この金属製ヘルムは、南の砂漠の燃えるような暑い太陽から保護するために布で包まれている。"
};
t["armor.head.leather_headband"]<-{name="革のヘッドバンド",
description="額を保護するために設計された乾燥して折りたたまれた革のヘッドバンド。"
};
t["armor.head.reinforced_mail_coif"]<-{name="強化メイルコイフ",
description="追加の金属製ノーズガード付きのメイルコイフ。"
};
t["weapon.goblin_heavy_bow"]<-{name="強化されたブーンドックボウ",
description="様々な木材で作られた、軽くて強力な弓。"
};
t["weapon.named_two_handed_hammer"]<-{description="その巨大な重量にもかかわらず、驚くほどバランスのとれた巨大なハンマー。 優雅さには欠けているが、人をノックアウトしたり地面に倒したりして、重装甲の敵の前線を粉砕するために使用されるため、生の力で補います。"
};
t["armor.body.reinforced_animal_hide_armor"]<-{name="強化されたアニマルハイドアーマー",
description="鎖と金属の鱗が追加された厚い革片から作られた強化された動物の皮の鎧。"
};
t["armor_upgrade.negative_falling_apart"]<-{name="バラバラ",
description=""
};
t["misc.bead_necklace"]<-{name="ビーズの首飾り",
description="北方の野蛮な部族に典型的な様々なビーズから作られたネックレス。"
};
t["weapon.warhammer"]<-{name="ウォーハンマー",
description="装甲板を簡単に叩く短い鉄製のウォーハンマー。"
};
t["armor.head.decayed_closed_flat_top_with_sack"]<-{name="腐敗したメイル付クローズドフラットトップ",
description="腐った布の袋の下に、完全なフェイスガードと首を覆うメイルコイフを備えた、磨耗して破れたクローズドヘルム。 それは明らかにしばらくの間屋外に放置されていた。"
};
t["misc.paint_black"]<-{name="ブラックペイント",
description="黒いペンキのバケツ。 多くの一般的なヘルムの塗装に使用できる。"
,gettooltips= [{b="Right-click or drag onto a helmet carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているヘルムを右クリックまたはドラッグして、ペイントする。このアイテムは消費される。"}]
};
t["armor.head.named_metal_nose_horn_helmet"]<-{description="このヘルムは野蛮人の別の戦士のものだったに違いない。 そのサイズとデザインは、すべての南方の人々にとって異質に見える。"
};
t["armor.head.nomad_head_wrap"]<-{name="遊牧民のヘッドラップ",
description="太陽と熱から保護するのに適した遊牧民スタイルのヘッドラップ。"
};
t["weapon.throwing_spear"]<-{name="投げ槍",
description="一般的な槍よりも軽いこの武器は、短距離で投げることを目的としている。 先端が衝撃で曲がり、盾が使用できなくなる可能性がある。 盾を持っていない敵に対しても使用でき、大きな効果が得られる。"
,gettooltips= [{b="Is destroyed on use",t="使い捨て"}]
};
t["base.food_item"]<-{gettooltips= [{b="Bought for [img]gfx/ui/tooltips/money.png[/img]",t="購入価格 [img]gfx/ui/tooltips/money.png[/img]"},
{b="Will spoil in [color=${Const.UI.Color.NegativeValue}]",t="[color=${Const.UI.Color.NegativeValue}]"},
{b="[/color] days.",t="[/color]日で腐る。"}]
};
t["weapon.woodcutters_axe"]<-{name="伐採用斧",
description="振るたびに重く耐える長い両手斧。 両手持ちで、大きな木を伐採するために使用されるが、人間も同様に伐採できる。"
};
t["armor.head.ancient_lich_headpiece"]<-{name="古代のヘッドピース",
description=""
};
t["armor.body.butcher_apron"]<-{name="肉屋のエプロン",
description="偶発的な切り傷から保護するために肉屋が着用する頑丈なエプロン。"
};
t["armor.body.leather_wraps"]<-{name="レザーラップ",
description="様々な粗い革のパッチが縫い合わされている。"
};
t["base.weapon"]<-{gettooltips= [{b="Damage of [color=${Const.UI.Color.DamageValue}]",t="ダメージ  [color=${Const.UI.Color.DamageValue}]"},
{b="Weapon skills build up [color=${Const.UI.Color.NegativeValue}]",t="武器スキルによる疲労は[color=${Const.UI.Color.NegativeValue}]"},
{b="[/color] more fatigue",t="[/color]多くなる"},
{b="Weapon skills build up [color=${Const.UI.Color.PositiveValue}]",t="武器スキルによる疲労は[color=${Const.UI.Color.NegativeValue}]"},
{b="[/color] less fatigue",t="[/color]少なくなる"},
{b="Contains ammo for [color=${Const.UI.Color.PositiveValue}]",t="残りの弾薬 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] uses",t="[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Is empty and useless[/color]",t="[color=${Const.UI.Color.NegativeValue}]弾薬が空で使用不可能[/color]"},
{b="%[/color] of damage ignores armor",t="%[/color] のダメージは装甲を無視する"},
{b="%[/color] effective against armor",t="%[/color] の効率で装甲にダメージを与える"},
{b="Shield damage of [color=${Const.UI.Color.DamageValue}]",t="盾へのダメージ [color=${Const.UI.Color.DamageValue}]"},
{b="Chance to hit head [color=${Const.UI.Color.PositiveValue}]+",t="頭部に命中するチャンス [color=${Const.UI.Color.PositiveValue}]+"},
{b="Has an additional [color=${Const.UI.Color.PositiveValue}]+",t="命中確率の補正 [color=${Const.UI.Color.PositiveValue}]+"},
{b="%[/color] chance to hit",t="%[/color]"},
{b="Has an additional [color=${Const.UI.Color.NegativeValue}]",t="命中確率の補正 [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit",t="%[/color]"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"}]
};
t["weapon.battle_whip"]<-{name="戦鞭",
description="棘のある先端を持つ長い鞭は、かなりの範囲でひどい出血性の傷を引き裂くことができるが、装甲に対しては非常に非効率的。"
};
t["misc.jeweled_crown"]<-{name="宝石で飾られた王冠",
description="宝石で飾られた精巧に作られた黄金の王冠。 買い手を見つけることができれば大金の価値があるはずだ。"
};
t["weapon.lute"]<-{name="リュート",
description="右手に持っていれば、振動する弦で心地よい音を出すことができる楽器。"
};
t["armor.head.greatsword_faction_helm"]<-{name="ツヴァイヘンダーのヘルム",
description="大きな羽毛の帽子で覆われた、パッドが追加された頑丈な金属製ヘルム。"
};
t["misc.golden_chalice"]<-{name="金の聖杯",
description="巨大な金で作られた杯。 買い手を見つけることができれば大金の価値があるはずだ。"
};
t["armor.body.orc_warrior_light_armor"]<-{name="略奪されたスケイルアーマー",
description=""
};
t["accessory.cat_potion"]<-{name="猫のポーション",
description="猫のように早く！ このポーションはあなたの感覚を高め、あなたの反射神経を鋭くすることを約束する。 責任を持って飲んでください。 次の戦いのために続きます。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+20[/color] Initiative",t="[color=${Const.UI.Color.PositiveValue}]+20[/color] イニシアチブ"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["shield.wooden_shield_old"]<-{name="古い木製の盾",
description="古い丸い木製の盾。"
};
t["armor.body.linothorax"]<-{name="リノソラックス",
description="数層のリネンで作られた胸当て。"
};
t["misc.hyena_fur"]<-{name="荒れ狂うハイエナの毛皮",
description="砂漠のハイエナのカラフルな毛皮は、洗練されたものではないにしても、傭兵の鎧に印象的でエキゾチックな追加をする。"
};
t["armor_upgrade.negative_weathered"]<-{name="風化",
description=""
};
t["weapon.faction_banner"]<-{name="軍旗",
description=""
};
t["armor.body.monk_robe"]<-{name="僧侶のローブ",
description="シンプルな布で作られた頑丈で大きなローブは、通常、僧侶や服装を気にしない同様の人々が着用する。"
};
t["armor.body.noble_mail"]<-{name="貴族の鎧",
description="本当に巧みに作られたメイルアーマー一式。 非常に軽量で柔軟性があり、優れた防護を提供しながら、煩わしさを軽減する。"
};
t["weapon.named_throwing_axe"]<-{description="目標に向かって上手投げで投げられる小さな斧。 これらは特にバランスが取れており、範囲から鎧や盾に深刻なダメージを与えるのに十分なほど丈夫。"
};
t["shield.named_wing"]<-{description="最高級の素材で作られた強化された木製のヒーターシールドで、明らかに熟練の盾職人によって作られている。"
};
t["weapon.named_shamshir"]<-{description="シャムシールはすでにこれらの部分で絶妙でエキゾチックな武器だが、この作品は並外れた品質を持つ。 熟したメロンと同じくらい簡単に肉や骨を切り裂く。"
};
t["misc.furs"]<-{name="毛皮",
description="野生動物の暖かい毛皮。 商人は、特に南方で、これに良いコインを支払うだろう。"
};
t["accessory.alp_trophy"]<-{name="アルプトロフィーネックレス",
description="さまざまなアルプのトロフィーから作られたこのネックレスは、それを身に着けている人が超自然的な夜行性の捕食者との戦いのベテランであり、簡単に心が揺らぐことはないと示す。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+5[/color] Resolve",t="[color=${Const.UI.Color.PositiveValue}]+5[/color] 決意"}]
};
t["shield.tower_shield"]<-{name="古代のタワーシールド",
description="高くて重いタワーシールドは、優れた防護を提供しますが、取り扱いが悪く非常にかさばる。 古くすり減っているようだ。"
};
t["accessory.warhound"]<-{description="戦争のために飼育された強力で忠実な北方の猟犬。ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。"
,names= [{b="\" the Warhound\"",t="- ウォーハウンド"}]
};
t["shield.craftable_kraken"]<-{name="クラーケンシールド",
description="巨大なクラーケンから取ったホーンプレートから彫られたこの盾は、一般的な盾よりも強力。"
};
t["armor.body.goblin_light_armor"]<-{name="軽装甲",
description=""
};
t["weapon.hunting_bow"]<-{name="狩猟弓",
description="通常、動物を狩るために使用される洗練された弓。 非装甲の目標に対しては致命的だが、効果的に使用するにはある程度の専門知識が必要。"
};
t["accessory.armored_warhound"]<-{description="戦争のために飼育された強力で忠実な北方の猟犬。 ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。 これは、切り傷から保護するために革のコートを着ている。"
};
t["weapon.named_two_handed_scimitar"]<-{description="両手で振るう非常に大きなシミター。 湾曲した刃は敵を完全に切り裂き、そのサイズに対して驚くほどバランスが取れている。"
};
t["weapon.polemace"]<-{name="ポールメイス",
description="遠くに見事な打撃を与えるために使用できる長いメイス。"
};
t["weapon.named_flail"]<-{description="打撃部が鎖で持ち手に取り付けられている。 かなり予測不可能な武器だが、シールドカバーの上または周りを攻撃するのに役立つ。 このフレイルは、その独特の特性のためにさらに恐ろしいようだ。"
};
t["armor.body.ancient_double_layer_mail"]<-{name="古代の二重層メイル",
description="古代のデザインの重くて腐った二層のメイル。 着心地は良くないが、それでも使用は可能。"
};
t["armor.body.leather_lamellar"]<-{name="レザーラメラーアーマー",
description="多数の重なり合う革板は、上半身のほとんどに適切な防護を提供する。"
};
t["weapon.fighting_axe"]<-{name="戦斧",
description="装甲の敵と戦うために明示的に設計された斧。 かなり頑丈。"
};
t["weapon.orc_axe"]<-{name="ヘッドスプリッター",
description="鋭い頭を持つ重い金属片。 人間の手には合わない。"
};
t["supplies.dried_fish"]<-{name="魚の干物",
description="食糧。  魚は沿岸地域で一般的に見られる食べ物。 保存のために乾燥させている。"
};
t["armor.body.ancient_ripped_cloth"]<-{name="破れた布",
description=""
};
t["weapon.heavy_throwing_axe"]<-{name="重い投斧の束",
description="北方の蛮族が使用する重くて扱いにくい投げ斧。 投げたり叩いたりするのは難しいが、致命的。"
};
t["misc.witch_hair"]<-{name="魔女の髪",
description="魔女から取った灰色がかった髪の長くてもろいストランド。 その髪はポーションや秘薬を作るのに強力な特性を持っていると言われている。 しかし、繰り返しになるが、魔女は犠牲者の性器をペットとして飼っているとも言われているため、農民から得られた情報は特に信頼できるものではないかもしれない。"
};
t["misc.third_eye"]<-{name="第三の目",
description="アルプには目がないが、この目のような器官は頭蓋骨の内側から取り出すことができる。"
};
t["armor.head.crude_faceguard_helmet"]<-{name="粗雑なフェイスガードヘルム",
description="粗野でさびた野蛮なヘルム。 繊細さには欠けているが、それを厚みで補っている。"
};
t["weapon.named_polemace"]<-{description="ポールメイスのような粗野な武器も、この模範で印象的に示されているように、情熱、スキル、細部への注意を払って作成することができる。"
};
t["armor.body.named_skull_and_chain_armor"]<-{description="面倒にならずに保護するように調整された粗製の野蛮な鎧。 北方の野蛮な部族の典型的なマーキングがされている。"
};
t["armor.head.cultist_leather_hood"]<-{name="狂信者のレザーフード",
description="頭と首を覆うが視界を制限する厚い革のフード。"
};
t["weapon.goblin_notched_blade"]<-{name="ノッチ付ブレード",
description="弱点を斬ったり、叩き切ったり、刺したりするために使用される片面刃の長い湾曲したナイフ。"
};
t["shield.southern_light_shield"]<-{name="アダーガシールド",
description="革で覆われた、金属枠付きの軽い木製の盾。 サイズが大きいため、遠隔攻撃に対して優れた防護を提供するが、それほど頑丈ではない。"
};
t["armor.head.orc_young_medium_helmet"]<-{name="ヘルム",
description=""
};
t["armor_upgrade.bone_platings"]<-{name="骨メッキ",
description="丈夫で驚くほど軽い骨から作られたこれらの華やかなメッキは、通常の鎧の上に着用できる切除可能な装甲になる。"
,gettooltips= [{b="Completely absorbs the first hit of every combat encounter which doesn't ignore armor",t="戦闘における最初のヒットに対して装甲を無視しないすべてのダメージを完全に吸収する"}]
};
t["armor.body.rugged_dark_surcoat"]<-{name="ダークラギッドサーコート",
description="保護を強化するために詰められたダークパッド入のレザーマントと、ペルトコート。"
};
t["armor.head.wolf"]<-{description="印象的なオオカミの頭で覆われた、メイル付の頑丈な金属製ヘルム。"
};
t["supplies.black_marsh_stew"]<-{name="ブラックマーシュシチュー",
description="食糧。  雹のように黒いこの恐ろしいシチューは、美味しさにはほど遠いが、甘やかすには何年もかかります。 そもそもすでに甘やかされているからかもしれません。"
};
t["misc.silverware"]<-{name="銀の食器",
description="銀食器の寄せ集め。 都市ではいい値が付くはずだ。"
};
t["armor.head.ancient_laurels"]<-{name="古代の月桂樹",
description=""
};
t["armor.body.nomad_robe"]<-{name="遊牧民のローブ",
description="熱と切り傷や打撲傷の両方から保護するために着用される遊牧民の布のローブ。"
};
t["armor.head.desert_stalker_head_wrap"]<-{name="デザートストーカーのヘッドラップ",
description="ブロンズのサソリで飾られた、保護を強化するための小さな隠された革のひもが付いた厚いヘッドラップ。"
};
t["shield.metal_round_shield"]<-{name="シパーシールド",
description="南方風の金属製ラウンドシールド。 かなり重いが、耐久性もある。"
};
t["misc.ornate_tome"]<-{name="華麗な書物",
description="巨大な金色の本の表紙が付いた保存状態の良い本。 ほこりっぽい古い書物を研究するような人々から良い価格を取得する必要があります。"
};
t["armor.head.jesters_hat"]<-{name="道化師の帽子",
description="道化師、芸能人、その他の旅行者のカラフルで象徴的なヘッドピース。"
};
t["armor.head.goblin_shaman_helmet"]<-{name="儀式のヘッドピース",
description=""
};
t["armor.head.dented_nasal_helmet"]<-{name="凹んだパッド入ノーズヘルム",
description="いくつかの戦いを経て凹んだ金属製ノーズヘルム。"
};
t["armor.head.padded_nasal_helmet"]<-{name="パッド入ノーズヘルム",
description="ノーズガードが追加され、下にパッド入りのコイフが付いた金属製ヘルム。"
};
t["weapon.fire_bomb"]<-{name="火炎ツボ",
description="非常に燃えやすい液体で満たされたツボで、投げると周囲が火で燃え上がる。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Will set [color=${Const.UI.Color.DamageValue}]7[/color] tiles ablaze with burning fire for 2 rounds",t="2ラウンドの間 [color=${Const.UI.Color.DamageValue}]7[/color] タイルを燃え盛る炎で延焼させる"},
{b="Is destroyed on use",t="使い捨て"}]
};
t["armor.body.named_bronze_armor"]<-{description="この鎧は奇妙な合金で構成されており、野蛮人の基準に合わせて巧みに作られている。 本当に珍しく注目に値する作品。"
};
t["supplies.strange_meat"]<-{name="奇妙な肉",
description="食糧。  何のものか不明な肉。 これを食べるのは危険に思えるかもしれないが、飢えるよりはマシ。"
};
t["misc.miracle_drug_"]<-{name="奇跡の薬",
description="多くの一般的な病気や病気に対する強力な治療法であり、炎症を軽減し、体の自然治癒をサポートする。\n\nこの薬で治療されたキャラクターは、寺院で治療された場合と同様、怪我からより早く回復する。"
,gettooltips= [{b="Right-click or drag onto the currently selected character in order to swallow. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲み込みます。このアイテムは消費されます。"}]
};
t["misc.spices"]<-{name="香辛料",
description="南方圏から輸入されている様々な風味豊かで珍しいスパイス。 これらの食材は北方で非常に人気がある。"
};
t["armor.body.lindwurm_armor"]<-{description="重い鎖帷子の上に縫い合わされた激しいリンドヴルムの頑丈な鱗。 それは偉大な狩人にとってのトロフィーであるだけでなく、最も激しい打撃をそらすこともでき、きらめく鱗は腐食するリンドヴルムの血の影響を受けない。"
,gettooltips= [{b="Unaffected by acidic Lindwurm blood",t="リンドヴルムの腐食血液の影響を受けない"}]
};
t["armor.body.thick_plated_barbarian_armor"]<-{name="厚いメッキの蛮族の鎧",
description="主に金属でできている重鎧。 先祖に選ばれたものだけがこのような鎧を所有する。"
};
t["misc.parched_skin"]<-{name="干からびた皮膚",
description="アルプから採取したこの皮膚は紙のように薄く、日光の下できらめく。"
};
t["base.helmet"]<-{gettooltips= [{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"},
{b="Vision [color=${Const.UI.Color.NegativeValue}]",t="ビジョン [color=${Const.UI.Color.NegativeValue}]"},
{b="Vision [color=${Const.UI.Color.PositiveValue}]",t="ビジョン [color=${Const.UI.Color.PositiveValue}]"}]
};
t["weapon.skull_hammer"]<-{name="両手スカルハンマー",
description="装甲とその着用者の両方を同様に粉砕するために両手で使用される粗金属ハンマー。"
};
t["armor.body.orc_young_medium_armor"]<-{name="ハイドアーマー",
description=""
};
t["armor.body.orc_warrior_heavy_armor"]<-{name="略奪されたプレートアーマー",
description=""
};
t["armor.head.leather_helmet"]<-{name="レザーヘルム",
description="硬化した皮から作られた厚い革のヘルム。 この皮をまとっていた動物は確かに危険な獲物だった。"
};
t["armor.body.wardog_armor"]<-{name="軍用犬用アーマー",
description=""
};
t["weapon.goblin_spear"]<-{name="ゴブリンの槍",
description="上部に鋭い金属の先端がある長い柄。"
};
t["armor.body.thick_furs"]<-{name="厚い毛皮",
description="寒さと打撃の両方から保護するために粗く乾燥され、一緒に結ばれている厚い毛皮。"
};
t["armor.head.sallet_helmet"]<-{name="サーリットヘルム",
description="ネックガードが延長された金属製のサーリットヘルム。これらの国では珍しいデザイン。 最小限の重量で最大限の保護を提供し、視界を損なうことなく、巧みに作られている。"
};
t["armor_upgrade.joint_cover"]<-{name="金属ジョイントカバー",
description="脆弱な肩関節を覆う大きな金属板。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+30[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+30[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-3[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-3[/color] 最大疲労"}]
};
t["accessory.bandage"]<-{name="包帯",
description="戦闘で使用できる清潔な包帯で、出血している傷に圧力をかけ、出血を止める。"
};
t["weapon.falx"]<-{name="ファルクス",
description="出血している傷を叩き切り、引き裂くために設計された湾曲した刃を持つ短くて重い刃。 何年にもわたって使用され切れ味は鈍い。"
};
t["base.item"]<-{gettooltips= [
{b="Can be used to craft items",t="クラフトアイテムとして使用可能"}],
getvaluestrings= [
{b="Worth [img]gfx/ui/tooltips/money.png[/img]",t="価値 [img]gfx/ui/tooltips/money.png[/img]"},
{b="Worth nothing.",t="価値なし。"}
]
};
t["armor.body.blue_studded_mail"]<-{description="このメイルシャツはギャンベゾンと組み合わされ、軽くて保護的な鎧のために頑丈な鋲で留められた革のジャケットで覆われている。"
};
t["armor.head.named_metal_bull_helmet"]<-{description="非常に頑丈な合金で作られた強化ヘルム。 それは豊かに装飾され、重いが、並外れた防護を提供する。"
};
t["weapon.javelin"]<-{name="ジャベリンの束",
description="通常、小競り合いで使われる投槍の束。 範囲が限られており、投げるのには骨が折れるが、壊滅的な怪我を負わせる可能性がある。"
};
t["armor.head.red_and_gold_band_helmet"]<-{description="この南方風のヘルムは、豪華な装飾が施されているだけでなく、バランスがよく、非常に高品質の金属で作られている。"
};
t["misc.silk"]<-{name="シルク",
description="滑らかな絹の布片は入手が非常に難しい。 最も裕福で高貴な者達だけが彼らの衣服をそれから仕立てる余裕があり、特に北方で良い価格で売れる。"
};
t["armor.body.southern_long_mail_with_padding"]<-{name="パッド付サザンロングメイルシャツ",
description="厚手のパッド入コートが付いた長くて重いメイルシャツ。"
};
t["misc.sulfurous_rock"]<-{name="硫黄岩",
description="攻撃的な悪臭は、錬金術師によって高く評価されているこれらのもろい岩から放出されている。"
};
t["misc.lindwurm_bones"]<-{name="リンドヴルムの骨",
description="リンドヴルムの骨は内側がほぼ中空であるため、サイズに関係なくトロフィーを持ち運びやすくなっている。"
};
t["weapon.two_handed_flail"]<-{name="両手フレイル",
description="使用するのに両手を必要とする大きくて重い金属製フレイル。 シールドカバーの上または周りを攻撃するのに便利。"
};
t["armor.head.flat_top_helmet"]<-{name="フラットトップヘルム",
description="ノーズガード付きのフラットな金属製ヘルム。"
};
t["armor.head.norse"]<-{description="貴族または高貴な戦士が持っていたに違いない、豊かに装飾された北欧の兜。"
};
t["misc.legendary_sword_grip"]<-{name="剣の柄",
description="神秘的な青い石で覆われた巧みに作られた剣の柄。 石の奥からきらめく光が出ているようだ。 両方のパーツがあれば、おそらく剣は再鍛造される可能性がある。"
};
t["armor.head.unhold_helmet_heavy"]<-{name="鎧",
description=""
};
t["armor.head.goblin_heavy_helmet"]<-{name="ヘルム",
description=""
};
t["weapon.winged_mace"]<-{name="ウィングドメイス",
description="短い柄と取り付けられたブレードを備えた金属製メイス。"
};
t["weapon.named_swordlance"]<-{description="鋭くてバランスの取れた湾曲したブレードに取り付けられた長いポールは、ある距離にわたって深いスイープストライクを提供するために使用される。"
};
t["armor.body.noble_gear"]<-{name="",
description=""
};
t["weapon.spetum"]<-{name="スペタム",
description="槍とパイクをかけ合わせると、優れた防御兵器になる。 ある程度の距離を突進し、敵を寄せ付けないために使用される。"
};
t["weapon.named_javelin"]<-{description="可能な限り真っ直ぐに飛ぶように巧みにバランスをとった2本の投槍。 範囲が限られており、投げるのには骨が折れるが、壊滅的な怪我を負わせる可能性がある。"
};
t["armor.head.decayed_closed_flat_top_with_mail"]<-{name="腐敗したメイル付クローズドフラットトップ",
description="完全なフェイスガードと首を覆うメイルコイフを備えた、摩耗して破れた閉じたヘルム。 それは明らかにしばらくの間屋外に放置されていた。"
};
t["misc.dies"]<-{name="染料",
description="様々な植物や鉱物から作られた貴重な染料。 商人はこれに良いコインを支払うだろう。"
};
t["armor.head.heraldic_mail"]<-{description="可動式のバイザーを備えた重いバシネットで、メイルコイフの上に着用する。 真の騎士にふさわしい派手な作品。"
};
t["misc.bodily_reward"]<-{name="ウォータースキン",
description="奇妙な人間の形をした木の下から取れる液体で満たされた革の水の皮。 癒すために飲むべきだと頭の中でささやきました。"
,gettooltips= [{b="Will remove all temporary or permanent injuries, as well as the Old, Addicted, Exhausted and Hangover traits and status effects",t="すべての一時的または永続的な怪我だけでなく、老化、中毒、消耗、二日酔いの特性とステータスの影響を削除する"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"}]
};
t["weapon.longsword"]<-{name="ロングソード",
description="用途の広い武器となる長い両手刃。"
};
t["ammo.bolts"]<-{name="ボルトの矢筒",
description="クロスボウを使用するために必要なボルトの矢筒。 十分な弾薬がある場合、各戦闘後に自動的に補充される。"
,gettooltips= [{b="Contains [color=${Const.UI.Color.PositiveValue}]",t="残りのボルト [color=${Const.UI.Color.PositiveValue}]"},
{b="[color=${Const.UI.Color.NegativeValue}]Is empty and useless[/color]",t="[color=${Const.UI.Color.NegativeValue}]弾薬が空で使用不可能[/color]"},
{b="[/color] bolts",t="[/color]"}]
};
t["accessory.sergeant_badge"]<-{name="軍曹のサッシュ",
description="戦場で2番目の指揮官である傭兵団の軍曹が着用するサッシュ。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+10[/color] Resolve",t="[color=${Const.UI.Color.PositiveValue}]+10[/color] 決意"}]
};
t["armor.head.mail_coif"]<-{name="メイルコイフ",
description="首も保護するメイルコイフ。"
};
t["armor.head.hunters_hat"]<-{name="狩人の帽子",
description="狩人のトロフィーとして羽で飾られた厚いフェルトの帽子。"
};
t["weapon.two_handed_mace"]<-{name="両手メイス",
description="スパイクヘッドのある巨大な木製の棍棒。 この武器から打撃を受けると、鎧に関係なく、誰もがぼんやりと息を切らしてしまう。"
};
t["weapon.hatchet"]<-{name="ハチェット",
description="短い柄と鉄製の頭部を持つ粗雑な斧。"
};
t["armor.body.werewolf_hide"]<-{name="ダイアウルフハイドアーマー",
description="巨大なオオカミの毛皮から巧みに作られた厚い革の鎧。 このように獣の皮を身につけると、印象的な姿になる。"
,gettooltips= [{b="Reduces the Resolve of any opponent engaged in melee by [color=${Const.UI.Color.NegativeValue}]-5[/color]",t="近接した敵の決意を[color=${Const.UI.Color.NegativeValue}]-5[/color]減少させる"}]
};
t["armor.body.vizier_gear"]<-{name="",
description=""
};
t["armor.head.sallet_green"]<-{description="鎖帷子に支えられた巧みに作られたサーリットで、色付きのリボンが付いている。"
};
t["armor.body.goblin_skirmisher_armor"]<-{name="スカーミッシャーの鎧",
description=""
};
t["misc.ghoul_teeth"]<-{name="ギザギザの牙",
description="ナハツェーラーから取った一握りのギザギザの牙。 腐敗に感染しているが、骨を噛むのに十分な硬さ。 市場の錬金術師からコインをもらえる可能性がある。"
};
t["accessory.orc_trophy"]<-{name="オークトロフィー",
description="凶暴なオークから取られたこの骨のネックレスは、それを身に着けているものが緑の獣との多くの戦いのベテランであり、彼らの力ずくで打ち負かされるものではないと示している。"
,gettooltips= [{b="Grants immunity to being stunned",t="スタンに対する免疫を与える"}]
};
t["accessory.hexen_trophy"]<-{name="魔女トロフィーネックレス",
description="殺害された魔女のトロフィーから作られたこのネックレスは、それを身に着けているものが下品な魔術との戦いのベテランであり、簡単に心が揺らぐことはないと示している。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+6[/color] Resolve",t="[color=${Const.UI.Color.PositiveValue}]+6[/color] 決意"}]
};
t["armor_upgrade.additional_padding"]<-{name="追加のファーパッド",
description="厚い毛皮から作られたこの追加のパッドは、打撃の衝撃を和らげるのに役立つ。"
,gettooltips= [{b="Reduces damage ignoring armor by [color=${Const.UI.Color.NegativeValue}]33%[/color]",t="装甲を無視するダメージを[color=${Const.UI.Color.NegativeValue}]33%[/color]軽減する"}]
};
t["weapon.orc_metal_club"]<-{name="棍棒",
description="金属板がちりばめられた巨大な木製の棍棒。 人間の手には合わない。"
};
t["weapon.bardiche"]<-{name="バルディッシュ",
description="壊滅的な効果で敵を倒せる長い頭を持つ大きな斧。"
};
t["misc.incense"]<-{name="お香",
description="この乾燥した樹液は、神秘的でエキゾチックな香りで満たされた濃い煙を作り出す。 特に北方で良い価格で売れる。"
};
t["misc.lindwurm_scales"]<-{name="リンドヴルムの鱗",
description="リンドヴルムのきらめく緑色の鱗は、獣狩りが冒険から持ち帰ることができる最も評判の良いトロフィーの1つである。"
};
t["armor_upgrade.horn_plate"]<-{name="ホーンプレート",
description="ホーンプレートのこれらの一部は、自然から提供されるものでも最も硬いが柔軟な材料の1つから作られている。 一般的な鎧の上に着用すると、敵の打撃をそらすのに役立つ。"
,gettooltips= [{b="Reduces any melee damage to the body by [color=${Const.UI.Color.NegativeValue}]-10%[/color]",t="体に対する近接攻撃のダメージを[color=${Const.UI.Color.NegativeValue}]-10%[/color]軽減する"}]
};
t["armor.head.ancient_legionary_helmet"]<-{name="古代の軍団のヘルム",
description="巧妙に作られたが部分的に腐敗した古代のデザインのヘルム。"
};
t["armor.body.goblin_heavy_armor"]<-{name="重装甲",
description=""
};
t["armor_upgrade.negative_shabby"]<-{name="ぼろぼろ",
description=""
};
t["accessory.spider_poison"]<-{name="毒油",
description="濃縮されたウェブクネヒト毒が混入されたオイルのフラスコ。 武器や矢先をコーティングするために使用可能。"
,gettooltips= [{b="Is destroyed on use",t="使い捨て"}]
};
t["shield.orc_heavy_shield"]<-{name="ヘビーメタルシールド",
description="破壊することはほぼ不可能だが、人間にとって非常に重くて疲れる巨大な金属製の盾。"
};
t["weapon.war_bow"]<-{name="戦弓",
description="大きな弓力を持つ長弓。 明確に戦闘用に設計されている。"
};
t["misc.amber_shards"]<-{name="琥珀の欠片",
description="主にネックレスや指輪に使用される琥珀の欠片。 商人はこれに良いコインを支払うだろう。"
};
t["misc.happy_powder"]<-{name="幸せの粉",
description="この奇跡的な粉は、不機嫌で気性の悪い傭兵を即座に幸せでエネルギッシュな傭兵に変える。 飲酒運転中は重機を操作しないこと。"
,gettooltips= [{b="Right-click or drag onto the currently selected character in order to snort. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、吸引します。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["weapon.khopesh"]<-{name="ケペシュ",
description="奇妙な装飾が施された長い柄の古代の湾曲した剣。 その形状は、鎧に対して特に効果的。"
};
t["armor.body.tattered_sackcloth"]<-{name="ボロボロの荒布",
description="裸で走るよりはかろうじてマシ。"
};
t["armor.head.goblin_skirmisher_helmet"]<-{name="ヘルム",
description=""
};
t["weapon.handgonne"]<-{name="ハンドキャノン",
description="長い木製の柄が付いた鉄の樽。 榴散弾を円錐状に発射し、1回の射撃で複数の目標を攻撃できる。 近接攻撃中は使用不可。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードが必要[/color]"}]
};
t["armor.body.ancient_mail"]<-{name="古代の鎧",
description="古くて痂皮のある古代のデザインの重鎧。 一部の部品が欠落しているが、それでも適切な防護を提供する。"
};
t["armor_upgrade.metal_plating"]<-{name="金属板と鋲",
description="下にある鎧に鋲で留められた厚い金属板。 非常に粗雑だが、防護をすばやく追加する簡単な方法である。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+30[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+30[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-3[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-3[/color] 最大疲労"}]
};
t["weapon.crypt_cleaver"]<-{name="クリプトクリーバー",
description="剣と斧の性質を組み合わせて壊滅的な両手包丁にした、奇妙に湾曲した端を持つ重い刃。"
};
t["weapon.named_skullhammer"]<-{description="この粗くて重いハンマーは、まだ十分に印象的ではないかのように、追加の動物の頭蓋骨で飾られている。 雄羊の頭のように、それはその目標を押し潰す。"
};
t["misc.valuable_furs"]<-{name="貴重な毛皮",
description="様々な小動物から剥いだ貴重な毛皮と毛皮のパック。 特に大規模な集落で非常に人気のある商品。"
};
t["misc.poison_gland"]<-{name="毒腺",
description="ウェブクネヒトの毒腺。 食物や飲物の近くに置かないこと。"
};
t["weapon.named_pike"]<-{description="ある距離を突き抜けて敵を寄せ付けないために使用される長いパイク。 この特定のパイクは、曲がっても折れることのない柔軟な木材から巧みに作られている。金属の先端は、世界のこれらの地域ではめったに見られない合金で構成されている。"
};
t["weapon.military_pick"]<-{name="軍用ピック",
description="最も頑丈な鎧に穴を開けるように設計された、長くて先の尖った金属製の頭部を備えた木製の柄。"
};
t["accessory.night_vision_elixir"]<-{name="夜目のエリクサー",
description="この秘薬は、消費されると、まるで昼のように夜を明るくする。 責任を持って飲んでください。 次の戦いのために続きます。"
,gettooltips= [{b="Not affected by nighttime",t="夜間による影響を受けない"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["weapon.warbrand"]<-{name="ウォーブランド",
description="長くて薄い刃を持ち、片側だけを研ぎ、クロスガードを持たない両手用の剣。 クイックスラッシュとスイープストライクの両方が使用可能。"
};
t["armor.body.heavy_iron_armor"]<-{name="ヘビーアイアンアーマー",
description="この鎧は、重金属板、鱗、鎖状の断片から作られている。 北方の戦士の真の鎧。"
};
t["armor_upgrade.unhold_fur"]<-{name="アンホールドの毛皮のマント",
description="フロストアンホールドの雄大な白い毛皮で作られた厚いマント。 あらゆる鎧の上に着用して、遠隔武器に対する着用者の弾力性を高めることができる。"
,gettooltips= [{b="Reduces any ranged damage to the body by [color=${Const.UI.Color.NegativeValue}]-20%[/color]",t="体に対する遠隔攻撃のダメージを[color=${Const.UI.Color.NegativeValue}]-20%[/color]軽減する"}]
};
t["weapon.goblin_bow"]<-{name="ブンドックボウ",
description="ゴブリンが使用する非常に軽い短弓。"
};
t["weapon.acid_flask"]<-{name="酸フラスコ",
description="リンドヴルムの酸性血液の濃縮物で満たされたフラスコ。 それは多くの材料に対して非常に腐食性があり、鎧を素早く燃やす。 短距離で投げることができる。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Reduces the target's armor by [color=${Const.UI.Color.DamageValue}]20%[/color] each turn for 3 turns",t="ターゲットの鎧を3ターンの間[color=${Const.UI.Color.DamageValue}]20%[/color]ずつ減らす"},
{b="Has a [color=${Const.UI.Color.DamageValue}]33%[/color] chance to hit bystanders at the same or lower height level as well",t="[color=${Const.UI.Color.DamageValue}]33%[/color]の確率で、同じかより下の高さレベルにいる隣接するキャラクターにもヒットする"},
{b="Is destroyed on use",t="使い捨て"}]
};
t["misc.cloth_rolls"]<-{name="羊毛布のロール",
description="羊毛で織られた布。 商人はこれに良いコインを支払うだろう。"
};
t["weapon.named_axe"]<-{description="装甲の敵と戦うために明示的に設計された巧妙で珍しい変種の斧。"
};
t["weapon.swordlance"]<-{name="ソードランス",
description="鋭い湾曲した刃に取り付けられた長いポールは、ある距離にわたって深いスイープストライクを提供するために使用される。"
};
t["misc.broken_ritual_armor"]<-{name="壊れた儀式の鎧",
description="儀式のルーン文字で覆われた、重い野蛮な鎧の壊れた残骸。 このように使えないのに、何か特別なところがあると感じる。 おそらくこれを修復する方法があるのではないだろうか？"
};
t["shield.kite_shield"]<-{name="カイトシールド",
description="下半身にも優れた防護を提供する革で覆われた細長い木製の盾。 接近戦で扱うにはややかさばる。"
};
t["weapon.thorned_whip"]<-{name="棘付鞭",
description="丈夫なとげのある鞭。 野蛮人が戦闘と野獣の群れの両方で使用するが、その最大のものでさえ、その振るう音に身を屈める。"
};
t["weapon.hooked_blade"]<-{name="フック付ブレード",
description="戦闘での使用に適した農業用の道具であるこのポールアームは、ある程度の距離を打って目標を引き込むためのフック付ブレードを持つ。"
};
t["weapon.heavy_javelin"]<-{name="重いジャベリンの束",
description="重くて頑丈そうなジャベリンのセット。 投げたり叩いたりするのは難しいが、より威力がある。"
};
t["weapon.reinforced_wooden_flail"]<-{name="強化木製フレイル",
description="短い鎖で取り付けられ、金属で補強された2本の大きな棒である強化木製フレイルは、農具になっている武器である。 それはかなり予測不可能なものだが、ほとんどの者が頭部によく当たって倒れるほど致命的であり、シールドカバーの上または周りを攻撃するのに役立つ。"
};
t["armor.body.basic_mail_shirt"]<-{name="ベーシックメイルシャツ",
description="ベーシックでシンプルなメイルシャツ。 斬撃や刺突攻撃に対する適切で手頃な防護を提供する。"
};
t["misc.glistening_scales"]<-{name="きらめく鱗",
description="この鱗は、太陽に向けると、すべての色できらめき、美しく輝く。"
};
t["weapon.named_orc_axe"]<-{description="鋭い頭を持つ重い金属片。 人間の手には合わない。"
};
t["armor.body.decayed_reinforced_mail_hauberk"]<-{name="腐敗した強化メイルホーバーク",
description="状態の悪いロングメイルシャツ。 いくつかの輪が欠けていて、汚れで覆われており、異臭がする。"
};
t["weapon.firelance"]<-{name="火槍",
description="発火すると2つのタイルに火を噴く爆発物を備えた南方のデザインの槍。 噴射は戦闘毎に1回のみ使用できるが、戦闘後に自動的に補充される。"
};
t["armor_upgrade.serpent_skin"]<-{name="蛇皮のマント",
description="砂漠の蛇の薄くてきらめく鱗から作られたマントは、特に熱と炎に耐性がある。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+30[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+30[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-2[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-2[/color] 最大疲労"},
{b="Reduces damage from fire and firearms by [color=${Const.UI.Color.NegativeValue}]33%[/color]",t="火もしくは銃によるダメージを[color=${Const.UI.Color.NegativeValue}]33%[/color]軽減する"}]
};
t["misc.white_pearls"]<-{name="白真珠",
description="様々なサイズの珍しい白真珠。 都市ではいい値が付くはずだ。"
};
t["misc.trade_jug"]<-{name="不思議な水差し",
description="ユチという謎の旅人と交換されたこの水差しの中身は、想像を絶する力を与える魔法の飲み物になることを約束します。"
,gettooltips= [{b="Grants a perk point",t="特性ポイントを獲得する"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"}]
};
t["misc.sabertooth"]<-{name="剣牙",
description="恐ろしい獣を追い詰めたふりをしたい人に、おそらくいくつかのクラウンのために売ることができる非常に大きな歯。"
};
t["armor.body.goblin_medium_armor"]<-{name="ミディアムアーマー",
description=""
};
t["armor.body.armor_of_davkul"]<-{name="Davkulの鎧",
description="この世界からではない古代の力であるダヴクルの恐ろしい側面、そしてそれが形作られたその身体からの％victim％の最後の残骸。 それは決して壊れることはないが、代わりにその場で傷ついた皮膚を再成長させ続ける。"
,gettooltips= [{b="Regenerates itself by [color=${Const.UI.Color.PositiveValue}]90[/color] points of durability each turn.",t="耐久度を毎ターン[color=${Const.UI.Color.PositiveValue}]90[/color]ポイント回復する。"}]
};
t["armor.head.flat_top_with_closed_mail"]<-{name="クローズドメイル付フラットトップ",
description="首と顔を覆うメイルコイフを備えたフラットな金属製ヘルム。"
};
t["armor.head.hood"]<-{name="フード",
description="天候や傷から保護するためのシンプルなフード。"
};
t["weapon.orc_wooden_club"]<-{name="木の枝",
description="木から引き裂かれた大きくて重い枝。 人間の手にはあまり適していない。"
};
t["armor.head.kettle_hat"]<-{name="ケトルハット",
description="リムの広い金属製ヘルム。"
};
t["armor.head.rusty_mail_coif"]<-{name="さびたメイルコイフ",
description="さびたメイルコイフはまだ優れた保護を提供する - それでもひどい汚れがあるが。"
};
t["armor.body.orc_berserker_light_armor"]<-{name="トロフィーボーン",
description=""
};
t["base.shield"]<-{gettooltips= [{b="Melee Defense [color=${Const.UI.Color.PositiveValue}]+",t="近接防御 [color=${Const.UI.Color.PositiveValue}]+"},
{b="Ranged Defense [color=${Const.UI.Color.PositiveValue}]",t="遠隔防御 [color=${Const.UI.Color.PositiveValue}]"},
{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"},
{b="Shield skills build up [color=${Const.UI.Color.NegativeValue}]",t="盾スキルによる疲労は[color=${Const.UI.Color.NegativeValue}]"},
{b="[/color] more fatigue",t="[/color]多くなる"},
{b="Shield skills build up [color=${Const.UI.Color.PositiveValue}]",t="盾スキルによる疲労は[color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] less fatigue",t="[/color]少なくなる"},
{b="[color=${Const.UI.Color.NegativeValue}]Broken and unusable[/color]",t="[color=${Const.UI.Color.NegativeValue}]破損していて使用不可能[/color]"}]
};
t["weapon.polehammer"]<-{name="ポールハンマー",
description="長いポールに取り付けられたウォーハンマー。装甲目標に対して、ある距離を越えて最前線の後ろから使用される。"
};
t["armor.head.padded_flat_top_helmet"]<-{name="パッド入フラットトップヘルム",
description="ノーズガードとパッド入りのコイフが下に付いたフラットな金属製ヘルム。"
};
t["armor.body.named_noble_mail_armor"]<-{description="この軽いメイルアーマーは、かつては有名なフェンシングマスターの私物だった。 チュニックのように軽いが、体の重要な部分をすべて保護する。"
};
t["armor.head.kettle_hat_with_mail"]<-{name="メイル付ケトルハット",
description="広い縁と下にメイルコイフを備えた金属製ヘルム。"
};
t["misc.paint_remover"]<-{name="ペイントリムーバー",
description="ペイントリムーバーのバケツ。 多くの一般的なヘルムから塗料を取り除くために使用可能。"
,gettooltips= [{b="Right-click or drag onto a helmet carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているヘルムを右クリックまたはドラッグして、ペイントする。このアイテムは消費される。"}]
};
t["weapon.blunt_cleaver"]<-{name="なまくらのクリーバー",
description="この鈍い包丁は重くて鈍いが、それでもひどい傷を引き起こす可能性がある。"
};
t["misc.ancient_gold_coins"]<-{name="古代の金貨",
description="様々な古代の痕跡が刻まれた厚い金貨。 君が買い手を見つけることができれば大きな価値があるはずだ。"
};
t["misc.lindwurm_hoard"]<-{name="リンドヴルムの溜め込んだもの",
description="リンドヴルムの内部で溜め込まれた、きらめく貴重品のコレクション。"
};
t["shield.wooden_shield"]<-{name="木製の盾",
description="丸い木製の盾。"
};
t["armor_upgrade.light_gladiator_upgrade"]<-{name="パッド入アーマーピース",
description="追加の保護を提供するパッド入りアームピース。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+60[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+60[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-4[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-4[/color] 最大疲労"}]
};
t["armor.body.goblin_shaman_armor"]<-{name="儀式の鎧",
description=""
};
t["shield.named_bandit_kite_shield"]<-{description="遠隔攻撃からの優れた保護のために全身を覆う長い木製の盾。 この特定の盾はいくつかのユニークな職人技を示しており、稀な発見である。"
};
t["weapon.bludgeon"]<-{name="棍棒",
description="木製の柄にトゲ付きの金属製頭部。粗い作りだが、頭部をバッシングするのに効果的。"
};
t["armor.head.nomad_reinforced_helmet"]<-{name="遊牧民の強化ヘルム",
description="メイルで補強された遊牧民のヘルム。"
};
t["armor.head.orc_warrior_medium_helmet"]<-{name="略奪されたケトルハット",
description=""
};
t["weapon.scimitar"]<-{name="シミター",
description="南方のエキゾチックな湾曲した剣で、斬撃には優れているが、鎧を突き刺したり貫通したりすることはできない。"
};
t["armor.head.named_metal_skull_helmet"]<-{description="頭蓋骨のようなフェイスマスクを備えた北方の蛮族に典型的な重いヘルム。 この作品は印象的であると同時に巨大。"
};
t["armor_upgrade.light_padding_replacement"]<-{name="軽量パッドへの交換",
description="エキゾチックな素材で作られたこの交換用パッドは、通常のパッドと同じ量の保護を軽量で提供可能。"
,gettooltips= [{b="Reduces an armor's penalty to Maximum Fatigue by [color=${Const.UI.Color.NegativeValue}]20%[/color]",t="最大疲労への鎧のペナルティーを[color=${Const.UI.Color.NegativeValue}]20%[/color]軽減する"}]
};
t["armor.body.worn_mail_shirt"]<-{name="使い古しのメイルシャツ",
description="何年にもわたって使われ一部の部品を失った強化メイルシャツ。"
};
t["weapon.heavy_rusty_axe"]<-{name="重いさびた斧",
description="この重いさびた斧は、その鋭さよりもその重さによって機能するが、それでも仕事を成し遂げる。"
};
t["shield.named_golden_round"]<-{description="並外れた品質の金属製ラウンドシールド。 これは、それを誇る戦士の誇りだったに違いない。"
};
t["armor.body.leather_tunic"]<-{name="レザーチュニック",
description="保護を強化するための布チュニックの上にある革のベスト。"
};
t["weapon.two_handed_wooden_flail"]<-{name="両手木製フレイル",
description="シールドカバーの上または周りを打つことができる重い両手持ちの木製のフレイル。"
};
t["armor.head.assassin_head_wrap"]<-{name="暗殺者のヘッドラップ",
description="暗殺者のダークヘッドラップ。"
};
t["accessory.cursed_crystal_skull"]<-{name="呪われた水晶の頭蓋骨",
description="単一の大きな結晶から彫られた不気味な頭蓋骨。 表面に傷やその他の跡は見られない。 近くにいるだけで、ほとんどすべての人の決意の火が消え、希望が失われ、疑いが芽生える。"
,gettooltips= [{b="Reduces the Resolve of any opponent engaged in melee by [color=${Const.UI.Color.NegativeValue}]-10[/color]",t="近接した敵の決意を[color=${Const.UI.Color.NegativeValue}]-10[/color]減少させる"},
{b="User can never have [color=${Const.UI.Color.NegativeValue}]confident[/color] morale",t="ユーザーの士気は[color=${Const.UI.Color.NegativeValue}]自信がある[/color] 状態にならない"}]
};
t["armor.body.rugged_scale_armor"]<-{name="頑丈なスケイルアーマー",
description="厚い鉄の鱗で作られた重いボディアーマー。"
};
t["weapon.broken_ancient_sword"]<-{name="折れた古代の剣",
description="刃が折れた古代の剣で、手の届く範囲が大幅に制限されている。"
};
t["weapon.named_goblin_heavy_bow"]<-{description="ゴブリンは効率的で軽い弓を作る方法を知っている。 未知の淡い木で作られたこの作品は、その小さなサイズにもかかわらず、驚くべき弓力を持っている。"
};
t["armor.head.faction_helm"]<-{name="装飾されたフルヘルム",
description="呼吸穴と複雑な装飾が施された金属製クローズドヘルム。 防護の点で優れており、見るべき芸術作品だが、息を吸うのが難しく、視野を制限する。"
};
t["weapon.masterwork_bow"]<-{name="傑作の弓",
description="細かく細工された弓。グリップが軽く、正確さのために完璧にバランスが取れている。 様々な森の素材から作られ、この木の色と武器の曲線は渦巻いており、象嵌のように見える。 本当に熟練の弓職人の仕事。"
};
t["misc.spider_silk"]<-{name="ゴッサマー",
description="ゴッサマーはウェブクネヒトの遺跡から集まった。 軽く丈夫で、ほとんどの一般的な素材よりも優れている。 べたつかなければだが…"
};
t["armor.body.cloth_sash"]<-{name="布サッシュ",
description="厚手の布で作られたダブルサッシュで、体全体に着用する。"
};
t["misc.petrified_scream"]<-{name="石化した叫び",
description="アルプの遺跡の中で見つかった不気味なアーティファクト。 これを持ち歩くと、悪い夢や悪い夜の休息を引き起こす可能性がある。"
};
t["shield.named_rider_on_horse"]<-{description="図像画像で覆われた遺物ヒーターシールド。 古いように見えるが、耐久性があり、扱いやすくなっている。"
};
t["armor.head.ancient_honorguard_helmet"]<-{name="古代の名誉衛兵ヘルム",
description="複雑な装飾が施された古代の重いヘルム。"
};
t["shield.goblin_light_shield"]<-{name="木製の小競り合いの盾",
description="ゴブリンによって作られた木製の盾。 軽量でありながら小型であり、それを使用する人間の攻撃に対する保護はほとんどない。"
};
t["weapon.named_rusty_warblade"]<-{description="この巨大で非常に巧妙に作られたウォーブレードは、北方の野蛮な部族に典型的なルーン文字と装飾で覆われている。"
};
t["weapon.hand_axe"]<-{name="ハンドアックス",
description="手頃な長さの柄と洗練された頭部を備えた片手斧。"
};
t["weapon.pitchfork"]<-{name="ピッチフォーク",
description="わらを持ち上げたり投げたりするために使用される長い柄と太い先の尖ったタインを備えた農具。 即興の武器として、敵を寄せ付けないようにするために使用できるが、最悪の怪我を負わせることはなく、装甲に対してはパフォーマンスが低下する。"
};
t["armor.head.full_aketon_cap"]<-{name="フルアケトンキャップ",
description="首を覆う大きなパッド入布製キャップ。"
};
t["misc.legendary_sword_blade"]<-{name="剣の刃",
description="クラーケンから回収した壊れた剣のきらめく刃。 何年にもわたる戦いの中で、このように巧みに作られた刃には出会ったことがない。 両方のパーツがあれば、おそらく剣は再鍛造される可能性がある。"
};
t["armor.body.padded_mail_and_lamellar_hauberk"]<-{name="パッド入メイルラメラーアーマー",
description="メイルコート、パッド、ラメラーで構成される重い複合装甲。"
};
t["misc.gemstones"]<-{name="宝石",
description="様々なサイズにカットされた宝石。 君が買い手を見つけることができれば大きな価値があるはずだ。"
};
t["weapon.rusty_warblade"]<-{name="さびたウォーブレード",
description="剣と斧を組み合わせて壊滅的な両手包丁にする湾曲した端を持つ重い刃。"
};
t["weapon.named_sword"]<-{description="両刃のバランスのとれた長剣。 これと同じように作られた武器は見つけるのが難しい。"
};
t["armor.head.named_nordic_helmet_with_closed_mail"]<-{description="フェイスガード付きのこの北方のヘルムは、並外れて細工されており、見た目が印象的であると同時に防護的。"
};
t["weapon.named_two_handed_mace"]<-{description="真の職人の燃えるような鍛冶場で生まれた大きな両手メイス。 その巨大な頭にもかかわらず、武器はバランスが取れており、経験豊富な者にとってはかなり扱いやすい。"
};
t["shield.named_full_metal_heater"]<-{description="ほぼ完全に金属で作られた精巧なヒーターシールド。 重くて丈夫だが、見た目よりも軽い。 これを作った職人は本当に交易の達人だったに違いない。"
};
t["weapon.orc_flail_2h"]<-{name="ベルセルクチェーン",
description="先端にトゲ付きの金属製頭部を備えた巨大な鉄の鎖。 平均的な人間が効果的に使用するには重すぎる。"
};
t["armor.head.blade_dancer_head_wrap"]<-{name="ブレードダンサーのヘッドラップ",
description="この独特の赤と黒のヘッドラップは、遊牧民の部族の最も熟練した戦士によって伝統的に着用されている。"
};
t["accessory.armored_wardog"]<-{description="戦争のために飼育された強くて忠実な犬。 ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。 これは、切り傷から保護するために革のコートを着ています。"
};
t["armor.body.rugged_surcoat"]<-{name="頑丈なサーコート",
description="保護を強化するために詰められたパッド入りの革のマントル。 通常は鎧の下に着用する。"
};
t["misc.wardog_armor_upgrade"]<-{name="軍用犬用アーマー",
description="戦闘である程度の保護を与えるためにどんな軍用犬でも着ることができるシンプルな革のコート。"
,gettooltips= [{b="Right-click or drag onto a wardog equipped by the currently selected character in order to use. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているウォードッグを右クリックまたはドラッグして、ペイントします。このアイテムは消費されます。"}]
};
t["base.trading_good_item"]<-{gettooltips= [{b="Bought for [img]gfx/ui/tooltips/money.png[/img]",t="購入価格 [img]gfx/ui/tooltips/money.png[/img]"}]
};
t["weapon.composite_bow"]<-{name="複合弓",
description="更なる弓力のために素材を重ね合わせて作られた短弓。"
};
t["accessory.arena_collar"]<-{name="アリーナカラー",
description="南方闘技場の戦闘員が着用する襟。"
};
t["weapon.two_handed_scimitar"]<-{name="両手シミター",
description="両手で振るう大きなシミター。 湾曲した刃は敵を切り裂く。"
};
t["weapon.named_crossbow"]<-{description="中距離でボルトを推進できるプルレバークロスボウ。 素人の手でも効果的だが、リロードするにはほぼ1ターン必要。 バランスが良く、非常に強い筋を備えたこの武器は、まさに熟練した職人の作品である。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードが必要[/color]"}]
};
t["misc.paint_red"]<-{name="赤いペンキ",
description="赤いペンキのバケツ。 多くの一般的なヘルムの塗装に使用できる。"
,gettooltips= [{b="Right-click or drag onto a helmet carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているヘルムを右クリックまたはドラッグして、ペイントする。このアイテムは消費される。"}]
};
t["armor.body.named_sellswords_armor"]<-{description="この層状の鎧はかつて有名な傭兵のものだった。 その高い弾力性と柔軟性は、卓越した職人技によるもの。 そしてこれは余分なポケットまで付いている！"
};
t["armor.head.gold_and_black_turban"]<-{description="この南方風のヘルムは、豪華な装飾が施されているだけでなく、バランスがよく、最高品質の素材で作られている。"
};
t["armor.head.goblin_leader_helmet"]<-{name="ヘルム",
description=""
};
t["misc.poisoned_apple"]<-{name="毒リンゴ",
description="おいしそう！"
};
t["misc.werewolf_pelt"]<-{name="異常に大きいオオカミの毛皮",
description="市場でまともな価格を取得する必要がある厚くて異常に大きいオオカミの毛皮。"
};
t["shield.named_undead_kite_shield"]<-{description="見かけの古さにもかかわらず、下半身にも優れた保護を提供する細長い木製の盾。 接近戦で扱うにはややかさばる。"
};
t["armor_upgrade.leather_neckguard"]<-{name="革のネックガード",
description="硬化した革のこのネックガードは、いくつかの追加の防護のために任意の鎧に取付可能。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+10[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+10[/color] 耐久度"}]
};
t["misc.heart_of_the_forest"]<-{name="森の心臓",
description="人間の心臓の形に似たとげのある植物の欠片。"
};
t["weapon.goblin_crossbow"]<-{name="スパイクインパラー",
description="大きくて重いクロスボウで、正面に威嚇するようなトゲがある。 ミニチュアバリスタのように、ターゲットヒットをノックバックするのに十分な力でステークを撃ちます。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードが必要[/color]"}]
};
t["misc.glowing_resin"]<-{name="輝く樹脂",
description="これらの琥珀色の樹脂の破片は、明るいオレンジ色をしている。 溶けた場合、材料は強力な接着剤になる。"
};
t["shield.named_bandit_heater"]<-{description="近接戦闘に最適な頑丈な三角盾。 非常に巧妙に作成されており、バランスの取れた模範的な出来栄え。"
};
t["accessory.heavily_armored_wardog"]<-{description="戦争のために飼育された強くて忠実な犬。 ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。 これは保護のために厚手のハイドコートを着ています。"
};
t["supplies.money"]<-{name="クラウン"
,gettooltips= [{b="The amount of [color=${Const.UI.Color.PositiveValue}]",t="この土地の通貨[color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] crowns, the currency in these lands. Will be added to your global stock once you're back on the worldmap.",t="[/color]クラウン。 世界地図に戻ると、グローバルストックに追加される。"}]
};
t["accessory.slayer_necklace"]<-{name="",
description="オークの骨のように見えるもので作られたネックレス。"
};
t["misc.growth_pearls"]<-{name="成長真珠",
description="ナハツェーラー組織の急速な成長は、小さな粒子や破片を飲み込み、それらを生き物の中にあるきらめく真珠に変えることがある。 都市ではいい値が付くはずだ。"
};
t["weapon.pickaxe"]<-{name="つるはし",
description="つるはしは、木製の柄に取り付けられた金属製の硬い頭部で、岩を砕くために使用される鉱山労働者の道具。 即興の武器としては扱いにくいが、鎧を通してさえ致命的な怪我をもたらす可能性がある。"
};
t["misc.serpent_skin"]<-{name="蛇の皮",
description="大きな蛇のうろこ状の肌。 熟練した職人ならこれを何か役に立つものに変えることができる。"
};
t["misc.kraken_horn_plate"]<-{name="ホーンプレート",
description="伝説のクラーケンの頭から取った、この大きくて硬いホーンプレートは、この世界ではほとんど主張できないトロフィーである。"
};
t["armor.head.wizard_hat"]<-{name= "魔術師の帽子",
description="縁の広い先のとがった帽子。"
};
t["armor.head.nasal_helmet"]<-{name="ノーズヘルム",
description="ノーズガードが追加された金属製ヘルム。"
};
t["armor.head.heavy_horned_plate_helmet"]<-{name="ヘビーホーンプレートヘルム",
description="この重いヘルムには装飾用の角が付いている。 これは、野蛮な部族内での高い地位と評判の表れである。"
};
t["armor.body.mail_hauberk"]<-{name="メイルホーバーク",
description="長くて重いチェーンメイルで、優れた防護を提供するが、着用するのは非常に疲れる。"
};
t["shield.goblin_heavy_shield"]<-{name="強化されたSkirmisherシールド",
description="ゴブリンによって作られた強化された木製の盾。 軽量でありながら小型であり、それを使用する人間の保護はほとんどない。"
};
t["armor.head.conic_helmet_with_closed_mail"]<-{name="クローズドメイル付コニックヘルム",
description="追加の保護のための完全に閉じたメイルスカートを備えた重い円錐形のヘルム。"
};
t["misc.paint_set_shields"]<-{name="ペイントセット",
description="いくつかの鮮やかな色のパレットとブラシのセット。 傭兵団の色で一般的なシールドをペイントするために使用できます。"
,gettooltips= [{b="Right-click or drag onto a shield carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っている盾を右クリックまたはドラッグして、ペイントします。このアイテムは消費されます。"}]
};
t["accessory.wardog"]<-{description="戦争のために飼育された強くて忠実な犬。ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。"
,names= [{b="\" the Wardog\"",t="- 軍用犬"}]
};
t["weapon.wooden_flail"]<-{name="木製フレイル",
description="短い鎖で取り付けられた2本の大きな棒である木製フレイルは、穀物の山を叩いて殻を緩めるために使用される農具である。 即興の武器として、かなり予測不可能だが、シールドカバーの上または周りを攻撃するのに役立つ。"
};
t["armor.body.ancient_lich_attire"]<-{name="古代の服",
description=""
};
t["misc.signet_ring"]<-{name="シグネットリング",
description="宝石で飾られたシグネットリング。 都市ではいい値が付くはずだ。"
};
t["weapon.named_billhook"]<-{description="ある程度の距離を打つための刃と、目標を引き込むために取り付けられたフックを備えたパイクのような武器。 この武器を鍛造した鍛冶屋は、自分が何をしているのかを確かに理解していた。"
};
t["armor_upgrade.metal_pauldrons"]<-{name="金属製の肩甲",
description="肩甲と上半身の保護を強化するために任意の鎧に追加できる頑丈な金属製の肩甲。 もちろん、それはまた鎧を少し重くする。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+40[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+40[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-4[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-4[/color] 最大疲労"}]
};
t["armor.body.hide_and_bone_armor"]<-{name="皮骨の鎧",
description="皮と骨は北方圏で一般的な材料である。 この鎧はまともな防護のために両方を使用している。"
};
t["armor.body.animal_hide_armor"]<-{name="アニマルハイドアーマー",
description="まともな間に合わせの鎧を作成するために一緒にパッチを当てた重い皮。"
};
t["armor.head.barbute_helmet"]<-{name="バービュートヘルム",
description="頑丈でありながら軽いバービュートヘルム。これらの国では珍しいデザインで、特に軽くて耐久性のある鋼で作られている。"
};
t["armor.body.orc_young_heavy_armor"]<-{name="メタルプレートハイドアーマー",
description=""
};
t["shield.worn_kite_shield"]<-{name="使い古したカイトシールド",
description="下半身もしっかり保護する細長い木製シールド。 接近戦で扱うにはややかさばる。"
};
t["weapon.scramasax"]<-{name="スクラマサクス",
description="片刃を備えた長くて重いナイフは、斬撃よりも叩き切ることに多く使用された。"
};
t["armor_upgrade.direwolf_pelt"]<-{name="Direwolf Pelt Mantle",
description="凶暴なダイアウルフから採取した毛皮を硬化させて縫い合わせ、首に獣ハンターのトロフィーとして着用する。 このように獣の皮を身につけると、印象的な姿になる。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+15[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+15[/color] 耐久度"},
{b="Reduces the Resolve of any opponent engaged in melee by [color=${Const.UI.Color.NegativeValue}]-5[/color]",t="近接した敵の決意を[color=${Const.UI.Color.NegativeValue}]-5[/color]減少させる"}]
};
t["armor.head.vizier_headgear"]<-{name="",
description=""
};
t["weapon.named_bardiche"]<-{description="珍しい合金から作られたこの重いバルディッシュは、同様の武器よりもはるかに優れている。"
};
t["armor_upgrade.negative_moulderedd"]<-{name="成形",
description=""
};
t["supplies.beer"]<-{name="ビール",
description="食糧。 この発酵ホップまたは大麦飲料は、普通の水よりも耐久性があり、安全に飲むことができる。"
};
t["misc.bone_figurines"]<-{name="骨の置物",
description="さまざまな珍しい骨から作られた小さな彫刻が施された置物。 コレクターはこれにまともなコインを支払うかもしれません。"
};
t["supplies.dried_lamb"]<-{name="乾燥した子羊肉",
description="食糧。  ドライラムは南方の名物であり、非常に人気のある料理である。 空腹の傭兵のための本当の御馳走。"
};
t["misc.unhold_hide"]<-{name="アンホールドの獣皮",
description="皮はほとんどの鎧の基礎であり、アンホールドから取ったこの厚い皮は特に頑丈。"
};
t["weapon.light_crossbow"]<-{name="ライトクロスボウ",
description="中距離でボルトを推進できるプルレバークロスボウの軽量版。 素人の手でも効果的だが、リロードするにはほぼ1ターン必要。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードが必要[/color]"}]
};
t["armor.head.orc_berserker_helmet"]<-{name="ボーンヘルム",
description=""
};
t["armor_upgrade.protective_runes"]<-{name="保護ルーンと印章",
description="乾いた肌に書かれ、不安なオーラを放つ保護ルーンと印章。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+20[/color] Resolve at morale checks against fear, panic or mind control effects",t="[color=${Const.UI.Color.PositiveValue}]+20[/color] 決意を恐怖、混乱、マインドコントロールに対する士気チェックに追加"}]
};
t["armor.head.flat_top_with_mail"]<-{name="メイル付フラットトップ",
description="ノーズガードとメイルコイフが下に付いたフラットな金属製ヘルム。"
};
t["armor.body.green_coat_of_plates"]<-{description="チェーンメイルと追加のパッドで強化された珍しいプレートコート。 真の職人技の作品！"
};
t["armor.head.golden_feathers"]<-{description="外国のデザインの頑丈な合金ヘルムと、優れた保護のためのフルメイルコイフを組み合わせたもの。"
};
t["armor.head.nomad_leather_cap"]<-{name="遊牧民のレザーキャップ",
description="軽い遊牧民の革の帽子。"
};
t["weapon.named_warscythe"]<-{description="鋭い湾曲した刃に取り付けられた長いポールは、ある距離にわたって深いスイープストライクを提供するために使用される。 この模範は特に巧妙に作られている。"
};
t["armor_upgrade.double_mail"]<-{name="ダブルメイル",
description="厚いダブルメイルパッチ。 重いが、鎧の防護をさらに強化するのに効果的。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+20[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+20[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-2[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-2[/color] 最大疲労"}]
};
t["armor.head.full_leather_cap"]<-{name="フルレザーキャップ",
description="頭と首を保護する閉じた革のキャップ。 追加の防護のためにパッド入り。"
};
t["weapon.named_goblin_spear"]<-{description="巧みに作られたゴブリンの槍。 熟練した戦闘機の手に正確、迅速、そして致命的。"
};
t["armor.head.fangshire"]<-{name="ファングシャー",
description="牙は北の虎の頭蓋骨で、2つの凶暴な牙の後ろに男性の顔を深く暗く抱きしめています。 もともとは猛烈な北部の襲撃者であるビーストマンのビャルンドが着用していましたが、彼が血まみれの襲撃を行い、海岸線沿いの多くの村を焼き払ったとき、敵の心に恐怖を植え付けました。 Bjarundが最終的に殺害されたとき、Fangshireはトロフィーとして受け取られ、さらに南に行きました。 噂によると、着用者の目は鋭い黄色に輝き、夜通し見ることができます。"
,gettooltips= [{b="Allows the wearer to see at night and negates any penalties due to nighttime.",t="着用者が夜間に見ることを許可し、夜間によるペナルティを無効にします。"}]
};
t["supplies.wine"]<-{name="ワイン",
description="食糧。  つぶして発酵させたブドウから作られたワイン。 どちらも製造に精巧で、購入するのに費用がかかる。"
};
t["armor.body.heraldic_armor"]<-{name="紋章のホーバーク",
description="肩甲、追加の金属メッキ、リベットで留められた革の鎧で補強されたメイルホーバークは、貴族家の色のタバードで覆われている。"
};
t["ammo.arrows"]<-{name="矢筒",
description="あらゆる種類の弓を使用するために必要な矢筒。 十分な弾薬がある場合、各戦闘後に自動的に補充される。"
,gettooltips= [{b="Contains [color=${Const.UI.Color.PositiveValue}]",t="残りの矢 [color=${Const.UI.Color.PositiveValue}]"},
{b="[color=${Const.UI.Color.NegativeValue}]Is empty and useless[/color]",t="[color=${Const.UI.Color.NegativeValue}]弾薬が空で使用不可能[/color]"},
{b="[/color] arrows",t="[/color]"}]
};
t["weapon.two_handed_saif"]<-{name="両手サイフ",
description="サイフの長いバージョンは両手で振るう。 湾曲した刃は恐ろしい傷を切り裂くことができる。"
};
t["shield.named_lindwurm"]<-{description="頑丈な木製フレームは、珍しいリンドヴルムの鱗のきらめく山の土台を築き、侵入できない盾を形成する。"
};
t["weapon.antler_cleaver"]<-{name="鹿角のクリーバー",
description="鋭利な枝角から作られた非常に粗雑な包丁。 重くて鈍いが、それでも危険。"
};
t["weapon.named_khopesh"]<-{description="華やかなグリップにフィットする華麗な曲刀。 このような作品は何世紀にもわたって失われ、帝国の時代までさかのぼると言われている。"
};
t["armor.body.brown_coat_of_plates"]<-{description="頑丈な金属板と組み合わせた厚いメイルホーバーク。 この鎧は、最も激しい戦闘でも着用者を保護する。"
};
t["armor.head.padded_kettle_hat"]<-{name="パッド入ケトルハット",
description="幅広のリムとパッド入りのコイフを下に備えた金属製ヘルム。"
};
t["armor.head.nomad_light_helmet"]<-{name="遊牧民のライトヘルム",
description="南方の砂漠地帯に典型的な軽量ヘルム。"
};
t["armor.body.ancient_plate_harness"]<-{name="古代のプレートハーネス",
description="厚い金属板とメイルで作られたこの重い古代の鎧は、数え切れないほどの年月を経ても、今でも優れた防護を提供している。 部分的に固まって腐っており、着用者の動きを著しく制限している。"
};
t["shield.schrat"]<-{name="シュラットの盾",
description=""
};
t["misc.goblin_carved_ivory_iconographs"]<-{name="刻まれた象牙のアイコングラフ",
description="ゴブリン社会の尊敬されるメンバーを描いた巧みに彫られた象牙のアイコングラフ。"
};
t["misc.ghoul_horn"]<-{name="ナハツェーラーの角",
description="ナハツェーラーは印象的な角を持っており、これらは順番に印象的なトロフィーを作ります。"
};
t["base.accessory"]<-{gettooltips= [{b="Worn in Accessory Slot",t="アクセサリースロットに装備"},
{b="Carried in Bag",t="バッグで運搬中"},
{b="Usable in Combat",t="戦闘中に使用可能"},
{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"}]
};
t["misc.paint_white_blue"]<-{name="白と青のペイント",
description="白と青のペンキのバケツ。 多くの一般的なヘルムの塗装に使用できる。"
,gettooltips= [{b="Right-click or drag onto a helmet carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているヘルムを右クリックまたはドラッグして、ペイントする。このアイテムは消費される。"}]
};
t["misc.looted_valuables"]<-{name="略奪された貴重品",
description="何年にもわたって野蛮人によって略奪されてきた山積みになった貴重品。 多くのものが壊れて曲がっているが、素材は非常に絶妙です。"
};
t["supplies.armor_parts"]<-{name="工具と消耗品"
,gettooltips= [{b="A good [color=${Const.UI.Color.PositiveValue}]",t="戦闘後に武器、鎧、ヘルム、盾を修理するための [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] assorted tools and supplies to repair weapons, armor, helmets and shields with after battle. Will be added to your global stock once you're back on the worldmap.",t="[/color]ユニットの各種工具と消耗品。 世界地図に戻ると、グローバルストックに追加される。"}]
};
t["weapon.goblin_staff"]<-{name="危険なスタッフ",
description="骨と羽で飾られた、古くて硬い木から彫られた危険なスタッフ。 コレクターにとって興味深いかもしれません。"
};
t["armor.head.southern_helmet_with_coif"]<-{name="コイフ付サザンヘルム",
description="首を保護するためのメイルコイフ付の南方メタルヘルム。"
};
t["armor.body.coat_of_scales"]<-{name="鱗のコート",
description="体の大部分を覆う、厚く重なり合う金属の鱗でできた重装甲。"
};
t["armor.head.nasal_helmet_with_mail"]<-{name="メイル付ノーズヘルム",
description="ノーズガードとメイルコイフが下に追加された金属製ヘルム。"
};
t["armor.head.closed_scrap_metal_helmet"]<-{name="クローズドスクラップメタルヘルム",
description="この重金属製ヘルムは、視認性は犠牲になるが、着用者の顔も保護する。"
};
t["weapon.named_spear"]<-{description="驚くほど軽く、しかも頑丈な巧みに作られた槍。"
};
t["weapon.named_fencing_sword"]<-{description="繊細で柔軟な適切なフェンシングソードを作ることは、それを振るうことと同じくらい難しい。 この特定の武器を生み出した鍛冶屋は、その業界で最高の一人だったに違いない。"
};
t["weapon.named_greatsword"]<-{description="このグレートソードは、柔軟性がありながら非常に耐久性のある刃を備えた真の傑作である。"
};
t["armor.body.southern_mail_shirt"]<-{name="サザンメイルシャツ",
description="北方で使われているものより少し薄くて軽い金属リングで作られたメイルシャツ。"
};
t["weapon.claw_club"]<-{name="クロークラブ",
description="いくつかの野生動物の巨大な爪がこの大きなクラブに固定されている。"
};
t["weapon.lightbringer_sword"]<-{name="古き神々の非難",
description="薄明薄暮の剣は、紫とオレンジを曲げて、薄明かりを完全に運んでいるように見える。 触ると、燃えているのか冷えているのかわからない。 魔法であれ、巧妙に作られたものであれ、武器が何であれ、それが巨大な力を撃退しているかのように振動し、鋼の真の電荷を見つけるためにそれを振るだけで済む。"
,gettooltips= [{b="Inflicts an additional [color=${Const.UI.Color.DamageValue}]10[/color] - [color=${Const.UI.Color.DamageValue}]20[/color] damage that ignores armor to up to three targets",t="鎧を無視する追加の [color=${Const.UI.Color.DamageValue}]10[/color] - [color=${Const.UI.Color.DamageValue}]20[/color] ダメージを最大3つの目標に対して与える"}]
};
t["armor.head.ijirok_helmet"]<-{name="イジロックの兜",
description="戦闘で野蛮な兜が壊れた後、この作品は伝説のイジロックの血に浸された。 あなたの理解を超えた力がそれを再び全体的に修復し、同様に着用者の傷も修復する。"
,gettooltips= [{b="Heals [color=${Const.UI.Color.PositiveValue}]10[/color] hitpoints of the wearer each turn",t="着用者のヒットポイントを毎ターン [color=${Const.UI.Color.PositiveValue}]10[/color] 回復する"}]
};
t["supplies.cured_venison"]<-{name="硬化鹿肉",
description="食糧。  塩で保存された鹿肉の硬化した塊。 旅に出る傭兵のための高級料理。"
};
t["shield.faction_wooden_shield"]<-{name="木製の盾",
description="丸い木製の盾。"
};
t["shield.coffin_shield"]<-{name="古代の棺の盾",
description="木でできており、青銅で補強された八角形の盾。 時が経ち、木がもろくなってきている。"
};
t["armor.head.southern_head_wrap"]<-{name="サザンヘッドラップ",
description="砂漠気候に適した伝統的な南方のヘッドラップ。"
};
t["shield.auxiliary_shield"]<-{name="古代の補助シールド",
description="楕円形の木製の遮光板。 木材はもろくて古く見え、耐久性が低くなっている。"
};
t["armor.head.orc_warlord_helmet"]<-{name="ヘルム",
description=""
};
t["misc.ghoul_brain"]<-{name="ナハツェーラーの脳みそ",
description="殺害されたナハツェーラーの脂っこい脳。 なぜこれが必要なのだろうか？"
};
t["weapon.crossbow"]<-{name="クロスボウ",
description="中距離でボルトを推進できるプルレバークロスボウ。 素人の手でも効果的だが、リロードにはほぼ1ターン必要。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードが必要[/color]"}]
};
t["misc.goblin_minted_coins"]<-{name="ミントの銀貨",
description="ゴブリンが通貨として使用する鋳造された銀貨。"
};
t["supplies.bread"]<-{name="パン",
description="食糧。  小麦から作られた軽いパンは、充実した食事になる。"
};
t["weapon.greataxe"]<-{name="グレートアックス",
description="戦闘用に設計された重くて長い両手斧で、スイングするたびに重くなり、人間を簡単に真っ二つに切ることができる。"
};
t["weapon.named_two_handed_flail"]<-{description="この印象的な両手フレイルは、それが由来する農具とほとんど共通点がない。 経験豊富な戦士によって設計され、非常に熟練した職人によって作られたようだ。"
};
t["armor.head.mask_of_davkul"]<-{name="ダヴクルの仮面",
description=" ダヴクルの垣間見ることは、古代と暗黒の力によって人間に授けられた贈り物であり、ヘルムは、最も言葉にできない儀式を通して人間の皮膚と骨と融合した。 人類がその先の領域からの創造物と一体になる未来を垣間見る。 それは決して壊れることはないが、代わりにその場で傷ついた皮膚を再成長させ続ける。"
,gettooltips= [{b="Regenerates itself by [color=${Const.UI.Color.PositiveValue}]90[/color] points of durability each turn.",t="耐久度を毎ターン[color=${Const.UI.Color.PositiveValue}]90[/color]ポイント回復する。"}]
};
t["armor.body.ancient_breastplate"]<-{name="古代の胸当て",
description="古代起源の変色した厚い胸当て。"
};
t["weapon.crude_axe"]<-{name="粗斧",
description="この斧は粗雑に作られているが、重くてギザギザになっている。"
};
t["base.armor_upgrade"]<-{gettooltips= [{b="Right-click or drag onto an armor carried by the currently selected character in order to permanently fuse. This item will be consumed in the process to give the following effects:",t="現在選択されているキャラクターが持っている鎧を右クリックまたはドラッグして、永久に融合します。このアイテムは消費され、次の効果を与えます："}]
};
t["armor.body.werewolf_mail"]<-{name="ダイアウルフメイルアーマー",
description="巨大なオオカミの毛皮を上に乗せた巧みに作られたメイルシャツ。 このように獣の皮を身につけると、印象的な姿になる。"
,gettooltips= [{b="Reduces the Resolve of any opponent engaged in melee by [color=${Const.UI.Color.NegativeValue}]-5[/color]",t="近接した敵の決意を[color=${Const.UI.Color.NegativeValue}]-5[/color]減少させる"}]
};
t["weapon.nomad_sling"]<-{name="遊牧民のスリング",
description="敵に石を投げつけるために使用される、金属で補強された杖の革のスリング。 至る所に石が豊富にあるので、弾薬が不足することはない。"
};
t["armor.head.decayed_great_helm"]<-{name="腐敗したグレートヘルム",
description="引き裂かれ、腐った装飾が施された素晴らしいヘルム。 かつては有名な騎士のものだったに違いない。"
};
t["weapon.orc_javelin"]<-{name="粗ジャベリンの束",
description="目標に投げることを目的とした粗雑に作られたジャベリンの束。 範囲が限られており、投げるのに疲れていますが、壊滅的な怪我を負わせる可能性があります。 代わりにシールドがヒットした場合、シールドに小さなダメージを与えることもできます。"
};
t["armor.body.padded_vest"]<-{name="パッド入ベスト",
description="鈍い打撃から保護するために密なウールで埋められた厚い布のベスト。"
};
t["supplies.preserved_mead"]<-{name="保存はちみつ酒",
description="食糧。  この灰の液体は、銀の小さな輝きが渦巻いている。 味は多少悪くなったが、ほとんど損なわれていない。"
};
t["armor.body.heraldic_mail"]<-{name="",
description="騎士にぴったりのこのメイルホーバークは、最高品質の素材で作られており、貴重な装飾や装飾品が自慢。"
};
t["weapon.named_goblin_pike"]<-{description="先端がギザギザになっているゴブリンパイクは、ひどい出血している傷を引き裂く可能性があります。 この作品は特に巧妙に作られています。"
};
t["armor.body.footman_armor"]<-{name="フットマンアーマー",
description="ロングメイルシャツとリベットレザーギャンベゾンで構成されるトランジショナルアーマー。"
};
t["armor.body.decayed_coat_of_scales"]<-{name="腐敗したスケイルコート",
description="このスケイルコートは摩耗しており、部品がいくつかなくなっている。 臭いを気にしないならば、それはまだ非常にいい防護を提供する。"
};
t["armor.body.ijirok_armor"]<-{name="イジロックの鎧",
description="戦闘で野蛮な鎧が壊れた後、この作品は伝説のイジロックの血に浸された。 あなたの理解を超えた力がそれを再び全体的に修復し、同様に着用者の傷も修復する。"
,gettooltips= [{b="Heals [color=${Const.UI.Color.PositiveValue}]10[/color] hitpoints of the wearer each turn",t="着用者のヒットポイントを毎ターン [color=${Const.UI.Color.PositiveValue}]10[/color] 回復する"}]
};
t["armor.head.closed_flat_top_with_neckguard"]<-{name="パッド入クローズドフラットトップ",
description="完全なフェイスガードとパッド入りのコイフが下に付いたクローズドヘルム。 息を吸うのが難しく、視野が制限される。"
};
t["misc.kraken_tentacle"]<-{name="切断された触手",
description="伝説的なクラーケンのしわが寄った触手の残骸は、ぬるぬるしてフワフワしているが、その想定される珍しい特性のために錬金術師によって非常に求められている。"
};
t["misc.spiritual_reward"]<-{name="ブルーバイアル",
description="他の男の命を犠牲にして悪意のある魔女と交換されたこの神秘的な調合は、精神のための魔法の飲み物であり、十数回の戦いを戦ったかのように知恵と洞察を与えることを約束します。"
,gettooltips= [{b="Grants a veteran level up",t="ベテランへのレベルアップを獲得する"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"}]
};
t["armor.head.goblin_light_helmet"]<-{name="ライトヘルム",
description=""
};
t["weapon.heavy_crossbow"]<-{name="ヘビークロスボウ",
description="中距離でボルトを推進できるクランク付きの重クロスボウで、重装甲の目標に対しても効果的。 リロードにはほぼ1ターン必要。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードが必要[/color]"}]
};
t["armor.body.mail_shirt"]<-{name="メイルシャツ",
description="ほとんどの武器に対して優れた防護を提供するショルダーガード付きのメイルシャツ。"
};
t["armor.head.conic_helmet_with_faceguard"]<-{name="フェイスガード付コニックヘルム",
description="メイル付きのこの円錐形のヘルムには、金属製のフェイスガードが付いている。 重くて視界は悪いが、優れた保護を提供する。"
};
t["armor.head.nasal_helmet_with_rusty_mail"]<-{name="さびたメイル付ノーズヘルム",
description="錆びたメイルコイフが付いた、着用して使用したヘルム。"
};
t["accessory.heavily_armored_warhound"]<-{description="戦争のために飼育された強力で忠実な北部の猟犬。 ルーティング敵を偵察、追跡、または駆逐するための戦闘で解き放つことができます。 これは保護のために厚手のハイドコートを着ています。"
};
t["armor.head.gunner_hat"]<-{name="ガンナーの帽子",
description="都市国家の軍隊で精巧な火薬兵器の使用を実践する人々が着用する、細かく包まれた布ターバン。"
};
t["weapon.wooden_stick"]<-{name="木の棒",
description="シンプルな木の棒、通常は即興の武器。"
};
t["armor.body.decaying_coat_of_plates"]<-{name="腐敗したプレートコート",
description="錆びた金属ともろい革の部品を備えたやや腐敗したプレートコート。 おそらくしばらくの間、野外に放置されていた。"
};
t["weapon.named_goblin_falchion"]<-{description="鋭利な黒い岩から作られたこの残酷な刃は、目に見えるよりも速く傷を引き裂くことができます。 本当に注目に値する作品。"
};
t["weapon.longaxe"]<-{name="ロングアックス",
description="非常に長い柄を持つ比較的薄い刃は、ある距離で壊滅的な切断攻撃を行い、最前線の後ろから盾を使用できなくするために使用される。"
};
t["armor.body.ancient_scale_coat"]<-{name="古代のスケイルコート",
description="戦場ではなくコレクションに属する古代のデザインの重く変色したスケイルコート。"
};
t["misc.mysterious_herbs"]<-{name="不思議なハーブ",
description="これらのハーブは、君が知っているもののように見えたり、匂いがしたりしない。 この香りは、興味をそそると同時にぞっとするものだ。"
};
t["misc.deformed_valuables"]<-{name="変形した貴重品",
description="アンホールドは不器用だが強い生き物であり、見つけた貴重品を押しつぶして、便利なねじれたボールにする傾向がある。"
};
t["weapon.short_bow"]<-{name="ショートボウ",
description="中射程のシンプルな木製のショートボウ。 効果的に使用するには、ある程度の専門知識が必要。"
};
t["weapon.holy Water"]<-{name="祝福された水のフラスコ",
description="神々の男に祝福された水で満たされたフラスコ。 短距離で投げることができる。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Damage of [color=${Const.UI.Color.DamageValue}]20[/color] for [color=${Const.UI.Color.DamageValue}]3[/color] turns to any undead target hit",t="命中したアンデッドに対して[color=${Const.UI.Color.DamageValue}]3[/color]ターンの間、[color=${Const.UI.Color.DamageValue}]20[/color]ダメージを与える"},
{b="[color=${Const.UI.Color.DamageValue}]100%[/color] of damage ignores armor",t="[color=${Const.UI.Color.DamageValue}]100%[/color] のダメージは鎧を無視する"},
{b="Has a [color=${Const.UI.Color.DamageValue}]33%[/color] chance to hit bystanders at the same or lower height level as well.",t="[color=${Const.UI.Color.DamageValue}]33%[/color]の確率で、同じかより下の高さにいる隣接するキャラクターにも命中する"},
{b="Is destroyed on use",t="使い捨て"}]
};
t["armor.body.ancient_scale_harness"]<-{name="古代のスケイルハーネス",
description="頑丈だが、重く、部分的に腐敗した古代のスケイルハーネス。"
};
t["weapon.pike"]<-{name="パイク",
description="ある距離を突き抜けて敵を寄せ付けないために使用される長いパイク。"
};
t["misc.copper_ingots"]<-{name="銅のインゴット",
description="銅を溶かしてインゴットに鋳造し、輸送を容易にしたもの。 商人はこれに良いコインを支払うだろう。"
};
t["armor_upgrade.leather_shoulderguards"]<-{name="革のショルダーガード",
description="鋲付きの革製ショルダーガードは、軽鎧でも少し弾力性を高めるのに役立つ。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+10[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+10[/color] 耐久度"}]
};
t["armor.body.patched_mail_shirt"]<-{name="パッチを当てたメイルシャツ",
description="この軽いメイルシャツは長い時代を経てきたが、それでもまともな防護を与える。"
};
t["misc.quality_wood"]<-{name="高品質の木材",
description="節穴やその他の傷のない高品質の木材。 商人はこれに良いコインを支払うだろう。"
};
t["weapon.fighting_spear"]<-{name="戦槍",
description="戦いのために作られた長くて頑丈な槍。"
};
t["tool.reinforced_throwing_net"]<-{name="強化投網",
description="ネットは、目標が効果的に移動して防御する能力を妨げるため、目標に投げつけるために使用される。 ウェブクネヒトから取ったゴッサマーで補強されているため、抜け出すのはさらに困難。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"},
{b="Will root a target in place and reduce their defenses",t="目標をその場に拘束し、防御を減らす"},
{b="Is destroyed on use",t="使い捨て"},
{b="Chance to break free is reduced by [color=${Const.UI.Color.NegativeValue}]-15[/color]",t="自由になるチャンスが [color=${Const.UI.Color.NegativeValue}]-15[/color] 削減される"}]
};
t["supplies.pickled_mushrooms"]<-{name="酢漬けのキノコ",
description="食糧。  沼沢地には食べ物がほとんどないが、キノコのピクルスはこれらの地域の旅行者に好まれている。"
};
t["armor.body.sellsword_armor"]<-{name="傭兵の鎧",
description="頑丈なメイルホーバークの上に身に着けられた金属板で補強された長い革のコート。"
};
t["misc.potion_of_oblivion"]<-{name="忘却のポーション",
description="最も希少で最も奇妙な成分のこの調合がどのように味わうのか尋ねない方がいい！ これを飲む者は誰でも彼の人生を追体験することができ、彼が途中で下した決定を変えることができると言われている。"
,gettooltips= [{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"}]
};
t["armor.head.emperors_countenance"]<-{name="皇帝の顔",
description="神秘的なエネルギーが染み込んだ、昔からの皇帝の顔を示す金色の兜とフェイスマスク。 光に当てると、まるで顔が動いて嫌悪感を表現しているように見える。"
,gettooltips= [{b="Reflects [color=${Const.UI.Color.PositiveValue}]25%[/color] of damage taken in melee back to the attacker",t="近接攻撃で受けたダメージの[color=${Const.UI.Color.PositiveValue}]25%[/color]を攻撃者に反射する"}]
};
t["armor.body.coat_of_plates"]<-{name="プレートコート",
description="1層のパッド、1層の強力なメイル、および重金属プレートが上に鋲で留められている。 優れた防護を提供する非常に重い鎧。"
};
t["weapon.goedendag"]<-{name="ゴーデンダッグ",
description="上部にスパイクが付いた金属強化クラブ。 敵を突き刺したり、敵を倒して服従させたりするために使用可能。"
};
t["weapon.goblin_spiked_balls"]<-{name="スパイクボール",
description="目標に投げつけられる金属スパイク付きの小さくて重い鉄球。"
};
t["armor.body.gladiator_harness"]<-{name="剣闘士のハーネス",
description="南方の都市国家の闘技場でピットファイターが一般的に着用する革製のハーネス。"
};
t["armor.head.unhold_helmet_light"]<-{name="鎧",
description=""
};
t["armor.head.orc_young_heavy_helmet"]<-{name="金属メッキヘルム",
description=""
};
t["supplies.goat_cheese"]<-{name="ヤギ乳チーズ",
description="食糧。  ヤギのチーズは、特に北方の寒冷地域で一般的な人気のある、美味しくて豊かな食べ物。"
};
t["armor.head.assassin_face_mask"]<-{name="暗殺者のフェイスマスク",
description="暗殺者のフェイスマスクとヘッドラップ。"
};
t["armor.head.spiked_skull_cap_with_mail"]<-{name="メイル付スパイクスカルキャップ",
description="メイルコイフの上にお洒落なスパイクが付いた金属製スカルキャップ。"
};
t["misc.paint_white_green_yellow"]<-{name="白、緑、黄色のペイント",
description="白、緑、黄色のペンキのバケツ。 多くの一般的なヘルムの塗装に使用できる。"
,gettooltips= [{b="Right-click or drag onto a helmet carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているヘルムを右クリックまたはドラッグして、ペイントする。このアイテムは消費される。"}]
};
t["armor.head.cultist_hood"]<-{name="狂信者のフード",
description="2つの穴が開いたラフな紡績布バッグ。"
};
t["armor.body.thick_nomad_robe"]<-{name="厚い遊牧民のローブ",
description="厚手の布で作られた二層のローブ。"
};
t["weapon.greatsword"]<-{name="グレートソード",
description="切断と同様に粉砕に適した長い両手剣。"
};
t["armor.head.nasal_helmet_with_closed_mail"]<-{name="クローズドメイル付ノーズヘルム",
description="ノーズガードとクローズドメイルコイフが下にある金属製ヘルム。"
};
t["misc.unhold_heart"]<-{name="アンホールドの心臓",
description="アンホールドの大きくて重い心臓。 魔法の特性を持っていると噂されているため、錬金術師はそれを手に入れるためにきちんとした金額を支払う準備ができています。"
};
t["armor.body.ancient_plated_scale_hauberk"]<-{name="古代のメッキスケイルホーバーク",
description="分厚いスケイルコート。上部にメッキされた金属の層で部分的に補強されている。 それは古くからの巨大な鎧であり、古くはありませんでした。"
};
t["accessory.lionheart_potion"]<-{name="獅子心のポーション",
description="ライオンのように勇気を出せ！ このポーションは、自分の能力を大幅に過大評価するまで、恐怖を抑制し、勇気を促進する。 責任を持って飲んでください。 次の戦いのために続きます。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+20[/color] Resolve",t="[color=${Const.UI.Color.PositiveValue}]+20[/color] 決意"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["misc.webbed_valuables"]<-{name="蜘蛛の巣付きの貴重品",
description="ウェブクネヒトの厚い網の中には、かつて不幸な犠牲者が所有していた貴重品が見つかることがある - 粘着性のある死の罠を探る勇気が十分にあるならだが。"
};
t["weapon.named_warbrand"]<-{description="長くて薄い刃を持ち、片側だけを研ぎ、クロスガードを持たない、巧みに細工された、やや珍しい剣の変種。 クイックスラッシュとスイープストライクの両方が使用可能。"
};
t["armor.body.named_golden_lamellar_armor"]<-{description="非常に巧妙に作られたラメラーアーマー。 殴られた金で覆われているので、本当に目立つ。"
};
t["weapon.named_battle_whip"]<-{description="鞭はかなり独特な武器だが、この作品は真の職人によって作られた。 それは君が見た他のどれよりも耐久性がありバランスが取れている。"
};
t["weapon.player_banner"]<-{name="軍旗",
description="戦いに参加するための傭兵団の旗。 高く掲げられることで、味方は新たな決意でその周りに集結し、敵は誰が自分を粉砕しようとしているのかを知ることになる。"
,gettooltips= [{b="Allies at a range of 4 tiles or less receive [color=${Const.UI.Color.PositiveValue}]10%[/color] of the Resolve of the character holding this standard as a bonus, up to a maximum of the standard bearer's Resolve.",t="4タイル以内の味方は、ボーナスとして、この旗を保持しているキャラクターの決意の [color=${Const.UI.Color.PositiveValue}]10％[/color]のボーナスを得る（最大で旗を持つキャラクターの決意まで）。"}]
};
t["armor.body.barbarian_ritual"]<-{name="儀式の鎧",
description=""
};
t["misc.peat_bricks"]<-{name="泥炭レンガ",
description="乾燥した泥炭から作られたレンガで、通常は燃料として使用される。 商人はこれに良いコインを支払うだろう。"
};
t["armor_upgrade.mail_patch"]<-{name="メイルパッチ",
description="最も脆弱な領域をさらに保護するために任意の鎧に追加できるメイルの大きなパッチ。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+20[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+20[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-2[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-2[/color] 最大疲労"}]
};
t["weapon.billhook"]<-{name="ビルフック",
description="ある程度の距離を打つための刃と、目標を引き込むために取り付けられたフックを備えたパイクのような武器。"
};
t["weapon.nomad_mace"]<-{name="遊牧民のメイス",
description="金属製のヘッドを備えたシンプルな木製メイス。 このような武器は、砂漠の遊牧民の間で人気がある。"
};
t["weapon.throwing_axe"]<-{name="投斧の束",
description="目標に向かって上手投げで投げられる小さな斧。 範囲から鎧と盾に深刻なダメージを与えるのに十分な重さがある。"
};
t["misc.soul_splinter"]<-{name="ソウルスプリンター",
description="アルプのほこりっぽい遺跡では、これらの真っ暗な破片が見つかることがある。 星がこれらの石の奥深くにきらめいているように見える。"
};
t["weapon.ancient_spear"]<-{name="古代の槍",
description="シンプルなデザインの古代の木槍。 時間はこの武器にその犠牲を払わせた。"
};
t["armor.head.leather_head_wrap"]<-{name="レザーヘッドラップ",
description="切り傷や打撲傷から保護する厚い革のヘッドラップ。"
};
t["armor.head.steppe_helmet_with_mail"]<-{name="メイル付ステップヘルム",
description="ノーズヘルムの魔女は、草原の人々の邪魔をして作られた付属のメイルネックガード。"
};
t["armor.head.named_conic_helmet_with_faceguard"]<-{description="この円錐形のヘルムには、首を保護するためにフェイスガードが取り付けられ、スケイルが細かく取り付けられている。 フェイスガードは、敵を攻撃しようとしている恐ろしい戦士に似ている。"
};
t["armor.body.thick_dark_tunic"]<-{name="ダークシックチュニック",
description="天候や引っかき傷から保護するための複数の層で構成される暗くて厚い布チュニック。"
};
t["weapon.fencing_sword"]<-{name="フェンシングソード",
description="軽くて華麗な刃で、スピーディーで機動性のある戦闘スタイルに向く。"
};
t["weapon.named_mace"]<-{description="短い柄と取り付けられた刃を備えた金属製メイス。 この武器を鍛造した鍛冶屋は、自分が何をしているのかを確かに理解していた。"
};
t["armor.body.sackcloth"]<-{name="荒布",
description="裸で走るよりはマシ。"
};
t["weapon.rhomphaia"]<-{name="ロンファイア",
description="大きく曲がった刃で、片側だけが鋭利になっている。 クイックスラッシュとスイープストライクの両方が使用可能。"
};
t["armor.body.gambeson"]<-{name="ギャンベゾン",
description="きちんとした保護を提供する丈夫で重いパッド入チュニック。"
};
t["armor.head.straw_hat"]<-{name="麦わら帽子",
description="太陽から身を守るための粗い麦わら帽子。"
};
t["armor.head.orc_warrior_heavy_helmet"]<-{name="金属板ヘルム",
description=""
};
t["armor.body.heavy_lamellar_armor"]<-{name="ヘビーラメラーアーマー",
description="体のほとんどの部分を厚く重なり合う金属板で覆い、最大限の防護を実現する重いラメラーアーマー。"
};
t["misc.unhold_bones"]<-{name="巨人の頭蓋骨と骨",
description="アンホールドから取られたこれらの大きな骨は、獣狩りの間で貴重なトロフィーである。"
};
t["weapon.three_headed_flail"]<-{name="三頭フレイル",
description="3つの打撃部が鎖で持ち手に取り付けられている。 各打撃部は、目標を個別に命中またはミスし、シールドカバーの上または周囲を攻撃する可能性がある。"
};
t["weapon.warfork"]<-{name="ウォーフォーク",
description="ピッチフォークが槍とパイクのかけ合わせである戦場の武器に再鍛造された。 ある程度の距離を突進し、敵を寄せ付けないために使用される。"
};
t["misc.ancient_wood"]<-{name="古代の木",
description="生きている木の残骸から彫られた古代の木片。"
};
t["weapon.two_handed_flanged_mace"]<-{name="両手フランジメイス",
description="両手で持つ大きくて重い翼のあるメイス。 この武器から打撃を受けると、鎧に関係なく、誰もがぼんやりと息を切らしてしまう。"
};
t["armor.head.kettle_hat_with_closed_mail"]<-{name="クローズドメイル付ケトルハット",
description="広いリムと首と顔を覆うメイルコイフを備えた金属製ヘルム。"
};
t["accessory.iron_will_potion"]<-{name="鉄の意志のポーション",
description="痛みを麻痺させ、ジュースを流すための飲み物。 喉に大きな灼熱感が現れることを期待してください。 責任を持って飲んでください。 次の戦いのために続きます。"
,gettooltips= [{b="Not affected by non-permanent injuries, new or old",t="非永続的な傷（新しいもの、古いもの）による影響を受けない"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["misc.rainbow_scale"]<-{name="虹色の鱗",
description="砂漠の蛇は、きらめく肌に特にカラフルで光沢のある鱗が埋め込まれていることがある。 これらは、土地の周りの宝石商やトロフィーハンターによって求められています。"
};
t["armor.body.ancient_plated_mail_hauberk"]<-{name="古代のメッキメイルホーバーク",
description="メッキされたアームガードを備えた古代のメイルアーマー。 非常に重く、着用者の動きを著しく制限する。"
};
t["misc.acidic_saliva"]<-{name="酸性唾液",
description="野生の砂漠のハイエナの唾液は、その独特の特性のために南方の錬金術師によって値付けされる。"
};
t["weapon.staff_sling"]<-{name="スタッフスリング",
description="敵に石を投げつけるために使用される、杖の革のスリング。 至る所に石が豊富にあるため、弾薬が不足することはない。"
};
t["weapon.boar_spear"]<-{name="イノシシの槍",
description="刃先の後ろに2つの翼がある短くて重い槍。"
};
t["weapon.falchion"]<-{name="ファルシオン",
description="非装甲の敵を斬ったり切ったりするのに最適な湾曲した剣。"
};
t["misc.paint_orange_red"]<-{name="オレンジと赤のペイント",
description="黄色と赤のペンキのバケツ。 多くの一般的なヘルムの塗装に使用できる。"
,gettooltips= [{b="Right-click or drag onto a helmet carried by the currently selected character in order to paint it. This item will be consumed in the process.",t="現在選択されているキャラクターが持っているヘルムを右クリックまたはドラッグして、ペイントする。このアイテムは消費される。"}]
};
t["weapon.military_cleaver"]<-{name="軍用クリーバー",
description="壊滅的な打撃に対処するために設計された大きくて鋭利な金属刃。"
};
t["shield.named_red_white"]<-{description="外国風の大きくて厚い木製の盾。 独特のフォルムにもかかわらず、優れた防護を提供する。"
};
t["accessory.berserker_mushrooms"]<-{name="奇妙なキノコ",
description="この奇妙なキノコを食べると、トランスのような怒りの状態に入り、痛みを感じず、攻撃性が大幅に高まる。 責任を持って食べる。 次の戦いのために続きます。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+25%[/color] Damage in Melee",t="[color=${Const.UI.Color.PositiveValue}]+25%[/color] 近接攻撃ダメージ"},
{b="[color=${Const.UI.Color.NegativeValue}]-15[/color] Melee Defense",t="[color=${Const.UI.Color.NegativeValue}]-15[/color] 近接防御"},
{b="[color=${Const.UI.Color.NegativeValue}]-15[/color] Ranged Defense",t="[color=${Const.UI.Color.NegativeValue}]-15[/color] 遠隔防御"},
{b="No morale check triggered upon losing hitpoints",t="ヒットポイントを失っても士気チェックがトリガーされない"},
{b="Right-click or drag onto the currently selected character in order to eat. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、食べます。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["weapon.bladed_pike"]<-{name="古代のブレードパイク",
description="長い古代のパイクは、ある程度の距離を攻撃し、敵を寄せ付けなかった。"
};
t["accessory.recovery_potion"]<-{name="息継ぎのポーション",
description="疲れた戦士は死んだ戦士です。 アドレナリンと植物ベースの覚醒剤のこの調合は、さらに一歩前進するために使用することができます。 次の戦いのために続きます。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+4[/color] Fatigue Recovery per turn",t="[color=${Const.UI.Color.PositiveValue}]+4[/color] 疲労を毎ターン回復"},
{b="Right-click or drag onto the currently selected character in order to drink. This item will be consumed in the process.",t="現在選択されているキャラクターを右クリックまたはドラッグして、飲みます。このアイテムは消費されます。"},
{b="Overindulgence may lead to sickness",t="過剰摂取により中毒になる"}]
};
t["shield.faction_heater_shield"]<-{name="ヒーターシールド",
description="革と帆布で覆われた三角形の木製の盾。"
};
t["weapon.named_warbow"]<-{description="非常に丈夫でありながら柔軟性のある木で作られたこの戦弓は、大きな牽引力を持ち、熟練した職人技の珍しい作品である。"
};
t["armor.head.full_helm"]<-{name="フルヘルム",
description="呼吸穴のある金属製クローズドヘルム。 保護の点では優れているが、息を吸い込みにくく、視野を制限する。"
};
t["weapon.orc_cleaver"]<-{name="ヘッドチョッパー",
description="鋭くて粗野な金属の破片で、グリップは剣に似ているが、かなり重い。 人間の手には合わない。"
};
t["shield.named_orc_heavy_shield"]<-{description="破壊することはほとんど不可能ですが、人間にとって非常に重くて疲れる巨大な金属製の盾。"
};
t["armor_upgrade.heraldic_plates"]<-{name="紋章のショルダープレート",
description="鎧の肩に固定される大きな保護プレート。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+40[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+40[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-4[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-4[/color] 最大疲労"}]
};
t["misc.jade_broche"]<-{name="翡翠のブローチ",
description="細かく細工された翡翠のブローチで、売ったときにきっと1、2枚のコインになります。"
};
t["armor.body.wardog_heavy_armor"]<-{name="軍用犬用重アーマー",
description=""
};
t["weapon.named_longaxe"]<-{description="非常に長い柄の先に付いた比較的薄い刃は、ある距離で壊滅的な切断攻撃を行い、最前線の後ろから盾を使用できなくするために使用される。 この長斧は並外れた職人の作品に違いない。"
};
t["armor.body.ancient_priest_attire"]<-{name="古代の司祭服",
description=""
};
t["armor.head.nordic_helmet_with_closed_mail"]<-{name="クローズドメイル付ノルディックヘルム",
description="閉じたメイルネックガードが取り付けられた金属製ノルディックヘルム。"
};
t["misc.ancient_amber"]<-{name="古代の琥珀",
description="特に古いシュラットは、彼らの豚肉に非常に純粋な琥珀の小さな欠片を成長させる。 これらは商人にかなりの価格で売られている。"
};
t["misc.vampire_dust"]<-{name="きらめく灰",
description="青色にきらめく灰の小さな山。 伝えられるところでは、それは強力なアンデッドの生き物の残骸だが、このような主張を信じる人はほとんどいない。"
};
t["armor_upgrade.barbarian_horn"]<-{name="角と骨",
description="自称野蛮な王の儀式用の装飾品。 希少で耐久性のある角は、驚くほど効果的な鎧として機能する。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+40[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+40[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-4[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-4[/color] 最大疲労"}]
};
t["weapon.named_qatal_dagger"]<-{description="南方の砂漠の暗殺者によって悪名高く使用されている、精巧に作られた湾曲した刃。 すでに衰弱している目標に対して特に効果的。"
};
t["armor.head.heavy_lamellar_helmet"]<-{name="ヘビーラメラーヘルム",
description="重なった金属板で作られた重いヘルム。"
};
t["armor.body.plated_nomad_mail"]<-{name="メッキ遊牧民メイル",
description="追加の金属プレートが接ぎ木された、わずかに磨耗した薄くて軽いメイル。"
};
t["accessory.poison"]<-{name="ゴブリン毒",
description="ゴブリンが使用するクモ毒のフラスコ。 武器や矢先をコーティングするために使用できます。"
,gettooltips= [{b="Is destroyed on use",t="使い捨て"}]
};
t["weapon.named_crypt_cleaver"]<-{description="肉と鎧を同じように切り裂くことができる巨大な包丁。 この作品は古くても状態はいい。"
};
t["weapon.arming_sword"]<-{name="アーミングソード",
description="斬り、突き、振りに適した軽量の直剣。"
};
t["shield.craftable_schrat"]<-{name="生きた木の盾",
description="生きている木の残骸から彫られたこの盾は、損傷を受けた場合、ゆっくりと再成長する。 一見すると、グロテスクな顔がまだ動いているように見える。"
,gettooltips= [{b="Regenerates itself by [color=${Const.UI.Color.PositiveValue}]4[/color] points of durability each turn.",t="耐久度を毎ターン[color=${Const.UI.Color.PositiveValue}]4[/color]ポイント回復する。"}]
};
t["armor.body.orc_berserker_medium_armor"]<-{name="ボーンアーマー",
description=""
};
t["weapon.orc_axe_2h"]<-{name="マンスプリッター",
description="巨大で粗雑に作られた双頭の戦斧は重すぎて、平均的な人間が効果的に使用することはできません。"
};
t["armor.body.scrap_metal_armor"]<-{name="スクラップメタルアーマー",
description="この鎧は、粗い革のチュニックに固定されている磨かれた金属部品からつなぎ合わされている。"
};
t["weapon.named_three_headed_flail"]<-{description="貴重で丈夫な素材で作られた非常に珍しい武器。 その儀式的な外観にもかかわらず、それは恐ろしい破壊の道具となる。"
};
t["armor_upgrade.heavy_gladiator_upgrade"]<-{name="メタルアーマーピース",
description="追加の保護を提供する金属製の鎧片。"
,gettooltips= [{b="[color=${Const.UI.Color.PositiveValue}]+115[/color] Durability",t="[color=${Const.UI.Color.PositiveValue}]+115[/color] 耐久度"},
{b="[color=${Const.UI.Color.NegativeValue}]-10[/color] Maximum Fatigue",t="[color=${Const.UI.Color.NegativeValue}]-10[/color] 最大疲労"}]
};
t["armor.body.unhold_armor_heavy"]<-{name="鎧",
description=""
};
t["accessory.falcon"]<-{name="ファルコン",
description="訓練された鷹。 隠された獲物を発見するために戦闘で解放することができる。"
};
t["base.armor"]<-{gettooltips= [{b="Maximum Fatigue [color=${Const.UI.Color.NegativeValue}]",t="最大疲労 [color=${Const.UI.Color.NegativeValue}]"}]
};
t["misc.lindwurm_blood"]<-{name="リンドヴルムの血液",
description="あっという間に金属を食い尽くすリンドヴルムの腐食した血。 幸いなことに、それはガラス瓶で安全に輸送することができる。"
};
t["supplies.ammo"]<-{name="矢弾"
,gettooltips= [{b="A good [color=${Const.UI.Color.PositiveValue}]",t="矢、ボルト、槍といったさまざまな種類の弾薬 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] units of assorted ammunition - arrows, bolts and javelins. Used to automatically refill your quivers after battle. Will be added to your global stock once you're back on the worldmap.",t="[/color]ユニット。戦闘後に矢筒を自動的に補充するために使用される。 世界地図に戻ると、グローバルストックに追加される。"}]
};
t["weapon.wonky_bow"]<-{name="グラグラの弓",
description="あなたがそれを見たことがあれば、思いがけない弓。 曲がると木が割れたり、ひびが入ったり、引くたびに弦が縮れたり、しわが寄ったりする。"
};
t["armor.head.nordic_helmet"]<-{name="ノルディックヘルム",
description="追加の金属板で顔と首を守るノルディックヘルム。"
};
t["armor.body.cultist_leather_robe"]<-{name="狂信者のレザーローブ",
description="追加の革パッチとオカルトの記章で覆われた厚い革の鎧。"
};
t["armor.body.wizard_robe"]<-{name="魔術師のローブ",
description="あらゆる種類の神秘的な装飾品やシンボルで覆われた布のローブ。"
};
t["weapon.named_orc_cleaver"]<-{description="鋭くて粗野な金属の破片で、グリップは剣に似ているが、かなり重い。 人間の手には合わない。"
};
t["supplies.fermented_unhold_heart"]<-{name="発酵したアンホールドの心臓",
description="食糧。  かつて彼らの活力を大胆にしたいと思った北の野蛮な王たちのための珍味だが、手に負えないほど発酵した心臓は明らかにひどい味がする。"
};
t["armor.head.dark_cowl"]<-{name="ダークカウル",
description="革と布で作られた頑丈な帽子とカウル。"
};
t["armor.body.padded_leather"]<-{name="パッド入レザー",
description="保護を強化するために革の付属品で補強されたパッド入チュニック。"
};
t["weapon.daze_bomb"]<-{name="閃光ツボ",
description="衝撃に激しく反応して明るい閃光と大きな強打を生み出す不思議な粉で満たされた投げられるツボ。 近くにいる人を驚かせる。"
,gettooltips= [{b="Worn in Offhand",t="オフハンドに装備"},
{b="Range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color]タイル"},
{b="Will give up to [color=${Const.UI.Color.DamageValue}]7[/color] targets the Dazed status effect for 2 turns",t="最大で[color=${Const.UI.Color.DamageValue}]7[/color]の目標を2ターンの間朦朧状態にする"},
{b="Is destroyed on use",t="使い捨て"}]
};
t["weapon.named_dagger"]<-{description="短くて固められた短剣、鎧の小さな隙間を突き刺すための先の尖った刃で巧みに作られている。"
};
t["armor.body.orc_warrior_medium_armor"]<-{name="略奪された強化メール",
description=""
};
t["armor.body.linen_tunic"]<-{name="リネンチュニック",
description="シンプルな布チュニック。 お洒落だが、防護はほとんどない。"
};
t["weapon.named_polehammer"]<-{description="ポールハンマーのような粗野な武器も、この模範が印象的に示されているように、情熱、スキル、細部への注意を払って作成することができる。"
};
t["weapon.two_handed_hammer"]<-{name="両手ハンマー",
description="両手持ちの大きくて重いハンマー。 優雅さには欠けているが、人をノックアウトしたり地面に倒したりして、重装甲の敵の前線を粉砕するために使用されるため、生の力で補います。"
};
t["weapon.goblin_falchion"]<-{name="残酷なファルシオン",
description="切断用に作られた軽量のゴブリンファルシオン。"
};
t["shield.buckler"]<-{name="バックラー",
description="小さいが頑丈な握りこぶしで握る盾。 遠隔攻撃に対する防護は不十分だが、近接攻撃の打撃をそらすのに役立つ。"
};
t["weapon.shortsword"]<-{name="ショートソード",
description="片手で扱いやすい、へこみや切り欠きのある短い生鉄の剣。"
};
t["armor.body.orc_warlord_armor"]<-{name="重装甲",
description=""
};
t["shield.craftable_lindwurm"]<-{name="リンドヴルムの盾",
description="リンドヴルムのきらめく鱗から作られたこの頑丈な盾は、ほぼ破壊不可能な防護を実現する。"
};
t["armor.head.named_steppe_helmet_with_mail"]<-{description="草原の人々のファッションで巧みに作られたヘルム。 金のアプリケーションで装飾され、追加のチークガードが装備されている。"
};
t["armor.head.closed_mail_coif"]<-{name="クローズドメイルコイフ",
description="顔の保護が追加されたメイルコイフ。"
};
t["misc.adrenaline_gland"]<-{name="副腎",
description="ダイアウルフの狂乱と血の欲望は、この腺によって生成された物質に起因する可能性がある。 誰かがどこかでおそらくこれを使用するだろう。"
};
t["weapon.militia_spear"]<-{name="民兵の槍",
description="金属の先端を持つシンプルな木製の槍。"
};
t["weapon.named_two_handed_spiked_mace"]<-{description="人間の頭蓋骨に似せて作られた重いスパイクメイス。 その粗野な外観にもかかわらず、これはバランスのとれた致命的な武器である。"
};
t["armor.body.orc_young_light_armor"]<-{name="ハイドアーマー",
description=""
};
t["armor.body.apron"]<-{name="エプロン",
description="見習いや職人が普段着ている革のエプロン。"
};
t["armor.head.bear_headpiece"]<-{name="クマのヘッドピース",
description="乾燥して剥製にされた大きなクマの頭。 ある程度の防護を提供するが、ほとんどの場合、外観のために着用されている。"
};
t["weapon.butchers_cleaver"]<-{name="肉屋のクリーバー",
description="肉や骨を叩き切るために使用される厚い長方形の刃を持つ道具。"
};
t["weapon.qatal_dagger"]<-{name="カタールダガー",
description="南方の砂漠の暗殺者によって悪名高く使用される湾曲した刃。 すでに衰弱している目標に対して特に効果的。"
};
t["armor.head.nasal_feather"]<-{description="革の鱗で作られたユニークなネックガードを備えた硬化したノーズヘルム。"
};
t["armor.body.leopard_armor"]<-{description="上質なメイルと快適な詰め物を組み合わせた重いラメラープレートハーネス。 戦闘で引き裂くには非常に貴重な、本当によくできた作品。"
};
t["armor.body.golden_scale"]<-{description="小さなインターロッキングメタルスケイルで作られたスケイルアーマー。 そのスタイルと職人技は、遠く離れた地域から来た鎧であることを暗に示している。"
};
t["armor.head.greatsword_hat"]<-{name="デュエリストの帽子",
description="装飾品と羽が付いた厚い革の帽子。"
};
t["armor.head.aketon_cap"]<-{name="アケトンキャップ",
description="パッド入り布製キャップ。"
};
t["armor.head.crude_metal_helmet"]<-{name="粗雑な金属製ヘルム",
description="粗雑な作りで錆びているが、この金属製ヘルムは耐久性があり頑丈である。"
};
t["weapon.axehammer"]<-{name="アクスハンマー",
description="ハンマーと斧の巨大でさびたかけ合わせ。 刃は鈍いため、後者よりも前者の方が使用頻度が高い。"
};
t["weapon.named_spetum"]<-{description="このスペタムは特に巧妙に作られ、その3つのヒントは完全にとがったスパイクに磨き上げられている。"
};
t["armor.body.goblin_leader_armor"]<-{name="",
description=""
};
t["weapon.named_greataxe"]<-{description="戦闘用に設計された長い両手斧で、スイングするたびに重くなり、人間を簡単に真っ二つに切ることができる。"
};
t["armor.head.open_leather_cap"]<-{name="オープンレザーキャップ",
description="耳や首を覆わない丈夫なレザーキャップ。"
};
t["armor.body.thick_tunic"]<-{name="厚手のチュニック",
description="天候や傷から保護するために、複数の層で構成される厚い布のチュニック。"
};
t["armor.body.orc_young_very_light_armor"]<-{name="ハイドアーマー",
description=""
};
t["supplies.medicine"]<-{name="医療用品"
,gettooltips= [{b="A good [color=${Const.UI.Color.PositiveValue}]",t="戦闘で受けた怪我から傭兵が回復するのに役立つ、ハーブ、軟膏、包帯など[color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] units of herbs, salves, bandages and the like to help your mercenaries recover from injuries sustained in battle. Will be added to your global stock once you're back on the worldmap.",t="[/color]ユニット。 世界地図に戻ると、グローバルストックに追加される。"}]
};
t["armor.body.lamellar_harness"]<-{name="ラメラーハーネス",
description="上半身の大部分を覆う厚い重なり合う金属板で作られたボディアーマー。"
};
t["weapon.named_heavy_rusty_axe"]<-{description="この重くて装飾された斧は、野蛮な部族の大切な仲間のものだった。 その装飾と比較的高い職人技は、北方の野生の戦士の間では珍しいものだ。"
};