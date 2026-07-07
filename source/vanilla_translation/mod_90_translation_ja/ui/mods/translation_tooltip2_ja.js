"use strict";

var translation_tooltip2 = {
   "assets.Money":  {
                        "descriptions":  [
                                             {
                                                 "t":  "君の傭兵団が持っているコインの量。毎日正午に全ての団員に日当を支払うため、新人を雇うため、道具を購入するために使用される。\n\n君は現在誰にも支払いを行っていない。",
                                                 "b":  "The amount of coin your mercenary company has. Used to pay every man daily at noon, as well as to hire new people and purchase equipment.\n\nYou currently don\u0027t pay anyone."
                                             },
                                             {
                                                 "t":  "君の傭兵団が持っているコインの量。毎日正午に全ての団員に日当を支払うため、新人を雇うため、道具を購入するために使用される。\n\n君は毎日 [color=${Const.UI.Color.PositiveValue}]",
                                                 "b":  "The amount of coin your mercenary company has. Used to pay every man daily at noon, as well as to hire new people and purchase equipment.\n\nYou pay out [color=${Const.UI.Color.PositiveValue}]"
                                             },
                                             {
                                                 "t":  "[/color] クラウンを支払う。君の [color=${Const.UI.Color.PositiveValue}]",
                                                 "b":  "[/color] crowns per day. Your [color=${Const.UI.Color.PositiveValue}]"
                                             },
                                             {
                                                 "t":  "[/color] クラウンはあと [color=${Const.UI.Color.PositiveValue}]",
                                                 "b":  "[/color] crowns will last you for [color=${Const.UI.Color.PositiveValue}]"
                                             },
                                             {
                                                 "t":  "[/color] 日持つ。",
                                                 "b":  "[/color] more days."
                                             },
                                             {
                                                 "t":  "[/color] クラウンを支払う。\n\n[color=${Const.UI.Color.NegativeValue}]部下に支払うクラウンがもうない！クラウンを早く稼ぐか、一人ずつ見捨てられる前に何人かの部下を解雇すること。[/color]",
                                                 "b":  "[/color] crowns per day.\n\n[color=${Const.UI.Color.NegativeValue}]You have no more crowns to pay your men with! Earn some crowns fast or let some people go before they desert you one by one.[/color]"
                                             }
                                         ],
                        "text":  "クラウン"
                    },
   "assets.Supplies":  {
                           "descriptions":  [
                                                {
                                                    "t":  "武器、鎧、兜、盾を良好な状態に保つための様々な道具と消耗品。 15点のアイテム状態を修理するには1点の消耗品が必要となる。物資が不足すると、戦闘で武器が壊れ、鎧が損傷して役に立たなくなる可能性がある。",
                                                    "b":  "Assorted tools and supplies to keep your weapons, armor, helmets and shields in good condition. One point is required to repair 15 points of item condition. Running out of supplies may result in weapons breaking in combat and will leave your armor damaged and useless."
                                                },
                                                {
                                                    "t":  "\n\n全ての装備品を修理するためには [color=${Const.UI.Color.PositiveValue}]",
                                                    "b":  "\n\nRepairing all your equipment will take [color=${Const.UI.Color.PositiveValue}]"
                                                },
                                                {
                                                    "t":  "[/color] 時間かかり、 ",
                                                    "b":  "[/color] hours and requires "
                                                },
                                                {
                                                    "t":  "[color=${Const.UI.Color.PositiveValue}]",
                                                    "b":  "[color=${Const.UI.Color.PositiveValue}]"
                                                },
                                                {
                                                    "t":  "[color=${Const.UI.Color.NegativeValue}]",
                                                    "b":  "[color=${Const.UI.Color.NegativeValue}]"
                                                },
                                                {
                                                    "t":  "[/color] の工具と消耗品が必要。",
                                                    "b":  "[/color] tools and supplies."
                                                },
                                                {
                                                    "t":  "君は最大",
                                                    "b":  "You can carry "
                                                },
                                                {
                                                    "t":  "個を携行可能。",
                                                    "b":  "units at most."
                                                }
                                            ],
                           "text":  "工具と消耗品"
                       },
   "effects.charmed":  {
                           "descriptions":  [
                                                {
                                                    "t":  "このキャラクターは魅了されている。 彼はもはや自分の行動を制御することはできず、彼の主人に従うしかない人形だ。 効果は[color=${Const.UI.Color.NegativeValue}]",
                                                    "b":  "This character has been charmed. He no longer has any control over his actions and is a puppet that has no choice but to obey his master. Wears off in [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] turn(s).\n\nThe higher a character\u0027s resolve, the higher the chance to resist being charmed."
                                                },
                                                {
                                                    "t":  "[/color]ターンで消える。\n\nキャラクターの決意が高ければ高いほど、魅了されることに抵抗する可能性が高くなる。",
                                                    "b":  "This character has been charmed. He no longer has any control over his actions and is a puppet that has no choice but to obey his master. Wears off in [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] turn(s).\n\nThe higher a character\u0027s resolve, the higher the chance to resist being charmed."
                                                }
                                            ],
                           "text":  "魅了"
                       },
   "effects.killing_frenzy":  {
                                  "descriptions":  [
                                                       {
                                                           "t":  "RAAAARGH！ このキャラクターは、あと[color=${Const.UI.Color.PositiveValue}]",
                                                           "b":  "RAAAARGH! This character is on a killing frenzy for [color=${Const.UI.Color.PositiveValue}]"
                                                       },
                                                       {
                                                           "t":  "[/color]ターンの間、殺戮の狂乱にある。 別の対戦相手を殺すと、2ターンの間殺戮の狂乱がリセットされる。",
                                                           "b":  "[/color] more turn(s). Killing another opponent will refresh the killing frenzy for a 2 turn duration."
                                                       }
                                                   ],
                                  "text":  "殺戮の狂乱！"
                              },
   "dlc_1":  {
                 "text":  "Lindwurm",
                 "options":  [
                                 {
                                     "t":  "ストアページをブラウザーで開く",
                                     "b":  "Open store page in browser"
                                 }
                             ]
             },
   "effects.withered":  {
                            "descriptions":  [
                                                 {
                                                     "t":  "黒魔術によって、このキャラクターは老人の体格に枯れてしまった。 [color=${Const.UI.Color.NegativeValue}]",
                                                     "b":  "By means of dark magic, this character has withered to have the physique of an old man. Will slowly wear off over [color=${Const.UI.Color.NegativeValue}]"
                                                 },
                                                 {
                                                     "t":  "[/color]ターンの間に徐々に解除される。",
                                                     "b":  "[/color] more turn(s)."
                                                 }
                                             ],
                            "text":  "枯れた"
                        },
   "assets.MoralReputation":  {
                                  "descriptions":  [
                                                       {
                                                           "t":  "君の評判は、世界中の人々が君の傭兵団を過去の行動に基づいてどのように行動するかを判断することを反映している。敵に情けをかけるのか？農場を焼き払い、農民を虐殺するのか？君の評判に基づいて、人々は君に様々な種類の契約を持ちかけ、契約もイベントも異なる展開を見せるかもしれない。",
                                                           "b":  "Your reputation reflects how people in the world judge your mercenary company to conduct itself based on past actions. Do you show mercy to your enemies? Do you burn down farmsteads and massacre the peasantry? Based on your reputation, people may offer you different kinds of contracts, and both contracts and events may play out differently."
                                                       }
                                                   ],
                                  "texts":  [
                                                {
                                                    "t":  "評判：",
                                                    "b":  "Reputation: "
                                                }
                                            ]
                              },
   "tactical-combat-result-screen.statistics-panel.DamageReceivedValue":  {
                                                                              "options":  [
                                                                                              {
                                                                                                  "t":  "[color=${Const.UI.Color.NegativeValue}]",
                                                                                                  "b":  "Received [color=${Const.UI.Color.NegativeValue}]"
                                                                                              },
                                                                                              {
                                                                                                  "t":  "[/color] ヒットポイントへのダメージ",
                                                                                                  "b":  "[/color] hitpoint damage"
                                                                                              },
                                                                                              {
                                                                                                  "t":  "[/color] 装甲へのダメージ",
                                                                                                  "b":  "[/color] armor damage"
                                                                                              }
                                                                                          ],
                                                                              "descriptions":  [
                                                                                                   {
                                                                                                       "t":  "このキャラクターが受けたダメージは、ヒットポイントへのダメージと装甲へのダメージに分けられる。値は、可能なダメージ軽減後のもの。",
                                                                                                       "b":  "The damage received by this character, split into damage to hitpoints and damage to armor. The value is after any possible damage reduction."
                                                                                                   }
                                                                                               ],
                                                                              "text":  "受けたダメージ"
                                                                          },
   "effects.spider_poison":  {
                                 "descriptions":  [
                                                      {
                                                          "t":  "このキャラクターは凶悪な毒を受けており、毎ターン[color=${Const.UI.Color.NegativeValue}]",
                                                          "b":  "This character has a vicious poison running through his veins and will lose [color=${Const.UI.Color.NegativeValue}]"
                                                      },
                                                      {
                                                          "t":  "[/color]ヒットポイントを、残り[color=${Const.UI.Color.NegativeValue}]",
                                                          "b":  "[/color] hitpoints each turn for [color=${Const.UI.Color.NegativeValue}]"
                                                      },
                                                      {
                                                          "t":  "[/color]ターンの間失い続ける。",
                                                          "b":  "[/color] more turn(s)."
                                                      }
                                                  ],
                                 "text":  "中毒"
                             },
   "effects.staggered":  {
                             "descriptions":  [
                                                  {
                                                      "t":  "このキャラクターは非常に大きな打撃を受けたため、バランスを崩し、慌てふためき、行動が遅れている。あと[color=${Const.UI.Color.NegativeValue}]",
                                                      "b":  "This character has received so heavy a blow that they are off-balance, scrambling and late to act. Will wear off in [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] turn(s)."
                                                  },
                                                  {
                                                      "t":  "[/color]ターンで回復する。",
                                                      "b":  "This character has received so heavy a blow that they are off-balance, scrambling and late to act. Will wear off in [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] turn(s)."
                                                  }
                                              ],
                             "text":  "千鳥足"
                         },
   "tactical-combat-result-screen.statistics-panel.DamageDealtValue":  {
                                                                           "options":  [
                                                                                           {
                                                                                               "t":  "[color=${Const.UI.Color.PositiveValue}]",
                                                                                               "b":  "Dealt [color=${Const.UI.Color.PositiveValue}]"
                                                                                           },
                                                                                           {
                                                                                               "t":  "[/color] ダメージをヒットポイントへ与えた",
                                                                                               "b":  "[/color] damage to hitpoints"
                                                                                           },
                                                                                           {
                                                                                               "t":  "[/color] ダメージを装甲へ与えた",
                                                                                               "b":  "[/color] damage to armor"
                                                                                           }
                                                                                       ],
                                                                           "descriptions":  [
                                                                                                {
                                                                                                    "t":  "戦闘中、ヒットポイントおよび装甲に対してこのキャラクターが与えたダメージ。",
                                                                                                    "b":  "The damage dealt by this character during battle, against hitpoints and against armor."
                                                                                                }
                                                                                            ],
                                                                           "text":  "与えたダメージ"
                                                                       },
   "effects.immune_to_poison":  {
                                    "descriptions":  [
                                                         {
                                                             "t":  "このキャラクターは解毒剤を服用しており、次の[color=${Const.UI.Color.NegativeValue}]",
                                                             "b":  "This character has taken antidote and is immune to any kind of poison for another [color=${Const.UI.Color.NegativeValue}]"
                                                         },
                                                         {
                                                             "t":  "[/color]ターンの間はどんな種類の毒にも耐性がある。",
                                                             "b":  "[/color] turn(s)."
                                                         }
                                                     ],
                                    "text":  "毒に対する免疫"
                                },
   "effects.dazed":  {
                         "descriptions":  [
                                              {
                                                  "t":  "このキャラクターは非常に大きな打撃を受けたため、意識が朦朧とし、混乱し、息を切らしている。 効果は[color=${Const.UI.Color.NegativeValue}]",
                                                  "b":  "This character has received so heavy a blow that they are dazed, confused and gasping for air. Will wear off in [color=${Const.UI.Color.NegativeValue}]"
                                              },
                                              {
                                                  "t":  "[/color]ターンで消える。",
                                                  "b":  "[/color] turn(s)."
                                              }
                                          ],
                         "text":  "朦朧"
                     },
   "world-town-screen.main-dialog-module.Arena":  {
                                                      "options":  [
                                                                      {
                                                                          "t":  "今日はもうここでは試合はないぞ。明日また来てくれ！",
                                                                          "b":  "No more matches take place here today. Come back tomorrow!"
                                                                      },
                                                                      {
                                                                          "t":  "他の仕事を契約している間は、闘技場で戦うことはできない",
                                                                          "b":  "You cannot fight in the arena while contracted to do other work"
                                                                      },
                                                                      {
                                                                          "t":  "進行中のトーナメントで戦うには、少なくとも5つの空のインベントリスロットが必要",
                                                                          "b":  "You need at least 5 empty inventory slots to fight in the ongoing tournament"
                                                                      },
                                                                      {
                                                                          "t":  "闘技場で戦うには、少なくとも3つの空のインベントリスロットが必要",
                                                                          "b":  "You need at least 3 empty inventory slots to fight in the arena"
                                                                      }
                                                                  ],
                                                      "descriptions":  [
                                                                           {
                                                                               "t":  "闘技場では、死と隣り合わせの戦いで金と名声を得る機会があり、観客の前で、最も陰惨な方法で命が失われることに歓声が上がる。",
                                                                               "b":  "The arena offers an opportunity to earn gold and fame in fights that are to the death, and in front of crowds that cheer for the most gruesome manner in which lives are dispatched."
                                                                           }
                                                                       ],
                                                      "text":  "闘技場"
                                                  },
   "tactical-combat-result-screen.statistics-panel.DaysWounded":  {
                                                                      "options":  [
                                                                                      {
                                                                                          "t":  "翌日に回復する。",
                                                                                          "b":  "Will heal by tomorrow"
                                                                                      },
                                                                                      {
                                                                                          "t":  "[color=${Const.UI.Color.NegativeValue}]",
                                                                                          "b":  "Will heal in [color=${Const.UI.Color.NegativeValue}]"
                                                                                      },
                                                                                      {
                                                                                          "t":  "[/color] 日で回復する。",
                                                                                          "b":  "[/color] days"
                                                                                      }
                                                                                  ],
                                                                      "descriptions":  [
                                                                                           {
                                                                                               "t":  "軽い打撲傷、肉離れ、失血等により、このキャラクターは能力を損なうことなくヒットポイントを失った。",
                                                                                               "b":  "Light bruises, flesh wounds, loss of blood and similar that caused this character to lose hitpoints without impairing their abilities."
                                                                                           }
                                                                                       ],
                                                                      "text":  "軽傷"
                                                                  },
   "assets.Ammo":  {
                       "descriptions":  [
                                            {
                                                "t":  "戦闘後に矢筒を自動的に補充するために使用される各種の矢、ボルト、投擲武器。 1本の矢またはボルトを補充すると1ポイント、ハンドキャノンの1ショットを補充すると2ポイント、1つの投擲武器または火槍のチャージを補充すると3ポイント必要になる。矢弾が不足すると、矢筒が空になり、部下は何も撃たなくなる。君は最大",
                                                "b":  "Assorted arrows, bolts and throwing weapons used to automatically refill quivers after battle. Replacing one arrow or bolt will take up one point of ammunition, replacing one shot of a Handgonne will take up two points, and replacing one throwing weapon or charge of a Fire Lance will take up three. Running out of ammunition will leave your quivers empty and your people with nothing to shoot with. You can carry no more than "
                                            },
                                            {
                                                "t":  "個を携行可能。",
                                                "b":  "units at a time."
                                            }
                                        ],
                       "text":  "矢弾"
                   },
   "effects.spider_poison_coat":  {
                                      "descriptions":  [
                                                           {
                                                               "t":  "このキャラクターは、濃縮されたウェブクネヒト毒が付与された武器を使用している。 次の数ヒットはヒットポイントに少なくとも[color=${Const.UI.Color.NegativeValue}] ",
                                                               "b":  "This character is using a weapon coated with concentrated webknecht poison. The next few hits doing at least [color=${Const.UI.Color.NegativeValue}]"
                                                           },
                                                           {
                                                               "t":  "[/color]のダメージを与える。 影響を受ける目標は、効果が薄れるまで、ターン毎に[color=${Const.UI.Color.NegativeValue}] 10 [/color]ヒットポイントを失う。",
                                                               "b":  "[/color] damage to hitpoints will apply it. Targets affected will lose [color=${Const.UI.Color.NegativeValue}]10[/color] hitpoints per turn until the effect has faded."
                                                           }
                                                       ],
                                      "text":  "毒を付与された武器"
                                  },
   "effects.lindwurm_acid":  {
                                 "descriptions":  [
                                                      {
                                                          "t":  "このキャラクターの鎧にはリンドヴルムの酸性の血が吹き付けられており、残り[color=${Const.UI.Color.NegativeValue}]",
                                                          "b":  "This character\u0027s armor has been sprayed with a Lindwurm\u0027s acidic blood, which is now slowly eating away at it for another [color=${Const.UI.Color.NegativeValue}]"
                                                      },
                                                      {
                                                          "t":  "[/color]ターンの間徐々に溶けていく。",
                                                          "b":  "[/color] turn(s)."
                                                      }
                                                  ],
                                 "text":  "酸を被る"
                             },
   "assets.BusinessReputation":  {
                                     "descriptions":  [
                                                          {
                                                              "t":  "名声とはプロの傭兵団としての君の評判のことであり、君がどれだけ信頼でき、有能であると人々が判断しているかを反映している。名声が高ければ高いほど、高報酬・高難易度の契約を任されるようになる。名声は、野望や契約を成功させたり、戦闘に勝利することで増加し、失敗すると減少する。",
                                                              "b":  "Your renown is your repute as a professional mercenary company and reflects how reliable and competent people judge you to be. The higher your renown, the higher-paid and more difficult contracts people will entrust you with. Renown increases on successfully completing ambitions and contracts, and winning battles, and decreases on failing to do so."
                                                          }
                                                      ],
                                     "texts":  [
                                                   {
                                                       "t":  "名声：",
                                                       "b":  "Renown: "
                                                   }
                                               ]
                                 },
   "world-screen.topbar.options-module.CampButton":  {
                                                         "options":  [
                                                                         {
                                                                             "t":  "[color=${Const.UI.Color.NegativeValue}]他のパーティと一緒に旅している間は野営不可[/color]",
                                                                             "b":  "[color=${Const.UI.Color.NegativeValue}]Unable to camp while travelling with other parties[/color]"
                                                                         }
                                                                     ],
                                                         "descriptions":  [
                                                                              {
                                                                                  "t":  "野営地を作るか壊す。野営中は、時間経過が早くなり、部下の回復や装備の修理の速度も速くなる。ただし、奇襲攻撃に巻き込まれる可能性も高くなる。",
                                                                                  "b":  "Make or break camp. While encamped, time will go faster and your men will heal and repair their equipment at a faster rate. However, you\u0027re also more vulnerable to being caught in a surprise attack."
                                                                              }
                                                                          ],
                                                         "text":  "野営（T）"
                                                     },
   "world-town-screen.main-dialog-module.Port":  {
                                                     "options":  [
                                                                     {
                                                                         "t":  "キャラバン護衛契約中は港を利用不可",
                                                                         "b":  "You cannot use the harbor while contracted to escort a caravan"
                                                                     }
                                                                 ],
                                                     "descriptions":  [
                                                                          {
                                                                              "t":  "外国の貿易船と地元の漁師の両方が行き交う港。ここでは、大陸の他の地域への海上通過を予約できる可能性がある。",
                                                                              "b":  "A harbor that serves both foreign trading ships and local fishermen. You\u0027ll likely be able to book passage by sea to other parts of the continent here."
                                                                          }
                                                                      ],
                                                     "text":  "港"
                                                 },
   "effects.shellshocked":  {
                                "descriptions":  [
                                                     {
                                                         "t":  "このキャラクターは迫撃砲の爆発の近くにいたためシェルショックを受けている。 彼らの耳は鳴り響き、視力はぼやけ、わずかに混乱している。 効果は[color=${Const.UI.Color.NegativeValue}]",
                                                         "b":  "This character is shellshocked from being near a mortar explosion. Their ears are ringing, their vision is blurred and they\u0027re slightly disoriented. The effect will slowly wear off over [color=${Const.UI.Color.NegativeValue}]"
                                                     },
                                                     {
                                                         "t":  "[/color]以上のターンでゆっくりと消えていく。",
                                                         "b":  "[/color] more turn(s)."
                                                     }
                                                 ],
                                "text":  "シェルショック"
                            },
   "tactical-combat-result-screen.statistics-panel.LeveledUp":  {
                                                                    "text":  "レベルアップ",
                                                                    "descriptions":  [
                                                                                         {
                                                                                             "t":  "このキャラクターはレベルアップした！能力を上げてパークを選択するには、世界地図からアクセスできる名簿で彼を見つけること。",
                                                                                             "b":  "This character just leveled up! Find him in your roster, accessible on the worldmap, to raise his attributes and select a perk."
                                                                                         }
                                                                                     ]
                                                                },
   "assets.Food":  {
                       "descriptions":  [
                                            {
                                                "t":  "君が運ぶ食糧の総量。平均的な部下は1日に2食分の食糧を必要とし、困難な地形ではそれ以上を必要とする。部下は期限切れに近い食糧を先に食べる。食糧を使い果たすと士気が下がり、最終的には餓死する前に部下が離脱することになる。\n\n君は１日あたり[color=${Const.UI.Color.PositiveValue}]",
                                                "b":  "The total amount of provisions you carry. The average man requires 2 provisions per day and more on difficult terrain. Your men will eat the provisions closest to expiring first. Running out of provisions will lower morale and will eventually lead to your people deserting you before dying of starvation.\n\nYou use [color=${Const.UI.Color.PositiveValue}]"
                                            },
                                            {
                                                "t":  "[/color] の食糧を使用する。君の食糧[color=${Const.UI.Color.PositiveValue}]",
                                                "b":  "[/color] provisions per day. Your [color=${Const.UI.Color.PositiveValue}]"
                                            },
                                            {
                                                "t":  "[/color] は最大で [color=${Const.UI.Color.PositiveValue}]",
                                                "b":  "[/color] provisions will last you for [color=${Const.UI.Color.PositiveValue}]"
                                            },
                                            {
                                                "t":  "[/color] 日間持つ。個々の食糧は時間が経つにつれて悪くなっていくことを忘れずに！",
                                                "b":  "[/color] more days at most. Keep in mind that individual provisions will eventually turn bad!"
                                            },
                                            {
                                                "t":  "[/color] の食糧を使用する。\n\n[color=${Const.UI.Color.NegativeValue}]部下を養うための食糧がほとんどない！新たな食糧を出来るだけ早く購入しないと、部下が飢える前に一人また一人君を見捨ててしまう！[/color]",
                                                "b":  "[/color] provisions per day.\n\n[color=${Const.UI.Color.NegativeValue}]You are almost out of provisions to feed your men! Buy new provisions as fast as possible or your men will desert you one by one before they starve![/color]"
                                            },
                                            {
                                                "t":  "[/color] の食糧を使用する。\n\n[color=${Const.UI.Color.NegativeValue}]部下を養うための食糧がもうない！新しい食糧を出来るだけ早く購入しないと、部下が飢える前に一人また一人君を見捨ててしまう！[/color]",
                                                "b":  "[/color] provisions per day.\n\n[color=${Const.UI.Color.NegativeValue}]You have no more provisions to feed your men! Buy new provisions as fast as possible or your men will desert you one by one before they starve![/color]"
                                            }
                                        ],
                       "text":  "食糧"
                   },
   "dlc_6":  {
                 "options":  [
                                 {
                                     "t":  "ストアページをブラウザーで開く",
                                     "b":  "Open store page in browser"
                                 }
                             ],
                 "descriptions":  [
                                      {
                                          "t":  "Blazing Deserts DLCは、中世のアラビアとペルシャの文化に触発された新しい砂漠地域を南方に追加する。聖戦を含む新しいゲーム後半の危機、傭兵団をカスタマイズできる非戦闘員の従者、錬金術のシステムや原始的な銃器、新しい人間と獣の敵、新しい契約とイベント等。",
                                          "b":  "The Blazing Deserts DLC adds a new desert region to the south inspired by medieval Arabic and Persian cultures, a new late game crisis involving a holy war, a retinue of non-combat followers with which to customize your company, alchemical contraptions and primitive firearms, new human and beastly opponents, new contracts and events, and more."
                                      }
                                  ],
                 "text":  "Blazing Deserts"
             },
   "effects.sleeping":  {
                            "descriptions":  [
                                                 {
                                                     "t":  "このキャラクターは不自然な眠りに落ち、行動することができない。 彼らは[color=${Const.UI.Color.NegativeValue}]",
                                                     "b":  "This character has fallen into unnatural sleep and is unable to act. They\u0027ll wake up after [color=${Const.UI.Color.NegativeValue}]"
                                                 },
                                                 {
                                                     "t":  "[/color]以上のターン後に目覚めるが、味方によって強制的に目覚めさせることもでき、どんな量のダメージを受けても目覚める。\n\nキャラクターの決意が高ければ高いほど、眠りたいという衝動に抵抗する可能性が高くなる。",
                                                     "b":  "[/color] more turn(s), but can also be forcibly awoken by allies and will wake up when taking any amount of damage.\n\nThe higher a character\u0027s resolve, the higher the chance to resist the urge to sleep."
                                                 }
                                             ],
                            "text":  "睡眠"
                        },
   "effects.distracted":  {
                              "descriptions":  [
                                                   {
                                                       "t":  "このキャラクターは、卑劣な企みの影響を受けている。 [color=${Const.UI.Color.NegativeValue}]",
                                                       "b":  "This character was on the receiving end of a dirty trick. Distracted for [color=${Const.UI.Color.NegativeValue}]"
                                                   },
                                                   {
                                                       "t":  "[/color]ターンの間気が散らされ、反応が遅くなり、正確に打撃を与えることが難しくなる。",
                                                       "b":  "[/color] more turn(s), they are slower to react and have a harder time landing clean strikes."
                                                   }
                                               ],
                              "text":  "気が散る"
                          },
   "effects.disarmed":  {
                            "descriptions":  [
                                                 {
                                                     "t":  "このキャラクターは[color=${Const.UI.Color.NegativeValue}] ",
                                                     "b":  "This character has been temporarily disarmed for [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] more turn(s) and is unable to use any weapon skills. Switching to a different weapon will remove this effect immediately."
                                                 },
                                                 {
                                                     "t":  "[/color]ターンの間一時的に武装解除されており、武器スキルを使用できない。 別の武器に切り替えると、この効果はすぐに削除される。",
                                                     "b":  "[/color] more turn(s) and is unable to use any weapon skills. Switching to a different weapon will remove this effect immediately."
                                                 }
                                             ],
                            "text":  "武装解除"
                        },
   "tactical-screen.topbar.options-bar-module.FleeButton":  {
                                                                "options":  [
                                                                                {
                                                                                    "t":  "この特別な戦いから撤退することはできない",
                                                                                    "b":  "You cannot retreat from this particular fight"
                                                                                }
                                                                            ],
                                                                "descriptions":  [
                                                                                     {
                                                                                         "t":  "戦闘から撤退し、君の生命のために逃げる。ここで無意味に死ぬよりも、別の日に戦う方がいい。",
                                                                                         "b":  "Retreat from combat and run for your lives. Better to fight another day than to die here pointlessly."
                                                                                     }
                                                                                 ],
                                                                "text":  "戦闘からの撤退"
                                                            },
   "effects.whipped":  {
                           "descriptions":  [
                                                {
                                                    "t":  "このキャラクターは、主人のために何をすべきかを思い知らされ、傷ついた。 それはあと",
                                                    "b":  "This character just received a hurtful reminder of what they need to do for their masters. It will last for another"
                                                },
                                                {
                                                    "t":  "ラウンド続く。",
                                                    "b":  "round(s)."
                                                }
                                            ],
                           "text":  "鞭打たれた"
                       },
   "assets.Medicine":  {
                           "descriptions":  [
                                                {
                                                    "t":  "医療用品は包帯、薬草、軟膏などで構成され、戦闘中に部下が負った重傷の治療に使用される。負傷が改善され、最終的に治癒するためには、毎日1ポイントの医療用品が必要。\n\n医療用品が不足すると、部下が重傷を負っても回復できなくなる。",
                                                    "b":  "Medical supplies consist of bandages, herbs, salves and the like, and are used to heal the more severe injuries sustained by your men in battle. One point of medical supplies is required each day for every injury to improve and ultimately heal. Lost hitpoints heal on their own.\n\nRunning out of medical supplies will leave your men unable to recover from severe injuries."
                                                },
                                                {
                                                    "t":  "\n\n団員の回復には [color=${Const.UI.Color.PositiveValue}]",
                                                    "b":  "\n\nHealing up all your men will take between [color=${Const.UI.Color.PositiveValue}]"
                                                },
                                                {
                                                    "t":  "[/color] から [color=${Const.UI.Color.PositiveValue}]",
                                                    "b":  "[/color] and [color=${Const.UI.Color.PositiveValue}]"
                                                },
                                                {
                                                    "t":  "[/color] 日かかり、 ",
                                                    "b":  "[/color] days and requires between "
                                                },
                                                {
                                                    "t":  "[color=${Const.UI.Color.PositiveValue}]",
                                                    "b":  "[color=${Const.UI.Color.PositiveValue}]"
                                                },
                                                {
                                                    "t":  "[color=${Const.UI.Color.NegativeValue}]",
                                                    "b":  "[color=${Const.UI.Color.NegativeValue}]"
                                                },
                                                {
                                                    "t":  "[/color] から ",
                                                    "b":  "[/color] and "
                                                },
                                                {
                                                    "t":  "[color=${Const.UI.Color.PositiveValue}]",
                                                    "b":  "[color=${Const.UI.Color.PositiveValue}]"
                                                },
                                                {
                                                    "t":  "[color=${Const.UI.Color.NegativeValue}]",
                                                    "b":  "[color=${Const.UI.Color.NegativeValue}]"
                                                },
                                                {
                                                    "t":  "[/color] の医療用品が必要。",
                                                    "b":  "[/color] Medical Supplies."
                                                },
                                                {
                                                    "t":  "君は最大",
                                                    "b":  "You can carry "
                                                },
                                                {
                                                    "t":  "個を携行可能。",
                                                    "b":  "units at most."
                                                }
                                            ],
                           "text":  "医療用品"
                       },
   "effects.insect_swarm":  {
                                "descriptions":  [
                                                     {
                                                         "t":  "千匹もの黒いハエがこのキャラクターの周りを飛び回り、鎧の小さな隙間にも、体のあらゆる開口部にも入り込もうとする。 この恐ろしい呪いは[color=${Const.UI.Color.NegativeValue}]",
                                                         "b":  "A thousand black flies buzz around this character, trying to crawl into every small opening of armor, into every orifice of the body. A terrible curse that makes it nigh impossible to fight for [color=${Const.UI.Color.NegativeValue}]"
                                                     },
                                                     {
                                                         "t":  "[/color]ターンの間戦うことをほぼ不可能にする。",
                                                         "b":  "[/color] more turn(s)."
                                                     }
                                                 ],
                                "text":  "虫の群れ"
                            },
   "effects.chilled":  {
                           "descriptions":  [
                                                {
                                                    "t":  "このキャラクターは寒さで骨の髄まで冷え切っている。手足が凍りつき、協調して動くには大変な努力が必要。 効果は[color=${Const.UI.Color.NegativeValue}]",
                                                    "b":  "This character has been chilled to the bone by cold. With their limbs frozen stiff, it takes a great deal of effort to move in a coordinated fashion. The effect will slowly wear off over [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] more turn(s)."
                                                },
                                                {
                                                    "t":  "[/color]ターンでゆっくりと消えていく。",
                                                    "b":  "[/color] more turn(s)."
                                                }
                                            ],
                           "text":  "凍えている"
                       },
   "effects.stunned":  {
                           "descriptions":  [
                                                {
                                                    "t":  "このキャラクターは、[color=${Const.UI.Color.NegativeValue}] ",
                                                    "b":  "This character is stunned or otherwise incapacitated for [color=${Const.UI.Color.NegativeValue}]"
                                                },
                                                {
                                                    "t":  "[/color]ターンの間、気絶させられたか無力化され、行動することができない。",
                                                    "b":  "[/color] more turn(s), and unable to act."
                                                }
                                            ],
                           "text":  "気絶"
                       },
   "world-campfire-screen.Cart":  {
                                      "descriptions":  [
                                                           {
                                                               "t":  "傭兵団はたくさんの装備や物資を運ばなければならない。荷車や馬車を使用することで、利用可能な在庫スペースを拡大し、さらに多くの荷物を運ぶことができる。",
                                                               "b":  "A mercenary company has to carry a lot of equipment and supplies. By using carts and wagons, you can expand your available inventory space and carry even more."
                                                           }
                                                       ],
                                      "texts":  [
                                                    {
                                                        "t":  "のために [img]gfx/ui/tooltips/money.png[/img]",
                                                        "b":  "for [img]gfx/ui/tooltips/money.png[/img]"
                                                    }
                                                ]
                                  },
   "effects.goblin_poison":  {
                                 "descriptions":  [
                                                      {
                                                          "t":  "このキャラクターには毒が流れている。視界はぼやけ、話し方は不明瞭で、協調して動くには多大な努力を要する。 効果は[color=${Const.UI.Color.NegativeValue}]",
                                                          "b":  "This character has poison running through his veins. His vision is blurred, his speech slurred and it takes a great deal of effort for him to move in a coordinated fashion. The effect will slowly wear off over [color=${Const.UI.Color.NegativeValue}]"
                                                      },
                                                      {
                                                          "t":  "[/color]ターンの間にゆっくりと消えていく。",
                                                          "b":  "[/color] more turn(s)."
                                                      }
                                                  ],
                                 "text":  "中毒"
                             },
   "effects.acid":  {
                        "descriptions":  [
                                             {
                                                 "t":  "このキャラクターの鎧にはリンドヴルムの酸性の血が吹き付けられており、残り[color=${Const.UI.Color.NegativeValue}]",
                                                 "b":  "This character\u0027s armor has been sprayed with a Lindwurm\u0027s acidic blood, which is now slowly eating away at it for another [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] turn(s)."
                                             },
                                             {
                                                 "t":  "[/color]ターンの間徐々に溶けていく。",
                                                 "b":  "This character\u0027s armor has been sprayed with a Lindwurm\u0027s acidic blood, which is now slowly eating away at it for another [color=${Const.UI.Color.NegativeValue}]${m.TurnsLeft}[/color] turn(s)."
                                             }
                                         ],
                        "text":  "酸を被る"
                    },
   "dlc_2":  {
                 "options":  [
                                 {
                                     "t":  "ストアページをブラウザーで開く",
                                     "b":  "Open store page in browser"
                                 }
                             ],
                 "descriptions":  [
                                      {
                                          "t":  "Beasts＆Exploration DLCは、荒野を徘徊する様々な新しい獣、トロフィーからアイテムを作成する新しいクラフトシステム、ユニークな報酬を発見できる伝説的な場所、多くの新しい契約とイベント、鎧のアタッチメントの新しいシステム、新しい武器、防具、使用可能なアイテム等が追加される。",
                                          "b":  "The Beasts \u0026 Exploration DLC adds a variety of new beasts roaming the wilds, a new crafting system to create items from trophies, legendary locations with unique rewards to discover, many new contracts and events, a new system of armor attachments, new weapons, armor and usable items, and more."
                                      }
                                  ],
                 "text":  "Beasts \u0026 Exploration"
             },
   "effects.bleeding":  {
                            "descriptions":  [
                                                 {
                                                     "t":  "このキャラクターは最近受けた傷から大量に出血しており、毎ターン[color=${Const.UI.Color.NegativeValue}]",
                                                     "b":  "This character is bleeding profusely from a recently received wound and will lose [color=${Const.UI.Color.NegativeValue}]"
                                                 },
                                                 {
                                                     "t":  "[/color]ヒットポイントを、[color=${Const.UI.Color.NegativeValue}]",
                                                     "b":  "[/color] hitpoints each turn for [color=${Const.UI.Color.NegativeValue}]"
                                                 },
                                                 {
                                                     "t":  "[/color]ターンの間失い続ける。",
                                                     "b":  "[/color] more turn(s)."
                                                 }
                                             ],
                            "text":  "出血"
                        },
   "dlc_4":  {
                 "options":  [
                                 {
                                     "t":  "ストアページをブラウザーで開く",
                                     "b":  "Open store page in browser"
                                 }
                             ],
                 "descriptions":  [
                                      {
                                          "t":  "Warriors of the North DLCは、独自の戦闘スタイルと装備を持つ新たな人間の派閥、北方蛮族が追加され、傭兵団のためのさまざまなスタートシナリオ、北欧とロシアにインスパイアされた新たな装備、そして新たな契約とイベントが追加される。",
                                          "b":  "The Warriors of the North DLC adds a new human faction of northern barbarians with their own fighting style and equipment, different starting scenarios for your company, new nordic and rus inspired equipment, as well as new contracts and events."
                                      }
                                  ],
                 "text":  "Warriors of the North"
             },
   "assets.Ambition":  {
                           "texts":  [
                                         {
                                             "t":  "野望",
                                             "b":  "Ambition"
                                         }
                                     ],
                           "options":  [
                                           {
                                               "t":  "野望をキャンセルする",
                                               "b":  "Cancel Ambition"
                                           }
                                       ],
                           "descriptions":  [
                                                {
                                                    "t":  "君は傭兵団が追求する野望を表明していない。ゲームが進むにつれ、そうするよう求められる。",
                                                    "b":  "You have not announced any ambition for your company to pursue. You\u0027ll be asked to do so as the game progresses."
                                                }
                                            ]
                       }
};