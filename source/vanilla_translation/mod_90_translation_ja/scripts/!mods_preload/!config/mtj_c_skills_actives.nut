local gt = this.getroottable();
gt.translation.skills_actives<-{};
local t=gt.translation.skills_actives;
t["actives.throw_net"]<-{name="投網",
description="目標の効果的な移動・防御を妨げるため、目標に網を投げる。 敵が免疫を持っていない場合は常に命中する。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color] タイル"}]
};
t["actives.serpent_hook"]<-{name="引っ張る",
description=""
};
t["actives.charge"]<-{name="突撃",
description=""
};
t["actives.ghost_split"]<-{name="スプリット",
description="2つのタイルを直線攻撃可能な、威力ではなくリーチを優先した、大きく振りかぶった頭上からの攻撃。"
,gettooltips= [{b="Can hit up to 2 targets",t="最大2目標に命中"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-5%[/color]"}]
};
t["actives.tail_slam_big"]<-{name="テイルスラム",
description=""
};
t["actives.rotation"]<-{name="ローテーション",
description="目標が気絶等拘束されておらず、スキルを使用しているキャラクターも同様の場合、場所を入れ替える。 戦線を回転させて、新鮮な軍隊を前に置け！"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Can not be used while rooted[/color]",t="[color=${Const.UI.Color.NegativeValue}]拘束されている間は使用不可[/color]"}]
};
t["actives.alp_teleport"]<-{name="フェード",
description=""
};
t["actives.lunge"]<-{name="ランジ",
description="2タイル離れた目標に向かって素早く突進し、その後、準備ができていない目標を捕まえるために正確な突進攻撃を行う。 使用者が速いほどより多くのダメージを与える。"
,gettooltips= [{b="Moves the user next to the target, ignoring Zone of Control",t="ZoCを無視して、目標の隣に使用者を移動する"},
{b="Inflicts additional damage, the higher the user's current Initiative",t="使用者の現在のイニシアチブの高さに応じた追加ダメージを与える"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used while rooted[/color]",t="[color=${Const.UI.Color.NegativeValue}]拘束されている間は使用不可[/color]"}]
};
t["actives.lightning_storm"]<-{name="落雷",
description=""
};
t["actives.throw_dirt"]<-{name="土投げ",
description=""
};
t["actives.crumble"]<-{name="クランブル",
description="敵の陣形を崩すための激しい攻撃。 2タイルの距離をカバーでき、他のほとんどの近接武器の範囲外で、最前線の後ろから使用可能。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] extra fatigue",t="[/color] 疲労を追加で与える"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.knock_back"]<-{name="ノックバック",
description="盾を使用して、目標を1タイルだけノックバックさせる。 命中した目標は疲労感を覚え、数レベルの高さまで押し下げられるとダメージを受ける可能性がある。 シールドウォール、スピアウォール、リポストは、ノックバックに成功した目標に対してキャンセルされる。 拘束された目標をノックバックすることはできない。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]+40%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+40%[/color]"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+25%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+25%[/color]"}]
};
t["actives.hyena_bite"]<-{name="ハイエナバイト",
description=""
};
t["actives.whip"]<-{name="ウィップ",
description="鞭をかなりの距離にわたって振るい、一度に2スタックの出血ダメージを与える。 鎧に対しては全く効果がない。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]3[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]3[/color] タイル"},
{b="Inflicts additional stacking [color=${Const.UI.Color.DamageValue}]",t="スタックする追加の[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] bleeding damage per turn, for 2 turns",t="[/color] 出血ダメージをターン毎に2ターンにわたって与える"}]
};
t["actives.return_favor"]<-{name="リターンの好意",
description="優れた戦闘技術を駆使して防御的なスタンスを取り、自分自身に到達できるようにあなたを攻撃している人を無力化しようとする。"
,gettooltips= [{b="Gain a [color=${Const.UI.Color.PositiveValue}]50%[/color] chance to stun any opponent missing this character with a melee attack (resistances and immunities still apply).",t="近接攻撃でこのキャラクターを攻撃した相手は[color=${Const.UI.Color.PositiveValue}]50%[/color]の確率でスタンする（耐性および免疫は適用される）。"}]
};
t["actives.adrenaline"]<-{name="アドレナリン",
description="対戦相手よりも速く行動する機会をつかむと、アドレナリンが血管を駆け抜けるのを感じろ。"
,gettooltips= [{b="Puts this character first in next round's turn order",t="このキャラクターを次のターンの最初に行動させる"}]
};
t["actives.hex"]<-{name="呪い",
description=""
};
t["actives.knock_out"]<-{name="ノックアウト",
description="強烈な打撃は、1ターンの間打たれるほど不運な人を気絶させたり無力化したりすることを目的としているが、最大のダメージを与えることはない。 唖然とした目標は、シールドウォール、スピアウォール、または同様の防御スキルを維持できない。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] extra fatigue",t="[/color] 疲労を追加で与える"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to stun on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率でスタン状態にする"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]"},
{b="%[/color] chance to stun on a hit",t="%[/color] の確率でスタンする"}]
};
t["actives.lash"]<-{name="ラッシュ",
description="相手の頭部を狙う。 ダメージはやや予測不可能だが、多少運が良ければシールドカバーの上または周りを攻撃できる。"
,gettooltips= [{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to hit the head",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率で頭に命中する"},
{b="Ignores the bonus to Melee Defense granted by shields",t="盾による近接防御ボーナスを無視する"}]
};
t["base.skill"]<-{getcoststrings= [{b="[i]Costs ",t="[i]使用コスト "},
{b=" AP[/color][/b] to use and builds up ",t=" AP[/color][/b] および "},
{b=" Fatigue[/color][/b][/i]",t=" 疲労[/color][/b][/i]"}]
,getdefaulttooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage that ignores armor",t="[/color] ダメージを、鎧を無視して与える"},
{b="[/color] damage to hitpoints, of which [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]",t="[/color] ダメージをヒットポイントに与える、そのうち [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]"},
{b="[/color] can ignore armor",t="[/color] は鎧を無視する"},
{b="damage to hitpoints[/color]",t="[/color] ダメージをヒットポイントに与える"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"}]
};
t["actives.unleash_wardog"]<-{name="軍用犬を解き放つ",
description="軍用犬を解き放ち、敵に突撃させる。 隣接する空白のタイルが必要。"
};
t["actives.chop"]<-{name="チョップ",
description="あらゆる目標に全力を発揮する強力なチョッピング攻撃。"
,gettooltips= [{b="Inflicts additional [color=${Const.UI.Color.PositiveValue}]50%[/color] damage on a hit to the head",t="頭に命中した場合、追加の[color=${Const.UI.Color.PositiveValue}]50%[/color]ダメージを与える"}]
};
t["actives.drums_of_war"]<-{name="戦争のドラム",
description=""
};
t["actives.uproot"]<-{name="根こそぎ",
description=""
};
t["actives.flail"]<-{name="フレイル",
description="相手にぶつかる。 ダメージはやや予測不可能だが、シールドカバーの上または周囲を攻撃することができる。"
,gettooltips= [{b="Ignores the bonus to Melee Defense granted by shields",t="盾による近接防御ボーナスを無視する"}]
};
t["actives.disarm"]<-{name="武装解除",
description="かなりの距離にわたって鞭を使用して、命中時に敵を一時的に武装解除する。 武装解除された対戦相手は武器スキルを使用できないが、他のスキルを使用して自由に移動可能。 非武装の目標は武装解除不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]3[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]3[/color] タイル"},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に"},
{b="chance to hit",t="%[/color]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to disarm on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率で武装解除状態にする"}]
};
t["actives.kraken_move"]<-{name="触手を動かす",
description=""
};
t["actives.overhead_strike"]<-{name="オーバーヘッドストライク",
description="壊滅的な影響を与えるために全力で振るわれる頭上からの袈裟斬り攻撃。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to hitpoints, of which [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]",t="[/color] ダメージをヒットポイントに与える、そのうち [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]"},
{b="[/color] can ignore armor",t="[/color] は鎧を無視する"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+5%[/color]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]${this.m.StunChance}%[/color] chance to stun for two turns on a hit",t="%[/color] の確率で2ターンの間スタンする"}]
};
t["actives.slash_lightning"]<-{name="ライトブリンガー",
description="素早く斬撃する攻撃で、命中すると、敵から敵へと火花を散らす稲妻を召喚する。"
,gettooltips= [{b="Inflicts an additional [color=${Const.UI.Color.DamageValue}]10[/color] - [color=${Const.UI.Color.DamageValue}]20[/color] damage that ignores armor to up to three targets",t="鎧を無視する追加の [color=${Const.UI.Color.DamageValue}]10[/color] - [color=${Const.UI.Color.DamageValue}]20[/color] ダメージを最大3つの目標に対して与える"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"}]
};
t["actives.swallow_whole"]<-{name="全体を飲み込む",
description=""
};
t["actives.round_swing"]<-{name="回転斬り",
description="無謀な回転斬りで、敵味方を問わず周囲の全目標を刈り取る。 何も狙っていないため回避は難しくないが、下手をすると壊滅的な被害をもたらす可能性がある。 団のコストカットをしたいのでない限り、自身の部下の周囲に注意すること！"
,gettooltips= [{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に[color=${Const.UI.Color.NegativeValue}]"},
{b="chance to hit",t=""},
{b="Can hit up to 6 targets",t="最大6目標に命中"}]
};
t["actives.split_shield"]<-{name="盾割り",
description="特に敵の盾を破壊することを目的とした攻撃。 盾を持っている目標に対してのみ使用可能。 常に命中するが、使用する盾と武器種によっては、数回命中する場合がある。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to shields",t="[/color] ダメージを盾に与える"},
{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles",t="[/color] タイル"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.serpent_bite"]<-{name="蛇の噛み付き",
description=""
};
t["actives.rally_the_troops"]<-{name="ラリー",
description="なんてこった！ このキャラクターのインスピレーションあふれる決意を使って、近くの逃げる仲間を結集し、全員をさらに一歩前進させる。 1人のキャラクターはラウンド毎に1回のみ使用可能。"
,gettooltips= [{b="Triggers a morale check to rally fleeing allies within 4 tiles distance, with a bonus to Resolve of [color=${Const.UI.Color.PositiveValue}]+",t="4タイル以内にいる Fleeing の味方を結集させる士気チェックをトリガーする。チェックではこのキャラクターの決意から [color=${Const.UI.Color.PositiveValue}]+"},
{b="[/color] based on this character's Resolve",t="[/color] のボーナスを受ける。"},
{b="Triggers a morale check to raise the morale of anyone wavering or worse within 4 tiles distance, with a bonus to Resolve of [color=${Const.UI.Color.PositiveValue}]+",t="4タイル以内にいる Wavering もしくは Worse のキャラクターの士気を向上させる士気チェックをトリガーする。チェックではこのキャラクターの決意から [color=${Const.UI.Color.PositiveValue}]+"},
{b="[/color] based on this character's Resolve, but lowered by [color=${Const.UI.Color.NegativeValue}]-10[/color] per tile distance",t="[/color] の、ただし距離1タイルごとに [color=${Const.UI.Color.NegativeValue}]-10[/color] のボーナスを受ける。"},
{b="Removes the Sleeping status effect of allies within 4 tiles distance",t="4タイル以内の味方の睡眠ステータス効果を除く"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not rally others the same turn as being rallied himself[/color]",t="[color=${Const.UI.Color.NegativeValue}]他のキャラクターに呼び掛けられている同じターンにラリーを行うことはでない[/color]"}]
};
t["actives.flying_skulls"]<-{name="叫ぶ頭蓋骨を上げる",
description=""
};
t["actives.strike_down"]<-{name="打ち倒し",
description="目標を2ターン無力化して気絶させることを目的とした強烈な打撃を与えるが、最大のダメージを与えることはない。 唖然とした目標は、シールドウォール、スピアウォール、または同様の防御スキルを維持できない。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] extra fatigue",t="[/color] 疲労を追加で与える"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to severely stun on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率で深刻なスタン状態にする"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]${this.m.StunChance}%[/color] chance to stun for two turns on a hit",t="%[/color] の確率で2ターンの間スタンする"}]
};
t["actives.perfect_focus"]<-{name="パーフェクトフォーカス",
description="武器と一体になり、時間そのものが静止しているかのように完全に集中できる。"
,gettooltips= [{b="The Action Point cost for using skills is reduced by half for the remainder of this round, but Fatigue costs are doubled.",t="このラウンドは、スキルのアクションポイントのコストは半分になるが疲労コストは倍になる"}]
};
t["actives.shatter"]<-{name="粉砕",
description="武器を広い弧を描いて振り、隣接する3つのタイルを反時計回りに攻撃する。 目標への命中は、打撃力からノックバックまたはずらされる可能性がある。 団のコストカットをしたいのでない限り、自身の部下の周囲に注意すること！"
,gettooltips= [{b="Has [color=${Const.UI.Color.NegativeValue}]-5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-5%[/color]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-10%[/color]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]33%[/color] chance to stagger on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]33%[/color] の確率でよろめき状態にする"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]33%[/color] chance to knock back on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]33%[/color] の確率でノックバックする"},
{b="Can hit up to 3 targets",t="最大3目標に命中"}]
};
t["actives.zombie_bite"]<-{name="噛み付き",
description=""
};
t["actives.web"]<-{name="蜘蛛の巣を張る",
description=""
};
t["actives.geomancy"]<-{name="ジオマンシー",
description=""
};
t["actives.stab"]<-{name="刺す",
description="素早く速く刺す。"
};
t["actives.possess_undead"]<-{name="アンデッドに憑依",
description=""
};
t["actives.cudgel"]<-{name="棍棒",
description="目標をパルプに棍棒で突き刺すために全力で実行されるゆっくりとした頭上からの攻撃。 このような打撃で打たれた人は皆、2ターンの間、彼らの打撃の後ろに全力を置くことができず、ぼんやりと空気をあえぎます。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] extra fatigue",t="[/color] 疲労を追加で与える"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to daze on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率で朦朧状態にする"}]
};
t["actives.shoot_bolt"]<-{name="ボルトを撃つ",
description="トリガーを素早く引いてボルトを撃つ。 再び発砲できるようにするには、各射撃の後にリロードする必要がある。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+",t="命中率に [color=${Const.UI.Color.PositiveValue}]+"},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] bolts left",t="残りのボルト [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty quiver of bolts equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でないボルト筒が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードする必要がある[/color]"}]
};
t["actives.impale"]<-{name="串刺し",
description="2タイルの距離をカバーでき、ほとんどの近接武器の範囲外で、最前線の後ろから使用できる突進攻撃。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.kraken_devour"]<-{name="むさぼり食う",
description=""
};
t["actives.first_aid"]<-{name="応急処置",
description="傷に圧力と暫定的な包帯をかけることによって、出血から死まで身を守る。 ヒットポイントは回復しない。 近接攻撃中は使用不可。"
,gettooltips= [{b="Removes the Bleeding status effect",t="出血ステータス効果を取り除く"},
{b="Removes fresh Cut Artery, Cut Neck Vein and Grazed Neck injuries",t="この戦闘で負った、動脈を切る、首の静脈を切る、かすめられた首の怪我を取り除く"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can only be used when bleeding[/color]",t="[color=${Const.UI.Color.NegativeValue}]出血している間のみ使用可能[/color]"}]
};
t["actives.kraken_bite"]<-{name="噛み付き",
description=""
};
t["actives.tail_slam_zoc"]<-{name="テイルスラム",
description=""
};
t["actives.geomancy_once"]<-{name="ジオマンシー",
description=""
};
t["actives.prong"]<-{name="プロング",
description="2タイルの距離をカバーでき、ほとんどの近接武器の範囲外で、最前線の後ろから使用できる突進攻撃。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.horror"]<-{name="ホラー",
description=""
};
t["actives.deathblow"]<-{name="死の一撃",
description="衰弱した目標に致命的な攻撃を加えて、トドメをさす。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]33%[/color] more damage against and ignores additional [color=${Const.UI.Color.DamageValue}]20%[/color] armor of targets that have the Dazed, Stunned or Trapped in Net status effects",t="ダメージを[color=${Const.UI.Color.DamageValue}]33%[/color]増加させた、鎧を[color=${Const.UI.Color.DamageValue}]20%[/color]追加で無視する攻撃を目標に対して行い、目標に朦朧かスタンか網へ絡まった状態を付与する"}]
};
t["actives.ghost_overhead_strike"]<-{name="オーバーヘッドストライク",
description="壊滅的な影響を与えるために全力で振るわれる頭上からの袈裟斬り攻撃。"
};
t["actives.puncture"]<-{name="穿刺",
description="敵の鎧の弱点への適切な攻撃。 すべての鎧を無視するが、命中させるのが難しく、追加ダメージのためにクリティカルヒットを与えることも、ダブルグリップで追加ダメージを与えることもできない。"
,gettooltips= [{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-10%[/color]"},
{b="Completely ignores armor",t="完全に鎧を無視する"}]
};
t["actives.tail_slam_split"]<-{name="テイルスラム",
description=""
};
t["actives.ghastly_touch"]<-{name="ガストリータッチ",
description=""
};
t["actives.voice_of_davkul"]<-{name="ダヴクルの声",
description=" ダヴクルの肉の導管と土の声になる。 彼の信者に真実を話し、彼等の神を喜ばせるために彼らのすべてを与えるようにさせる。"
,gettooltips= [{b="Lowers the fatigue of every cultist, friend or foe, by [color=${Const.UI.Color.NegativeValue}]-10[/color] instantly. Anyone not a cultist is not affected.",t="全ての狂信者（敵味方を問わず）の疲労を即座に [color=${Const.UI.Color.NegativeValue}]-10[/color] 減らす。狂信者以外には影響しない。"}]
};
t["actives.horrific_scream"]<-{name="恐ろしい悲鳴",
description=""
};
t["actives.decapitate"]<-{name="斬首",
description="その場で標的を斬首することを目的とした壊滅的な打撃。 目標がすでに負傷しているほどヒットポイントへのダメージが大きくなる。 目標を殺害すると、可能ならば常に斬首される。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage depending on how wounded the target already is, of which [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]",t="[/color] ダメージを、目標が既に負っている傷の度合いに応じて与える、そのうち [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]"},
{b="[/color] can ignore armor",t="[/color] は鎧を無視する"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"}]
};
t["actives.batter"]<-{name="バター",
description="2タイルの距離をカバーできるストライク。 その効果は、最も厚い鎧を通しても感じられる。"
,gettooltips= [{b="Always inflicts at least [color=${Const.UI.Color.DamageValue}]10[/color] damage to hitpoints, regardless of armor",t="鎧の有無にかかわらず少なくとも[color=${Const.UI.Color.DamageValue}]10[/color] ダメージをヒットポイントに与える"},
{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.spider_bite"]<-{name="ウェブクネヒトの噛み付き",
description=""
};
t["actives.shoot_stake"]<-{name="ヘビーボルトを撃つ",
description="トリガーを素早く引いてヘビーボルトを撃つ。 再び発砲できるようにするには、各射撃の後にリロードする必要がある。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+",t="命中率に [color=${Const.UI.Color.PositiveValue}]+"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] bolts left",t="残りのボルト [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty quiver of bolts equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でないボルト筒が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードする必要がある[/color]"}]
};
t["actives.unstoppable_charge"]<-{name="止められない突撃",
description=""
};
t["actives.crack_the_whip"]<-{name="鞭を打つ",
description=""
};
t["actives.merge_golem"]<-{name="リビングサンドをマージ",
description=""
};
t["actives.grant_night_vision"]<-{name="夜目を付与",
description=""
};
t["actives.werewolf_bite"]<-{name="ダイアウルフの噛み付き",
description=""
};
t["actives.wake_ally"]<-{name="味方を起こす",
description="隣接する味方を不自然な睡眠から強制的に目覚めさせる。"
,gettooltips= [{b="Removes the Sleeping status effect",t="睡眠ステータス効果を取り除く"}]
};
t["actives.throw_daze_bomb"]<-{name="フラッシュポットを投げる",
description="衝撃に激しく反応して明るい閃光と大きな衝撃を生み出す不思議な粉で満たされたツボを投げると、近くにいる人を驚かせる-敵味方関係なく"
,gettooltips= [{b="Give up to [color=${Const.UI.Color.DamageValue}]7[/color] targets the Dazed status effect for 2 turns",t="最大で[color=${Const.UI.Color.DamageValue}]7[/color]の目標を2ターンのあいだ朦朧状態にする"}]
};
t["actives.split_man"]<-{name="スプリットマン",
description="目標を上から下に真っ二つにするために全力で実行されるゆっくりとした頭上からの攻撃。 常に頭部と体の両方に当たり、追加ダメージを与えるのに十分な力がある。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to hitpoints, of which [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]",t="[/color] ダメージをヒットポイントに与える、そのうち [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]"},
{b="[/color] can ignore armor",t="[/color] は鎧を無視する"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to hitpoints",t="[/color] ダメージをヒットポイントに与える"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"},
{b="Hits both head and body for additional damage",t="頭と体に命中し追加のダメージを与える"}]
};
t["actives.bandage_ally"]<-{name="包帯を使用する",
description="傷に圧力と暫定的な包帯をかけ、自身または他のキャラクターを出血で死亡するのを救う。 ヒットポイントは回復しない。 このスキルを使用しているキャラクターも患者も、近接攻撃に従事することはできない。"
,gettooltips= [{b="Removes the Bleeding status effect",t="出血ステータス効果を取り除く"},
{b="Removes fresh Cut Artery, Cut Neck Vein and Grazed Neck injuries",t="この戦闘で負った、動脈を切る、首の静脈を切る、かすめられた首の怪我を取り除く"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.throw_holy_water"]<-{name="祝福された水を投げる",
description="祝福された水のフラスコを目標に向けて投げる。目標へその内容物を粉砕し振りかける。 祝福された水はアンデッドを燃やすが、他の目標には影響しない。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]20[/color] damage to hitpoints for [color=${Const.UI.Color.DamageValue}]3[/color] turns, all of which ignores armor",t="[color=${Const.UI.Color.DamageValue}]3[/color] ターンの間[color=${Const.UI.Color.DamageValue}]20[/color] ダメージを鎧を無視してヒットポイントに与える"},
{b="Has a [color=${Const.UI.Color.DamageValue}]33%[/color] chance to hit bystanders at the same or lower height level as well.",t="[color=${Const.UI.Color.DamageValue}]33%[/color]の確率で、同じかより下の高さにいる隣接するキャラクターにも命中する"},
{b="Only affects undead targets",t="アンデッドにのみ効果がある"}]
};
t["actives.sling_stone"]<-{name="スリングストーン",
description="スリングで石を目標に向かって投げつける。 精度は距離とともに急激に低下する。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]+",t="命中率に [color=${Const.UI.Color.PositiveValue}]+"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has a [color=${Const.UI.Color.NegativeValue}]100%[/color] chance to daze a target on a hit to the head",t="頭に命中した場合、目標は[color=${Const.UI.Color.NegativeValue}]100%[/color]の確率で朦朧状態になる"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.aimed_shot"]<-{name="エイムショット",
description="遠くからでも狙った目標に当たる見通しの良い、焦点を絞った慎重に狙ったショット。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+",t="命中率に [color=${Const.UI.Color.PositiveValue}]+"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] arrows left",t="残りの矢 [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty quiver of arrows equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でない矢筒が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.strike"]<-{name="攻撃",
description="2タイルの距離をカバーでき、他のほとんどの近接武器の範囲外で、最前線の後ろから使用できるスイープストライク。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent",t="直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+5%[/color]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.thrust"]<-{name="スラスト",
description="回避またはブロックするのが難しい、適切に配置されたスラスト攻撃。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]+20%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+20%[/color]"}]
};
t["actives.unleash_wolf"]<-{name="オオカミを解き放つ",
description="オオカミを解き放ち、敵に突撃させます。 隣接する空白のタイルが必要。"
};
t["actives.tail_slam"]<-{name="テイルスラム",
description=""
};
t["actives.gorge"]<-{name="貪り喰う",
description=""
};
t["actives.root"]<-{name="拘束",
description=""
};
t["actives.uproot_small"]<-{name="根こそぎ",
description=""
};
t["actives.fling_back"]<-{name="振り返る",
description=""
};
t["actives.raise_all_undead"]<-{name="ブラックブック",
description=""
};
t["actives.sweep_zoc"]<-{name="スイープストライク",
description=""
};
t["actives.explode"]<-{name="爆発する",
description=""
};
t["actives.break_free"]<-{name="ブレイクフリー",
description="自由に使えるすべてのものを使用して、自分を固定しているものから自分を解放する。 必要に応じて、ハック、スラッシュ、カット、またはかじる！"
,gettooltips= [{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="近接スキルに基く成功確率 [color=${Const.UI.Color.PositiveValue}]"},
{b="%[/color] chance to succeed, based on Melee Skill. Each failed attempt will increase the chance to succeed for subsequent attempts.",t="%[/color]。失敗するたびに自由になるための成功確率は上がる。"}]
};
t["actives.darkflight"]<-{name="ダークフライト",
description=""
};
t["actives.throw_spear"]<-{name="槍を投げる",
description="盾を使用できなくするために、目標に投げ槍を投げつける。 盾のある目標は常に攻撃される。 盾なしの目標を攻撃すると、代わりに壊滅的なダメージを与える可能性があるが、攻撃は失敗する可能性がある。 近接攻撃中は使用不可。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to shields",t="[/color] ダメージを盾に与える"},
{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+30%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]-10%[/color] per tile of distance",t="命中率に [color=${Const.UI.Color.PositiveValue}]+30%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]-10%[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.kraken_ensnare"]<-{name="Ensnare",
description=""
};
t["actives.throw_smoke_bomb"]<-{name="スモークポットを投げる",
description="衝撃を受けるとすぐに密な雲を作る物質で満たされたツボを投げる。"
,gettooltips= [{b="Covers [color=${Const.UI.Color.DamageValue}]7[/color] tiles in smoke for one round, allowing anyone inside to move freely and ignore zones of control",t="[color=${Const.UI.Color.DamageValue}]7[/color]タイルを煙で覆い、内部の誰もが自由に移動してZoCを無視できるようにする"},
{b="Increases Ranged Defense by [color=${Const.UI.Color.PositiveValue}]+100%[/color], but lowers Ranged Skill by [color=${Const.UI.Color.NegativeValue}]-50%[/color] for anyone inside",t="遠隔防御を[color=${Const.UI.Color.PositiveValue}]+100%[/color]増加させる、ただし中にいるキャラクターの遠隔スキルを [color=${Const.UI.Color.NegativeValue}]-50%[/color] 低下させる"},
{b="Extinguishes existing tile effects like Fire or Miasma",t="炎あるいは瘴気のような既にあるタイル効果を消す"}]
};
t["actives.cleave"]<-{name="切り裂き",
description="打撃を吸収する鎧がなく、目標が出血できる場合に出血する傷を負わせる可能性のある強引な切り裂き攻撃。"
,gettooltips= [{b="Inflicts additional stacking [color=${Const.UI.Color.DamageValue}]",t="スタックする追加の[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] bleeding damage per turn, for 2 turns",t="[/color] 出血ダメージをターン毎に2ターンにわたって与える"}]
};
t["actives.uproot_zoc"]<-{name="根こそぎ",
description=""
};
t["actives.mirror_image"]<-{name="鏡像",
description=""
};
t["actives.swing"]<-{name="スイング",
description="武器を広い弧を描いて振り、隣接する3つのタイルを反時計回りに攻撃する。 団のコストカットをしたいのでない限り、自身の部下の周囲に注意すること！"
,gettooltips= [{b="Can hit up to 3 targets",t="最大3目標に命中"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-5%[/color]"}]
};
t["actives.wardog_bite"]<-{name="噛み付き",
description=""
};
t["actives.wither"]<-{name="枯れる",
description=""
};
t["actives.throw_javelin"]<-{name="槍投げ",
description="目標に投げ槍を投げる。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] javelins left",t="残りの投げ槍 [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]No javelins left[/color]",t="[color=${Const.UI.Color.NegativeValue}]残りの投げ槍がない[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.kraken_move_ensnared"]<-{name="引っ張る",
description=""
};
t["actives.riposte"]<-{name="リポスト",
description="近接攻撃を試みて失敗した敵を即座に反撃する準備をする。"
,gettooltips= [{b="Has [color=${Const.UI.Color.NegativeValue}]-10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-10%[/color]"}]
};
t["actives.pound"]<-{name="ポンド",
description="鎖と打撃ヘッドで目標を地面に叩きつける。 やや予測不可能だが、多少運が良ければシールドカバーの上または周りを攻撃することができる。 十分な力で命中した目標は、1ターンの間気絶することがある。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to hitpoints, of which [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]",t="[/color] ダメージをヒットポイントに与える、そのうち [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]"},
{b="[/color] can ignore armor",t="[/color] は鎧を無視する"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]${this.m.StunChance}%[/color] chance to stun for two turns on a hit",t="%[/color] の確率で2ターンの間スタンする"},
{b="Ignores the bonus to Melee Defense granted by shields",t="盾による近接防御ボーナスを無視する"}]
};
t["actives.throw_acid_flask"]<-{name="酸フラスコを投げる",
description="酸のフラスコを目標に向けて投げる。目標にその内容物が粉砕されて降りかかる。 酸は、攻撃された敵の鎧をゆっくりと腐食させる-敵味方関係なく。"
,gettooltips= [{b="Reduces the target's armor by [color=${Const.UI.Color.DamageValue}]20%[/color] each turn for 3 turns.",t="目標の鎧を3ターンの間[color=${Const.UI.Color.DamageValue}]20%[/color]ずつ減らす"},
{b="Has a [color=${Const.UI.Color.DamageValue}]33%[/color] chance to hit bystanders at the same or lower height level as well.",t="[color=${Const.UI.Color.DamageValue}]33%[/color]の確率で、同じかより下の高さにいる隣接するキャラクターにも命中する"}]
};
t["actives.quick_shot"]<-{name="クイックショット",
description="ドローと照準にほとんど時間をかけずに素早く射撃する。 精度は距離とともに急激に低下する。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+",t="命中率に [color=${Const.UI.Color.PositiveValue}]+"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] arrows left",t="残りの矢 [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty quiver of arrows equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でない矢筒が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.charm"]<-{name="魅了",
description=""
};
t["actives.nightmare"]<-{name="悪夢",
description=""
};
t["actives.crush_armor"]<-{name="アーマー破壊",
description="武器を使用して、目標の鎧を打撃、変形、裂け、その他の方法で使用できなくすることで、大きな効果が得られる。 衝撃は最も厚い鎧を通しても感じられるが、着用者に最も大きな怪我を与えることはない。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]10[/color] damage to hitpoints that ignores armor",t="[color=${Const.UI.Color.DamageValue}]10[/color] ダメージを鎧を無視して ヒットポイントに与える"}]
};
t["actives.fake_drink_night_vision"]<-{name="夜目のエリクサーを飲む",
description="錬金術の驚異を飲んで、まるで昼間のように夜を明るくする。 近接攻撃中は使用不可。"
,gettooltips= [{b="Removes the Nighttime effect",t="夜間ステータス効果を取り除く"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.warhound_bite"]<-{name="噛み付き",
description=""
};
t["actives.drink_antidote"]<-{name="解毒剤を飲むか与える",
description="隣接する味方に与えるか、自分で解毒剤を飲んで毒の影響を取り除く。 近接攻撃中は使用不可。アイテムを受け取る人は、空のバッグスロットが必要。"
,gettooltips= [{b="Removes the Poisoned status effect",t="毒ステータス効果を取り除く"},
{b="Grants immunity to Poison for 3 turns",t="毒に対する免疫を3ターンの間与える"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.fire_handgonne"]<-{name="ハンドキャノン発射",
description="ハンドキャノンの口火に点火する。 一度に多くの目標を攻撃できるが、遠くの目標は攻撃される可能性が低くなる。 近接攻撃中は使用不可。"
,gettooltips= [{b="Can hit up to 6 targets",t="最大6目標に命中"},
{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on flat ground and [color=${Const.UI.Color.PositiveValue}]",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合は"},
{b="[/color] tiles if shooting downhill",t="[/color] タイル"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+",t="命中率に [color=${Const.UI.Color.PositiveValue}]+"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance. This chance is unaffected by objects or characters in the line of fire.",t="%[/color]。この命中率は射線上のオブジェクトまたはキャラクターの影響を受けない。"},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance. This chance is unaffected by objects or characters in the line of fire.",t="%[/color] 。この確率は射線上のオブジェクトやキャラクターには影響を受けない。"},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] shots left",t="残りのショット [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty powder bag equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でない火薬袋が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Must be reloaded before firing again[/color]",t="[color=${Const.UI.Color.NegativeValue}]再発射の前にリロードする必要がある[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.recover"]<-{name="回復",
description="深呼吸をして、体力を回復するために1ターン休憩する。"
,gettooltips= [{b="Current Fatigue is reduced by half",t="現在の疲労を半分に減らす"}]
};
t["actives.coat_with_spider_poison"]<-{name="毒油を使用する",
description="武器と矢先を毒でコーティングする。 近接攻撃中は使用不可。"
,gettooltips= [{b="The next [color=${Const.UI.Color.PositiveValue}]4[/color] attacks will apply the Poisoned status effect for [color=${Const.UI.Color.NegativeValue}]10[/color] damage per turn.",t="次の [color=${Const.UI.Color.PositiveValue}]4[/color]回の攻撃の間、自身の攻撃にターン当たり[color=${Const.UI.Color.NegativeValue}]10[/color]ダメージを与える毒ステータス効果を付与する。"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.gore"]<-{name="ゴア",
description=""
};
t["actives.sweep"]<-{name="スイープストライク",
description=""
};
t["actives.taunt"]<-{name="挑発",
description="あなたは牛のように戦う！ 防御アクションを実行したり、別の、潜在的により脆弱な目標を攻撃したりする代わりに、1人の対戦相手を挑発してこのキャラクターを攻撃する。"
,gettooltips= [{b="Force the target to engage and attack this character, if possible, on their next turn. Note that targets will still adhere to their group strategy, and may not blindly charge forward.",t="可能であれば、次のターンに目標にこのキャラクターと交戦させて攻撃させる。ただし目標は引き続きグループ戦略を順守し、盲目的に前に進むことはない。"}]
};
t["actives.slash"]<-{name="スラッシュ",
description="平均的なダメージを与える迅速な斬撃攻撃。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"}]
};
t["actives.coat_with_poison"]<-{name="毒を使う",
description="武器と矢先を毒でコーティングする。 近接攻撃中は使用不可。"
,gettooltips= [{b="The next [color=${Const.UI.Color.PositiveValue}]4[/color] attacks will apply the Poisoned status effect.",t="次の [color=${Const.UI.Color.PositiveValue}]4[/color]回の攻撃の間、攻撃に毒ステータス効果を付与する。"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.throw_fire_bomb"]<-{name="ファイアポットを投げる",
description="引火性の高い液体で満たされたツボに点火して目標に向けて投げると、ツボが粉々になり、周囲が炎上する。 燃えているエリア内でターンを終了した人は誰でも発火し、ダメージを受ける-敵味方の区別はない。"
,gettooltips= [{b="Set an area of [color=${Const.UI.Color.DamageValue}]7[/color] tiles ablaze with fire for 2 rounds. Water and snow can not burn.",t="2ラウンドの間 [color=${Const.UI.Color.DamageValue}]7[/color] タイルを燃え盛る炎で延焼させる。水および雪は燃やすことはできない。"},
{b="Burns away existing tile effects like Smoke or Miasma",t="煙や瘴気などのタイル効果を取り除く"}]
};
t["actives.ghost_swing"]<-{name="スイング",
description="武器を広い弧を描いて振り、隣接する3つのタイルを反時計回りに攻撃する。 団のコストカットをしたいのでない限り、自身の部下の周囲に注意すること！"
,gettooltips= [{b="Can hit up to 3 targets",t="最大3目標に命中"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-5%[/color]"}]
};
t["actives.shieldwall"]<-{name="シールドウォール",
description="次のターンまで防御姿勢になる。 シールドウォールを隣り合わせに使用している味方は、盾を重ねることで防御をさらに強化する。"
,gettooltips= [{b="Grants [color=${Const.UI.Color.PositiveValue}]+",t="[color=${Const.UI.Color.PositiveValue}]+"},
{b="[/color] Melee Defense for one turn",t="[/color] 近接防御を1ターン付与する"},
{b="[/color] Ranged Defense for one turn",t="[/color] 遠隔防御を1ターン付与する"},
{b="Grants an additional [color=${Const.UI.Color.PositiveValue}]+5[/color] Defense against all attacks for each ally adjacent also using Shieldwall",t="隣接してシールドウォールを使用している味方に、全ての攻撃に対する追加の [color=${Const.UI.Color.PositiveValue}]+5[/color] 近接防御を与える"}]
};
t["actives.whip_slave"]<-{name="鞭打ち",
description="彼らに鞭打ちを与えることによって、主人が誰であるかを思い出させる。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]1[/color] - [color=${Const.UI.Color.DamageValue}]3[/color] damage that ignores armor to the target",t="[color=${Const.UI.Color.DamageValue}]1[/color] - [color=${Const.UI.Color.DamageValue}]3[/color] ダメージを鎧を無視して目標に与える"},
{b="Gives the targeted indebted the 'Whipped' status effect, increasing many of their stats for 2 rounds. The higher the level of the character using this skill, the higher the increase.",t="対象の奴隷に「鞭打ち」効果を付与し、ステータスを2ラウンド向上させる。このスキルを使用するキャラクターのレベルが高いほど効果が高くなる。"},
{b="Resets the morale of the targeted indebted to 'Steady' if currently below",t="対象の奴隷の士気が Steady より低い場合、Steady にリセットする"}]
};
t["actives.spearwall"]<-{name="スピアウォール"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用できない[/color]"}]
,descriptions= [{b="Prepare to immediately attack any opponent that attempts to move into melee range and, on a hit, prevent that opponent from closing in. Targets hit will receive half the damage of a normal ",t="近接範囲に移動しようとする敵をすぐに攻撃する準備をし、命中すると、その敵が接近するのを防ぐ。 命中した目標は、通常の"},
{b="attack. Can not be used while already engaged in melee.",t="攻撃の半分のダメージを受ける。 すでに近接攻撃を行っている間は使用不可。"}]
};
t["actives.break_ally_free"]<-{name="無料の味方",
description="自由に使えるすべてのものを使用して、近くの味方を所定の位置に保持しているものから解放する。 必要に応じて、ハック、スラッシュ、カット、またはかじる！"
,gettooltips= [{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="近接スキルに基く成功確率 [color=${Const.UI.Color.PositiveValue}]"},
{b="%[/color] chance to succeed, based on Melee Skill, or higher if there's been attempts to free the ally before.",t="%[/color]、この確率は以前に味方を解放しようとしていればより高くなる。"}]
};
t["actives.stealth"]<-{name="ステルス",
description="TODO"
,gettooltips= [{b="Can not be used if currently visible to an opponent",t="相手に見つかっている間は使用不可"}]
};
t["actives.split"]<-{name="スプリット",
description="2つのタイルを直線攻撃可能な、威力ではなくリーチを優先した、大きく振りかぶった頭上からの攻撃。"
,gettooltips= [{b="Can hit up to 2 targets",t="最大2目標に命中"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-5%[/color]"}]
};
t["actives.rupture"]<-{name="破裂",
description="2タイルの距離をカバーでき、最前線の後ろから、ほとんどの近接武器の範囲外で使用でき、鎧で止めないと出血している傷を引き裂くことができる突進攻撃。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Inflicts additional [color=${Const.UI.Color.DamageValue}]${10}[/color] bleeding damage over time if not stopped by armor",t="鎧で止められなかった場合、追加の[color=${Const.UI.Color.DamageValue}]10[/color]出血ダメージを与える"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+5%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+5%[/color]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.goblin_whip"]<-{name="ウィップ",
description=""
};
t["actives.indomitable"]<-{name="不屈",
description="このキャラクターの体力と意志力をすべて集めて、次のターンまで不屈になる。"
,gettooltips= [{b="Only receive [color=${Const.UI.Color.PositiveValue}]50%[/color] of any damage",t="任意のダメージの[color=${Const.UI.Color.PositiveValue}]50%[/color]のみを受ける"},
{b="Become immune to being stunned",t="スタンされなくなる"},
{b="Become immune to being knocked back or grabbed",t="ノックバックあるいは掴まれなくなる"}]
};
t["actives.hook"]<-{name="引っ掛け",
description="2タイル離れた目標を引っ掛けて、スペースがある場合は引き寄せる。 命中した人はだれでもよろめき、主導権を失う。 目標は同じ高さまで引き上げることはできないが、一度に複数の高さまで引き下げるとダメージを受ける可能性がある。 シールドウォール、スピアウォール、リポストは、正常にフックインされた目標に対してキャンセルされる。 拘束された目標を引っ掛けることはできない。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to stagger on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率でよろめき状態にする"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"}]
};
t["actives.grow_shield"]<-{name="シールドを育てる",
description=""
};
t["actives.split_axe"]<-{name="スプリット",
description="2つのタイルを直線攻撃可能な、威力ではなくリーチを優先した、大きく振りかぶった頭上からの攻撃。"
,gettooltips= [{b="Can hit up to 2 targets",t="最大2目標に命中"}]
};
t["actives.uproot_small_zoc"]<-{name="根こそぎ",
description=""
};
t["actives.hail"]<-{name="ヘイル",
description="相手の頭部を狙う。 攻撃する各ヘッドは、武器のダメージの3分の1を自分でヒットまたはミスする可能性があり、シールドカバーの上または周囲を攻撃する。"
,gettooltips= [{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to hit the head",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率で頭に命中する"},
{b="Will make three separate strikes for one third of the weapon's damage each.",t="この武器の1/3のダメージを与える別々の攻撃を3回行う。"},
{b="Ignores the bonus to Melee Defense granted by shields",t="盾による近接防御ボーナスを無視する"}]
};
t["actives.ignite_firelance"]<-{name="点火する",
description="火槍の口火に点火し、敵に火と煙の奔流を放つ。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]+40%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+40%[/color]"},
{b="Can hit up to 2 targets",t="最大2目標に命中"},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] charge left",t="残りのチャージ [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]No charges left[/color]",t="[color=${Const.UI.Color.NegativeValue}]残りのチャージがない[/color]"}]
};
t["actives.sleep"]<-{name="睡眠",
description=""
};
t["actives.warcry"]<-{name="ウォークライ",
description=""
};
t["actives.berserker_mushrooms"]<-{name="奇妙なキノコを食べるか与える",
description="隣の味方にあげるか、奇妙なキノコを食べて、安全を気にせずにトランスのような怒りの状態に入る。 病気になる可能性がある。 効果は4ターンかけてゆっくりと消えていく。 近接攻撃中は使用不可。アイテムを受け取る人は、空のバッグスロットが必要。"
,gettooltips= [{b="Grants [color=${Const.UI.Color.PositiveValue}]+40%[/color] Damage in Melee",t="近接攻撃のダメージを [color=${Const.UI.Color.PositiveValue}]+40%[/color] 追加する"},
{b="Grants [color=${Const.UI.Color.NegativeValue}]-40%[/color] Melee Defense",t=""},
{b="Grants [color=${Const.UI.Color.NegativeValue}]-40%[/color] Ranged Defense",t=""},
{b="No morale check triggered upon losing hitpoints",t="ヒットポイントを失っても士気チェックをトリガーしない"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.throw_golem"]<-{name="リビングサンドを投げる",
description=""
};
t["actives.ghoul_claws"]<-{name="グールクロー",
description="肉を簡単に引き裂くことができる長くて鋭い爪。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage",t="[/color] ダメージを与える"}]
};
t["actives.miasma"]<-{name="瘴気",
description=""
};
t["actives.insects"]<-{name="昆虫の群れ",
description=""
};
t["actives.bash"]<-{name="バッシュ",
description="命中するたびに追加の疲労を与えるブルートフォース攻撃。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] extra fatigue",t="[/color] 疲労を追加で与える"}]
};
t["actives.throw_axe"]<-{name="斧を投げる",
description="目標に斧を投げる。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]",t="%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]"},
{b="%[/color] per tile of distance",t="%[/color] "},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] axes left",t="残りの斧 [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]No axes left[/color]",t="[color=${Const.UI.Color.NegativeValue}]残りの斧がない[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.hammer"]<-{name="バター",
description="最も厚い鎧を通しても感じることができ、永続的な痕跡を残す打撃"
,gettooltips= [{b="Always inflicts at least [color=${Const.UI.Color.DamageValue}]10[/color] damage to hitpoints, regardless of armor",t="鎧の有無にかかわらず少なくとも[color=${Const.UI.Color.DamageValue}]10[/color] ダメージをヒットポイントに与える"}]
};
t["actives.knock_over"]<-{name="ひっくり返す",
description="強烈な打撃は、1ターンの間打たれるほど不運な人を気絶させたり無力化したりすることを目的としているが、最大のダメージを与えることはない。 唖然とした目標は、シールドウォール、スピアウォール、または同様の防御スキルを維持できない。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] extra fatigue",t="[/color] 疲労を追加で与える"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to stun on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率でスタン状態にする"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]${this.m.StunChance}%[/color] chance to stun for two turns on a hit",t="%[/color] の確率で2ターンの間スタンする"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.repel"]<-{name="撃退",
description="目標を1タイルだけ使用者から遠ざけるため、目標を突いて突き刺す。 命中した目標はずらされてイニシアチブを失い、高さのいくつかのレベルを押し下げるとダメージを受ける可能性がある。 シールドウォール、スピアウォール、リポストは、反発に成功した目標に対してキャンセルされる。 拘束された目標は撃退不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to stagger on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率でよろめき状態にする"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.reload_bolt"]<-{name="リロード",
description="別のボルトを発射する準備をする。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] bolts left",t="残りのボルト [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty quiver of bolts equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でないボルト筒が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.throw_balls"]<-{name="ボールを投げる",
description="スパイクボールを目標に向かって投げる。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has a range of [color=${Const.UI.Color.PositiveValue}]",t="射程 [color=${Const.UI.Color.PositiveValue}]"},
{b="[/color] tiles on even ground, more if shooting downhill",t="[/color] タイル（同一の高さの場合）、低い位置を攻撃する場合はそれ以上"},
{b="Has [color=${Const.UI.Color.PositiveValue}]+30%[/color] chance to hit, and [color=${Const.UI.Color.NegativeValue}]-10%[/color] per tile of distance",t="命中率に [color=${Const.UI.Color.PositiveValue}]+30%[/color]、および距離に応じてタイルごとに [color=${Const.UI.Color.NegativeValue}]-10%[/color]"},
{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] spiked balls left",t="残りのスパイクボール [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]No spiked balls left[/color]",t="[color=${Const.UI.Color.NegativeValue}]残りのスパイクボールがない[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.fire_mortar"]<-{name="火のモルタル",
description=""
};
t["actives.move_tail"]<-{name="尻尾を動かす",
description=""
};
t["actives.release_falcon"]<-{name="ファルコンを解放する",
description="鷹を放して、現在のラウンドの間、周囲の12個のタイルのビジョンを取得します。 戦闘ごとに1回使用できます。"
};
t["actives.raise_undead"]<-{name="レイズ・アンデッド",
description=""
};
t["actives.demolish_armor"]<-{name="アーマー破壊",
description="武器を使用して、目標の鎧を打撃、変形、裂け、その他の方法で使用できなくすることで、大きな効果が得られる。 衝撃は最も厚い鎧を通しても感じられるが、着用者に最も大きな怪我を与えることはない。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]10[/color] damage to hitpoints that ignores armor",t="[color=${Const.UI.Color.DamageValue}]10[/color] ダメージを鎧を無視して ヒットポイントに与える"},
{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.gash"]<-{name="ガッシュ",
description="衰弱させる怪我を負わせる可能性が高い、適切に配置された斬撃攻撃。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]+10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.PositiveValue}]+10%[/color]"},
{b="Has a [color=${Const.UI.Color.NegativeValue}]50%[/color] lower threshold to inflict injuries",t="怪我を与える閾値を[color=${Const.UI.Color.NegativeValue}]50%[/color]低下させる"},
{b="Has a [color=${Const.UI.Color.NegativeValue}]33%[/color] lower threshold to inflict injuries",t="怪我を与える閾値を[color=${Const.UI.Color.NegativeValue}]33%[/color]低下させる"}]
};
t["actives.debilitate"]<-{name="衰弱させる",
description="次の攻撃を準備して、目標を1ターン衰弱させ、ダメージを与える能力を[color=${Const.UI.Color.NegativeValue}] -50％[/color]減らす。 目標がない場合、効果が無駄になる。"
};
t["actives.footwork"]<-{name="フットワーク",
description="巧みなフットワークで、フリーアタックを誘発せずにZoCを離れる。"
,gettooltips= [{b="[color=${Const.UI.Color.NegativeValue}]Can only be used when in an opponent's Zone of Control[/color]",t="[color=${Const.UI.Color.NegativeValue}]相手のZoCにいる間のみ使用可能[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used while rooted[/color]",t="[color=${Const.UI.Color.NegativeValue}]拘束されている間は使用不可[/color]"}]
};
t["actives.reap"]<-{name="刈り取り",
description="ある距離にわたって反時計回りの順序で3つの隣接するタイルに当たる広い弧のスイープストライク。 団のコストカットをしたいのでない限り、自身の部下の周囲に注意すること！"
,gettooltips= [{b="Can hit up to 3 targets",t="最大3目標に命中"},
{b="Has a range of [color=${Const.UI.Color.PositiveValue}]2[/color] tiles",t="攻撃範囲 [color=${Const.UI.Color.PositiveValue}]2[/color] タイル"},
{b="Has [color=${Const.UI.Color.NegativeValue}]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy",t="扱いづらさのため直接隣接する目標に対して命中率に [color=${Const.UI.Color.NegativeValue}]-15%[/color]"}]
};
t["actives.wolf_bite"]<-{name="噛み付き",
description=""
};
t["actives.hand_to_hand"]<-{name="ステゴロ",
description="標準的な拳闘攻撃。 殴り飛ばせ！"
,gettooltips= [{b="Has [color=${Const.UI.Color.NegativeValue}]-10%[/color] chance to hit",t="命中率に [color=${Const.UI.Color.NegativeValue}]-10%[/color]"}]
};
t["actives.gruesome_feast"]<-{name="恐ろしい饗宴",
description=""
};
t["actives.smite"]<-{name="スマイト",
description="目標を粉々に粉砕するために全力で実行されるゆっくりとした頭上からの攻撃。 命中した人はだれでもよろめき、主導権を失う。"
,gettooltips= [{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to hitpoints, of which [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]",t="[/color] ダメージをヒットポイントに与える、そのうち [color=${Const.UI.Color.DamageValue}]0[/color] - [color=${Const.UI.Color.DamageValue}]"},
{b="[/color] can ignore armor",t="[/color] は鎧を無視する"},
{b="Inflicts [color=${Const.UI.Color.DamageValue}]",t="[color=${Const.UI.Color.DamageValue}]"},
{b="[/color] damage to armor",t="[/color] ダメージを鎧に与える"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]100%[/color] chance to stagger on a hit",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]100%[/color] の確率でよろめき状態にする"}]
};
t["actives.thresh"]<-{name="スレッシュ",
description="無謀な回転斬りで、敵味方を問わず周囲の全目標を刈り取る。 何も狙っていないため回避は難しくないが、下手をすると壊滅的な被害をもたらす可能性がある。1ターン命中した目標を気絶させる可能性がある。 団のコストカットをしたいのでない限り、自身の部下の周囲に注意すること！"
,gettooltips= [{b="Has [color=${Const.UI.Color.NegativeValue}]",t="命中率に"},
{b="chance to hit",t="%[/color]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]",t="命中した場合に [color=${Const.UI.Color.PositiveValue}]"},
{b="Has a [color=${Const.UI.Color.PositiveValue}]${this.m.StunChance}%[/color] chance to stun for two turns on a hit",t="%[/color] の確率で2ターンの間スタンする"},
{b="Can hit up to 6 targets",t="最大6目標に命中"}]
};
t["actives.cascade"]<-{name="カスケード",
description="対戦相手の3つの印象的な頭のカスケードを緩めましょう。 シールドカバーの上または周囲に衝突します。"
,gettooltips= [{b="Will make three separate strikes for one third of the weapon's damage each",t="この武器の1/3のダメージを与える別々の攻撃を3回行う"},
{b="Ignores the bonus to Melee Defense granted by shields",t="盾による近接防御ボーナスを無視する"}]
};
t["actives.line_breaker"]<-{name="ラインブレーカー",
description=""
};
t["actives.teleport"]<-{name="スピリットウォーク",
description=""
};
t["actives.load_mortar"]<-{name="モルタルをロード",
description=""
};
t["actives.reload_handgonne"]<-{name="リロード",
description="別のショットを発射する準備をする。 近接攻撃中は使用不可。"
,gettooltips= [{b="Has [color=${Const.UI.Color.PositiveValue}]${ammo}[/color] shots left",t="残りのショット [color=${Const.UI.Color.PositiveValue}]${ammo}[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Needs a non-empty powder bag equipped[/color]",t="[color=${Const.UI.Color.NegativeValue}]空でない火薬袋が必要[/color]"},
{b="[color=${Const.UI.Color.NegativeValue}]Can not be used because this character is engaged in melee[/color]",t="[color=${Const.UI.Color.NegativeValue}]キャラクターが近接戦闘中のため使用不可[/color]"}]
};
t["actives.barbarian_fury"]<-{name="野蛮な怒り",
description=""
};
t["actives.headbutt"]<-{name="頭突き",
description=""
};