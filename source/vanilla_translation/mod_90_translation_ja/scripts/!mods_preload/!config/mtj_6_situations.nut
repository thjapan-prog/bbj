local gt = this.getroottable();
gt.translation.situations<-{};
local t=gt.translation.situations;
t["situation.razed"]<-{name="壊滅状態",
description="この場所は破壊された。住民の多くは殺され、貴重品は略奪された。",
addstring="%_s%は破壊された",
removestring="%_s%は%name%ではなくなった"
,rumors= [{b="Smoke columns can be seen from miles and miles away. There is naught more than a burning pile of rubble where %settlement% once stood.",t="煙の柱は何マイルも離れたところから見ることができるんだ。かつて%settlement%があった場所には、燃え盛る瓦礫の山しかない。"},
        {b="Floods of refugees have been arriving from %settlement%. They claim that most of it has been burned to the ground! Can this be true?",t="%settlement%から難民が殺到してる。そのほとんどが焼失してしまったって言うんだ！本当なのかね？"},
        {b="%settlement% is no more, just a black charred skeleton smoking and smoldering... How did it come to this?",t="%settlement%はもはやなく、黒焦げの骸骨が煙を上げてくすぶっているだけなんだと...どうしてこうなった？"}]
};
t["situation.witch_burnings"]<-{name="魔女狩り",
description="燃えるような光景、魔女の火あぶりは観客を魅了し、観客は屋台を魅了する。そして、町にはたくさんの魔女狩りがいるはずだ...",
addstring="%_s%で%name%が発生している",
removestring="%_s%の%name%は終了した"
,rumors= [{b="Some witch hunters came by yesterday. They didn't find what they were looking for and headed on to %settlement%.",t="昨日までに何人かの魔女狩りがやってきた。 彼らは探しているものを見つけられず、%settlement%に向かった。"},
        {b="From what I hear they found a witch in %settlement% and will put her to the pyre. Come to think of it, maybe I should report that old shrew that bested me on the market the other day, she's a witch for sure!",t="聞いたところによると、彼らは%settlement%で魔女を見つけ、火葬にするつもりらしい。そういえば、この間市場で俺を打ち負かしたジジイも報告する必要があるかもしれないな、アイツは確かに魔女だ！"}]
};
t["situation.disappearing_villagers"]<-{name="村人の消失",
description="村人たちはこの町から姿を消し、誰もが苦しんでいる。 路上で見つけられる可能性のある新兵は少なくなり、人々は見知らぬ人とあまり好意的に取引しない。",
addstring="%_s%で%name%が発生している",
removestring="%_s%はもう%name%はない"
,rumors= [{b="I just cancelled my visit to %settlement% after I heard that people go missing over there. Staying out of trouble served me well so far!",t="あそこで行方不明になっている人がいると聞いた後、%settlement%への訪問を取りやめたよ。トラブルに巻き込まれないようにすることが、今のところ自分の役に立ってる！"},
        {b="Me neighbour %randomname% went to %settlement% 'bout a week ago. Haven't heard a word of him since. I just hope nothing happened to him, you know, with them brigands and monsters and all roaming 'bout...",t="隣に住んでる%randomname%は1週間前に%settlement%に行った。 それ以来、彼の声を聞いてない。 彼に何も起こらなかったことを願っているが、アンタも知っているだろう、山賊や怪物達が辺りを彷徨いているからな..."},
        {b="The forces of evil are strong in this world. They hide in the woods, and in the mountains, and in the shadows, and sometimes folk just disappear without a trace. It's happening again right now over in %settlement%.",t="この世は悪の力が強い。 彼らは森の中、山の中、そして影の中に隠れ、時には人々は跡形もなく消えてしまう。 それは%settlement%で今再び起こっている。"}]
};
t["situation.unhold_attacks"]<-{name="アンホールドの攻撃",
description="この地域では、大規模なアンホールドが見聞きされている。 町民は集落の近くを離れることを恐れている。",
addstring="%_s%で%name%が発生している",
removestring="%_s%の%name%は解消した"
,rumors= [{b="A traveling merchant told me about giant footprints near the road from %settlement%. Sure as hell would not want to meet whatever beast left those!",t="旅商人から、%settlement%からの道近くに巨大な足跡があると聞いた。確かに、どんな獣がそれを残したにせよ、会いたくはないだろうよ！"},
        {b="When I was in %settlement% the other day, a group of hunters went missing. They were after some sort of giant...",t="先日%settlement%にいたとき、狩人のグループが行方不明になった。 彼らはある種の巨人を追っていたんだが..."},
        {b="Ever heard of unholds? Huge monsters that stomp whole carts under a foot! I heard rumors of sightings near %settlement%.",t="アンホールドについて聞いたことがあるか？ 荷車を足で踏み潰す巨大な怪物だ！ %settlement%の近くで目撃されたって噂を聞いたぜ。"}]
};
t["situation.short_on_food"]<-{name="食糧不足",
description="最近の出来事により、この場所は食料が不足している。 人々は飢餓の危機に瀕しているため、食料を手に入れるのは難しく、価格も上昇している。",
addstring="%_s%は%name%だ",
removestring="%_s%は%name%ではなくなった"
,rumors= [{b="The men and women in %settlement% are starving, I heard, with nothing but dirt to eat. I don't think I'll ever complain about my mouldy grain soup again!",t="%settlement%の男も女も飢えていて、土しか食べるものがないと聞いた。ウチのカビの生えた穀物のスープに文句を言うことはもうないだろうさ！"},
        {b="Some farmer just arrived today from %settlement%. Told stories of slain cattle, burned fields and empty larders. Looked like a damn walking skeleton himself!",t="ある農夫が今日%settlement%からやって来た。殺された牛、焼かれた畑、空の食料庫の話をしてたよ。ヤツはまるで歩く骸骨みたいだったぜ！"}]
};
t["situation.ambushed_trade_routes"]<-{name="交易路の待ち伏せ",
description="近頃ここに通じる道路は安全ではなく、多くの隊商が待ち伏せされ略奪されている。交易がほとんど成功していないため、商品の選択は少なく、価格は高くなっている。",
addstring="%_s%で%name%が発生している",
removestring="%_s%はもう%name%はない"
,rumors= [{b="Brigands and raiders are the bane of us traveling merchants! An old friend of mine got ambushed, robbed and beaten just outside of %settlement%!",t="山賊や略奪者は我々旅商人の悩みの種です！ 私の旧友は%settlement%のすぐ外で待ち伏せされ、強盗に襲われ、殴られました！"},
        {b="If you have any valuables on you, stay away from %settlement%. The place is scourged by cutthroats, bandits and highwaymen!",t="貴重な品を持っているなら、%settlement%には近づくな。その場所は、切裂魔、盗賊、そして追い剥ぎ共に襲われているからな！"},
        {b="The guardsmen are doing what they can, but these brigands just move on to the next town and waylay traders on the road. They're said to lurk around %settlement% now!",t="衛兵達はできる限りのことをしているが、山賊共はただ次の町に移動するだけで、道中の商人達を待ち伏せしてる。 奴らは今%settlement%辺りに潜んでいるらしいぞ！"}]
};
t["situation.high_spirits"]<-{name="意気揚々",
description="ここは活気があり、人々は貴方と商売をしたいと思っている。",
addstring="%_s%は%name%だ",
removestring="%_s%はもう%name%ではない"
,rumors= [{b="I arrived from %settlement% today, my clothes are still dusty from the road. The folks over there surely were in a good mood, not quite sure why though...",t="私は今日%settlement%から到着しました、私の服はまだ道路のせいで埃っぽいです。 あそこの人たちは確かに機嫌が良かったのですが、なぜかはよくわかりませんね..."},
        {b="No need to get me a mug, I am still drunk from the celebrations in %settlement%. They sure know how to have a good time!",t= "ジョッキを用意する必要はねえよ、まだ%settlement%のお祝いで酔っ払ってるからな。 あいつらは確かに楽しい時間を過ごす方法を知ってるぜ！"},
        {b="Rumor has it that the townsfolk of %settlement% just got an important relic back.",t="噂によると%settlement%の町の人々が重要な遺物を取り戻したばかりらしい。"}]
};
t["situation.slave_revolt"]<-{name="奴隷の反乱",
description="お世話になっている、都市国家の奴隷階級は、武器を手に取り主人達に立ち向かった！お世話になっているのは難しいですし、武器や防具は市場から一掃されている。",
addstring="%_s%で%name%が発生している",
removestring="%_s%の%name%は解消した"
,rumors= [{b="The slaves over at %settlement% took up arms and turned to banditry and waylaying. Unsullied or whatever they call them, I mean. There is surely some work to be done for a mercenary like you.",t="%settlement%にいた奴隷達は武器を手に取り、盗賊行為や道楽に走った。アンサリード(貶められていない)とか何とか呼ばれる連中さ。 アンタのような傭兵にはきっとやるべき仕事があるはずだぜ。"},
        {b="Word has made it here that the slaves at %settlement% are rebelling. A proper revolt could topple their whole city, and I hope it does.",t="%settlement%の奴隷達が反乱を起こしたという情報が入ってきた。 ちゃんとした反乱が起これば街全体が転覆するかもしれない、そうなることを願ってるがね。"}]
};
t["situation.raided"]<-{name="襲撃",
description="この場所は最近襲撃された！ 被害を受け、貴重な品物や物資を失い、命をも失った。",
addstring="%_s%で%name%が発生している",
removestring="%_s%はもう%name%されていない"
,rumors= [{b="You one of them raiders? Sure look and smell like one! Your men pillage %settlement%? Get out of here, I says, we don't want your kind around!",t="アンタは襲撃者の一人か？見た目も匂いも確かに同じだ！ アンタの部下が%settlement%で略奪をしたのか？ここから出て行け、お前らみたいなのはお断りだと言ってるんだ！"},
        {b="Folks' arrivin' from %settlement%, sayin' it's been raided and plundered right good. Poor sobs, but what're we to do? Ain't got much ourselves. It's up to the lord to protect them!",t="%settlement%から人々がやって来て、襲撃され略奪されたと言ってる。かわいそうに、だがどうすればいいんだ？俺たちには何も出来ない。彼等を守るのは領主次第だ！"},
        {b="These are dangerous times indeed, sellsword. I just got word that %settlement% was plundered and raided not two nights past.",t="今は本当に危険な時代だな、売剣さん。 %settlement%が2夜前に略奪され、襲撃されたという知らせを受けたばかりだ。"}]
};
t["situation.warehouse_burned_down"]<-{name="倉庫の全焼",
description="最近起こった倉庫火災は重大な被害を引き起こした。 火事で燃え残ったものは今では高値で売られている。",
addstring="%_s%で%name%が発生した",
removestring="%_s%の%name%は解消した"
,rumors= [{b="Seen the smoke on the horizon last night? They say it was the big warehouse in %settlement% burning down to the ground.",t="昨夜、地平線に煙が見えただろう？%settlement%の大倉庫が焼け落ちたらしい。"},
        {b="I heard they caught the arsonist lighting the warehouse up in %settlement%. Hanged him from a tree right then and now, but it'll take them a lot longer to build up the warehouse again.",t="%settlement%で倉庫に火を放った放火犯が捕まったそうだ。そいつはすぐにでも木に吊るせばいいが、倉庫を再建するにはもっと時間がかかる。"}]
};
t["situation.arena_tournament"]<-{name="トーナメント",
description="大規模トーナメントが闘技場で開催される。 参加して豪華賞品を獲得せよ！",
addstring="%_s%で%name%が行われている",
removestring="%_s%はもう%name%は行われていない"
,rumors= [{b="You look like an able fighter. The arena in %settlement% is hosting a tournament and you can surely still enter!",t="アンタは有能な戦士のように見えるな。%settlement%の闘技場でトーナメントを開催してるんだが、まだ参加出来るはずだぜ！"},
        {b="After this drink I will head straight out towards %settlement% to watch the great arena tournament! Best entertainment all year!",t="この一杯を飲み終わったらそのまま%settlement%に向かって、素晴らしいアリーナトーナメントを観戦するつもりさ！ 今年最高のエンターテインメントだよ！"},
        {b="I heard the prize for the arena tournament winner in %settlement% is even more marvelous this year!",t="%settlement%のアリーナトーナメント優勝者への賞品は、今年はさらに素晴らしいものだと聞いたぞ！"}]
};
t["situation.rebuilding_effort"]<-{name="再建への取り組み",
description="近くの拠点を再建するため、建築材料は需要が高く供給が少ない。"
,rumors= [{b="Finally they're starting to rebuild around %settlement%. That place was in ruins for long enough.",t="ようやく%settlement%周辺を再建し始めている。 あそこは随分長い間廃墟だったからな。"},
        {b="I heard they're bringing in wood to %settlement% with wagons now. The new Burgomeister is surely trying to fix things up over there.",t="今彼等は、馬車で%settlement%に木材を運び込んでいると聞いたよ。 新町長はきっとあそこで事態を収拾しようとしているんだろうな。"}]
};
t["situation.moving_sands"]<-{name="移動砂",
description="街の周辺には、特に大きな蛇が群がっている。交易が難しく、商品はより希少で高価になっている。",
addstring="%_s%で%name%が発生している",
removestring="%_s%にはもう%name%はない"
,rumors= [{b="Word is that traders on the road to %settlement% have been swallowed whole by shifting sands. But who believes nonsense like that?",t="%settlement%への道を進んでいた商人達が、移動砂に丸ごと飲み込まれたということらしい。だが、誰がそんな戯言を信じるってんだ？"},
        {b="You afraid of snakes? A lot have been seen near %settlement% lately, some as long as my arm, some as long as a whole trader's wagon!",t="アンタはヘビが怖いかい？ 最近、%settlement%近くでわんさか見かけるらしいぜ。俺の腕の長さみたいなのもいれば、商人の荷車の長さみたいなのもいるんだと！"}]
};
t["situation.seasonal_fair"]<-{name="季節市",
description="季節市のため、遠くから商人達がここに集まる。 周辺の田園地帯からたくさんの人が集まるため、品物を売ったり、たくさんの物を売ったりする絶好の機会だ。"
,rumors= [{b="What's going on around here you're asking? Well, there's a fair over in %settlement%. Merchants from far and wide gather to offer their wares.",t="このあたりで何が起こっているのか聞きたいんだろう？ああ、%settlement%で季節市が開かれてるのさ。 遠くから商人達が集まって商品を売ってるよ。"},
        {b="Me, I am more of the solitary type. Big fairs like the one over in %settlement% just don't appeal to me at all....",t="私、私はどちらかと言うと孤独なタイプなんだよ。 %settlement%で開かれるような大きな市は、私にとっては全く魅力的じゃない…."}]
};
t["situation.public_executions"]<-{name="公開処刑",
description="公開処刑は見逃せない。家族全員に娯楽を提供する。 そのような機会には食べ物や飲み物が豊富だが、商人も観客を利用しようとするかもしれない。",
addstring="%_s%で%name%が行われている",
removestring="%_s%の%name%は終了した"
,rumors= [{b="A whole bunch of folks is headin' over to %settlement% for the big spectacle! Men, womenfolk, young ones, all on the road to see the upcoming executions!",t="大勢の人々が大スペクタクルのために%settlement%に向かってる！ 男も女も若者も、皆今度の処刑を見に行くんだ！"},
        {b="I heard they grabbed some brigands near %settlement% and are putting them to the chopping block. Serves them just right, waylaying poor folk on the roads...",t="%settlement%の近くで山賊達を捕まえて、もの切り台に載せてると聞いたぜ。 道で貧しい人々を待ち伏せしてたんだから、いい気味だな..."},
        {b="Us poor folks don't have much to enjoy these days, but a good hanging is always welcome. Hasn't been one here since autumn, but they is hanging folk over at %settlement% is what %randomname% tells me.",t="私たち貧乏人には近頃楽しみが少ないが、首吊りはいつでも大歓迎だ。秋以来ここには来てないが、%settlement%にぶら下がってる連中がいるって%randomname%から聞いたよ。"}]
};
t["situation.mirage_sightings"]<-{name="蜃気楼",
description="ひび割れた熱とちらつきのある空気は、多くの蜃気楼を引き起こし、奇妙な人物がその中でシャッフルしていると報告されています。 ",
addstring="%_s%で%name%が発生している",
removestring="%_s%にはもう%name%はない"
,rumors= [{b="I tell you, a wonderous lush oasis, golden roofs flimmering in the distance, rainbow colored birds ahead! Where I saw that? Well, it was on the road to %settlement%. I swear!",t="素晴らしい緑豊かなオアシス、遠くに煌めく金色の屋根、前方には虹色の鳥達！ どこで見たかって？ あぁ、そりゃ%settlement%への道の途中だ。誓うよ！"},
        {b="Some evils do not come in the dark of the night or hide in the shadows. They come out in the scorching sun, during the mid of day. Head on to %settlement% if you want to find out what I am talking about.",t="ある種の悪は夜の暗闇に現れたり、影に隠れたりはしない。 奴等は日中、灼熱の太陽の下に出てくるんだ。 何を言ってるのか知りたければ、%settlement%に行ってみるといい。"},
        {b="Mirages can be seen occasionally in the deserts, and following them can lead to a fate way worse than getting lost in the desert.",t="蜃気楼は砂漠で時折見られるが、それを追えば砂漠で迷子になるよりも悪い運命を辿ることになる。"}]
};
t["situation.abducted_children"]<-{name="子供達の誘拐",
description="子供達がこの集落から姿を消している。 不信と恐れが通りを支配し、ゆっくりとコミュニティを蝕んでいる。",
addstring="%_s%で%name%が発生している",
removestring="%_s%はもう%name%はない"
,rumors= [{b="Rumor is that children disappear from their cribs in %settlement% into thin air. Imagine the parents' terror...",t="噂によると、子供達は%settlement%のベビーベッドから薄い空気の中に姿を消すらしい。 両親の恐怖を想像してみろ..."},
        {b="My grandma told me a story about witches abducting children for their innocent blood. And now in %settlement%, kids have gone missing just like in the stories.",t="祖母は、魔女が罪のない血を求めて子供達を誘拐するという話をしてくれた。 そして今、%settlement%では、物語のように子供達が行方不明になっている。"},
        {b="Never ever strike a deal with witches! A relative in %settlement% did it years ago and now his kid is gone missing.",t="魔女とは決して取引をしてはいけない！ %settlement%に住む親戚が何年も前にそれをやって、今彼の子供が行方不明になっている。"}]
};
t["situation.rich_veins"]<-{name="豊富な鉱脈",
description="幸運な鉱夫の何人かが特に豊かな鉱脈を見つけた！ 鉱物や金属の抽出は、枯渇するまで大幅に増加するが、集落でも価格が高騰する。",
addstring="%_s%に%name%がある",
removestring="%_s%にはもう%name%はない"
,rumors= [{b="They struck a mother lode over in %settlement%. I myself worked the mines for decades, too, and all I got to show for it is a bad cough.",t="あいつらは%settlement%で鉱脈を掘り当てたんだ。 俺自身も何十年も鉱山で働いていたんだが、それで得たのはひどい咳だけだよ。"},
        {b="Those lucky bastards in %settlement% have found a new vein in the mine. Caravans can't come fast enough now with what they're shoveling up.",t="%settlement%の幸運な野郎共は、鉱山で新しい鉱脈を見つけたのさ。キャラバンがなかなか来ないんだ、掘り出した鉱物でいっぱいでね。"},
        {b="I hear that the mines in %settlement% are awfully productive these days. Not a bad way to make some coin if you're in the trading business.",t="最近%settlement%の鉱山はとても生産的だと聞いてるよ。アンタが交易商売をしてるなら、小銭を稼ぐには悪くない。"}]
};
t["situation.hunting_season"]<-{name="狩猟シーズン",
description="森は鹿でにぎわっており、狩猟シーズンである。鹿肉と毛皮は豊富に供給されている。",
addstring="%_s%は%name%だ",
removestring="%_s%はもう%name%ではない"
,rumors= [{b="Do you like venison, sellsword? And how about your men? I heard that hunting season has started in %settlement%. Just saying.",t="アンタは鹿肉が好きかい、売剣さん？ そして、アンタの部下はどうだい？ %settlement%で狩猟シーズンが始まったそうだ。言ってみただけだよ。"},
        {b="It's the time of the year that all hunters have been eagerly waiting for. The hunting season started around %settlement% just now!",t="全ての狩人が待ちに待っていた時期だ。%settlement%辺りの狩猟シーズンはちょうど今始まった！"},
        {b="Hunting outside the season might get you your hands cut right off! Doesn't matter, though, as the season will start any day now in the forests over by %settlement%.",t="シーズン外に狩猟をすれば両手を切り落とされるかもしれないぞ！とはいえ、%settlement%の向こうの森でシーズンが今にも始まるから問題じゃないな。"}]
};
t["situation.well_supplied"]<-{name="十分な供給",
description="ここには最近新鮮な品物が供給されており、それらの多くは今では適切な価格で購入することができる。",
addstring="%_s%は%name%がされている",
removestring="%_s%の%name%がなくなった"
,rumors= [{b="Trade with %settlement% is prospering, my friend! Safe roads and full stocks, let's hope it stays this way...",t="%settlement%との取引は順調だよ、友よ！ 安全な道路と完全な在庫、このままであることを祈るよ..."},
        {b="My cousin over in %settlement% keeps bragging about how good they have it there. Well stocked market stands and all. Not like this rotten place.",t="いとこが%settlement%にいるんだけど、そこがどんなにいいところかを自慢し続けてる。 品揃え豊富な屋台とかね。 この腐った場所とは違うよ。"}]
};
t["situation.refugees"]<-{name="難民",
description="戦争が激化する中、絶え間なく難民達がこの集落に流れ込んでいる。 それは地域経済に負担をかけるが、同時に仕事を提供できる人にとっては安く新規雇用が出来ることを意味する。",
addstring="%_s%で%name%が発生している",
removestring="%_s%にはもう%name%はいない"
,rumors= [{b="Come morning I'll head out to %settlement%. Word is a large group of refugees just arrived and I need more hands for my farm.",t="朝が来たら、%settlement%に向かうつもりだよ。難民の大群が到着したばかりで、ウチの農場にもっと人手が必要なんでね。"},
        {b="From what I've heard, %settlement% is flooded with refugees nowadays. Those cowards should have stayed and fought for their home, I'd say!",t="聞いたところによると、%settlement%は最近難民で溢れかえっているんだとさ。あの臆病者どもめ、自分らの故郷のために残って戦うべきだったんじゃねえかと思うがね！"},
        {b="The beggars, the downtrodden, the fugitives, they all have to go somewhere. A large group of them just arrived at %settlement% from what I heard.",t="物乞い、踏みにじられた人、逃亡者、誰も皆どこかに行かなきゃならん。聞いたところじゃ、彼らの大群が%settlement%に到着したばかりだ。"}]
};
t["situation.mustering_troops"]<-{name="軍隊の召集",
description="この集落での奉仕のために部隊への招集命令が出された。 装備や新兵は不足しているが、ここで武器や鎧を売ることで素早くクラウンを得ることができる。",
addstring="%_s%で%name%が発生している",
removestring="%_s%の%name%は終了した"
,rumors= [{b="Another damn noble is pressing younglings into a regiment at %settlement%. Ach, why am I even talking to you about this, sellsword? You are no better!",t="あっちのクソ貴族が%settlement%の連隊に若者を押し込んでやがる。 あン、なんで俺はこんな話をしてるんだろうな、売剣さん？ アンタも変わらんぜ！"},
        {b="If I were a merchant with a wagonload full of weapons and armor, I'd know just where to sell it all - they're mustering troops at %settlement% and will surely pay good coin. Alas, I'm neither a merchant nor do I have any weapons.",t="もし私が武器や防具を満載した荷馬車を持っている商人だったら、どこでそれを売るか知ってる - %settlement%で兵隊を集めてて、きっといい金になるだろう。残念ながら、私は商人じゃないし武器も持っていないけどね。"},
        {b="I'm just passing trough. Narrowly escaped from impressment at %settlement%. They wanted to force me to fight for some lord, but no thanks, I says, not gonna happen, and away I went. I'll strike my luck further down south.",t="私はただの通りすがりだ。 %settlement%での強制徴募からかろうじて逃げてきた。 彼らはどこかの領主のために戦わせたかったようだが、私は遠慮すると言って去ったんだ。運を掴むのはもっと南の方だ。"}]
};
t["situation.preparing_feast"]<-{name="饗宴の準備",
description="貴族達がごちそうの準備をしている。 料理人の家や台所は食料をまとめて買っている。",
addstring="%_s%で%name%が行われている",
removestring="%_s%の%name%は終了した"
,rumors= [{b="The oh-so-noble highborns are preparing a feast at %settlement% while us peasants have but old grain to choke on...",t="とっても高貴なご貴族サマ達が%settlement%でごちそうを準備してるってのに、我々農民は古い穀物しか口にできないよ..."},
        {b="My uncle is a servant at %settlement%, and he tells me that they're preparing a big feast. No point in going there unless you're invited, though.",t="私の叔父は%settlement%の使用人をしていて、大きなごちそうを準備していると教えてくれました。 招待されない限り、そこに行く意味はありませんが。"}]
};
t["situation.disbanded_troops"]<-{name="軍隊の解散",
description="地元の紛争が解決されたため、多くの徴兵された軍隊とその武器はもはや必要ない。 掘り出し物を手に入れたり、経験豊富な新しい人員を雇うのに良い時期である。",
addstring="%_s%で%name%が発生している",
removestring="%_s%ではもう%name%は終了した"
,rumors= [{b="Standing armies are expensive, my friend. I heard an entire regiment was disbanded at %settlement%. Surely there'll be some veteran fighters lingering there still, desperate for coin.",t="常備軍にはカネがかかるのさ、友よ。 %settlement%で連隊が解散したと聞いたよ。 まだそこに残っているベテランの戦士が何人かはいるはずだ、小銭を欲しがってる連中がね。"},
        {b="When I was young I used to be a soldier, and I liked it. Even the marching. But when my unit was disbanded I didn't know what the hell to do with myself. Now they're disbanding one of them regiments over at %settlement%, from what I hear.",t="若い頃は兵士だったんだ、それが好きだった。行進さえもな。だが、自分の部隊が解散させられたとき、一体どうすればいいのかわからなかったよ。聞くところによると、今%settlement%の連隊の1つを解散させているらしいね。"},
        {b="I'm concerned for my niece; an entire unit of soldiers got disbanded at %settlement%, right near where she lives. Things won't end well if those brutes don't find employment soon!",t="姪のことが心配なんだ。彼女が住んでいる場所のすぐ近くの%settlement%で兵士の部隊が解散させられたんだ。あの野蛮人どもがすぐに就職先を見つけなければ、物事はうまく終わらない！"}]
};
t["situation.terrified_villagers"]<-{name="怯える村人達",
description="ここの住民達は未知の恐怖を恐れている。 路上で見つけられる可能性のある新兵は少なくなり、人々は見知らぬ人とあまり好意的に取引しない。"
,rumors= [{b="The dead ain't really dead, sometimes they come back to haunt the living! Don't believe me? Just head over to %settlement% and see for yourself!",t="死者は本当に死んでいるわけではなく、時折生者を苦悩させるために戻ってくる！信じられない？ %settlement%に向かって、自分の目で確かめてみろ！"},
        {b="You look like an able swordsman! I heard rumors of the dead walking again near %settlement%. Humbug probably, but frightened folks often pay good crowns to feel safe again.",t="アンタは有能な剣士のように見えるな！ %settlement%の近くで死者が再び歩いているって噂を聞いたぞ。戯言かもしれんが、恐怖に怯えた人々はまた安心感を得るために高額なクラウンを払うだろうさ。"}]
};
t["situation.ceremonial_seasonn"]<-{name="儀式の時期",
description="儀式の時期には寺院で大量のお香が使われる。 お香の需要と価格はかつてないほど高い。",
addstring="%_s%は%name%である",
removestring="%_s%はもう%name%ではない"
,rumors= [{b="During this time of the year, the temples in %settlement% smoke like a hovel that's on fire! I wonder where they get all that incense from...",t="今年のこの時期、%settlement%の寺院は、火に包まれた小屋のように煙を出す。お香はどこから持ってくるんだろう…"},
        {b="If you are a godly person you might want to head to %settlement% to burn some incense and say some prayers.",t="もし貴方が敬虔なお人なら、%settlement%に行って、お香を焚いて、祈りを捧げたいと思うかもしれませんね。"}]
};
t["situation.conquered"]<-{name="征服",
description="ここは最近征服された。多くの命が失われ、生存者は戦利品を奪う征服者に耐えなければならなかった。 集落の多くはまだ被害を受けており、活気はない。"
,rumors= [{b="%settlement% was recently captured, or so I have heard. 'New Lords - same shit' is what I always say...",t="%settlement%は最近占領されたとか、そう聞いてるぞ。「新しい領主=同じクソ」がオレの口癖だがね..."},
        {b="Conquering new lands is the game of nobles. I heard they just sacked %settlement%.",t="新しい土地を征服することが貴族の遊びなんだ。彼らはちょうど%settlement%を略奪したと聞いたよ。"},
        {b="Oh, hey sellsword! Were you at the siege of %settlement%? Well, fucking congratulations. How many did you kill? How many did you rape? ",t="おぉ、なぁ売剣さんよ！ アンタ%settlement%の包囲戦にいたのかい？そいつぁ、クソおめでとうございますだな。何人殺した？何人強姦したんだ？"}]
};
t["situation.mine_cavein"]<-{name="鉱山の崩落",
description="悲劇的な事故が発生し、鉱山の1つで崩落があった。 被害が修復されるまで生産は停止し、鉱夫は家族を養う手段がない。",
addstring="%_s%で%name%が発生した",
removestring="%_s%は%name%の影響を受けなくなった"
,rumors= [{b="I'd never work underground, I am no stinkin' mole! It's a damn deathtrap! Not long ago a mine gave in by %settlement%, don't even want to know how many died that day...",t="オレは絶対に地下では働かねぇ、臭いモグラじゃねぇんだ！クソッタレの死の罠だ！少し前に%settlement%の鉱山が崩落したんだ、その日に何人死んだかなんて知りたくもねぇよ..."},
        {b="A delivery of ores and minerals from the mines of %settlement% was due today, but alas it did not arrive yet. Something must have happened over there.",t="%settlement%の鉱山からの鉱石と鉱物が今日届くはずだったんだが、残念ながらまだ届いてない。あそこで何かが起こったに違いないな。"},
        {b="Heard there was a cave-in on one of the mines at %settlement%. Just imagine being buried alive deep under rock and earth...",t="%settlement%の鉱山の1つで陥没事故があったと聞いたな。 岩と土の下に生き埋めになっているところを想像してみてくれよ..."}]
};
t["situation.sickness"]<-{name="病気",
description="ここでは、病気が多くの人々を襲った。 利用できる新兵は少なく、食料や医薬品は不足している。",
addstring="%_s%で%name%が発生している",
removestring="%_s%の%name%は解消した"
,rumors= [{b="Don't go near %settlement%! A sickness struck that poor town and the folks are dying like flies over there...",t="%settlement%には近づくなよ！貧しい町を病魔が襲って、人々がハエのように死んでいってる..."},
        {b="We had some folks coming here from %settlement%, but had to send them away at the gates. Everybody knows that a cruel disease is spreading in that cursed town.",t="%settlement%から何人か来ていたんだが、門前払いするしかなかったんだ。 あの呪われた町で残酷な病気が蔓延していることは誰もが知っているからな。"},
        {b="Fancy my herbal necklace? It protects me against even the most pestilent disease. You better get yourself one, too, if you're planning to ahead on towards %settlement%.",t="私のハーブネックレスはどうだい？どんな疫病からも守ってくれるよ。%settlement%に向けて進むつもりなら、君も1つ持っておくことをオススメするね。"}]
};
t["situation.besieged"]<-{name="包囲",
description="ここは、最近まで敵に包囲されていた。 被害を受け、物資も少なく、多くの人々が命を落としている。",
addstring="%_s%は%name%された",
removestring="%_s%は%name%されなくなった"
,rumors= [{b="Rocks and fire arrows flying, hot oil being poured, people starving and dying - that is a siege. You can head over to %settlement% and get a good close look yourself.",t="岩と火矢が飛び、熱い油が注がれ、人々は飢えて死ぬ-それが包囲だ。%settlement%に行って自分でよく見てみるといい。"},
        {b="When I was younger, I served in %randomnoble%'s army. The worst was a siege we partook in, it lasted for months. A shame that it is happening again right now in %settlement%.",t="私は若い頃、%randomnoble%の軍隊に所属していた。 最悪だったのは私たちが参加した包囲戦で、何ヶ月も続いたんだ。 %settlement%で今再び起こっているのは残念だよ。"},
        {b="Heard the word? %settlement% is under siege! Poor folks up in there will suffer a lot.",t="聞いたかい？ %settlement%が包囲されてるんだと！ そこにいる貧しい人々は多くの苦しみを味わうだろうな。"}]
};
t["situation.bread_and_games"]<-{name="パンとゲーム",
description="評議会は住民を幸せに保つために、誰もが食べ物や飲み物を手にでき、ゲームを楽しめるようにした。 食べ物や飲み物は簡単に手に入り、剣闘士が街に群がり、アリーナの戦いは通常よりも多くのお金を払っている。",
addstring="%_s%で%name%が行われている",
removestring="%_s%はもう%name%は行われていない"
,rumors= [{b="Praise the wise council of %settlement%! A time of food, drink and games is upon us!",t="%settlement%の賢明なる評議会を称賛せよ！ 食べ物、飲み物、ゲームの時間は我々のものだ！"},
        {b="Ever been to the famed games of the south? Head to %settlement% and see for yourself the glory of the festivities!",t="南方の有名なゲームに行ったことがあるかい？ %settlement%に向かい、祝祭の栄光を自分の目で確かめるといい！"},
        {b="All the hard work through the year and for what? I will tell you: Food, drink and games! I will head out to %settlement% to join in, and so should you.",t="この1年の苦労は何のためだったのか？教えてやろう、食べ物、飲み物、そしてゲームのためさ！参加するために%settlement%に向かうつもりなんだ、アンタもそうすべきだ。"}]
};
t["situation.sand_storm"]<-{name="砂嵐",
description="遠吠えする砂嵐が街を飲み込み、商人が安全に出入りするのを妨げている。 商品はますます希少になり、価格は高くなっている。",
addstring="%_s%は%name%に苦しんでいる",
removestring="%_s%は%name%の影響を受けなくなった"
,rumors= [{b="I just came back from %settlement%, barely made it out! A sandstorm has engulfed the whole city!",t="%settlement%から戻ってきたばかりなんだが、かろうじての脱出だった！砂嵐が街全体を飲み込んじまった！"},
        {b="It happened again, %settlement% has been engulfed in the most terrible of sandstorms.",t="また起こった、%settlement%は恐ろしい砂嵐に巻き込まれちまった。"}]
};
t["situation.good_harvest"]<-{name="豊作",
description="作物の条件は完璧だった。 食べ物はすぐに手に入り、低価格で提供される。",
addstring="%_s%は%name%の恩恵を受けている",
removestring="%_s%は%name%の恩恵を受けなくなった"
,rumors= [{b="Head over to %settlement% if you need to restock on food. Those lucky bastards have had themselves a bountiful harvest season this year.",t="食料を補充する必要があるなら%settlement%に行くといい。あそこは何ともツイてることに、今年は豊作だったんだとさ。"},
        {b="I came here from %settlement% to sell our extra produce. The gods have been smiling on us and granted us the best harvest in many years!",t="%settlement%から余分な農産物を売りに来たんだよ。神々は私たちに微笑みかけ、ここ数年で最高の収穫を与えてくれたのさ！"},
        {b="I just learned that in %settlement% the granaries and larders are filled to the brim thanks to a good harvest. ",t="%settlement%では、豊作のおかげで穀倉と食料貯蔵庫が満杯になっていることを知ったんだ。"}]
};
t["situation.safe_roads"]<-{name="安全な道路",
description="ここに通じる道路は最近かなり安全であり、多くの有益な交易が行われ、和解がいくらか繁栄することを可能にした。"
,rumors= [{b="Seems the brigands around %settlement% are having a rough time now with all those patrols going on.",t="%settlement%周辺の山賊達は、ひっきりなしのパトロールのせいで大変な目に会ってるみたいだな。"},
        {b="Just got back from %settlement% last night. No brigand in sight on the roads, thank the gods.",t="昨夜%settlement%から戻ってきたところなんだ。道路に山賊は見かけない、神に感謝だね。"},
        {b="Been telling my cousin for years to stop robbing people on the road. Ain't no way for it but to end badly. And right I was, it did. Got his comeuppance the other day by %settlement%. Place is crawling with militia.",t="いとこには何年も前から、道で人々を襲うのをやめるように言ってきた。ひどい結末しか待ってないからだ。その通りだったよ、そうなったんだ。 先日%settlement%で報いを受けたんだよ。そこには民兵がウヨウヨいたんだ。"}]
};
t["situation.local_holiday"]<-{name="地元の休日",
description="地元の休日は人々を寛大な気分にさせる。 食べ物と飲み物の時間だ！",
addstring="%_s%は%name%だ",
removestring="%_s%はもう%name%ではない"
,rumors= [{b="If you're looking to have a good time, head on over to %settlement% and join their celebration! Boy, I wish I could be there.",t="楽しい時間を過ごしたいなら、%settlement%に行ってお祝いに参加するといい。その場にいられたらいいんだけど。"},
        {b="You don't look quite like the festive type, if I might say so, but perhaps your men would enjoy some food and drink. Alas, both can be found aplenty in %settlement%, as they're celebrating some holiday over there.",t="アンタはお祭り騒ぎをするタイプには見えないが、おそらくアンタの部下達は食べ物や飲み物を楽しんでることだろう。あいにく、向こうじゃ休日を祝ってるから、どちらも%settlement%にはたくさんあるんでな。"},
        {b="The good folks over in %settlement% are having their annual holiday right now. I'd be there drinking and eating and all, if only I had the crowns. Mind getting me another ale, friend?",t="%settlement%にいる善良な人々は、今、毎年恒例の休日を過ごしてる。 クラウンさえあれば、そこで飲んだり食べたりしたいもんだ。 エールのおかわりを頼んでもいいかい？"}]
};
t["situation.cultist_procession"]<-{name="カルトの行列",
description="街を通り抜けるカルト信者の行列がある。人々の着実な流れが薄い空気から現れたように見え、今ではゆっくりと幹線道路に沿って進んでいる。 落ち着いた色で覆われ、鐘を鳴らし、ダヴクルの名前を単調に唱えている。",
addstring="%_s%で%name%が発生している",
removestring="%_s%はもう%name%はない"
,rumors= [{b="I just saw the most bone chilling procession coming through %settlement%! Masked figures, whipping themselves on the backs until they were all bloodied up...",t="ゾッとするような行列が%settlement%を通って来るのを見かけたんだ！覆面姿で、血まみれになるまで背中を鞭で打ってた..."},
        {b="%settlement% is swarming with strange cultists, they are surely up to no good! Somebody should send the witch hunters their way, I'd say!",t="%settlement%には奇妙なカルト集団がウヨウヨしてる、きっと何か企んでるんだ！ 誰かが魔女狩りを送り込むべきだと思うがね！"},
        {b="It has awakened! The sleeping beast is about to rise from its century long slumber! Go to %settlement% and my brothers in faith will tell you the same! Davkul will come!",t="目覚めたのだ！ 眠れる獣が100年の長い眠りから目覚めようとしているのだ！ %settlement%に行けば私の信仰の兄弟達が同じことを言うだろう！ ダヴクルが来るのだ！"}]
};
t["situation.snow_storms"]<-{name="吹雪",
description="吹雪は多かれ少なかれここを交易から隔離した。 新商品が少ないため、品揃えが少なく、価格も高くなっている。",
addstring="%_s%は%name%に苦しんでいる",
removestring="%_s%は%name%の影響を受けなくなった"
,rumors= [{b="Bad weather out there towards %settlement%, looks like a full-blown blizzard.",t="%settlement%方面は悪天候で、本格的な猛吹雪みたいだな。"}]
};
t["situation.greenskins"]<-{name="グリーンスキンの略奪",
description="グリーンスキンは周囲の土地を恐怖に陥れ、オークやゴブリンが郊外の農場を襲撃し、キャラバンを荒らし続けているため、多くの命が失われている。 物資が不足し始め、人々は必死になっている。",
addstring="%_s%で%name%が発生している",
removestring="%_s%の%name%は解消した"
,rumors= [{b="I heard rumors that vile greenskins are marauding around %settlement%! Is it true? I hope they don't make their way over here...",t="卑劣なグリーンスキン共が%settlement%の周りを略奪してるという噂を聞いたぞ！本当なのか？ 奴等がここを通らないことを願ってるが..."},
        {b="Did you see the columns of smoke in the evening sky? They are rising over from %settlement% where greenskins are burning and pillaging the countryside.",t="夕暮れの空に煙の柱が見えたか？ グリーンスキン共が郊外を燃やし、略奪している%settlement%から立ち上がってる煙さ。"},
        {b="Here, take a look at what's left of my hand! Can hardly use it anymore on account of it having no fingers since that run-in with greenskins a while ago. Now I hear they are back, marauding around %settlement% right as we speak.",t="ほら、俺の残った手を見てくれ！ 少し前にグリーンスキン共とやり合って以来、指がないせいでもうほとんど使えねぇ。 今、奴等が戻ってきて、%settlement%を略奪して回ってると聞いたよ。"}]
};
t["situation.terrifying_nightmares"]<-{name="恐ろしい悪夢",
description="この集落の人々は悪夢に脅かされている。 多くの人は、安全のために一晩中起きていることを好む。",
addstring="%_s%は%name%に苦しんでいる",
removestring="%_s%は%name%の影響を受けなくなった"
,rumors= [{b="The other day I came through %settlement%. Something is wrong there. Pale faces, tired eyes and shambling walks. It's like they didn't sleep in a week!",t="先日、%settlement%を通ったんだ。あそこは何かがおかしいよ。 みんな青白い顔と疲れた目で、ヨタヨタと歩くんだ。 まるで一週間寝てなかったみたいだ！"},
        {b="I just got a letter from my aunt in %settlement% claiming that the whole town is troubled by terrible nightmares. I don't know, she's always been overly dramatic.",t="%settlement%の叔母から手紙が届いたんだけど、町中がひどい悪夢に悩まされているらしい。よくわからないけど、彼女はいつも大げさだからね。"},
        {b="The best recipe for a good night's sleep is hard work and a pint of ale! Come to think of it, someone should tell it to the folks over in %settlement%; from what I've heard, whole town's got trouble sleeping.",t="ぐっすり眠るための最高のレシピは、しっかり働くことと1パイントのエールさ！あぁそうそう、誰かが%settlement%の人々に教えてやればいいんだよ。聞いたところによると、町中が寝られないそうだからな。"}]
};
t["situation.archery_contest"]<-{name="弓術大会",
description="弓術大会は、弓に堪能な人を魅了した。 おそらく、それに応じた新兵を探すのに良い時期だろう。",
addstring="%_s%で%name%が行われている",
removestring="%_s%はもう%name%は行われていない"
,rumors= [{b="If you're a skilled archer, you might want to head to that big contest over in %settlement% and let fly some arrows!",t="もし貴方が腕のいい射手なら、%settlement%での大きなコンテストに向かい、矢を放ちたいと思うかもしれないね！"},
        {b="You know, I myself was once the best archer near and far, I swear! Until a damned donkey stepped on my hand, that is. Otherwise, I'd be in %settlement% for the archery contest right now...",t="知ってるだろうが、オレはかつてこの辺りじゃ最高の射手だったんだ、本当だぞ！ いまいましいロバがオレの手を踏み潰すまでは、な。 そうでなきゃ、今頃弓術大会のために%settlement%にいるだろうさ..."},
        {b="Anyone skilled with a bow is making their way to %settlement% these days for some contest. Most of them poachers and other lowlifes, I imagine.",t="弓の腕に覚えがある奴は皆、最近は何かのコンテストのために%settlement%に向かってる。そいつらのほとんどは密猟者やその他の低生活者だと思うがね。"}]
};
t["situation.lost_at_sea"]<-{name="海難事故",
description="嵐の最中に、漁師を乗せた船が海で失われた。 新鮮な魚と自発的な新兵の両方が稀になる。",
addstring="%_s%で%name%が発生した",
removestring="%_s%の%name%の影響はなくなった"
,rumors= [{b="They never came back from the sea... thinking about all the poor souls lost from %settlement% makes me shiver.",t="彼らは海から戻ってこなかった... %settlement%で失われた哀れな魂について考えると身震いがする。"},
        {b="Damn wenches by %settlement%, wailin' and wailin'. Went over to sell them some of me pigs, but they only wailin' with nary a man to be found. Some boat lost at sea or sumthin'. Went right back with not a single pig sold.",t="%settlement%のそばで女達が泣き叫んでたんだ。 豚の何匹かを売るために行ったんだが、彼らは泣き叫ぶだけで人っ子1人いないんだよ。どこかの船が海で遭難したとか何とか。豚は一頭も売れずにすぐに戻ってきた。"},
        {b="Seafaring has always been a dangerous profession. That's why I turned my back to the water. And right in time, might I say, for otherwise it might have been me on that boat that got lost by %settlement%.",t="船乗りは常に危険な職業だ。だから私は海に背を向けた。そうでなければ、%settlement%で遭難した船に乗っていたのは私だったかもしれない。"}]
};
t["situation.draught"]<-{name="干ばつ",
description="予期せぬ熱波が地元の作物の多くを燃やした。 利用できる食料が少なく、価格が高くなっている。",
addstring="%_s%は%name%に苦しんでいる",
removestring="%_s%は%name%の影響を受けなくなった"
,rumors= [{b="A terrible drought is ailing %settlement% from what I hear. It's always been hard for the folks over there, but this time it's dire.",t="聞いたところによると、ひどい干ばつが%settlement%を苦しめている。あそこの住民にとってはいつものことだったが、今回は悲惨だ。"},
        {b="If you are as reckless as you look, you might make a quick crown selling food in %settlement%. A harsh drought has the people starving, so they'll pay anything to get something between their teeth.",t="アンタに見かけによらない無謀さがあるなら、%settlement%で食料を売れば手っ取り早くクラウンが手に入るかもしれん。 厳しい干ばつで人々は飢えてるから、食べ物を口にするためならいくらでも払うだろうさ。"},
        {b="Oh, son, I used to be a rainmaker over in %settlement%, but the fools chased me off! Now, admittedly, the village was suffering from a draught, but isn't that all the more reason to rely on me? Fools, I say!",t="ああ、%settlement%で雨乞いをしていたが、愚か者共が私を追い払ったのさ！村が干ばつに苦しんでいたのは確かさ、それならなおさら私を頼る理由になるってもんじゃないか？ 愚か者共だよ！"}]
};
t["situation.full_nets"]<-{name="豊漁",
description="水の中は魚群でいっぱい。 新鮮な魚が豊富で安価に入手できる。",
addstring="%_s%は%name%だ",
removestring="%_s%はもう%name%ではない"
,rumors= [{b="This time o' year large schools of fish always come by %settlement%. All they need do is throw some nets into the water and then pull out more fish than they could ever eat! Lucky bastards!",t="この時期の%settlement%にはいつも魚の大群がやってくるんだ。網を水中に投げ入れて引き揚げるだけで、食べ切れないほどの魚が手に入るのさ！幸運な奴らだよなぁ！"},
        {b="Tomorrow I'll head out to %settlement% and fill my carts with fish. Rumor has it the fishermen over there hit a lucky streak!",t="明日は%settlement%に出かけて、荷車に魚を満載するつもりなんだ。 噂によるとあそこの漁師達は幸運の連鎖に見舞われたらしいからね！"},
        {b="You in the trading business? I hear they have their nets filled to the brim with fish over at %settlement%.",t="貴方は交易を行っていますか？ %settlement%では網が魚でいっぱいになっているそうですよ。"}]
};