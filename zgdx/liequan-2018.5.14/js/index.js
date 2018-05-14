//tab切换功能
var $tabLi=$('.tab ul li');
var $tabDiv=$('.tab div');
var $tabOl=$('.tab ol');
//初始化
map01();
map02();
$tabDiv.eq(0).css('display','block');
$tabOl.eq(0).css('display','block');

$tabLi.eq(0).attr('class','hActive');
$tabLi.click(function(){
    var index=$(this).index();
    $tabDiv.css('display','none');
    $tabOl.css('display','none');
    $tabDiv.eq(index).css('display','block');
    $tabOl.eq(index).css('display','block');
    $tabLi.attr('class','');
    $tabLi.eq(index).attr('class','hActive');
    map01();
    map02();
})


$("#btn01").click(function(){
    map01();
})
$("#btn02").click(function(){
    map02();
})

function map01(){
    var num1=$("input[my-data='num1']").val();
    var num2=$("input[my-data='num2']").val();
    var num3=$("input[my-data='num3']").val();
    var num4=$("input[my-data='num4']").val();
    var num5=$("input[my-data='num5']").val();
    var num6=$("input[my-data='num6']").val();
    // if(num1==''&&num2==''&&num3==''&&num4==''&&num5==''&&num6==''){
    //     num1==121.24356710396394;
    //     num2==31.188669026176047;
    //     num3==121.5236751742856;
    //     num4==31.112174867118885;
    //     num5==121.49495394125242;
    //     num6==31.12528006297392;
    //     // alert(num1);
    // }
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom("上海", 11);  // 初始化地图,设置中心点坐标和地图级别
    //添加地图类型控件
    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));     
    map.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    // var pt1 = new BMap.Point(121.24356710396394,31.188669026176047);
    // var pt2 = new BMap.Point(121.5236751742856,31.112174867118885);
    // var pt3 = new BMap.Point(121.49495394125242,31.12528006297392);
    var pt1 = new BMap.Point(num1,num2);
    var pt2 = new BMap.Point(num3,num4);
    var pt3 = new BMap.Point(num5,num6);

    //开始添加覆盖

    //--第一个圆居住地
    var circle1 = new BMap.Circle(pt1,10000,{strokeColor:"#237cc8",
        strokeWeight:2,
        fillColor:"#237cc8",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle1);

    //添加图标
    var myIcon1 = new BMap.Icon("img/u-26.png", new BMap.Size(110,43),{
        anchor: new BMap.Size(55, 43)
    });
    var marker1 = new BMap.Marker(pt1,{icon:myIcon1});  // 创建标注
    map.addOverlay(marker1);

    //--第二个圆工作地
    var circle2 = new BMap.Circle(pt2,10000,{strokeColor:"#2dadc2",
        strokeWeight:2,
        fillColor:"#2dadc2",
        fillOpacity: 0.3,
        strokeOpacity:0.9
    });

    //增加圆形
    map.addOverlay(circle2);

    //添加图标
    var myIcon2 = new BMap.Icon("img/u-25.png", new BMap.Size(110,43),{
        anchor: new BMap.Size(55, 43)
    });
    var marker2 = new BMap.Marker(pt2,{icon:myIcon2});  // 创建标注
    //var marker2 = new BMap.Marker(pt2);  // 创建标注
    map.addOverlay(marker2);

    //--第三个圆
    var circle3 = new BMap.Circle(pt3,10000,{strokeColor:"#c23531",
        strokeWeight:2,
        fillColor:"#c23531",
        fillOpacity: 0.3,
        strokeOpacity:0.9});

    //增加圆形
    map.addOverlay(circle3);

    //添加图标
    var myIcon3 = new BMap.Icon("img/u-27.png", new BMap.Size(110,43),{
        anchor: new BMap.Size(55, 43)
    });
    var marker3 = new BMap.Marker(pt3,{icon:myIcon3});  // 创建标注

    map.addOverlay(marker3);
}



function map02(){

    var num11=$("input[my-data='num11']").val();
    var num12=$("input[my-data='num12']").val();
    var num13=$("input[my-data='num13']").val();
    var num14=$("input[my-data='num14']").val();
    var num15=$("input[my-data='num15']").val();
    var num16=$("input[my-data='num16']").val();
    var num17=$("input[my-data='num17']").val();
    var num18=$("input[my-data='num18']").val();
    var num19=$("input[my-data='num19']").val();
    var num20=$("input[my-data='num20']").val();

    // if(num11==''&&num12==''&&num13==''&&num14==''&&num15==''&&num16==''&&num17==''&&num18==''&&num19==''&&num20==''){
    //     num11==121.391;
    //     num12==31.117;
    //     num13==121.558;
    //     num14==31.224;
    //     num15==121.511;
    //     num16==31.268;
    //     num17==121.355;
    //     num18==30.748;
    //     num19==121.283;
    //     num20==31.373;
    // }

    // 第二个图
    // 百度地图API功能
    var map2 = new BMap.Map("allmap2");
    map2.centerAndZoom("上海", 10);
    //添加地图类型控件
    map2.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
    ]}));     
    map2.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
    map2.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    // var Position01=new BMap.Point(121.391,31.117),
    //     Position02=new BMap.Point(121.558,31.224),
    //     Position03=new BMap.Point(121.511,31.268),
    //     Position04=new BMap.Point(121.355,30.748),
    //     Position05=new BMap.Point(121.283,31.373);
    var Position01=new BMap.Point(num11,num12),
        Position02=new BMap.Point(num13,num14),
        Position03=new BMap.Point(num15,num16),
        Position04=new BMap.Point(num17,num18),
        Position05=new BMap.Point(num19,num20);
    var points = [Position01,Position02,Position03,Position04,Position05];

    var curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
    map2.addOverlay(curve); //添加到地图中
}
