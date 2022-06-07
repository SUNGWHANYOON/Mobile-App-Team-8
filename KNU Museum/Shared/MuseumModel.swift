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
        var ename: String
        var einfo: String
        var eng: Bool
    }
    
    static var mdata = MuseumData()
    static var emdata = MuseumData()
    
    
    //12, 10, 14, 17, 29, 9, 16, 35, 15, 28
    var data = [
        Object(id: 1, image: "Image1", name: mdata.relics[11]["name"] as! String, info: mdata.relics[11]["info"] as! String, generation: mdata.relics[11]["generation"] as! String, relic_no: mdata.relics[11]["relicNo"] as! String, ename: emdata.erelics[11]["name"] as! String, einfo: emdata.erelics[11]["info"] as! String, eng: false),
        Object(id: 2, image: "Image2", name: mdata.relics[9]["name"] as! String, info: mdata.relics[9]["info"] as! String, generation: mdata.relics[9]["generation"] as! String, relic_no: mdata.relics[9]["relicNo"] as! String, ename: emdata.erelics[9]["name"] as! String, einfo: emdata.erelics[9]["info"] as! String, eng: false),
        Object(id: 3, image: "Image3", name: mdata.relics[13]["name"] as! String, info: mdata.relics[13]["info"] as! String, generation: mdata.relics[13]["generation"] as! String, relic_no: mdata.relics[13]["relicNo"] as! String, ename: emdata.erelics[13]["name"] as! String, einfo: emdata.erelics[13]["info"] as! String, eng: false),
        Object(id: 4, image: "Image4", name: mdata.relics[16]["name"] as! String, info: mdata.relics[16]["info"] as! String, generation: mdata.relics[16]["generation"] as! String, relic_no: mdata.relics[16]["relicNo"] as! String, ename: emdata.erelics[16]["name"] as! String, einfo: emdata.erelics[16]["info"] as! String, eng: false),
        Object(id: 5, image: "Image5", name: mdata.relics[28]["name"] as! String, info: mdata.relics[28]["info"] as! String, generation: mdata.relics[28]["generation"] as! String, relic_no: mdata.relics[28]["relicNo"] as! String, ename: emdata.erelics[28]["name"] as! String, einfo: emdata.erelics[28]["info"] as! String, eng: false),
        Object(id: 6, image: "Image6", name: mdata.relics[8]["name"] as! String, info: mdata.relics[8]["info"] as! String, generation: mdata.relics[8]["generation"] as! String, relic_no: mdata.relics[8]["relicNo"] as! String, ename: emdata.erelics[8]["name"] as! String, einfo: emdata.erelics[8]["info"] as! String, eng: false),
        Object(id: 7, image: "Image7", name: mdata.relics[15]["name"] as! String, info: mdata.relics[15]["info"] as! String, generation: mdata.relics[15]["generation"] as! String, relic_no: mdata.relics[15]["relicNo"] as! String, ename: emdata.erelics[15]["name"] as! String, einfo: emdata.erelics[15]["info"] as! String, eng: false),
        Object(id: 8, image: "Image8", name: mdata.relics[34]["name"] as! String, info: mdata.relics[34]["info"] as! String, generation: mdata.relics[34]["generation"] as! String, relic_no: mdata.relics[34]["relicNo"] as! String, ename: emdata.erelics[34]["name"] as! String, einfo: emdata.erelics[34]["info"] as! String, eng: false),
        Object(id: 9, image: "Image9", name: mdata.relics[14]["name"] as! String, info: mdata.relics[14]["info"] as! String, generation: mdata.relics[14]["generation"] as! String, relic_no: mdata.relics[14]["relicNo"] as! String, ename: emdata.erelics[14]["name"] as! String, einfo: emdata.erelics[14]["info"] as! String, eng: false),
        Object(id: 10, image: "Image10", name: mdata.relics[27]["name"] as! String, info: mdata.relics[27]["info"] as! String, generation: mdata.relics[27]["generation"] as! String, relic_no: mdata.relics[27]["relicNo"] as! String, ename: emdata.erelics[27]["name"] as! String, einfo: emdata.erelics[27]["info"] as! String, eng: false),
    ]

}

struct MuseumData {
    static var datalist:Array = mData.components(separatedBy: "\n\n")

    var mItem = Dictionary<String,Any>()
    var relics : Array = [Dictionary<String, Any>]()
    
    
    static var edatalist: Array = emData.components(separatedBy: "\n\n")

    var emItem = Dictionary<String,Any>()
    var erelics : Array = [Dictionary<String, Any>]()

    init() {
        for i in 0..<MuseumData.datalist.count {
            var flag = false
            for j in MuseumData.datalist[i].components(separatedBy: "\n"){
                if (flag) {
                    flag = false
                    mItem.updateValue(j, forKey: "info")
                } else {
                    flag = true
                    let temp = j.components(separatedBy: "/")
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

        for i in 0..<MuseumData.edatalist.count {
            var flag = false
            for j in MuseumData.edatalist[i].components(separatedBy: "\n"){
                if (flag) {
                    flag = false
                    emItem.updateValue(j, forKey: "info")
                } else {
                    flag = true
                    let temp = j.components(separatedBy: "/")
                    emItem.updateValue(temp[0], forKey: "id")
                    emItem.updateValue(temp[1], forKey: "name")
                }
            }
            erelics.append(emItem)
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


let emData = """
1/Daegu Martial Arts Myeongjakbi/Samguk (Silla)/Treasure No. 516
It is a monument to the construction of a reservoir in Yeongdong-ri Village in the Year of the Martial Arts of Unified Silla, and is a valuable historical material for the repair work of Silla around 6C. Regarding construction relations and human life, it is listed in the order of occupation, birthplace, person, and official, and the number of people mobilized for the construction is 312. The size of the embankment is 20 steps in width, 5 steps in height, 4 feet in length, and 50 steps in length, and the life of the person who built the inscription is recorded. 103 cm in height

2/12 Deterioration Box/Unification Silla
It is a stone coffin in the shape of a house from the Unified Silla period excavated in Jinhae, Gyeongsangnam-do, and the lid is in the form of a gabled roof and a half-sitting twelve-figure statue is carved around the lower body. During this period, when a monk dies, it is common to bury him, bury him, collect his bones, and put them in the sarcophagus, which seems to have played such a role. 45cm in height

3/Four Heavenly Kings/Unification Silla
Originating from India's pharmacist, it was initially expressed as an armored kidney, but gradually changed to wearing a cloth around Banra's body and raising his arms to emphasize its vigorous strength. In Korea, many paintings and sculptures remain as illegal guardians at the entrance of temples or Buddhist temples and at the doors of stone pagodas. 73cm in height

4/Stone Vairocana Buddha statue/Unification Silla/Treasure No. 335
Small conch-shaped hair is attached to the head, and the face is larger and round compared to the body. The face of this Buddha statue is full and features a smile on the eyes and mouth. The clothes are thickly wrapped around both shoulders, and the folds of the clothes are formalized. The shoulders are narrow, so the body is remarkably dwarfed, and both feet are placed on the knees and the soles of the feet are sitting in a position facing the sky. The hand is wrapped around the index finger of the left hand with the right hand, which is the general shape of the hand taken by Vairocana Buddha. The halo is expressed very large compared to the Buddha statue, and five small Buddhas are carved together, and the flame pattern is delicately expressed on the edge. The octagonal pedestal where the Buddha statue sits is engraved with colorful flower patterns and animal statues, but it is very formal. It is a work that shows the general characteristics of Vairocana Buddha in the late Unified Silla period and seems to have been made around the same time as the Stone Vairocana Buddha (Treasure No. 244) of Donghwasa Temple, which was made in the 3rd year of King Gyeongmun of Silla (863). 275 cm in height

5/Stone Guardian/Joseon
It is a kind of guardian deity that was erected in the village or temple's wild head or hill by trimming stones and making them into human-shaped figures. The villagers also regarded it as an object of faith to hold ancestral rites or worship. A natural stone was carved to separate the face from the body. The head is decorated with a four-sided hat, and the eyes are deeply engraved and protruded. The nose is long and narrow, and the mouth expressed in intaglio has a smile. The arms of the body are joined up and down, and the lower part is carved to be inserted. 80 cm in height

6/The Buddha Triad/Unification Silla
Samjonsang is a late Unified Silla work with relatively excellent expression style, with the left and right Hyupsi Bodhisattva riding a lion and an elephant. The main statue is similar to and more refined than the typical Vairocana Buddha statue after the mid-9th century in its elegant body, the injustice of parallel stair-style folds, the collection of land rights in its chest, and detailed expressions.

7/Bonghwa Bukji Stone Side Dish Box/Unified Silla/Treasure No. 997
The upper body is broken and disappeared, and only the round lotus-patterned footrest made separately from the lower body remains, but it is considered the largest half statue in Korea with its bold and realistic carving technique. The right leg placed on the left knee is very large and emphasized by raising the knee high. Under the raised bridge, there are three layers of folds of clothes flowing smoothly. Next to them is a large square ring and colorful bead decoration. The footrest is a disk of about 70cm and has seven downward lotus leaves engraved. It is considered to be a work of the mid seventh century. 160 cm in height

8/Stone Vairocana Buddha statue/Unification Silla
It is made of sandstone, and consists of a pedestal carved with one stone and a pedestal and a mistrust. The head of the Buddha statue is a bellflower that embodies the shape of hair being rolled up to the right like a conch, and the top of the head is a hump-like flesh. The face is soft and smooth, with thick eyes and a smile on the corner of the mouth, which seems to show the inner world full of joy. The folds of the clothes are simple, and although the hands are damaged, it is clear that the local authority is holding the index finger of the right hand with the left hand. Yeonhwamun Gate is engraved on the lower and upper stones of the pedestal, and the eight-sided middle statues are engraved on the octagonal middle stones. 196 cm in height

9/Daegu Sangyeok-dong Yeonhwa Unryong Style Seungtap/Goryeo/Treasure No. 135
It follows the basic style of octagonal Wondang of the Silla Dynasty, and shows the characteristics of the Goryeo Dynasty well in the square lower pedestal and middle stone. In particular, the dragons and clouds embossed in the middle stone show a heroic technique. Compared to the pagoda body or roof, the base part is vast, so there is less cheerful feeling, but rather a stable and majestic feeling. What was kept in a private house in Daegu was moved here. The material is granite. 274 cm in height

10/Daegu Sangyeok-dong Lion Rock Decorated Seungtap/Goryeo/Treasure No. 258
It is a typical pagoda of the Goryeo Dynasty that shows the octagonal Wondang-shaped style. The base on the square-shaped stone is composed of upper, middle, and lower stones. Some parts of the roof are damaged, and although the upstream is not complete, the sculptures of each part are magnificent and excellent, and the vertical proportions are well matched. In particular, the cloud-patterned sculptures of Ansang and Ha Daeseok show the characteristics of the times. The material is granite. 247 cm in height

11/Three-story Stone Pagoda/Korea
This stone pagoda, consisting of a two-story upper and lower base and a three-story pagoda body on a surface stone, is relatively simple and simple. Both the pagoda body and the stylobate are embossed with the corner pillar, the universe, and the central pillar, the tangju. In particular, the lower stylobate is engraved with an ornamental statue modeled after the shape of an elephant's eye, and a flower pattern is placed in the center. 228 cm in height

12/Inheungsa Temple Site Three-story Stone Pagoda/Unification Silla
It was moved from the place presumed to be Inheungsa Temple Site and restored. The stone pagoda has four soft-shaped eyes engraved on each side of the upper and upper pedestal of each side of the stone pagoda. Naksu-myeon has a rather steep slope, and the end of the Chuyeo is lightly reversed to show a cheerful appearance. On the upper part of the roof stone on the third floor, there is a circular sari hole with a diameter of about 10 cm and a T-shaped upper ring fixing hole. 410 cm in height

13/Straight Tank/Joseon
It is a water bottle made of stone.

14/Stone Tower/Unification Silla
It is made of sandstone and consists of one pagoda body and two roof stones without a base on a square ground stone. The Four Heavenly Kings are enshrined in the center of the slope of the pagoda body, and each roof stone is engraved with a four-tiered roof support for each roof stone. 128 cm in height

15/Seokdeung/Unification Silla
It is a registration made to light the temple grounds, tombs, and gardens. The granite part, which lights up with only the lower structure of the stone lantern remaining, and the roof stone, which acts as a roof, were lost.

16/Stone Seated Buddha/Unification Silla
It is made of granite, and the head is slightly bent forward, and the hands are overlapped on the knees and meditated. The clothes were covered from arms to knees. On a large square pedestal, it was carved in a shallow chamber. In Soseung Buddhism, Nahan means a person who is at the highest stage of ascension, and in Daeseung Buddhism, a saint who has achieved the best enlightenment, and is tasked with protecting the Buddha's law and saving the public. It was introduced in Korea from the late Three Kingdoms period and was very popular during the Goryeo Dynasty. The excavation site is Gyeongju. 76 cm in height

17/Seated Buddha/Unified Silla
It is a Buddha statue that expresses the lotus pedestal, mistrust, and halo by engraving relief on one side of the stone. On the top of the head, there is a lump-like flesh and hair is not expressed separately. The clothes are tonggyeon that covers both shoulders, and the belt knot of the clothes is visible on the chest. Under the neck is surrounded by three folds. The legs are a position of sitting with two feet on the opposite thigh, with the soles of the feet facing up. The hand is an anti-magazine that lowers the right hand under the right knee and points five fingers to the ground to subdue the devil. 142 cm in height

18/Chilgok Yakmok Tombs/Three Kingdoms
The animal had a feeling about it in 1960. 21m, 1~5m, Hoseok is spinning. Until now, the 1st store has a wall-mounted wall and has minced and flat steel stones, and the next burial is covered with flagstones. This stone wall measures 5.8 m 1.3 m in length and 1.4 m in girth. They didn't arrive in the remote area, they were kicked out by the southern wall and came there, and they were chased away by the southern wall and came there), and the two places that were kicked out right there were kicked out. kicked out The exhibited artifacts are in one exhibition room.

19/Chokhwabi/Joseon
After Byeonginyangyo in 1866 and Sinmiyangyo in 1871, Heungseon Daewongun erected a monument to the country, including Seoul, in April 1871 to strengthen the determination to isolate the country and to warn the people against foreign invasions. On the surface of the tombstone, the inscription “洋夷侵犯non-warning則和主和賣國 (Western barbarians invade, let us reconcile if we do not fight; insisting on reconciliation is to sell the country)” is engraved in large letters and “戒俄萬年子孫丙寅”作 辛未立 (I warn our descendants of all generations. Built in the year of Byeongin and erected in the year of Shinmi)” was engraved in small letters.

20/The Unified Silla and umuldol
Stone over to the top of the well umuldol. A speed higher than a square circle round made the center. The wooden Cover is estimated that he was not to go into the well.

21/Foundation Stone/Unification Silla
It is also called the foundation stone as the foundation stone of the building. It serves to transfer the load coming down through the pillar to the ground.

22/Mojeon Stone Pagoda/Unification Silla
It was built in the style of a tower using stone. This Mojeon Stone Pagoda is not built by processing stones into bricks, but stone pagoda and roof stone are stacked like a stone pagoda, and the left and right universes are omitted from the pagoda stone and the roof stone falls are marked with layers like a front tower. 190cm in height

23/Tower/Joseon
It is a pagoda with an octagonal base stone placed on top of the octagonal pedestal, a roof stone placed on top of it, and an upper stream. The pedestal has double lotus on its upper surface, and on one side of the stylobate, it is vertically engraved as Byeokheodang. The roof stone is carved with lotus flowers on the bottom. The falling water surface of Okgaeseok is somewhat steep, and the end of the Chuyeo is lightly reversed and climbed. The upper ring was carved with jewels on the pedestal. 182 cm in height

24/Jonghyeong Tower/Joseon
The Seokjong-type Seungtap was built with octagonal Wondang-type Seungtap during the Unified Silla Period, and it was especially developed during the Joseon Dynasty after the late Goryeo Dynasty. It is common to build a bell-shaped pagoda body on a square pedestal and place a stupa engraved with jewels at the top, but the pedestal and jewels are now lost.

25/Stone Returned Singer/Joseon
Isu is a stone that decorates the head of a tombstone. The eyes are hemispherical and the nose occupies a wide position in the center. Large teeth are exposed with a wide opening of the mouth, and whiskers and hair are widely carved on both cheeks. This statue serves as a pyeoksa to protect against evil spirits. 50cm in height

26/Seokjoryong Lee Soo/Joseon
The dragon pattern was carved against the backdrop of clouds. The two dragons are facing each other and biting a female pearl. The scales and horns of the dragon are realistically carved. It is the headstone of the tombstone decorated with the shape of a dragon to start the Royal Tomb of King Taejong Muyeol of Silla. 58 cm in height

27/2020 Power cut-off wood ratio/Joseon
The front and back two sides are unique stone monuments written for different purposes, and the front is the Munchjeolmokbi, and the back is the Monument to the Merit of Yi Bang Jeong Geon-hak. This monument lists measures to prevent the recurrence of such evil practices and normalize the station system by case in the Joseon Dynasty, as a bad habit of money flowing to the private sector was caught by secret agents in connection with the taste that was entrusted to raise horses for government affairs. It seems to have been built around 1762 or 1822 based on the marking of Imo in the text, and it seems to have been recycled as a tribute to Yi Bang at the end of the 19th century.

28/Daegu Seokbingobi/Joseon
This monument was erected to commemorate the completion of the Daegu Seokbinggo from 1713 to 1716, and to commemorate the achievements of the famous music of the magistrate. The body of the monument is purple and has a rectangular shape with a rounded top. Seokbinggo is an ice warehouse that was cut off and stored by the river in winter and prevented solar and direct sunlight from entering so that the ice can be taken out and used again in summer. There are currently six Seokbinggo left in the 18th century, and it is mainly distributed in Gyeongsang-do, including Gyeongju and Changnyeong. Its original location is the northern slope of Amisan Mountain (now Banwoldang). 185 cm in height

29/Seokin/Joseon
Seokin is one of the stones erected in front of the tomb. There are literary figures in the shape of civil servants and unmanned figures in the shape of military officers. Stone figures are placed in tombs to symbolize the protection of tombs and the authority of those in power. In China, it started from the Junhan period and in Korea, the tradition continues from the Unified Silla period to the present. The stone seal in Wolpawon is from the Joseon Dynasty, and it can be seen that it develops into a square mold with a majestic effect, characterized by a large head and large ears.

30/Shipbuilding/Joseon
It is a form of Songdeokbi Monument built to commemorate the virtue of the official who gave the selection. When Song Deok-bi was in government office and gave grace and edification, the people built a monument in honor of it. However, there are examples of people threatening the people or forcing the construction of Songdeokbi at the expense of the government officials themselves. In Wolpawon, there are eight Joseon Dynasty monuments, including the Monument to Master of Pankwan Myeongseongak, Cheongdeok Aeminseon Maintenance of Pankwan Myeongseongak, the Monument to Punkwan Myeongseongak, the Monument to Punkwan Kim Ki-hyun, the Monument to Rightbok Jeong Gyeong-hak, and the Monument to Merit.

31/Daegu Icheon-dong Dolmen/Bronze Age
It is part of Jiseokmyo-gun in the 4th district of Daebong-dong, which was investigated during the Japanese colonial period, and the museum of this school conducted two re-excavation surveys in 1990 and 1993. Currently restored are dolmens I and III in District 4. Five stone pavilions and sarcophagus are arranged in a 자 shape with one upper stone at the center, and a square graveyard was made by laying steel around it. The stonewall No. IV built in the center is the largest with a length of 227cm, a width of 55cm, and a depth of 75cm. Dolmen No. III are placed on top of four pedestal stones with a weight of 40 tons, and two stone walls and a stone coffin made of one plate stone are built around them. As relics, Maje stone swords, Maje stone chisels, government offices, and Hongdo were excavated.

32/Daegu Sangin-dong Dolmen/Bronze Age
In 1992, the dolmen in Sangin-dong, which was excavated and investigated by the museum of this school, was relocated and restored. The dolmen in Sangin-dong were built by stacking steel stones to make rectangular stone tombs, and then a square graveyard of 3.5m to 5m on one side was built by laying steel stones around it. In the northeast-southwest direction, five stone tombs were built connecting the graveyard, and two more stone tombs were built near the southeast. The largest cover stone weighs 21 tons, and the rest is about 3 to 5 tons. These dolmen cover stones were used as lid stones on top of stone mound tombs or placed in the center of several stone mound tombs to mark tombs. Many artifacts such as stone knives, stone arrowheads, red clay pottery, and curved jade made of Cheonha stone were excavated around these dolmens and cover stones, and are displayed in the first exhibition hall.

33/Daegu Seojae-ri earthenware kiln/Unified Silla
In 2004, the first kiln out of two earthenware kilns at the western foot of Waryongsan Mountain, which was excavated and investigated by the (re) Yeongnam Cultural Heritage Research Institute, was relocated and restored. The kiln has a semi-underground structure, and it has been identified that the kiln is baked with earthenware, the flue part from which smoke escapes, and the ash and earthenware were discarded at the bottom. In addition, a drain around the kiln was identified. In the kiln, most of the household earthenware such as short wooden pots and bowls were excavated in a carved state. Since most of the pottery is made of Inhwamun, it can be seen that these kilns were used in the late 7th and early 8th centuries. Pottery similar to the pottery excavated from this earthenware kiln is displayed in the second exhibition hall.

34/Sunset[Direct Translation]/Joseon
Literary seats, unmanned seats, a seat for the military, a seat for the upper classIt is one of the stone structures placed around the tomb, such as Mangjuseok and Seokho. It was built from the Jeonhan period in China, and during the Joseon Dynasty, it was built around the tombs of kings and queens and in front of the tombs of the four masters to protect the cemetery.

35/Neckless Buddha/Unified Silla
These are seated Buddha statues from the Unified Silla Period. The absence of all the necks of the Buddha may have been damaged for various reasons such as invasion of foreign enemies, the policy of Soongyueokbul, and the replacement of the Buddha, but it is also because the neck of the Buddha is the weakest of each part and is easy to lose. The neckless Buddha statue is not a complete appearance, but it is a great work of art that reflects our history as it is.

36/Yeonja Mammoth/Joseon
It is a mill that threshes or mills grains. On a round, plate-shaped stone plate, a smaller, round stone is placed on the side, and Maso drags and turns it.

37/Millstone/Joseon
It is a tool that grinds grain into powder.
"""
