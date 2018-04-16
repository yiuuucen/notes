
map01();
$("#btn01").click(function(){
    map01();
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
    var myIcon1 = new BMap.Icon("img/location.png", new BMap.Size(110,43),{
        anchor: new BMap.Size(55, 43)
    });
    var marker1 = new BMap.Marker(pt1,{icon:myIcon1});  // 创建标注
    map.addOverlay(marker1);

    //--第二个圆工作地
    var circle2 = new BMap.Circle(pt2,10000,{strokeColor:"#237cc8",
        strokeWeight:2,
        fillColor:"#237cc8",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });

    //增加圆形
    map.addOverlay(circle2);

    //添加图标
    var myIcon2 = new BMap.Icon("img/location.png", new BMap.Size(110,43),{
        anchor: new BMap.Size(55, 43)
    });
    var marker2 = new BMap.Marker(pt2,{icon:myIcon2});  // 创建标注
    //var marker2 = new BMap.Marker(pt2);  // 创建标注
    map.addOverlay(marker2);

    //--第三个圆
    var circle3 = new BMap.Circle(pt3,10000,{strokeColor:"#237cc8",
        strokeWeight:2,
        fillColor:"#237cc8",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });

    //增加圆形
    map.addOverlay(circle3);

    //添加图标
    var myIcon3 = new BMap.Icon("img/location.png", new BMap.Size(110,43),{
        anchor: new BMap.Size(55, 43)
    });
    var marker3 = new BMap.Marker(pt3,{icon:myIcon3});  // 创建标注

    map.addOverlay(marker3);


    //---给三个圆添加文字
    //居住地

    function opts1(){
        var opts = {
            position : pt1,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(-20, -35)    //设置文本偏移量
        };
        var label = new BMap.Label("区域一", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#2196f3",
            fontSize : "12px",
            height : "24px",
            lineHeight : "20px",
            paddingLeft:"15px",
            border:"none"

        });
        map.addOverlay(label);
    }
    opts1();
    function opts2(){
        var opts = {
            position : pt2,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(-20, -35)    //设置文本偏移量
        };
        var label = new BMap.Label("区域二", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#2196f3",
            fontSize : "12px",
            height : "24px",
            lineHeight : "20px",
            paddingLeft:"15px",
            border:"none"

        });
        map.addOverlay(label);
    }
    opts2();
    function opts3(){
        var opts = {
            position : pt3,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(-20, -35)    //设置文本偏移量
        }
        var label = new BMap.Label("区域三", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#2196f3",
            fontSize : "12px",
            height : "24px",
            lineHeight : "20px",
            paddingLeft:"15px",
            border:"none"

        });
        map.addOverlay(label);
    }
    opts3();
}
