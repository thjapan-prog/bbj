local gt = this.getroottable();
gt.translation.strings<-{};
local t=gt.translation.strings;
t["Direction"]<-{items= [
        {b="north-east",t="北東"},
        {b="south-east",t="南東"},
        {b="south-west",t="南西"},
        {b="north-west",t="北西"},
        {b="south",t="南"},
        {b="north",t="北"},
        {b="<undefined>",t="<未定義>"}]
};
t["Direction8"]<-{items= [
        {b="north-east",t="北東"},
        {b="south-east",t="南東"},
        {b="south-west",t="南西"},
        {b="north-west",t="北西"},
        {b="north",t="北"},
        {b="east",t="東"},
        {b="south",t="南"},
        {b="west",t="西"}]
};
t["Distance"]<-{items= [{b="close by",t="すこし行った所"},
        {b="not far",t="やや離れた所"},
        {b="some way",t="離れた所"},
        {b="a long way",t="遠く離れた所"},
        {b="far",t="非常に遠く離れた所"},
        {b="far away",t="遥か彼方に離れた所"}]
};
t["World.TimeOfDay"]<-{items= [
        {b="Dawn",t="夜明け"},
        {b="Morning",t="朝"},
        {b="Midday",t="昼"},
        {b="Afternoon",t="午後"},
        {b="Evening",t="夕方"},
        {b="Dusk",t="夕暮れ"},
        {b="Night",t="夜"},
        {b="Dawn",t="夜明け"}]
};
t["BodyPartName"]<-{items= [{b="body",t="胴体"},
        {b="head",t="頭"}]
};
t["TerrainShort"]<-{items= [{b="",t=""},
        {b="bay",t="港"},
        {b="plains",t="平原"},
        {b="swamp",t="沼地"},
        {b="hills",t="丘"},
        {b="forest",t="森"},
        {b="mountain",t="山"},
        {b="snow",t="雪原"},
        {b="wastelands",t="荒れ地"},
        {b="tundra",t="ツンドラ"},
        {b="steppe",t="草原"},
        {b="shore",t="岸辺"},
        {b="desert",t="砂漠"},
        {b="hills",t="丘"},
        {b="wetlands",t="湿原"}]
};
t["Tactical.TerrainDescription"]<-{items= [{b="None",t="なし"},
        {b="A dirt road originating from constant use by humans and animals.",t="人間や動物が常に使用する未舗装の道路。"},
        {b="A primitve road consisting of tamped clay.",t= "粘土を踏み固めた原始的な道路。"},
        {b="A cobblestone road used for carriages and larger vehicles.",t="馬車や大型車用の石畳の道。"},
        {b="Short grass on flat and solid ground.",t="平坦でしっかりした地面に生えている短い芝。"},
        {b="Bare and flat earth with barely any vegetation.",t="草木もほとんど生えていない平坦な大地。"},
        {b="Forest ground covered in a thick and soft mossy layer.",t="厚く柔らかい苔の層に覆われた森林の地面。"},
        {b="Dark and muddy earth.",t="暗くて泥っぽい大地。"},
        {b="Mostly firm ground covered in tall and soft grass.",t="背の高い柔らかい草で覆われたほとんどが固い地面。"},
        {b="Shallow, murky water covering a soft and muddy ground.",t="柔らかくぬかるんだ地面を覆っている浅く濁った水辺。"},
        {b="Flat and firm ground covered with dry and shriveled grass.",t="乾燥し縮れた草が茂った平らで固い地面。"},
        {b="Hard patches of earth completely dried out by sun and heat.",t="太陽と熱で完全に乾燥した硬い土の塊。"},
        {b="Flat and arid ground covered in rough grasses and weeds.",t="荒れた草や雑草に覆われた平坦で乾燥した地面。"},
        {b="Frozen ground covered in a thick layer of snow.",t="厚い雪の層に覆われた凍土。"},
        {b="Frozen ground covered in a light layer of snow.",t="浅い雪の層に覆われた凍土。"},
        {b="Smooth stone ground granting a good footing.",t="足場のいい滑らかな石の地面。"},
        {b="Rough stone ground.",t="荒れた石の地面。"},
        {b="Burning hot desert sand.",t="燃えるように熱い砂漠の砂。"},
        {b="Clear and shallow water.",t="澄んだ浅い水辺。"}]
};
t["TerrainAlternative"]<-{items= [{b="",t=""},
        {b="on plains",t="平原"},
        {b="in the swamp",t="沼の中"},
        {b="on a hill",t="丘の上"},
        {b="in the forest",t="森の中"},
        {b="on a mountain",t="山の上"},
        {b="on plains",t="平原"},
        {b="in the snow",t="雪の中"},
        {b="in the tundra",t="ツンドラの中"},
        {b="on steppe",t="草原"},
        {b="in the desert",t="砂漠の中"},
        {b="in wetlands",t="湿原の中"}]
};
t["ItemSlotName"]<-{items= [{b="Body",t="胴体"},
        {b="Head",t="頭"},
        {b="Mainhand",t="メインハンド"},
        {b="Offhand",t="オフハンド"},
        {b="Accessory",t="アクセサリー"},
        {b="Bag",t="バッグ"}]
};
t["UI"]<-{table= {
        RetreatDialogueConsequences = {b="The enemy is battered and beaten. Those few still alive scatter away in all directions. Will you hunt them down to claim their heads and possessions, or declare the battle won?",t="敵はボロボロに打ちのめされている。まだ生き残っている者達は四方八方に散らばっていく。首と財産を奪うため彼等を追い詰めるのか、それとも戦闘の勝利を宣言するか？"},
        Introduction = {b="You soak in the cool morning air. As the sun slowly rises, so does a new chapter in your life begin. After years of bloodying your sword for meager pay you've saved up enough crowns to start your very own mercenary company. With you are %allbrothers% with whom you've fought before side by side in the shieldwall. You are their commander now, the leader of the %companyname%.\n\nAs you travel the lands you should hire new men in the villages and cities to fill your ranks. Many who offer their services will have never picked up a real weapon before. Maybe they are desperate, maybe they are greedy for quick spoils of war. Most of them will die on the battlefield. But do not be discouraged. Such is the mercenary life, and the next village will always have new men eagerly looking for a new start in life.\n\nThe lands are dangerous these times. Robbers and pillagers lay in ambush by the roads, wild beasts roam the dark forests and orc tribes are restless in the swamps to the east. There are rumors even of dark magic being at work, the dead rising from their graves and walking again. There is plenty of opportunity to earn good money, whether by taking on contracts you can find in the villages, cities and strongholds all over the land, or by venturing out on your own to explore and raid.\n\nYour men look to you to give a command. They live and die for the %companyname% now.\n\n[color=#bd9d71]EARLY ACCESS DISCLAIMER: This version is still heavily work in progress and does not represent the final quality of the product. Features may be incomplete or missing, the UI is unskinned as of yet, there will be bugs, and the balancing and progression of the economy, resources and enemies may need tweaking and can be too challenging or easy occasionally. A lot of additional content will be added over the course of the Early Access, including more enemies, items, contracts, terrain types, unique locations, story events and other features.[/color]",t="朝の冷たい空気に浸る。太陽がゆっくりと昇るにつれ、貴方の人生の新たな章が始まる。僅かな報酬のために何年も剣を血で染め続けてきたが、貴方は自分の傭兵団を立ち上げるのに十分なクラウンを貯めることができた。貴方と共にいるのは、以前シールドウォールで肩を並べて共に戦った%allbrothers%だ。貴方は今や彼らの指揮官であり、%companyname%のリーダーである。\n\n各地を旅する際には村や都市で新しい人員を雇い、仲間を増やす必要がある。彼らの多くは本物の武器を手にしたことがないだろう。自暴自棄になっているのかもしれないし、手っ取り早く戦利品を手に入れようと貪欲になっているのかもしれない。彼らの多くは戦場で死ぬだろう。しかし、落胆することはない。それが傭兵というものであり、次の村には必ず新しい男たちが現れ、人生の再出発を切望している。\n\nこの時代の土地は危険だ。街道沿いには強盗や略奪者が待ち伏せし、暗い森には野獣が徘徊し、東部の沼地ではオークの部族が跋扈している。闇の魔術が働いていて、死者が墓から蘇り、再び歩き出すという噂さえある。土地中の村や都市や拠点で見つけた契約を請け負ったり、自分自身で探検や襲撃に出かけたりと、金を稼ぐチャンスはいくらでもある。\n\n貴方の部下は、貴方が命令を与えるのを待っている。彼らは今、%companyname%のために生き、そして死ぬのだ。\n\n[color=#bd9d71]Early ACCESS DISCLAIMER: このバージョンはまだ大きく進行中の作業であり、製品の最終的な品質を表しているわけではありません。機能が不完全であったり、欠落していたり、UIがまだ未完成であったり、バグがあったり、経済、資源、敵のバランスや進行に微調整が必要であったり、時にはやりがいがあったり、簡単であったりすることがあります。アーリーアクセスの期間中には、より多くの敵やアイテム、契約、地形の種類、ユニークなロケーション、ストーリーイベントなど、多くの追加コンテンツが追加される予定です。[/color]"},
        FleeDialogueConsequences = {b="Sometimes it's better to do a tactical retreat in order to live and fight another day. The men will attempt to reach the edges of the map by themselves and then safely retreat. However, the enemy may catch up, and anyone currently engicaged may not be able to get away unscathed or even alive.",t="生きてまた次の日も戦うために、戦術的な退却をした方がいいこともある。部下達は自力でマップの端までたどり着き、安全に撤退しようとする。しかし、敵に追いつかれる可能性もあり、現在交戦中の者は無傷では済まず、生きていることさえできないかもしれない。"}}
};
t["Relations"]<-{items= [
        {b="Hostile",t="敵対的"},
        {b="Threatening",t="険悪"},
        {b="Unfriendly",t="非友好的"},
        {b="Cold",t="冷淡"},
        {b="Neutral",t="中立"},
        {b="Open",t="好意"},
        {b="Very Friendly",t="非常に友好的"},
        {b="Friendly",t="友好的"},
        {b="Allied",t="味方"}]
};
t["Tactical.TerrainName"]<-{items= [{b="None",t="なし"},
        {b="Dirt Road",t="未舗装の道"},
        {b="Clay Road",t="粘土の道"},
        {b="Cobblestone Road",t="石畳の道"},
        {b="Grassland",t="草原"},
        {b="Dirt",t="土"},
        {b="Forest",t="森"},
        {b="Muddy Earth",t="泥地"},
        {b="Plashy Grass",t="多肉質の草"},
        {b="Murky Water",t="濁った水辺"},
        {b="Steppe",t="草原"},
        {b="Dry Steppe",t="乾燥した草原"},
        {b="Tundra",t="ツンドラ"},
        {b="Snow",t="雪"},
        {b="Light Snow",t="小雪"},
        {b="Stone",t="石"},
        {b="Sand",t="砂"},
        {b="Shallow Water",t="浅瀬の水辺"}]
};
t["Tactical.EntityDescription"]<-{table= {
        Ruin = {b="Ruins from an age long past.",t="遥か昔の遺跡。"},
        Shrubbery = {b="Very dense shrubbery that blocks movement and line of sight.",t="移動と視線を遮る非常に密な低木。"},
        Boulder = {b="A large stone boulder. Blocks movement and line of sight.",t="大きな岩の玉石。移動と視線を遮る。"},
        Brush = {b="Very dense shrubbery that blocks movement and line of sight.",t="移動と視線を遮る非常に密なやぶ。"},
        Cart = {b="A cart full of trading goods.",t="交易品を満載した荷車。"},
        Tree = {b="A large tree with a massive trunk.",t="巨大な幹を持つ大木。"},
        Plant = {b="An exotic plant that blocks movement and line of sight.",t="移動と視線を遮る熱帯植物。"},
        Cartwheel = {b="The old and broken wheel of an oxcart.",t="古くて壊れた牛車の車輪。"},
        Donkey = {b="A donkey used for pulling heavy carts.",t="重い荷車を引っ張るのに使われるロバ。"},
        TreeTrunk = {b="A treetrunk half covered in foul water.",t="半分が汚い水に覆われている木の幹。"},
        RuinedPillar = {b="TODO",t="TODO"},
        TreeSwamp = {b="This tree is rotten and long dead.",t="この木は腐っていて、古く昔に枯れている。"}}
};
t["Terrain"]<-{items= [{b="",t=""},
        {b="in the ocean",t="海の中"},
        {b="on the plains",t="平原"},
        {b="in the swamps",t="沼の中"},
        {b="on the hills",t="丘の上"},
        {b="in the forest",t="森の中"},
        {b="in the mountains",t="山の中"},
        {b="in the snow",t="雪の中"},
        {b="in the wastelands",t="荒れ地の中"},
        {b="in the tundra",t="ツンドラの中"},
        {b="in the steppe",t="草原の中"},
        {b="on the shore",t="岸辺"},
        {b="in the desert",t="砂漠の中"},
        {b="in the wetlands",t="湿原の中"}]
};
t["Tactical.EntityName"]<-{table= {
        Ruin = {b="Ruin",t="廃墟"},
        Shrubbery = {b="Shrubbery",t="低木"},
        Boulder = {b="Boulder",t="大岩"},
        Brush = {b="Brush",t="やぶ"},
        Cart = {b="Caravan Cart",t="隊商の荷車"},
        Tree = {b="Tree",t="木"},
        Plant = {b="Plant",t="植物"},
        Cartwheel = {b="Old Cartwheel",t="古い車輪"},
        Donkey = {b="Donkey",t="ロバ"},
        RuinedPillar = {b="Ruined Pillar",t="廃墟の柱"}}
};