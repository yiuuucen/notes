
map01();
$("#btn01").click(function(){
    map01();
})

$("#switch").click(function(){
    
    if($(".tab ol").css("left")=='0px'){
        
        $(".tab ol").animate({
            left:"-255px",
        })
    }else{
        $(".tab ol").animate({
            left:"0px",
        })
    }
})

function mydata(str){
    var n,m;
    // if(str.indexOf("，")>=0){
    //     str=str.replace(/，/ig,',');
    // }
    str=str.replace(/，/ig,',');
    n=str.split(",")[0];
    m=str.split(",")[1];
    return [n,m]
}

function map01(){

    
    var num1=$("input[my-data='num1']").val();
    var num2=$("input[my-data='num2']").val();
    var num3=$("input[my-data='num3']").val();

    var num4=$("input[my-data='num4']").val();
    var num5=$("input[my-data='num5']").val();
    var num6=$("input[my-data='num6']").val();


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
    var pt1 = new BMap.Point(mydata(num1)[0],mydata(num1)[1]);
    var pt2 = new BMap.Point(mydata(num2)[0],mydata(num2)[1]);
    var pt3 = new BMap.Point(mydata(num3)[0],mydata(num3)[1]);

    var pt4 = new BMap.Point(mydata(num4)[0],mydata(num4)[1]);
    var pt5 = new BMap.Point(mydata(num5)[0],mydata(num5)[1]);
    var pt6 = new BMap.Point(mydata(num6)[0],mydata(num6)[1]);

    //开始添加覆盖

    //--第一个圆居住地
    var circle1 = new BMap.Circle(pt1,7000,{strokeColor:"#237cc8",
        strokeWeight:2,
        fillColor:"#237cc8",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle1);

    //添加图标
    var myIcon1 = new BMap.Icon("img/location1.png", new BMap.Size(80,43),{
        anchor: new BMap.Size(40, 43)
    });
    var marker1 = new BMap.Marker(pt1,{icon:myIcon1});  // 创建标注
    map.addOverlay(marker1);

    //--第二个圆工作地
    var circle2 = new BMap.Circle(pt2,7000,{strokeColor:"#237cc8",
        strokeWeight:2,
        fillColor:"#237cc8",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle2);

    //添加图标
    var myIcon2 = new BMap.Icon("img/location1.png", new BMap.Size(80,43),{
        anchor: new BMap.Size(40, 43)
    });
    var marker2 = new BMap.Marker(pt2,{icon:myIcon2});  // 创建标注
    map.addOverlay(marker2);

    //--第三个圆
    var circle3 = new BMap.Circle(pt3,7000,{strokeColor:"#237cc8",
        strokeWeight:2,
        fillColor:"#237cc8",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle3);

    //添加图标
    var myIcon3 = new BMap.Icon("img/location1.png", new BMap.Size(80,43),{
        anchor: new BMap.Size(40, 43)
    });
    var marker3 = new BMap.Marker(pt3,{icon:myIcon3});  // 创建标注
    map.addOverlay(marker3);


/////////////////////////////////////////////////////////////////////////
//--第一个圆居住地
    var circle4 = new BMap.Circle(pt4,7000,{strokeColor:"#f4a942",
        strokeWeight:2,
        fillColor:"#f4a942",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle4);

    //添加图标
    var myIcon4 = new BMap.Icon("img/location2.png", new BMap.Size(80,43),{
        anchor: new BMap.Size(40, 43)
    });
    var marker4 = new BMap.Marker(pt4,{icon:myIcon4});  // 创建标注
    map.addOverlay(marker4);

    //--第二个圆工作地
    var circle5 = new BMap.Circle(pt5,7000,{strokeColor:"#f4a942",
        strokeWeight:2,
        fillColor:"#f4a942",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle5);

    //添加图标
    var myIcon5 = new BMap.Icon("img/location2.png", new BMap.Size(80,43),{
        anchor: new BMap.Size(40, 43)
    });
    var marker5 = new BMap.Marker(pt5,{icon:myIcon4});  // 创建标注
    map.addOverlay(marker5);

    //--第三个圆
    var circle6 = new BMap.Circle(pt6,7000,{strokeColor:"#f4a942",
        strokeWeight:2,
        fillColor:"#f4a942",
        strokeOpacity:0.9,
        fillOpacity: 0.3
    });
    //增加圆形
    map.addOverlay(circle6);

    //添加图标
    var myIcon6 = new BMap.Icon("img/location2.png", new BMap.Size(80,43),{
        anchor: new BMap.Size(40, 43)
    });
    var marker6 = new BMap.Marker(pt6,{icon:myIcon6});  // 创建标注
    map.addOverlay(marker6);

    //---给三个圆添加文字
    //居住地
    function opts1(){
        var opts = {
            position : pt1,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(0, -33)    //设置文本偏移量
        };
        var label = new BMap.Label("区域一", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#2196f3",
            fontSize : "10px",
            height : "15px",
            lineHeight : "15px",        
            border:"none"
        });
        map.addOverlay(label);
    }
    opts1();
    function opts2(){
        var opts = {
            position : pt2,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(0, -33)    //设置文本偏移量
        };
        var label = new BMap.Label("区域二", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#2196f3",
            fontSize : "10px",
            height : "15px",
            lineHeight : "15px",        
            border:"none"
        });
        map.addOverlay(label);
    }
    opts2();
    function opts3(){
        var opts = {
            position : pt3,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(0, -33)    //设置文本偏移量
        };
        var label = new BMap.Label("区域三", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#2196f3",
            fontSize : "10px",
            height : "15px",
            lineHeight : "15px",        
            border:"none"
        });
        map.addOverlay(label);
    }
    opts3();


    function opts4(){
        var opts = {
            position : pt4,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(0, -33)    //设置文本偏移量
        };
        var label = new BMap.Label("区域一", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#f4a942",
            fontSize : "10px",
            height : "15px",
            lineHeight : "15px",        
            border:"none"
        });
        map.addOverlay(label);
    }
    opts4();
    function opts5(){
        var opts = {
            position : pt5,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(0, -33)    //设置文本偏移量
        };
        var label = new BMap.Label("区域二", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#f4a942",
            fontSize : "10px",
            height : "15px",
            lineHeight : "15px",        
            border:"none"
        });
        map.addOverlay(label);
    }
    opts5();
    function opts6(){
        var opts = {
            position : pt6,    // 指定文本标注所在的地理位置
            offset   : new BMap.Size(0, -33)    //设置文本偏移量
        };
        var label = new BMap.Label("区域三", opts);  // 创建文本标注对象
        label.setStyle({
            color : "#fff",
            background:"#f4a942",
            fontSize : "10px",
            height : "15px",
            lineHeight : "15px",        
            border:"none"
        });
        map.addOverlay(label);
    }
    opts6();
}
