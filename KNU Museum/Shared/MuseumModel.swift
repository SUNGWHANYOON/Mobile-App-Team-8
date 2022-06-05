//
//  MuseumModel.swift
//  KNU Museum
//
//  Created by Sreya Reddy on 15/05/22.
//

import Foundation

struct MuseumModel {
    
    struct Object: Identifiable {
        var id: Int
        var image: String
        var name: String
        var info: String
        var generation: String
        var relic_no: String
    }
    
    static var mdata = MuseumData()
    
    //12, 10, 14, 17, 29, 9, 16, 35, 15, 28
    var data = [
        Object(id: 1, image: "Image1", name: mdata.relics[11]["name"] as! String, info: mdata.relics[11]["info"] as! String, generation: mdata.relics[11]["generation"] as! String, relic_no: mdata.relics[11]["relicNo"] as! String),
        Object(id: 2, image: "Image2", name: mdata.relics[9]["name"] as! String, info: mdata.relics[9]["info"] as! String, generation: mdata.relics[9]["generation"] as! String, relic_no: mdata.relics[9]["relicNo"] as! String),
        Object(id: 3, image: "Image3", name: mdata.relics[13]["name"] as! String, info: mdata.relics[13]["info"] as! String, generation: mdata.relics[13]["generation"] as! String, relic_no: mdata.relics[13]["relicNo"] as! String),
        Object(id: 4, image: "Image4", name: mdata.relics[16]["name"] as! String, info: mdata.relics[16]["info"] as! String, generation: mdata.relics[16]["generation"] as! String, relic_no: mdata.relics[16]["relicNo"] as! String),
        Object(id: 5, image: "Image5", name: mdata.relics[28]["name"] as! String, info: mdata.relics[28]["info"] as! String, generation: mdata.relics[28]["generation"] as! String, relic_no: mdata.relics[28]["relicNo"] as! String),
        Object(id: 6, image: "Image6", name: mdata.relics[8]["name"] as! String, info: mdata.relics[8]["info"] as! String, generation: mdata.relics[8]["generation"] as! String, relic_no: mdata.relics[8]["relicNo"] as! String),
        Object(id: 7, image: "Image7", name: mdata.relics[15]["name"] as! String, info: mdata.relics[15]["info"] as! String, generation: mdata.relics[15]["generation"] as! String, relic_no: mdata.relics[15]["relicNo"] as! String),
        Object(id: 8, image: "Image8", name: mdata.relics[34]["name"] as! String, info: mdata.relics[34]["info"] as! String, generation: mdata.relics[34]["generation"] as! String, relic_no: mdata.relics[34]["relicNo"] as! String),
        Object(id: 9, image: "Image9", name: mdata.relics[14]["name"] as! String, info: mdata.relics[14]["info"] as! String, generation: mdata.relics[14]["generation"] as! String, relic_no: mdata.relics[14]["relicNo"] as! String),
        Object(id: 10, image: "Image10", name: mdata.relics[27]["name"] as! String, info: mdata.relics[27]["info"] as! String, generation: mdata.relics[27]["generation"] as! String, relic_no: mdata.relics[27]["relicNo"] as! String),
    ]

}

struct MuseumData {
    static var datalist:Array = mData.components(separatedBy: "\n\n")
    
    //var datasplit:Array = datastring.split(separator: "\n", omittingEmptySubsequences: true)
    //datasplit.count

    var mItem = Dictionary<String,Any>()
    var relics : Array = [Dictionary<String, Any>]()

    init() {
        for i in 0..<MuseumData.datalist.count {
            var flag = false
            for j in MuseumData.datalist[i].components(separatedBy: "\n"){
                if (flag) {
                    flag = false
                    mItem.updateValue(j, forKey: "info")
                } else {
                    flag = true
<<<<<<< HEAD
                    var temp = j.components(separatedBy: "/")
=======
                    let temp = j.components(separatedBy: "/")
>>>>>>> 70068798763db9c64dc61a37dc0ec11e4fd703cd
                    mItem.updateValue(temp[0], forKey: "id")
                    mItem.updateValue(temp[1], forKey: "name")
                    mItem.updateValue(temp[2], forKey: "generation")
                    if (temp.count == 4) {
                        mItem.updateValue(temp[3], forKey: "relicNo")
                    } else {
                        mItem.updateValue("", forKey: "relicNo")
                    }
                }
            }
            relics.append(mItem)
        }
    }
    
}





let mData = """
1/대구 무술명오작비/삼국(신라)/보물 제 516호
통일신라 어느 무술년, 영동리촌에 저수지를 축조하고 세운 기념비로 6C경 신라의 수리공사에 관한 귀중한 사료이다. 공사관계, 인명에 관하여 직명, 출생지, 인명, 관위 순으로 열거되어 있으며 공사에 동원된 인원의 수는 312명이다. 제방의 크기는 폭 20보, 높이 5보 4척, 길이 50보이고, 비문을 지은 사람의 인명이 기록되어 있다. 높이 103cm

2/십이지상각가형석함/통일신라
경남 진해에서 출토된 통일신라시대 집모양의 석관이다, 뚜껑은 맞배지붕 형태이고 몸체 아래쪽 둘레에 반쯤 앉은 모양의 십이지상이 조각되어 있다. 이 시기 승려가 죽으면 매장하여 육탈시킨 다음 뼈를 모아 석관에 넣는 세골장이 일반적인데 이 석관도 그러한 역할을 한 것으로 보인다. 높이 45cm

3/사천왕상/통일신라
인도의 약사신에서 유래된 것으로 처음에는 갑옷을 입은 신장형으로 표현되었지만 차츰 반라의 몸에 천의를 두르고 팔을 들어 왕성한 힘을 강조하는 모습으로 변했다. 우리나라에서는 불법수호신으로 사찰이나 불전의 입구와 석탑의 문 등에 그림 이나 조각상으로 많이 남아있다. 높이 73cm

4/석조비로자나불좌상/통일신라/보물 제 335호
머리에는 작은 소라 모양의 머리칼을 붙여 놓았으며 얼굴은 몸에 비해 크고 둥글다. 이 불상의 얼굴은 풍만하고 눈과 입가에 미소를 짓고 있는 것이 특징이다. 옷은 양 어깨를 두껍게 감싸고 있으며 옷주름은 형식적으로 처리된 모습이다. 어깨가 좁아서 체구가 현저히 왜소해진 모습이며, 양 발을 무릎에 올리고 발바닥이 하늘을 향한 자세로 앉아 있다. 손은 왼손 검지를 오른손으로 감싼 모습으로 비로자나불이 취하는 일반적인 손모양이다. 광배는 불상에 비해 매우 크게 표현되었으며 합장하고 있는 작은 부처 5구가 새겨져 있고, 가장자리에는 불꽃무늬가 섬세하게 표현되어 있다. 불상이 앉아 있는 8각의 대좌에는 화려한 꽃무늬와 동물상 등이 새겨져 있으나 상당히 형식적으로 처리된 모습이다. 통일신라 후기 비로자나불의 일반적 특징을 잘 보여주고 있는 작품으로 신라 경문왕 3년(863)에 만들어진 동화사 석조비로자나불(보물 제244호)과 비슷한 시기에 만들어진 것으로 보인다. 높이 275cm

5/돌장승/조선
돌을 다듬어 사람 모양의 형상물로 만들어 마을이나 절의 들머리 또는 고개 등지에 세웠던 일종의 수호신이다. 마을 사람들은 이를 신령시하여 제사를 지내거나 치성을 드리는 신앙의 대상으로 여기기도 했다. 자연석을 조각하여 얼굴과 몸통을 구분지었다. 머리에는 사모를 썼고 눈은 깊게 음각하여 돌출되어 있다. 코는 길쭉하고 좁으며 음각으로 표현한 입은 미소를 띄고 있다. 몸통의 팔은 손을 아래 위로 맞대어 있으며 아래쪽에는 꽂을 조각하였다. 높이 80cm

6/법수사비로자나삼존불상/통일신라
삼존상은 좌우 협시보살이 사자와 코끼리를 탄 문수보살과 보현보살이며, 표현양식이 비교적 뛰어난 통일신라 후기 작품이다. 본존상은 단아한 체구, 평행계단식 옷주름의 불의, 가슴에 모은 지권인, 섬세한 세부표현 등에서 9세기 중엽 이후의 전형적인 비로자나불상과 유사하면서 보다 세련되게 표현되었다.

7/봉화북지리 석조반가상/통일신라/보물 제 997호
상반신은 깨져 없어지고, 하반신과 별도로 만든 둥근 연꽃무늬 발받침대만이 남아 있는 상태이지만 당당하고 사실적인 조각수법으로 국내 최대의 반가상으로 평가된다. 왼쪽 무릎 위에 올려 놓은 오른쪽 다리는 매우 크고 무릎을 높이 솟게 하여 강조하고 있다. 올려 놓은 다리 밑에는 3단으로 옷주름이 부드럽게 흐르고 있다. 이들 옆에는 커다란 사각형의 고리와 화려한 구슬 장식이 있다. 발받침대는 약 70cm의 원반형으로 아래로 향한 연꽂이 7잎 새겨져 있다. 7세기 중엽의 작품으로 여겨진다. 높이 160cm

8/석조비로자나불좌상/통일신라
사암으로 만들어졌으며, 중대석과 하대석이 하나의 돌로 조각된 대좌부와 불신으로 구성된다. 불신의 머리는 머리카락이 소라처럼 오른쪽으로 말려 올라가는 모습을 형상화한 나발이며, 정수리에는 마치 혹과 같은 육계가 솟아있다. 얼굴은 부드럽고 원만하며 도톰한 두 눈과 꼭 다문 입가에는 미소를 띠어 환희에 가득 찬 내면세계를 보여 주는 듯하다. 옷주름은 간결하며 손은 비록 파손되었으나 왼손으로 오른손 검지를 감아쥔 지권인이 분명하다. 대좌의 하대석과 상대석에 연화문이, 8각의 중대석에 팔부중상이 새겨져 있다. 높이 196cm

9/대구 산격동 연화 운룡장식 승탑/고려/보물 제 135호
신라시대의 팔각원당형의 기본양식을 따르면서 방형의 하대석과 중대석에서 고려시대의 특색을 잘 나타낸다. 특히 중대석에 양각된 용과 구름은 웅혼한 수법을 보여 준다. 탑신이나 옥개에 비해 기단부가 광대하여 경쾌한 감은 적으나, 오히려 안정되고 장엄한 느낌을 준다. 대구시내의 개인 집에 소장하고 있던 것을 이곳으로 옮겼다. 재료는 화강암이다. 높이 274cm

10/대구 산격동 사자 주악장식 승탑/고려/보물 제 258호
팔각원당형의 양식을 잘 나타내고 있는 고려시대의 전형적인 승탑이다. 방형지대석 위의 기단은 상, 중, 하대석으로 구성되어 있다. 옥개 일부에는 손상이 있으며 상륜이 완전하지는 않지만 각 부분의 조각이 웅장하고 뛰어나며 상하 비례가 잘 맞다. 특히 안상이나 하대석의 구름무늬 조각은 시대적 특징을 잘 보여준다. 재료는 화강암이다. 높이 247cm

11/삼층석탑/고려
지대석 위에 상하2층의 기단과 3층의 탑신으로 구성된 이 석탑은 비교적 간단하고 소박한 형태이다. 각각의 탑신과 기단 양쪽에는 모서리 기둥인 우주와 중심 기둥인 탱주가 양각되어 있다. 특히 하층기단에는 코끼리 눈의 형상을 본떠 만든 장식모양인 안상이 새겨져 있는데 그 중앙에 꽃무늬를 배치하였다. 높이 228cm

12/인흥사지삼층석탑/통일신라
인흥사지로 추정되는 곳에서 옮겨와서 복원하였다. 석탑은 지대석 각면 상부와 상중대석 각 면에 4 매와 1매의 연화형 안상이 음각되어 있다. 낙수면은 다소 경사가 급한 편이며 추녀 끝은 가볍게 반전하여 경쾌한 모습을 보여 준다. 3층 옥개석 상부에는 지름 10cm 내외의 원형의 사리구멍과 T자형의 상륜부 고정 구멍이 있다. 높이 410cm

13/돌수조/조선
돌로 만든 물통이다.

14/석탑/통일신라
사암으로 만들어졌으며 방형의 지대석 위에 기단부 없이 하나의 탑신석과 2매의 옥개석으로 구성되어 있다. 1충 탑신석 사면의 중앙에 사천왕상이 부조되어 있으며, 각각의 옥개석에는 4단의 옥개받침이 새겨져있다. 높이 128cm

15/석등/통일신라
사원 경내나 능묘, 정원 등에 불을 밝히기 위해 만들어진 등기이다. 석등의 하부구조만 남아있는 상태로 점등하는 화사석 부분과 지붕의 역할을 하는 옥개석은 유실되었다.

16/석조나한좌상/통일신라
화강암으로 만들었으며 머리는 약간 앞으로 숙이고 두 손은 무릎 위에 겹쳐 명상에 잠긴 모습이다. 옷은 양팔부터 무릎까지 덮었다. 큼직한 방형 대석 위, 얕은 감실 속에 돋을새김으로 만들었다. 나한은 소승불교에서는 수행자가 오를 수 있는 가장 높은 단계에 있는 자라는 뜻이며 대승불교에서는 최고의 깨달음을 얻은 성자로서 석가에게서 불법을 지키고 대중을 구제하라는 임무를 받은 자를 말한다. 우리나라에 삼국시대 후기부터 소개되어 고려시대에 크게 유행하였다. 출토지는 경주이다. 높이 76cm

17/여래좌상/통일신라
판석의 한쪽 면에다 돋을새김을 하여 연꽂대좌, 불신, 광배를 표현한 여래상이다. 정수리에 마치 혹과 같은 육계가 있고 머리카락은 따로 표현하지 않았다. 옷은 양 어깨를 모두 덮는 통견이고 가슴에는 옷의 띠 매듭이 보인다. 목의 아래에는 주름과 같은 삼도가 둘러져 있다. 다리는 두 발등을 반대쪽 허벅지 위에 올려 발바닥이 위를 보도록 한 결가부좌 자세이다. 손은 오른손을 오른 무릎 아래로 내려 다섯 손가락이 땅을 가리키면서 악마를 굴복시키는 항마촉지인이다. 높이 142cm

18/칠곡 약목 고분/삼국(신라)
우리나라 대학박물관으로서는 최초의 발굴로 1960년 본교 박물관에서 발굴 조사하였다. 분구의 지름은 21m, 높이는 1〜5m이며 둘레에 호석이 돌려져 있었다. 분구의 중앙에 대형 판석으로 축조한 1호 석곽이 있고 호석 바깥에 붙여 강돌을 쌓아 만든 2호 석곽이 있었다. 현재 복원되어 있는 1호 석곽은 판석을 세워 벽을 만들고 점토를 다진 바닥 위에 편평한 강돌을 깐 다음 시신을 매장하고 큰 판석 뚜껑을 덮었다. 이 석곽의 규모는 길이 5.8m 너비 1.3m, 높이 1.4m이다. 석곽의 서쪽에는 대옹이, 동쪽에는 통형기대, 발형기대를 비롯한 토기류가 부장되었고, 중앙부에는 시신 옆에 대도와 철촉 등 철기류가 놓이고, 남장벽 아래에 석곽 길이 방향으로 고배가 길게 두 줄로 놓여 있었다. 출토된 유물은 제 1 전시실에 전시되어 있다.

19/척화비/조선
1866년 병인양요와 1871년 신미양요 뒤 흥선대원군은 쇄국의 결의를 굳히고 백성들에게 외세의 침입을 경계하라는 의미로 1871년 4월을 기해 서울을 비롯하여 전국에 척화비를 세웠다. 비석 표면에는 “洋夷侵犯非戰則和主和賣國(서양 오랑캐가 침입하는데 싸우지 않으면 화친하자는 것이니, 화친을 주장함은 나라를 파는 것이다)”라는 주문을 큰 글자로 새기고 ”戒俄萬年子孫丙寅作 辛未立(우리 만대자손에게 경계하노라. 병인년에 짓고 신미년에 세우다)”라고 작은 글자로 새겼다.

20/우물돌/통일신라
돌로 쌓은 우물의 상단에 덮는 우물돌이다. 네모난 테두리보다 한 단 높게 중앙부를 둥글게 만들었다. 빗물이 우물로 들어가지 않도록 나무로 된 뚜껑을 덮었을 것으로 추정된다.

21/초석/통일신라
건물의 기초가 되는 돌로 주춧돌이라고도 한다. 기둥을 통해 내려오는 하중을 땅으로 전달하는 역할을 한다.

22/모전석탑/통일신라
석재를 이용하여 전탑양식으로 만들었다. 이 모전석탑은 돌을 벽돌모양으로 가공하여 축조한 형식이 아닌 석탑과 같이 석괴형의 탑신석과 옥개석을 쌓되, 탑신석에는 좌우의 우주를 생략하고 옥개석 낙수면에는 전탑과 같이 층단을 표시한 형식이다. 높이 190cm

23/승탑/조선
8각의 대석 위에 8각의 기단면석이 놓이고 그 위에 옥개석이 놓이고 정상에는 상륜을 장식한 승탑이다. 대석은 상면에 이중연꽃을 새겼고, 기단면석 한 면에는 벽허당이라고 세로로 새겨져 있다. 옥개석은 아랫면에 연꽃이 새겨졌다. 옥개석의 낙수면은 다소 경사가 급한 편으로 추녀 끝은 가볍게 반전하여 올라간다. 상륜부는 원좌 위에 보주를 조각하였다. 높이 182cm

24/종형승탑/조선
석종형승탑은 통일신라시대에 팔각원당형 승탑과 함께 만들어졌으며, 특히 고려말 이후 조선시대에 크게 발달하였다. 사각형의 기대석 위에 종모양의 탑신을 세우고 꼭대기에 보주를 새긴 부도를 안치하는게 보통이나 현재 기대석과 보주는 유실되었다.

25/석조귀면이수/조선
이수는 비석 머리를 장식하는 돌이다. 눈은 반구형으로 돌출되었고 코는 중앙에서 넓은 자리를 차지한다. 입을 크게 벌려 커다란 치아가 드러나 있으며 양 볼에 넓게 수염과 머리카락이 조각되어 있다. 이러한 귀면상은 사악한 기운으로부터 수호하는 벽사의 기능을 한다. 높이 50cm

26/석조운룡이수/조선
구름을 배경으로 용의 문양을 조각하였다. 두 용이 서로 마주보고 여의주를 물고 있다. 용의 비늘과 뿔 등이 사실적으로 조각되어 있다. 신라 태종무열왕릉비를 시작 용의 형체를 새겨 장식한 비석의 머릿돌이다. 높이 58cm

27/입마시 정전방금절목비/조선
앞,뒤 두개의 면이 다른용도로 쓰여진 특이한 석비로서 앞면은 입마절목비이고, 뒷면은 이방 정건학 유공불망비이다. 이 입마절목비는 조선시대에 범어역에서 관아 일을 위해 쓸 말을 민간에 기르도록 맡기는 입마와 관련하여 뒷돈이 오가는 악습이 암행어사에게 적발되어 그러한 악습의 재발을 방지하고 역제를 본래대로 정상화시키기 위한 조치들을 사례별로 열거한 비이다. 본문 중 임오라는 해 표기로 볼 때 1762년 혹은 1822년경에 세웠던 것으로 보이며, 19세기 말경 이방의 공덕비로 재활용된 듯하다.

28/대구석빙고비/조선
이 비는 1713〜1716년에 대구석빙고의 완성을 기념하고, 판관 유명악의 공적을 널리 기리기 위해 세워졌다. 비 몸체는 자색을 띠며 꼭대기가 둥근 장방형이다. 석빙고는 겨울에 강가에서 얼음을 잘라내 저장한 뒤 태양열과 직사광선이 들어가지 못하게 하여 여름에 수시로 그 얼음을 다시 꺼내 사용할 수 있도록 만든 얼음 창고이다, 전국에서 석빙고는 현재 6개가 남아있는데 모두 18세기에 제작되었으며 경주, 창녕 등 경상도지방에 주로 분포한다. 원래 위치는 아미산(현재의 반월당)의 북쪽 경사지이다. 높이 185cm

29/석인/조선
석인은 능묘 앞에 세워 놓은 석물의 하나이다. 문관의 형상을 한 문인석과 무관의 모습을 한 무인석이 있다. 석인은 무덤에 배치되어 분묘의 수호나 권력자의 권위를 상징한다, 중국에서는 전한대부터 시작되었고 우리나라에서는 통일신라시대부터 현재까지 그 전통이 이어지고 있다. 월파원에 있는 석인은 조선시대의 것으로 큰 머리와 커다란 귀가 특징이며 장엄한 효과를 보이는 사각주형으로 발전하는 것을 확인할 수 있다.

30/선정비/조선
선정을 베푼 관원의 덕을 기념하기 위하여 세운 송덕비의 한 형태이다. 송덕비는 관직에 있으면서 은혜와 교화를 끼쳤을 때 백성들이 이를 기리며 비를 세웠다. 그러나 백성을 위협하거나 관원 자신의 재물을 들여 억지로 송덕비를 세우는 예도 있다. 월파원에는 판관 유명악 거사비, 판관 유명악 청덕애민선정비, 판관 유명악 청덕선정비, 판관 유명악 영세불망비, 관찰사 유척기 영세블망비, 판관 김기현 선정비, 대구도호부사 우복 정경세 영세불망비, 이방 정건학 유공불망비를 포함하여 8개의 조선시대 송덕비가 있다.

31/대구 이천동 고인돌/청동기
일제시대에 조사된 옛 대봉동 4구역 지석묘군의 일부이며, 1990년과 1993년 본교 박물관이 두 차례의 재발굴 조사를 하였다. 현재 복원되어 있는 것은 4구역의 I, III호 고인돌이다. I 호 고인돌은 상석 1개를 중심으로 5기의 석곽과 석관이 卍자형으로 배치되어 있고 주위에 강돌을 깔아 방형의 묘역을 만들었다. 중앙에 축조된 IV호 석곽이 길이 227cm, 너비 55cm, 깊이 75cm로 규모가 가장 크다. III호 고인돌은 4개의 받침돌 위에 무게 40t의 상석을 올려 놓았고 둘레에 2기의 석곽과 1기의 판석으로 짠 석관이 축조되어 있다. 유물로는 마제석검, 마제석촉, 관옥, 홍도 등이 출토되었다.

32/대구 상인동 고인돌/청동기
1992년 본교 박물관에서 발굴 조사한 상인동 고인돌을 이전 복원하였다. 상인동 고인돌은 강돌을 쌓아서 장방형의 석곽을 만든 다음 둘레에 강돌을 깔아 한 변 3.5m〜5m의 방형 묘역을 만들었다. 북동-남서향으로 5기의 석곽이 묘역을 잇대어 축조되어 있으며 동남쪽 가까이에 2기의 석곽이 더 축조되어 있었다. 덮개돌은 가장 큰 것의 무게가 21톤이며, 나머지는 3〜5톤 정도이다. 이 고인돌 덮개돌들은 돌덧널무덤 위에 얹어서 뚜껑돌로 쓰거나 여러 기의 돌덧널무덤 중앙에 놓아 묘를 표시하는 것으로 사용되었다. 이러한 고인돌과 덮개돌들 주변에서 돌칼, 돌화살촉, 붉은간토기, 천하석제 굽은 옥 등 많은 유물이 출토되었으며, 제 1 전시실에 전시되어 있다.

33/대구 서재리 토기가마/통일신라
2004년 (재)영남문화재 연구원이 발굴 조사한 와룡산 서쪽자락의 토기가마 2기 중 1호 가마를 이전 복원하였다. 가마는 반지하식 구조이며 빚은 토기를 놓고 굽는 소성실(燒成室)과 연기가 빠져나가는 연도부(羨道部), 그리고 아래쪽에 재와 토기를 폐기한 회구부(灰丘部)가 확인되었다. 또 가마 둘레를 분원형으로 두른 배수구가 확인되었다. 가마에서는 짧은 목항아리와 사발 같은 생활용토기들이 대부분 조각 상태로 출토되었다. 토기는 인화문(印花文)이 대부분인 점에서 이 가마들은 7세기 말〜8세기 초에 쓰였음을 알 수 있다. 이 토기가마에서 출토된 토기와 유사한 토기는 제 2 전시실에 전시되어 있다.

34/석양/조선
문인석.무인석.상석.망주석.석호 등 능 주위에 배치되는 석물 중 하나이다. 중국 전한대부터 만들어 졌으며 조선시대에는 왕과 왕비의 무덤 둘레와 사대부의 무덤 앞에 세워져 묘역을 지키는 역할을 하였다.

35/목 없는 불상/통일신라
통일신라시대의 좌불상들이다. 불상의 목이 모두 없는 것은 외적의 침입이나 숭유억불 정책, 불상의 교체 등 다양한 이유로 파손되었을 수 있지만, 불상의 목부분이 불상 각 부위 중 가장 약하여 파손되어 유실되기 쉽기 때문이기도 하다. 목 없는 불상은 완전한 모습은 아니지만 현재 모습 그대로가 우리 역사를 반영하고 있는 훌륭한 예술작품이다.

36/연자방아/조선
곡식을 탈곡 또는 제분하는 방아이다. 둥글고 판판한 돌판 위에 그보다 작고 둥근 돌을 옆으로 세워 얹어 마소가 끌고 돌린다.

37/맷돌/조선
곡물을 갈아서 가루로 만드는 용구이다.
"""
