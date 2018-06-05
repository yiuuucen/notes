<%--
  Created by IntelliJ IDEA.
  Date: 2017/12/5
  Time: 下午12:46
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
    <meta charset="utf-8" />
    <title>区域轨迹</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <%--<script type="text/javascript" src="${js}/track.js" ></script>--%>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=hSIt0DcToAglz6yjLDKGAeYD"></script>--%>
    <%--<script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>--%>
    <script type="text/javascript" src="${js}/bmap.js" ></script>
    <script type="text/javascript" src="${js}/china.js"></script>


    <script>
        $(function(){
            
            $(".list li").children("span:first-child").on("click",function(){
               // alert(1)
            });

            $("#navList li").removeClass("active");
            $("#navList li:eq(2)").addClass("active");

            $("#img1").attr("src","${img}/u-03.png");
            $("#img2").attr("src","${img}/u-04.png");
            $("#img3").attr("src","${img}/u-05c.png");


        });

    </script>
</head>
<body>
<div id="region-reset"></div>
<div class="container-fluid smartEyes-container">
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox">
        <!---->
        <div class="col-lg-12 namelist area clearfix">
            <div class="pull-left namelistcc ">
                <span>当前重点人员：</span>
                <span id="tit-person"></span>
                <span id="tit-area">&nbsp;&nbsp;&nbsp;最常活动区域：</span>
            </div>
            <div class="pull-right text-right input-group col-lg-5">
                <!--<input placeholder="2017-10-01 16:49" type="text" class="pull-right datetimepicker" />
                <input placeholder="2017-10-02 16:49" type="text" class="pull-right datetimepicker" />-->
                <%--<select class="pull-right select" style="margin-top: 7px; margin-right: 16px;">--%>
                    <%--<option value="最近一天" selected=''>&nbsp;最近一天</option>--%>
                    <%--<option value="最近一周">&nbsp;最近一周</option>--%>
                    <%--<option value="最近一月">&nbsp;最近一月</option>--%>
                    <%--<option value="最近一年">&nbsp;最近一年</option>--%>
                    <%--<option value="自定义">&nbsp;自定义</option>--%>
                    <%--<option value="全部">&nbsp;全部</option>--%>
                <%--</select>--%>
            </div>
        </div>
        <!--区域地图展示-->
        <div class="mapBox col-lg-12" >
            <!---->
            
            <ul class="listArea">
                <li class="pull-left active"><a href="javascript:;">热力图</a></li>
                <li class="pull-left"><a href="javascript:;">活动区域</a></li>
                <li class="pull-left"><a href="javascript:;">活动轨迹</a></li>
            </ul>
            <div class="mapk maplist" id="allmap">
                <!--可疑活动轨迹-->

            </div>
            <div class="mapc maplist" id="allmap2">
                <!--常活动区域-->

            </div>
            
	        <div class="maph maplist map3" id="allmap3_1">
	                <!--活动轨迹-->
	                <!--<img src="img/u-21.png" width="100%" />-->
	        </div>
	        <div class="maph maplist map3" id="allmap3_2">
	                <!--活动轨迹-->
	                <!--<img src="img/u-21.png" width="100%" />-->
	        </div>
	            <ul class="track" style="display: none;">
	                <li class="active">
	                    <span class="pull-left"></span>
	                    <div class="pull-right tracklist">
	                        <p>轨迹1:工作轨迹</p>
	                        <%--<p>8:14-9:26</p>--%>
	                        <p>8:14-9:26</p>
	                    </div>
	                </li>
	                <li>
	                    <span class="pull-left"></span>
	                    <div class="pull-right tracklist">
	                        <p>轨迹2:可疑轨迹</p>
	                        <p>17:40-19:00</p>
	                    </div>
	                </li>
	                
	            </ul>
            
        </div>
    </div>
	<div>
        <%--search页的提交框--%>
        <div class="no_data_tip" style="display: none;">
            <div class="submit_box">
                	当前重点人员无位置与轨迹信息。
            </div>
        </div>
    </div>
</div>
<!--底部-->
<footer style="background: none;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
<script>
    function tab(classname,boxDivlist){
        $(classname).children("li").click(function(){
            var index=$(this).index();
            if(index==2){
                $(".track").show();
                if($(".track li:eq(0)").hasClass("active")){
        
        			$("#allmap3_1").show().css("opacity",'1').siblings(".maplist").hide().css('opacity','0');
                }else{
                	$("#allmap3_2").show().css("opacity",'1').siblings(".maplist").hide().css('opacity','0');
                }
            }else{
                $(".track").hide();
	            $(boxDivlist).children(".maplist").eq(index).show().css("opacity",'1').siblings(".maplist").hide().css('opacity','0');
            }
            $(this).addClass("active").siblings("li").removeClass("active");
            //提示弹框：当前重点人员无位置与轨迹信息
            if((index==0 && !map1HasDataFlag) ||
            	(index==1 && !map2HasDataFlag) ||
            	(index==2 && !map3HasDataFlag)){
            	var timer=null;
                clearTimeout(timer);
                $(".no_data_tip").show();
                timer=setTimeout(function(){
                    $(".no_data_tip").hide();
                },3000);
            }
        })
    };
    tab(".listArea",".mapBox");
</script>

<%--<script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>--%>
<%--<script type="text/javascript" src="${js}/bmap.js" ></script>--%>
<%--<script type="text/javascript" src="${js}/china.js"></script>--%>

<script type="text/javascript">
//    获取页面高度加了这个页面会变乱;
//    var h= $(window).height();
//    $(".maplist").height(h-100);
    var targetPhone = $("#targetPhone").val();
    var showPersonInfo = "";
	showPersonInfo = "SE"+targetPhone.slice(0,3)+"****"+targetPhone.slice(7,11);
	//涉案类型
	//涉案类型
    var type = '${suspectType}';
	if(type!=''){
		showPersonInfo += "&nbsp;&nbsp;&nbsp;"+type+"人员";
	}
	$('#tit-person').html(showPersonInfo);

    //var mydata = [[],[],[]];
    var mydata;//存放坐标数据
    var map1HasDataFlag=false;//热力图-常活动区域是否有数据
    var map2HasDataFlag=false;//活动区域是否有数据
    var map3HasDataFlag=false;//活动轨迹是否有数据
    
    //地图展示高度
    var h= $(window).height()-120;
    $(".maplist").height(h);
    //加载动画效果
    var myChart1 = echarts.init(document.getElementById('allmap'));
	myChart1.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
    });
    var myChart31 = echarts.init(document.getElementById('allmap3_1'));
	myChart31.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
    });
    var myChart32 = echarts.init(document.getElementById('allmap3_2'));
	myChart32.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
    });
    //活动区域
    map02();
    //获取活动区域-热力图
    map01();
    
    var mytrack1 = [];//工作轨迹
    var mytrack2 = [];//可疑轨迹
    //获取工作轨迹
	map03_1();
    //获取可疑轨迹
	map03_2();
	//设置上方文字
	setArea();
	
	
    $("#region-reset").click(function(){
     	if(!$("#allmap").is(":hidden")){map01();}
     	else if(!$("#allmap2").is(":hidden")){map02();}
     	else if(!$("#allmap3_1").is(":hidden")){map03_1();}
     	else if(!$("#allmap3_2").is(":hidden")){map03_2();}
    });
    
    function setArea(){
    	//设置上方文字
	    var myGeo = new BMap.Geocoder();
	    var len = mydata.length;
	    var dupresult = [];
	    if(map2HasDataFlag){
	    	myGeo.getLocation(new BMap.Point(mydata[0][0], mydata[0][1]), function(result){
	
	        if (result){
	            $('#tit-area').append(""+result.addressComponents.district);
	            dupresult.push(""+result.addressComponents.district);
	        }
	        for(var i = 1;i<len;i++){
	
	            myGeo.getLocation(new BMap.Point(mydata[i][0], mydata[i][1]), function(result){
	
	                if (result){
	                    if(dupresult.indexOf(result.addressComponents.district)===-1){
	                        $('#tit-area').append("、"+result.addressComponents.district);
	                        dupresult.push(""+result.addressComponents.district);
	                    }else {}
	                }else {}
	
	            });
	        }
	
	    });
	    }else{
	    	$('#tit-area').append("暂无常活动区域");
	    }
    }

    
    
    $(".track li").click(function(){
        //轨迹切换显示
        var index=$(this).index();
        $(this).addClass("active").siblings("li").removeClass("active");
        //$(".map3").hide();
        $("#allmap3_"+(index+1)).show();
        
        $("#allmap3_"+(index+1)).show().css("opacity",'1').siblings(".maplist").hide().css('opacity','0');
    });
  
    
    function map02(){
        // 百度地图API功能
        var map = new BMap.Map("allmap2");  // 创建Map实例

        //map.centerAndZoom("上海",15); // 初始化地图,用城市名设置地图中心点

//        var point = new BMap.Point(121.473,31.232);
//        map.centerAndZoom(point, 15);

		
        //设置mydata初始化数据
        $.ajax({
            type: "GET",
            async: false,
            url: window.ctx+"/region/getRegion?targetPhone="+targetPhone,
            dataType: "json",
            //[ [121.24356710396394,31.188669026176047], [121.5236751742856,31.112174867118885], [121.49495394125242,31.12528006297392] ]
            success: function (data) {
            	mydata = data;
            	
            	if(mydata!= null&& mydata.length>0){
            		map2HasDataFlag = true;
            		map3HasDataFlag = true;
            	}
            	
            },
            error: function () {
                alert("获取失败，请联系管理员！");
            }
        });

       // console.log(mydata.length);
        //创建一个中心点
        //var x = (mydata[0][0]+mydata[1][0]+mydata[2][0])/3;
        //var y = (mydata[0][1]+mydata[1][1]+mydata[2][1])/3;
        //var point = new BMap.Point(x,y);
        var point=null;
        if(map2HasDataFlag){//已获取坐标数据
	        point = new BMap.Point(mydata[1][0],mydata[1][1]);
	        map.centerAndZoom(point, 15);
        }else{//未获取坐标数据
        	var point = new BMap.Point(121.473,31.232);
			map.centerAndZoom(point, 15);
        }


        //设置缩放
        map.enableScrollWheelZoom(true);
        map.setMapStyle({style:'grayscale'});//灰色皮肤
        
        if(!map2HasDataFlag){
        	return;
        }

        //初始化获得的几个点
        var pt1 = new BMap.Point(mydata[0][0],mydata[0][1]);
        var pt2 = new BMap.Point(mydata[1][0],mydata[1][1]);
        var pt3 = new BMap.Point(mydata[2][0],mydata[2][1]);


        //开始添加覆盖

        //--第一个圆居住地
        var circle1 = new BMap.Circle(pt1,500,{strokeColor:"#237cc8",
            strokeWeight:2,
            fillColor:"#237cc8",
            strokeOpacity:0.9,
            fillOpacity: 0.3
        });
        //增加圆形
        map.addOverlay(circle1);

        //添加图标
        var myIcon1 = new BMap.Icon("${img}/u-26.png", new BMap.Size(110,43),{
            anchor: new BMap.Size(55, 43)
        });
        var marker1 = new BMap.Marker(pt1,{icon:myIcon1});  // 创建标注
        map.addOverlay(marker1);

        //--第二个圆工作地
        var circle2 = new BMap.Circle(pt2,500,{strokeColor:"#2dadc2",
            strokeWeight:2,
            fillColor:"#2dadc2",
            fillOpacity: 0.3,
            strokeOpacity:0.9
        });

        //增加圆形
        map.addOverlay(circle2);

        //添加图标
        var myIcon2 = new BMap.Icon("${img}/u-25.png", new BMap.Size(110,43),{
            anchor: new BMap.Size(55, 43)
        });
        var marker2 = new BMap.Marker(pt2,{icon:myIcon2});  // 创建标注
        //var marker2 = new BMap.Marker(pt2);  // 创建标注
        map.addOverlay(marker2);

        //--第三个圆
        var circle3 = new BMap.Circle(pt3,500,{strokeColor:"#c23531",
            strokeWeight:2,
            fillColor:"#c23531",
            fillOpacity: 0.3,
            strokeOpacity:0.9});

        //增加圆形
        map.addOverlay(circle3);

        //添加图标
        var myIcon3 = new BMap.Icon("${img}/u-27.png", new BMap.Size(110,43),{
            anchor: new BMap.Size(55, 43)
        });
        var marker3 = new BMap.Marker(pt3,{icon:myIcon3});  // 创建标注

        map.addOverlay(marker3);


        //---给三个圆添加文字
        //居住地

        function opts1(){
            var opts = {
                position : pt1,    // 指定文本标注所在的地理位置
                //offset   : new BMap.Size(10, -100)    //设置文本偏移量
                offset   : new BMap.Size(-27, 5)    //设置文本偏移量
            };
            var label = new BMap.Label("居住地", opts);  // 创建文本标注对象
            label.setStyle({
                color : "#fff",
                fontSize : "12px",
                height : "24px",
                lineHeight : "20px",
                paddingLeft:"10px",
                paddingRight:"44px",
                background:"#237cc8",
                border:"none"

            });
            map.addOverlay(label);
        }
        //opts1();
        function opts2(){
            var opts = {
                position : pt2,    // 指定文本标注所在的地理位置
                //offset   : new BMap.Size(10, -100)    //设置文本偏移量
                offset   : new BMap.Size(-27, 5)    //设置文本偏移量
            };
            var label = new BMap.Label("工作地", opts);  // 创建文本标注对象
            label.setStyle({
                color : "#ffffff",
                fontSize : "12px",
                height : "24px",
                lineHeight : "20px",
                paddingLeft:"10px",
                paddingRight:"44px",
                background:"#2dadc2",
                border:"none"

            });
            map.addOverlay(label);
        }
        //opts2();
        function opts3(){
            var opts = {
                position : pt3,    // 指定文本标注所在的地理位置
                // offset   : new BMap.Size(3, -75)    //设置文本偏移量
                offset   : new BMap.Size(-27, 5)    //设置文本偏移量
            }
            var label = new BMap.Label("A区域", opts);  // 创建文本标注对象
            label.setStyle({
                color : "#ffffff",
                fontSize : "12px",
                height : "24px",
                lineHeight : "20px",
                paddingLeft:"10px",
                paddingRight:"44px",
                background:"#c23531",
                border:"none"

            });
            map.addOverlay(label);
        }

        //opts3();

    }

    ///常活动区-热力图
    function map01(){
        var myChart = echarts.init(document.getElementById('allmap'));

        var tp = $("#targetPhone").val();
        $.ajax({
            type:"GET",
            url:window.ctx+"/location/getReginHeatMap?targetPhone="+tp,
            dataType:"json",
            success:function (data) {
                console.log(1);
            	if(data!=null && data.length>0){
            		map1HasDataFlag = true;
            	}
                var points = data.map(function (seg) {
                    return seg.coord.concat([1]);
                });
                
                myChart.hideLoading();
                myChart.clear();
                myChart.setOption(option = {
                    animation: false,
                    bmap: {
                        center: [121.477208, 31.23152],
                        zoom: 10,
                        roam: true
                    },
                    visualMap: {
                        show: false,
                        top: 'top',
                        min: 0,
                        max: 5,
                        seriesIndex: 0,
                        calculable: true,
                        inRange: {
                            color: ['blue', 'blue', 'green', 'yellow', 'red']
                        }
                    },
                    series: [{
                        type: 'heatmap',
                        coordinateSystem: 'bmap',
                        data: points,
                        pointSize: 5,
                        blurSize: 6
                    }]
                });

                // 添加百度地图插件
                var bmap = myChart.getModel().getComponent('bmap').getBMap();
                //变颜色
                bmap.setMapStyle({style:'grayscale'});//灰色皮肤
                bmap.addControl(new BMap.MapTypeControl({
                    mapTypes:[
                        BMAP_NORMAL_MAP
                    ]}));
                    
                //如果没有数据，则弹出提示层
                if(!map1HasDataFlag){
					var timer=null;
			        clearTimeout(timer);
			        $(".no_data_tip").show();
			        timer=setTimeout(function(){
			            $(".no_data_tip").hide();
			        },4000);
				}
            },
            error:function () {
                alert("获取失败，请联系管理员！");

            }
        });

        <%--var polygon = new BMap.Polygon([--%>
            <%--new BMap.Point(121.479623,31.233832),--%>
            <%--new BMap.Point(121.472653,31.233932),--%>
            <%--new BMap.Point(121.471653,31.238932),--%>
            <%--new BMap.Point(121.475653,31.238932),--%>
            <%--new BMap.Point(121.482653,31.238939),--%>
            <%--new BMap.Point(121.482653,31.238939),--%>
            <%--new BMap.Point(121.482453,31.238939)--%>

        <%--], {strokeColor:"#c23531", strokeWeight:2,fillColor:"#c23531",fillOpacity: 0.3, strokeOpacity:0.9});  //创建多边形--%>
        <%--map.addOverlay(polygon);   //增加多边形--%>
        <%--//添加图标--%>
        <%--var pt = new BMap.Point(121.483993,31.238832);--%>
        <%--var myIcon = new BMap.Icon("${img}/u-27.png", new BMap.Size(300,87));--%>
        <%--var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注--%>
        <%--map.addOverlay(marker2);--%>
        //添加文字
//        function opts(){
//            var opts = {
//                position : point,    // 指定文本标注所在的地理位置
//                offset   : new BMap.Size(10, -100)    //设置文本偏移量
//            }
//            var label = new BMap.Label("A区域", opts);  // 创建文本标注对象
//            label.setStyle({
//                color : "#ffffff",
//                fontSize : "12px",
//                height : "24px",
//                lineHeight : "20px",
//                paddingLeft:"10px",
//                paddingRight:"44px",
//                background:"#c23531",
//                border:"none"
//
//            });
//            map.addOverlay(label);
//        }
//
//        opts();
//
//        function opts2(){
//            var opts = {
//                position : point,    // 指定文本标注所在的地理位置
//                offset   : new BMap.Size(-470, -100)    //设置文本偏移量
//            }
//            var label = new BMap.Label("B区域", opts);  // 创建文本标注对象
//            label.setStyle({
//                color : "#fff",
//                fontSize : "12px",
//                height : "24px",
//                lineHeight : "20px",
//                paddingLeft:"10px",
//                paddingRight:"44px",
//                background:"#c23531",
//                border:"none"
//
//            });
//            map.addOverlay(label);
//        }
//        opts2();



        <%--var polygon2 = new BMap.Polygon([--%>
            <%--new BMap.Point(121.448623,31.228832),--%>
            <%--new BMap.Point(121.432653,31.233932),--%>
            <%--new BMap.Point(121.431653,31.238932),--%>
            <%--new BMap.Point(121.445653,31.238932),--%>
            <%--new BMap.Point(121.442653,31.238939),--%>
            <%--new BMap.Point(121.432653,31.238939),--%>
            <%--new BMap.Point(121.452957,31.238939)--%>

        <%--], {strokeColor:"#c23531", strokeWeight:2, strokeOpacity:0.9,fillColor:"#c23531",fillOpacity: 0.3});  //创建多边形--%>
        <%--map.addOverlay(polygon2);   //增加多边形--%>

        <%--var pt2 = new BMap.Point(121.449623,31.238832);--%>
        <%--var myIcon2 = new BMap.Icon("${img}/u-27.png", new BMap.Size(290,87));--%>
        <%--var marker3 = new BMap.Marker(pt2,{icon:myIcon2});  // 创建标注--%>
        <%--map.addOverlay(marker3);--%>


    }
    /**
     *
     * @param start {lng:LNG, lat:LAT}
     * @param end {lng:LNG, lat:LAT}
     */
    function track(start, end,mt) {
        var url = 'http://api.map.baidu.com/direction/v2/transit?ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p';
        url += '&origin=' + start.lat + ',' + start.lng;
        url += '&destination=' + end.lat + ',' + end.lng;

        //var res = [];
        $.ajax({
            type: "GET",
            //async: false,
            url: url,
            dataType: "jsonp",
            success: function (data) {
                if (data.message === '成功') {
                    var route = data.result.routes[0].steps;
                    for (var s = 0; s < route.length; s++) {
                        var arr = route[s][0].path.split(';');
                        for (var i = 0; i < arr.length; i += 5) {
                            var point = arr[i].split(',');
                            //res.push({lng: point[0], lat: point[1]});
                            mt.push([point[0],point[1]]);
                        }
                    }
                    //fn(mydata,res);
                    //cb(mt);


                }
            },
            error: function () {
                alert("获取失败，请联系管理员！");
            }
        });
        //return res;
    }


    //var a = track({lng:mydata[0][0], lat:mydata[0][1]},{lng:mydata[1][0], lat:mydata[1][1]},mytrack1);
    //var b = track({lng:mydata[0][0], lat:mydata[0][1]},{lng:mydata[2][0], lat:mydata[2][1]},mytrack2);
	//获取工作轨迹
	function map03_1() {
		if(!map3HasDataFlag){//没有位置信息
			map03(mydata, mytrack1, 1);
			return;
		}
	    $.when($.ajax({
	        type: "GET",
	        //如果设置为false没有正确变为同步
	        async: false,
	        url: 'http://api.map.baidu.com/direction/v2/transit?ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p&origin='
	        + mydata[0][1] + ',' + mydata[0][0] + '&destination=' + mydata[1][1] + ',' + mydata[1][0],
	        dataType: "jsonp",
	        success: function (data) {
	            if (data.message === '成功') {
	                mytrack1 = [];
	                if(data.result.routes== null ||data.result.routes.length<=0){
	                	return mytrack1;
	                }
	                var route = data.result.routes[0].steps;
	                for (var s = 0; s < route.length; s++) {
	                    var arr = route[s][0].path.split(';');
	                    for (var i = 0; i < arr.length; i += 5) {
	                        var point = arr[i].split(',');
	                        //res.push({lng: point[0], lat: point[1]});
	                        mytrack1.push([point[0], point[1]]);
	                    }
	                }
	
	                return mytrack1;
	
	
	            }
	        },
	        error: function () {
	            alert("获取失败，请联系管理员！");
	        }
	    })).done(function cb() {
	    	/*if (myChart3_1 !== null && myChart3_1 !== "" && myChart3_1 !== undefined) {
            	myChart3_1.dispose();
        	}
        	myChart3_1 = echarts.init(document.getElementById('allmap3_1'));*/
	        map03(mydata, mytrack1, 1);
	
	    });
	}
	
	//获取可疑轨迹
	function map03_2(){
		if(!map3HasDataFlag){//没有位置信息
			map03(mydata, mytrack2, 2);
			return;
		}
		$.when($.ajax({
			type: "GET",
            //async: false,
            url: 'http://api.map.baidu.com/direction/v2/transit?ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p&origin='
                    +mydata[0][1]+','+mydata[0][0]+'&destination='+mydata[2][1]+','+mydata[2][0],
            dataType: "jsonp",
            success: function (data) {
            	if (data.message === '成功') {
                    mytrack2 = [];
                    if(data.result.routes== null ||data.result.routes.length<=0){
				        return mytrack2;
				    }
                    var route = data.result.routes[0].steps;
                    for (var s = 0; s < route.length; s++) {
	                    var arr = route[s][0].path.split(';');
	                    for (var i = 0; i < arr.length; i += 5) {
		                    var point = arr[i].split(',');
		                    //res.push({lng: point[0], lat: point[1]});
		                    mytrack2.push([point[0],point[1]]);
	                    }
                    }

                    return mytrack2;

                 }
            },
            error: function () {
               alert("获取失败，请联系管理员！");
            }
		})).done(function cb() {
			/*if (myChart3_2 !== null && myChart3_2 !== "" && myChart3_2 !== undefined) {
            	myChart3_2.dispose();
        	}
        	myChart3_2 = echarts.init(document.getElementById('allmap3_2'));*/
        	map03(mydata,mytrack2,2);

        });
	}


    ///活动轨迹
    function map03(mydata,mytrack,index){
        var myChart3 = echarts.init(document.getElementById('allmap3_'+index));

        //一条线路三个点
        var len = mytrack.length;

        var myptArr = [];

        if(len > 5)
        {
            var pt11 = Math.floor(len/4);
//            console.log("1:"+pt11);
            var pt12 = Math.floor(len/2);
//            console.log("2:"+pt12);
            var pt13 = Math.floor(3*len/4);
//            console.log("3:"+pt13);

            myptArr.push(mytrack[pt11]);
//            console.log(mytrack[pt11]);
            myptArr.push(mytrack[pt12]);
//            console.log(mytrack[pt12]);
            myptArr.push(mytrack[pt13]);
//            console.log(mytrack[pt13]);

        }else{
            console.log("当前数据小于5个");

        };
		
		var centerPoint={};
		if(!map3HasDataFlag){//没有位置信息时
			centerPoint = {
	            x: 121.473,
	            y: 31.232
	        };
		}else{
			if(myptArr.length>0){//有轨迹时,获取轨迹坐标作为中心点
			
				centerPoint = {
		            x: myptArr[1][0],
		            y: myptArr[1][1]
		        };
			}else{	//没有轨迹时,获取居住地坐标作为中心点
		        centerPoint = {
		            x: mydata[0][0],
		            y: mydata[0][1]
		        };
			
			}
		
		}
		
		//var zoomSize =  getBMapZoomSize(mydata,index);
		
// 地图自定义样式
        var bmap = {
            center: [centerPoint.x, centerPoint.y],
            zoom: 12,
            roam: true
            /*mapStyle: {
                styleJson: [{
                    "featureType": "water",
                    "elementType": "all",
                    "stylers": {
                        "color": "#d1d1d1"
                    }
                }, {
                    "featureType": "land",
                    "elementType": "all",
                    "stylers": {
                        "color": "#f3f3f3"
                    }
                }, {
                    "featureType": "boundary",
                    "elementType": "geometry",
                    "stylers": {
                        "color": "#979797"
                    }
                }, {
                    "featureType": "railway",
                    "elementType": "all",
                    "stylers": {
                        "visibility": "off"
                    }
                }, {
                    "featureType": "highway",
                    "elementType": "geometry",
                    "stylers": {
                        "color": "#ffffff"
                    }
                }, {
                    "featureType": "highway",
                    "elementType": "geometry.fill",
                    "stylers": {
                        "color": "#979797",
                        "lightness": 1
                    }
                }, {
                    "featureType": "highway",
                    "elementType": "labels",
                    "stylers": {
                        "visibility": "off"
                    }
                }, {
                    "featureType": "arterial",
                    "elementType": "geometry",
                    "stylers": {
                        "color": "#ffffff"
                    }
                }, {
                    "featureType": "arterial",
                    "elementType": "geometry.fill",
                    "stylers": {
                        "color": "#ffffff"
                    }
                }, {
                    "featureType": "poi",
                    "elementType": "all",
                    "stylers": {
                        "visibility": "off"
                    }
                }, {
                    "featureType": "gray",
                    "elementType": "all",
                    "stylers": {
                        "color": "#979797",
                        "visibility": "off"
                    }
                }, {
                    "featureType": "subway",
                    "elementType": "all",
                    "stylers": {
                        "visibility": "off"
                    }
                }, {
                    "featureType": "manmade",
                    "elementType": "all",
                    "stylers": {
                        "visibility": "off"
                    }
                }, {
                    "featureType": "local",
                    "elementType": "all",
                    "stylers": {
                        "visibility": "true"
                    }
                }, {
                    "featureType": "arterial",
                    "elementType": "labels",
                    "stylers": {
                        "visibility": "off"
                    }
                }, {
                    "featureType": "boundary",
                    "elementType": "geometry.fill",
                    "stylers": {
                        "color": "#979797"
                    }
                }, {
                    "featureType": "building",
                    "elementType": "all",
                    "stylers": {
                        "color": "#979797"
                    }
                }, {
                    "featureType": "label",
                    "elementType": "all",
                    "stylers": {
                        "visibility": "true"
                    }
                }]
            }*/
        }

		var geoCoordMap={};
		if(mydata.length==3){
	        geoCoordMap = {
	
	            '居住地':[mydata[0][0],mydata[0][1]],
	            '工作地':[mydata[1][0],mydata[1][1]],
	            '可疑地':[mydata[2][0],mydata[2][1]],
	        };
	        if(myptArr.length>0){
	        	geoCoordMap['工作途径点1']=[myptArr[0][0],myptArr[0][1]];
	        	geoCoordMap['可疑途径点1']=[myptArr[0][0],myptArr[0][1]];
	        }
	        
	        if(myptArr.length>1){
	        	geoCoordMap['工作途径点2']=[myptArr[1][0],myptArr[1][1]];
	        	geoCoordMap['可疑途径点2']=[myptArr[1][0],myptArr[1][1]];
	        }
	        
	        if(myptArr.length>2){
	        	geoCoordMap['工作途径点3']=[myptArr[2][0],myptArr[2][1]];
	        	geoCoordMap['可疑途径点3']=[myptArr[2][0],myptArr[2][1]];
	        }
		}




        var GZDData = [

            [{
                name: '居住地'
            }, {
                name: '工作途径点1',
                value: 40
            }],
            [{
                name: '工作途径点1'
            }, {
                name: '工作途径点2',
                value: 40
            }],
            [{
                name: '工作途径点2'
            }, {
                name: '工作途径点3',
                value: 40
            }],
            [{
                name: '工作途径点3'
            }, {
                name: '工作地',
                value: 40
            }]
        ];

        var KYDData = [
            [{
                name: '居住地'
            }, {
                name: '可疑途径点1',
                value: 40
            }],
            [{
                name: '可疑途径点1'
            }, {
                name: '可疑途径点2',
                value: 40
            }],
            [{
                name: '可疑途径点2'
            }, {
                name: '可疑途径点3',
                value: 40
            }],
            [{
                name: '可疑途径点3'
            }, {
                name: '可疑地',
                value: 40
            }]

        ];





        var planePath = '';

        //data是二维数组，每一项是一个边，穿的是SHDdata，SHData里面每一项是一个地点to另一个地点
        var convertData = function(data) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var dataItem = data[i];
                var fromCoord = geoCoordMap[dataItem[0].name];
                var toCoord = geoCoordMap[dataItem[1].name];
                if (fromCoord && toCoord) {
                    res.push({
                        fromName: dataItem[0].name,
                        toName: dataItem[1].name,
                        coords: [fromCoord, toCoord]
                    });
                }
            }
            return res;
        };

        var color = ['#237cc8', '#237cc8', '#237cc8'];
        var series = [];
        var draw = [];
        switch(index)
        {
            case 1:
                draw = [];
                draw.push(['居住地', GZDData,'工作轨迹']);
                break;
            case 2:
                draw = [];
                draw.push(['居住地', KYDData,'可疑轨迹']);
                break;
        }
        draw.forEach(function(item, i) {
            series.push(
                //设置起始点
                {
                //name: item[0] ,
                //带有涟漪特效动画的散点（气泡）图。利用动画特效可以将某些想要突出的数据进行视觉突出。
                type: 'effectScatter',
                coordinateSystem: 'bmap',
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        formatter: '{b}'

                    }
//                    emphasis: {
//                        show: false,
//
//                        formatter: '{c}'
//
//                    }
                },
                symbolSize: function(val) {
                  // return val[2] / 4;
                   return 10;
                },
                showEffectOn: 'render',
                itemStyle: {
                    normal: {
                        color: color[i]
                    }
                },
                data: [{
                    name: item[0],
                    //value: geoCoordMap[item[0]].concat([40])
                    value: geoCoordMap[item[0]]
                }]
            },
                //白线
                    {
                    name: item[0] ,
                    type: 'lines',
                    coordinateSystem: 'bmap',
                    zlevel: 1,
                    effect: {
                        show: true,
                        period: 6,
                        trailLength: 0.7,
                        color: '#fff',
                        symbolSize: 3
                    },
                    lineStyle: {
                        normal: {
                            color: color[i],
                            width: 0,
                            curveness: 0.2
                        }
                    },
                    data: convertData(item[1])
                },
                //黄线
                {
                name: item[2],
                type: 'lines',
                coordinateSystem: 'bmap',
                zlevel: 2,
                effect: {
                    show: true,
                    period: 6,
                    trailLength: 0,
                    symbol: 'arrow',
                    symbolSize: 10
                },
                lineStyle: {
                    normal: {
                        color: color[i],
                        width: 3,
                        opacity: 0.8,
                        curveness: 1
                    }
                },
                data: convertData(item[1])
            },
                //涟漪点
                {
                //name: item[0] ,
                type: 'effectScatter',
                coordinateSystem: 'bmap',
                zlevel: 10,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                symbolSize: function(val) {
                   // return val[2] / 4;
                    return 10;
                },
                showEffectOn: 'render',
                itemStyle: {
                    normal: {
                        color: color[i]
                    }
                },
                data: item[1].map(function(dataItem) {
                    return {
                        name: dataItem[1].name,
                        //value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
                       // value: geoCoordMap[dataItem[1].name].concat([40])
                        value: geoCoordMap[dataItem[1].name]
                    };
                })
            }
            );
        });

        option = {
            bmap: bmap,
            color: ['gold', 'aqua', 'lime'],
            backgroundColor: '#d1d1d1',

            tooltip: {
                trigger: 'item'
            },

            geo: {
                map: 'bmap',
                polyline: true,
                progressiveThreshold: 40,
                progressive: 40,
                label: {
                    emphasis: {
                        show: true
                    }
                },
                roam: true,
                itemStyle: {
                    normal: {
                        areaColor: '#323c48',
                        borderColor: '#404a59'
                    },
                    emphasis: {
                        areaColor: '#2a333d'
                    }
                }
            },
            series: series
        };

		myChart3.hideLoading();
		myChart3.clear();
        myChart3.setOption(option);
        
        // 添加百度地图插件
        var bmap = myChart3.getModel().getComponent('bmap').getBMap();
        //变颜色
        bmap.setMapStyle({style:'grayscale'});//灰色皮肤
        bmap.addControl(new BMap.MapTypeControl({
            mapTypes:[
                BMAP_NORMAL_MAP
        ]}));
        
        //根据提供的地理区域或坐标设置地图视野，调整后的视野会保证包含提供的地理区域或坐标
        var viewPointArray = getPointArray(mydata,myptArr,index);//获取需要展示的坐标位置
		bmap.setViewport(viewPointArray);

    }
    //track({lng:mydata[0][0], lat:mydata[0][1]},{lng:mydata[1][0], lat:mydata[1][1]},mydata,map03);
    //track({lng:mydata[0][0], lat:mydata[0][1]},{lng:mydata[2][0], lat:mydata[2][1]},mydata,map03);
    //map03(mydata,mytrack1,mytrack2);
    
    //获取需要展示的坐标位置
	function getPointArray(mydata,myptArr,index){
		var pointArray=new Array();
		if(mydata.length==0){
			return null;
		}
		if(index==1){
			pointArray[0] = new BMap.Point(mydata[0][0],mydata[0][1]); // 创建点坐标A–居住地 
			pointArray[1] = new BMap.Point(mydata[1][0],mydata[1][1]); // 创建点坐标B–工作地
		}else{
			pointArray[0] = new BMap.Point(mydata[0][0],mydata[0][1]); // 创建点坐标A–居住地
			pointArray[1] = new BMap.Point(mydata[2][0],mydata[2][1]); // 创建点坐标B–可疑地 
		}
		
		if(myptArr.length==0){
			return pointArray;
		}
		for(var i=0;i<myptArr.length;i++){
			pointArray[i+2] = new BMap.Point(myptArr[i][0],myptArr[i][1]);
		}
		
		return pointArray;
	}
	//设置缩放级别
	function getBMapZoomSize(myPointData,index){
		var zoomSize = 12;
		if(myPointData.length==0){
			return zoomSize;
		}
		
		var dis = 0;
		var map = new BMap.Map("container");
		if(index==1){  //工作轨迹：获取居住地到工作地的距离
			var pointA = new BMap.Point(mydata[0][0],mydata[0][1]); // 创建点坐标A–居住地 
			var pointB = new BMap.Point(mydata[1][0],mydata[1][1]); // 创建点坐标B–工作地
			dis=map.getDistance(pointA,pointB).toFixed(2);
		}else if(index==2){//可疑轨迹：获取居住地到可疑地的距离
			var pointA = new BMap.Point(mydata[0][0],mydata[0][1]); // 创建点坐标A–居住地
			var pointB = new BMap.Point(mydata[2][0],mydata[2][1]); // 创建点坐标B–可疑地 
			dis=map.getDistance(pointA,pointB).toFixed(2);
		}
		console.log("dis:"+dis);
		 dis = dis/10;//以10厘米展示为最佳，计算每一厘米的比例长度
		 if(dis<=200){
		 	zoomSize = 16;
		 }else if(dis>200 && dis<=500){
		 	zoomSize = 15;
		 }else if(dis>500 && dis<=1000){
		 	zoomSize = 14;
		 }else if(dis>1000 && dis<=2000){
		 	zoomSize = 13;
		 }else if(dis>2000 && dis<=5000){
		 	zoomSize = 12;
		 }else if(dis>5000 && dis<=10000){
		 	zoomSize = 11;
		 }else if(dis>10000 && dis<=20000){
		 	zoomSize = 10;
		 }else if(dis>20000 && dis<=25000){
		 	zoomSize = 9;
		 }else if(dis>25000){
		 	zoomSize = 8;
		 }
		 console.log("zoomSize:"+zoomSize);
		 return zoomSize;
		
	}

</script>



</body>
</html>

