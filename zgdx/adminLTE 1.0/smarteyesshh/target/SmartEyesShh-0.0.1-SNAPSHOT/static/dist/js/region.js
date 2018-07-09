    //判断region页面中进入的哪一个图
    var str=window.location.search;
    if(str.match('mydata=1')){
        $(".data1").addClass('active');
        setTimeout(function(){
            $("#bar01").click()
        },1)  
    }else if(str.match('mydata=2')){
        $(".data2").addClass('active');
        setTimeout(function(){
            findmap();
            $("#bar02").click()
        },1) 
    }else if(str.match('mydata=3')){
        $(".data3").addClass('active');
        setTimeout(function(){
            findmap()
            $("#bar03").click()
        },1) 
    }
    
    //vue的ele日历
    //这个页面暂时不需要这个组件
    // new Vue({
    //     el:'#app',
    //     data:{
    //         morenT:new Date()- 3600 * 1000 * 24 * 30,
    //         morenT2:new Date(),
    //         pickerOptions2: {
    //             disabledDate:function(time) {
    //                 let curDate = (new Date()).getTime();
    //                 let three = 186 * 24 * 3600 * 1000;
    //                 let threeMonths = curDate - three;
    //                 return time.getTime() > Date.now() || time.getTime() < threeMonths;;
    //             },
    //             shortcuts: [{
    //                 text: '最近一周',
    //                 onClick:function(picker) {
    //                     const end = new Date();
    //                     const start = new Date();
    //                     start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
    //                     picker.$emit('pick', [start, end]);
    //                 }
    //             }, {
    //                 text: '最近一个月',
    //                 onClick:function(picker) {
    //                     const end = new Date();
    //                     const start = new Date();
    //                     start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
    //                     picker.$emit('pick', [start, end]);
    //                 }
    //             }, {
    //                 text: '最近三个月',
    //                 onClick:function(picker) {
    //                     const end = new Date();
    //                     const start = new Date();
    //                     start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
    //                     picker.$emit('pick', [start, end]);
    //                 }
    //             }]
    //         },
    //         value6: '',
    //         value7: ''
    //     },
    //     methods:{
    //         gettime:function(value){
    //           value0=value[0].slice(0,4)+value[0].slice(5,7)+value[0].slice(8,10);
    //           value1=value[1].slice(0,4)+value[1].slice(5,7)+value[1].slice(8,10);
    //           // value[0]=2018-03-06;
    //           // value0=20180306;
    //         },
    //         formatDate1:function(date){
    //             var y = date.getFullYear();
    //             var m = date.getMonth() + 1;
    //             m = m < 10 ? '0' + m : m;
    //             var d = date.getDate();
    //             d = d < 10 ? ('0' + d) : d;
    //             return y + '-' + m + '-' + d;
    //         }
    //     },
    //     // 钩子函数，页面渲染自动执行
    //     mounted:function(){
    //         this.morenT=this.formatDate1(new Date(this.morenT));
    //         this.morenT2=this.formatDate1(this.morenT2);
    //     }
    //
    // });
    var targetPhoneNo86=$("#targetPhone").val().slice(-11);
    var targetPhoneHide4="SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);
    //当前重点人员
    var showPersonInfo = targetPhoneHide4;
    var type = $("#suspectType").val();
    if(type!=''){
        showPersonInfo += "&nbsp;&nbsp;&nbsp;"+type+"人员";
    }
    $('#tit-person').html(showPersonInfo);


    $("#bar01").click(function(){
      $(".track").css("display","none");
      $(this).addClass('mActive');
      $("#bar02").removeClass('mActive');
      $("#bar03").removeClass('mActive');
      $("#barEchart01").css("display","block");
      $("#barEchart02").css('display','none').children().remove();
      $("#barEchart03").css('display','none').children().remove();
      reliMap();
    });
    $("#bar02").click(function(){
      $(".track").css("display","none");
      $(this).addClass('mActive');
      $("#bar01").removeClass('mActive');
      $("#bar03").removeClass('mActive');
      $("#barEchart02").css("display","block");
      $("#barEchart01").css('display','none').children().remove();
      $("#barEchart03").css('display','none').children().remove();
      at01Map();
    });
    $("#bar03").click(function(){
      $(".track").css("display","block");
      $(this).addClass('mActive');
      $("#bar01").removeClass('mActive');
      $("#bar02").removeClass('mActive');
      $("#barEchart03").css("display","block");
      $("#barEchart01").css('display','none').children().remove();
      $("#barEchart02").css('display','none').children().remove();
      $(".track li:nth-child(1)").addClass("active");
      $(".track li:nth-child(2)").removeClass("active");
      at02Map();

      $(".track li:nth-child(1)").click(function(){
          $(this).addClass("active");
          $(".track li:nth-child(2)").removeClass("active");
          at02Map();
      });
      $(".track li:nth-child(2)").click(function(){
          $(this).addClass("active");
          $(".track li:nth-child(1)").removeClass("active");
          at03Map();
      })
    });   

    //重置按钮
    $(".region .DTreset").click(function(){
        window.location.reload();
    });

    // 热力图
    var myChart1;
    var myChart2;
    var myChart3;

    // 获取常活动区域函数
    function findmap(){
        var targetPhone=$("#targetPhone").val();
        $.ajax({
            type: "GET",
            url: window.ctx + "/location/getReginHeatMap?targetPhone=" + targetPhone,
            dataType: "json",
            success:function(data){
                var often = data.map(function (seg) {
                    return seg.coord;
                });


                var myGeo = new BMap.Geocoder();
                var len=often.length;
                var arr2=[]
                //地图获取地点位置这个接口是异步进行的，这里使用的是设置定时器延迟5秒，
                //但有个小BUG，如果数据太大，或者信号不好，超过5秒后还没生成完数据，
                //常活动区域就用这5秒内产生的地点进行选择，而不是所有数据。
                for(var i=0;i<len;i++){
                    myGeo.getLocation(new BMap.Point(often[i][0], often[i][1]), function(result){
                        // $("#address").val(result.addressComponents.district+","+$("#address").val());
                        arr2.push(result.addressComponents.district)
                    });
                };
                setTimeout(function(){
                    var res = {};
                    // 遍历数组
                    for (var i=0;i<arr2.length;i++) {
                        if (!res[arr2[i]]) {
                            res[arr2[i]] = 1
                        } else {
                            res[arr2[i]]++
                        }
                    }
                    // console.log(res);
                    // 遍历 res
                    var keys = Object.keys(res);
                    var maxNum = 0,secNum=0, maxEle,secEle;
                    for (var i=0;i<keys.length;i++) {
                        if (res[keys[i]] > maxNum) {
                            maxNum = res[keys[i]];
                            maxEle = keys[i];
                        }else if(res[keys[i]] > secNum){
                            secNum = res[keys[i]];
                            secEle = keys[i];
                        }
                    }
                    if(!len){
                        $('#tit-area').html("无常活动区域");
                    }else{
                        $('#tit-area').html("最常活动区域 : " + maxEle);
                    }
                },5000)
            }
        })
    }


    function reliMap(){
        if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
            myChart1.dispose();
        }
        // 基于准备好的dom，初始化echarts图表
        myChart1 = echarts.init(document.getElementById('barEchart01'));

        myChart1.showLoading({
            text: 'loading...',
            color: '#2196f3',
            textColor: '#2196f3',
            maskColor: 'transparent',
            zlevel: 0,
        });
        var targetPhone=$("#targetPhone").val();
        var tel=targetPhone.slice(-11);
        // $("#tit-person").html('SE189****0796  盗窃人员')
        $("#tit-person").html('SE'+tel.slice(0,3)+'****'+tel.slice(7,11)+'&nbsp;&nbsp;&nbsp;'+$("#suspectType").val()+"人员" )

        $.ajax({
            type: "GET",
            url: window.ctx + "/location/getReginHeatMap?targetPhone=" + targetPhone,
            dataType: "json",
            success:function(data){
                myChart1.hideLoading();
                $(".DTreset").css("display","block");
                if(data!=null && data.length>0){
                    map1HasDataFlag = true;
                }

                var often = data.map(function (seg) {
                    return seg.coord;
                });


                var myGeo = new BMap.Geocoder();
                var len=often.length;
                var arr2=[]
                //地图获取地点位置这个接口是异步进行的，这里使用的是设置定时器延迟5秒，
                //但有个小BUG，如果数据太大，或者信号不好，超过5秒后还没生成完数据，
                //常活动区域就用这5秒内产生的地点进行选择，而不是所有数据。
                for(var i=0;i<len;i++){
                    myGeo.getLocation(new BMap.Point(often[i][0], often[i][1]), function(result){
                        // $("#address").val(result.addressComponents.district+","+$("#address").val());
                        arr2.push(result.addressComponents.district)
                    });
                };
                setTimeout(function(){
                    var res = {};
                    // 遍历数组
                    for (var i=0;i<arr2.length;i++) {
                        if (!res[arr2[i]]) {
                            res[arr2[i]] = 1
                        } else {
                            res[arr2[i]]++
                        }
                    }
                    // console.log(res);
                    // 遍历 res
                    var keys = Object.keys(res);
                    var maxNum = 0,secNum=0, maxEle,secEle;
                    for (var i=0;i<keys.length;i++) {
                        if (res[keys[i]] > maxNum) {
                            maxNum = res[keys[i]];
                            maxEle = keys[i];
                        }else if(res[keys[i]] > secNum){
                            secNum = res[keys[i]];
                            secEle = keys[i];
                        }
                    }
                    if(!len){
                        $('#tit-area').html("无常活动区域");
                    }else{
                        $('#tit-area').html("最常活动区域 : " + maxEle);
                    }
                },5000)

                var points = data.map(function (seg) {
                    return seg.coord.concat([1]);
                });

                option = {
                    animation: false,
                    bmap: {
                        center: [121.477208, 31.23152],
                        zoom: 10,
                        roam: 'move'

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
                };
                myChart1.setOption(option);
                // 添加百度地图插件
                var bmap = myChart1.getModel().getComponent('bmap').getBMap();

                //变颜色
                bmap.setMapStyle({style:'grayscale'});//灰色皮肤
                bmap.addControl(new BMap.MapTypeControl({
                    mapTypes:[
                        BMAP_NORMAL_MAP
                    ]
                }));
            }
        })

        // points=[[121.42722,31.21944,1],[121.42167,31.21278,1],[121.42342,31.22018,1],[121.42167,31.21278,1],[121.412064,31.214897,1],[121.41192,31.21782,1],[121.42402,31.20622,1],[121.42228,31.20025,1],[121.43356,31.19635,1],[121.43356,31.19635,1],[121.42167,31.21278,1],[121.42722,31.21944,1],[121.43583,31.20778,1],[121.42722,31.21944,1],[121.43806,31.21681,1],[121.4155556,31.22055556,1],[121.43332,31.21072,1],[121.4187,31.19832,1],[121.432822,31.220543,1],[121.43806,31.21681,1],[121.42722,31.21944,1],[121.432822,31.220543,1],[121.43806,31.21681,1],[121.412064,31.214897,1],[121.42722,31.21944,1],[121.42402,31.20622,1],[121.412064,31.214897,1],[121.4155556,31.22055556,1],[121.42402,31.20622,1],[121.4155556,31.22055556,1],[121.4155556,31.22055556,1],[121.407074,31.214736,1],[121.42167,31.21278,1],[121.417482,31.227097,1],[121.42342,31.22018,1],[121.42167,31.21278,1],[121.42722,31.21944,1],[121.6328,31.30666,1],[121.41389,31.20528,1],[121.4155556,31.19305556,1],[121.4122222,31.21194444,1],[121.43332,31.21072,1],[121.43332,31.21072,1],[121.432822,31.220543,1],[121.4122222,31.21194444,1],[121.43306,31.22417,1],[121.42167,31.21278,1],[121.412064,31.214897,1],[121.4288611,31.21716667,1],[121.42722,31.21944,1],[121.42722,31.21944,1],[121.4288611,31.21716667,1],[121.42722,31.21944,1],[121.4288611,31.21716667,1]];

    }

    // 活动区域图

    function at01Map(){
        var targetPhone=$("#targetPhone").val();
        $.ajax({
            type: "GET",
            async: false,
            url: window.ctx+"/region/getRegion?targetPhone="+targetPhone,
            dataType: "json",
            //[ [121.24356710396394,31.188669026176047], [121.5236751742856,31.112174867118885], [121.49495394125242,31.12528006297392] ]
            success: function (data) {
                if(data.length!=0){
                    areaMap(data);
                    $(".DTreset").css("display","block");
                }else{
                    alert("没有数据")
                }

            },
            error: function () {
                alert("获取失败，请联系管理员！");
            }
        });
    }
    function areaMap(data){

        var map = new BMap.Map("barEchart02");    // 创建Map实例
        map.centerAndZoom(new BMap.Point(data[0][0],data[0][1]),16);  // 初始化地图,设置中心点坐标和地图级别
        //添加地图类型控件
        map.addControl(new BMap.MapTypeControl({
            mapTypes:[
                BMAP_NORMAL_MAP,
                BMAP_HYBRID_MAP
            ]}));     
        map.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

        var styleJson=[
                        {
                            "featureType": "all",
                            "elementType": "all",
                            "stylers": {
                                "lightness": 10,
                                "saturation": -100
                            }
                        },       
                      ]
         map.setMapStyle({styleJson:styleJson});

        var pt1 = new BMap.Point(data[0][0],data[0][1]);
        var pt2 = new BMap.Point(data[1][0],data[1][1]);
        var pt3 = new BMap.Point(data[2][0],data[2][1]);

        //开始添加覆盖

        //--第一个圆居住地
        var circle1 = new BMap.Circle(pt1,150,{strokeColor:"#237cc8",
            strokeWeight:2,
            fillColor:"#237cc8",
            strokeOpacity:0.9,
            fillOpacity: 0.3
        });
        //增加圆形
        map.addOverlay(circle1);

        //添加图标
        var myIcon1 = new BMap.Icon("static/dist/img/old/u-26.png", new BMap.Size(110,43),{
            anchor: new BMap.Size(55, 43)
        });
        var marker1 = new BMap.Marker(pt1,{icon:myIcon1});  // 创建标注
        map.addOverlay(marker1);

        //--第二个圆工作地
        var circle2 = new BMap.Circle(pt2,150,{strokeColor:"#2dadc2",
            strokeWeight:2,
            fillColor:"#2dadc2",
            strokeOpacity:0.9,
            fillOpacity: 0.3
        });
        //增加圆形
        map.addOverlay(circle2);

        //添加图标
        var myIcon2 = new BMap.Icon("static/dist/img/old/u-25.png", new BMap.Size(110,43),{
            anchor: new BMap.Size(55, 43)
        });
        var marker2 = new BMap.Marker(pt2,{icon:myIcon2});  // 创建标注
        map.addOverlay(marker2);

        //--第三个圆
        var circle3 = new BMap.Circle(pt3,150,{strokeColor:"#c23531",
            strokeWeight:2,
            fillColor:"#c23531",
            strokeOpacity:0.9,
            fillOpacity: 0.3
        });
        //增加圆形
        map.addOverlay(circle3);

        //添加图标
        var myIcon3 = new BMap.Icon("static/dist/img/old/u-27.png", new BMap.Size(110,43),{
            anchor: new BMap.Size(55, 43)
        });
        var marker3 = new BMap.Marker(pt3,{icon:myIcon3});  // 创建标注
        map.addOverlay(marker3);


    /////////////////////////////////////////////////////////////////////////

        //---给三个圆添加文字
        //居住地
        // function opts1(){
        //     var opts = {
        //         position : pt1,    // 指定文本标注所在的地理位置
        //         offset   : new BMap.Size(-27, 5)    //设置文本偏移量
        //     };
        //     var label = new BMap.Label("居住地", opts);  // 创建文本标注对象
        //     label.setStyle({
        //         color : "#fff",
        //         fontSize : "12px",
        //         height : "24px",
        //         lineHeight : "20px",
        //         paddingLeft:"10px",
        //         paddingRight:"44px",
        //         background:"#237cc8",
        //         border:"none"
        //     });
        //     map.addOverlay(label);
        // }
        // opts1();
        // function opts2(){
        //     var opts = {
        //         position : pt2,    // 指定文本标注所在的地理位置
        //         offset   : new BMap.Size(-27, 5)    //设置文本偏移量
        //     };
        //     var label = new BMap.Label("工作地", opts);  // 创建文本标注对象
        //     label.setStyle({
        //         color : "#ffffff",
        //         fontSize : "12px",
        //         height : "24px",
        //         lineHeight : "20px",
        //         paddingLeft:"10px",
        //         paddingRight:"44px",
        //         background:"#2dadc2",
        //         border:"none"
        //     });
        //     map.addOverlay(label);
        // }
        // opts2();
        // function opts3(){
        //     var opts = {
        //         position : pt3,    // 指定文本标注所在的地理位置
        //         offset   : new BMap.Size(-27, 5)    //设置文本偏移量
        //     };
        //     var label = new BMap.Label("可疑地", opts);  // 创建文本标注对象
        //     label.setStyle({
        //         color : "#ffffff",
        //         fontSize : "12px",
        //         height : "24px",
        //         lineHeight : "20px",
        //         paddingLeft:"10px",
        //         paddingRight:"44px",
        //         background:"#c23531",
        //         border:"none"
        //     });
        //     map.addOverlay(label);
        // }
        // opts3();

    }
///////////////////////////////////////////////////////////////////////////

    // 轨迹地图
    var mytrack1 = [];//工作轨迹
    var mytrack11 = [];//工作轨迹
    var mytrack2 = [];//可疑轨迹
    var mytrack22 = [];//可疑轨迹
    //工作轨迹用的是接口返回数据中的a[0],a[1]
    //可疑轨迹用的是接口返回数据中的a[0],a[2]
    var res=[];
    var data2=[];
    var pointArray=[];
    //工作轨迹
    function at02Map(){
        var targetPhone=$("#targetPhone").val();
        trailMap();
        $.ajax({
            type: "GET",
            async: false,
            url: window.ctx+"/region/getRegion?targetPhone="+targetPhone,
            dataType: "json",
            success: function (mydata) {
                myChart3.dispose();
                if(mydata.length!=0){
                    $(".DTreset").css("display","block");
                    $.ajax({
                        type: "GET",
                        //如果设置为false没有正确变为同步
                        async: false,
                        url: 'https://api.map.baidu.com/direction/v2/transit?ak=6XS2KGjHtiSTaR9CzIAQlBcnMQpcs6uI&origin='
                        + mydata[0][1] + ',' + mydata[0][0] + '&destination=' + mydata[1][1] + ',' + mydata[1][0],
                        dataType: "jsonp",
                        success: function (data) {
                            if (data.message === '成功') {
                                mytrack1 = [];
                                if(data.result.routes== null ||data.result.routes.length<=0){
                                    //有时候2个点之间太近或者地理原因，没有公交路线，直接让起点连接终点
                                    //最好的办法就是判断当没有公交路线时，走骑行路线或者驾车路线。
                                    //https://api.map.baidu.com/direction/v2/riding?
                                    $.ajax({
                                        type: "GET",
                                        //如果设置为false没有正确变为同步
                                        async: false,
                                        url: 'https://api.map.baidu.com/direction/v2/riding?ak=6XS2KGjHtiSTaR9CzIAQlBcnMQpcs6uI&origin='
                                        + mydata[0][1] + ',' + mydata[0][0] + '&destination=' + mydata[1][1] + ',' + mydata[1][0],
                                        dataType: "jsonp",
                                        success:function(data){
                                            //如果起点和终点在一起时，就没有路线，routes为空
                                            if(data.result.routes.length!=0){
                                                var steps = data.result.routes[0].steps;
                                                for (var s = 0; s < steps.length; s++) {
                                                    var arr = steps[s].path.split(';');
                                                    for (var j = 0; j < arr.length; j++) {
                                                        var point = arr[j].split(',');
                                                        //res.push({lng: point[0], lat: point[1]});
                                                        mytrack1.push([point[0], point[1]]);
                                                    }
                                                }
                                                mytrack11=[];
                                                var n=0;
                                                for(var m=0;m<mytrack1.length;m=m+mytrack1.length/4){
                                                    n=Math.ceil(m)
                                                    mytrack11.push(mytrack1[n])
                                                }
                                                mytrack11.push(mytrack1[mytrack1.length-1]);
                                                trailMap(mytrack11);
                                            }else{
                                                trailMap([[mydata[0][0],mydata[0][1]],[mydata[1][0],mydata[1][1]]])
                                            }
                                        }
                                    })
                                }else{
                                    //百度api中公交车routes有多种方案，这里统一用routes[0],
                                    //由于点太多导致效果图不好看，这里简化为5个点
                                    var steps = data.result.routes[0].steps;
                                    for (var s = 0; s < steps.length; s++) {
                                        var arr = steps[s][0].path.split(';');
                                        for (var j = 0; j < arr.length; j++) {
                                            var point = arr[j].split(',');
                                            //res.push({lng: point[0], lat: point[1]});
                                            mytrack1.push([point[0], point[1]]);
                                        }
                                    }
                                    mytrack11=[];
                                    var n=0;
                                    for(var m=0;m<mytrack1.length;m=m+mytrack1.length/4){
                                        n=Math.ceil(m)
                                        mytrack11.push(mytrack1[n])
                                    }
                                    mytrack11.push(mytrack1[mytrack1.length-1]);
                                    trailMap(mytrack11);
                                }
                            }
                        },
                        error: function () {
                            alert("获取失败，请联系管理员！");
                        }
                    });
                }else{
                    alert("没有数据")
                }
            },
            error: function () {
                alert("获取失败，请联系管理员！");
            }
        });
    }
    //可疑轨迹
    function at03Map(){
        var targetPhone=$("#targetPhone").val();
        trailMap();
        $.ajax({
            type: "GET",
            async: false,
            url: window.ctx+"/region/getRegion?targetPhone="+targetPhone,
            dataType: "json",
            success: function (mydata) {
                myChart3.dispose();
                if(mydata.length!=0){
                    $(".DTreset").css("display","block");
                    $.ajax({
                        type: "GET",
                        //如果设置为false没有正确变为同步
                        async: false,
                        url: 'https://api.map.baidu.com/direction/v2/transit?ak=6XS2KGjHtiSTaR9CzIAQlBcnMQpcs6uI&origin='
                        + mydata[0][1] + ',' + mydata[0][0] + '&destination=' + mydata[2][1] + ',' + mydata[2][0],
                        dataType: "jsonp",
                        success: function (data) {
                            mytrack2=[];
                            if (data.message === '成功') {
                                if(data.result.routes== null ||data.result.routes.length<=0){
                                    $.ajax({
                                        type: "GET",
                                        //如果设置为false没有正确变为同步
                                        async: false,
                                        url: 'https://api.map.baidu.com/direction/v2/riding?ak=6XS2KGjHtiSTaR9CzIAQlBcnMQpcs6uI&origin='
                                        + mydata[0][1] + ',' + mydata[0][0] + '&destination=' + mydata[2][1] + ',' + mydata[2][0],
                                        dataType: "jsonp",
                                        success:function(data){
                                            if(data.result.routes.length!=0){
                                                var steps = data.result.routes[0].steps;
                                                for (var s = 0; s < steps.length; s++) {
                                                    var arr = steps[s].path.split(';');
                                                    for (var j = 0; j < arr.length; j++) {
                                                        var point = arr[j].split(',');
                                                        //res.push({lng: point[0], lat: point[1]});
                                                        mytrack2.push([point[0], point[1]]);
                                                    }
                                                }
                                                mytrack22=[];
                                                var n=0;
                                                for(var m=0;m<mytrack2.length;m=m+mytrack2.length/4){
                                                    n=Math.ceil(m)
                                                    mytrack11.push(mytrack2[n])
                                                }
                                                mytrack22.push(mytrack2[mytrack1.length-1]);
                                                trailMap(mytrack22);
                                            }else{
                                                trailMap([[mydata[0][0],mydata[0][1]],[mydata[2][0],mydata[2][1]]]);
                                            }

                                        }
                                    })
                                }else{
                                    //百度api中公交车routes有多种方案，这里统一用routes[0],
                                    //由于点太多导致效果图不好看，这里简化为5个点
                                    var steps = data.result.routes[0].steps;
                                    for (var s = 0; s < steps.length; s++) {
                                        var arr = steps[s][0].path.split(';');
                                        for (var j = 0; j < arr.length; j ++) {
                                            var point = arr[j].split(',');
                                            //res.push({lng: point[0], lat: point[1]});
                                            mytrack2.push([point[0], point[1]]);

                                        }
                                    }
                                    mytrack22=[];
                                    var n=0;
                                    for(var m=0;m<mytrack2.length;m=m+mytrack2.length/4){
                                        n=Math.ceil(m)
                                        mytrack22.push(mytrack2[n])
                                    }
                                    mytrack22.push(mytrack2[mytrack2.length-1]);
                                    trailMap(mytrack22);
                                }
                            }
                        },
                        error: function () {
                            alert("获取失败，请联系管理员！");
                        }
                    });
                }else{
                    alert("没有数据")
                }
            },
            error: function () {
                alert("获取失败，请联系管理员！");
            }
        });
    }

    function trailMap(arr){

        if (myChart3 != null && myChart3 != "" && myChart3 != undefined) {
            myChart3.dispose();
        }
        // 基于准备好的dom，初始化echarts图表
        myChart3 = echarts.init(document.getElementById('barEchart03'));

        // myChart3.showLoading({
        //     text: 'loading...',
        //     color: '#2196f3',
        //     textColor: '#2196f3',
        //     maskColor: 'transparent',
        //     zlevel: 0,
        // });

        if(arr){
            var bmap = {

                roam: true,
                mapStyle: {
                    styleJson: [{
                        "featureType": "all",
                        "elementType": "all",
                        "stylers": {
                            "lightness": 10,
                            "saturation": -100
                        }
                    }]
                }
            }
            res=[];
            data2=[];
            pointArray=[];
            //
            // // data2=[{value:[num1[0],num1[1],80]},{value:[num2[0],num2[1],80]},{value:[num3[0],num3[1],80]},{value:[num4[0],num4[1],80]},{value:[num5[0],num5[1],80]},{value:[num6[0],num6[1],80]}]
            // // var arr=[[121.30502,31.301144],[121.420578,31.233486],[121.348714,31.16034],[121.398157,31.103958],[121.330317,30.994066],[121.123922,31.106432]];
            for(var j=0;j<arr.length-1;j++){
                res.push([{coord:arr[j]},{coord:arr[j+1]}]);
            }

            for(var i=0;i<arr.length;i++){
                pointArray[i] = new BMap.Point(arr[i][0],arr[i][1]);
                data2.push({value:[arr[i][0],arr[i][1],80]})
            }

            series=[
                {
                    type: 'lines',
                    coordinateSystem: 'bmap',
                    zlevel: 1,
                    effect: {
                        show: true,
                        period: 6,
                        trailLength: 0.7,
                        color: 'fff',
                        symbolSize: 3
                    },
                    lineStyle: {
                        normal: {
                            color:'#237cc8',
                            width: 0,
                            curveness: 0.2
                        }
                    },
                    data: res
                },
                {
                    type: 'lines',
                    coordinateSystem: 'bmap',
                    zlevel: 2,
                    effect: {
                        show: true,
                        period: 6,
                        trailLength: 0,
                        symbol: "triangle",
                        symbolSize: 8
                    },
                    lineStyle: {
                        normal: {
                            color: '#237cc8',
                            width: 3,
                            opacity: 0.4,
                            curveness: 0.2
                        }
                    },
                    data:res
                },
                {
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
                    },
                    symbolSize: function (val) {
                        return val[2] / 8;
                    },
                    showEffectOn: 'render',
                    itemStyle: {
                        normal: {
                            color: '#237cc8'
                        }
                    },
                    data : data2
                    // data : [{value:[mydata(num1)[0],mydata(num1)[1],80]},{value:[mydata(num2)[0],mydata(num2)[1],80]},{value:[mydata(num3)[0],mydata(num3)[1],80]},{value:[mydata(num4)[0],mydata(num4)[1],80]},{value:[mydata(num5)[0],mydata(num5)[1],80]},{value:[mydata(num6)[0],mydata(num6)[1],80]}]
                },
            ]


            option ={
                bmap:bmap,
                tooltip: {
                    trigger: 'item',
                    // formatter: function (params) {
                    //     return 'X: ' + params.data[0].toFixed(2) + '<br>Y: ' + params.data[1].toFixed(2);
                    // }
                },
                geo: {
                    map: 'bmap',
                    label: {
                        emphasis: {
                            show: true
                        }
                    },
                    roam: true,
                    zoom:1,
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
            }
            myChart3.setOption(option);
            var bmap = myChart3.getModel().getComponent('bmap').getBMap();
            bmap.setViewport(pointArray);
        }
    }

