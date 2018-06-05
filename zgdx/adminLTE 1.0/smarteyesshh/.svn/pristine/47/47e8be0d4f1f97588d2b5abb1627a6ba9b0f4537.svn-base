<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>概览</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style2.css" />
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <%--<script type="text/javascript" src="${js}/change.js" ></script>--%>
    <script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>
    <script type="text/javascript" src="${js}/bmap.js" ></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });
            $("#navList li").removeClass("active");
            $("#navList li:eq(0)").addClass("active");
            $("#img1").attr("src","${img}/u-03c.png");
            $("#img2").attr("src","${img}/u-04.png");
            $("#img3").attr("src","${img}/u-05.png");

        })
    </script>
</head>
<body>

<div class="container-fluid smartEyes-container">
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
            <div class="pull-left namelistcc">
                <%--<span>当前重点人员：</span>--%>
                <%--<span id="tit-person">张*强  3101001986  疑似涉毒人员</span>--%>
                <span>当前重点人员：</span>
                <span id="tit-person"></span>
            </div>
            <div class="pull-right text-right input-group col-lg-5 col-md-5 col-xs-5">
                <!--<input placeholder="2017-10-01 16:49" type="text" class="pull-right datetimepicker" />
                <input placeholder="2017-10-02 16:49" type="text" class="pull-right datetimepicker" />-->
                <%--<select id="overview-select" onchange="calendar(this.options[this.options.selectedIndex].value)" class="pull-right select" style="margin-top: 7px; margin-right: 16px;">--%>
                <select id="overview-select" onchange="allChange(this.options[this.options.selectedIndex].value)" class="pull-right select" style="margin-top: 7px; margin-right: 16px;">
                    <option value="day" >&nbsp;最近一天</option>
                    <option value="week">&nbsp;最近一周</option>
                    <option value="month" selected=''>&nbsp;最近一月</option>
                    <%--<option value="year">&nbsp;最近一年</option>--%>
                    <%--<option value="自定义">&nbsp;自定义</option>--%>
                    <%--<option value="全部">&nbsp;全部</option>--%>
                </select>
            </div>
        </div>
        <%--图表展示--%>
        <div class="col-lg-12 col-md-12 col-xs-12 echartBox">
            <!--图表展示列表-->
            <div class="g-viewlist">
                <!--联系人特征-->
                <div class="g-viewlistHead clearfix">
                    <h2 class="pull-left">联系人特征</h2>
                    <%--<p class="pull-left">有效联系人147个[高于/低于均值60%]</p>--%>
                    <p class="pull-left" id="p1"></p>
                    <a href="${ctx}/contact?targetPhone=${targetPhone}" class="pull-right more"><i><img src="${img}/more.png"></i>更多</a>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 g-viewlist-EcBox">
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-right: 0;">
                        <!--关系图-->
                        <div class="g-viewlist-gx" id="relation" style="width: 100%; height: 100%;padding-top: 28px">

                            <!--<img src="img/u-30.png" />
                            -->
                        </div>
                        <p class="g-import-title" >Top10核心联系人</p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-left: 0;">
                        <!--饼状图-->
                        <div class="g-viewlist-bz" id="pcher" style="width: 100%; height: 100%;padding-top: 48px">
                            <!---->
                        </div>
                        <p class="g-import-title" >联系人属性分布</p>

                    </div>
                </div>

            </div>
            <div class="g-viewlist">
                <!--通话特征-->
                <div class="g-viewlistHead clearfix">
                    <h2 class="pull-left">通话特征</h2>
                    <%--<p class="pull-left" id="p2">通话总时长：1140 min</p>--%>
                    <p class="pull-left" id="p2"></p>
                    <a href="${ctx}/contact?targetPhone=${targetPhone}" class="pull-right more"><i><img src="${img}/more.png"></i>更多</a>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 g-viewlist-EcBox">
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-right: 0;">
                        <!--日历热力图-->
                        <div class="g-viewlist-gx"  id="calendar" style="width: 100%; height: 100%;">
                            <!--<img src="img/u-32.png" />-->
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-left: 4%;">
                        <!--柱状图-->
                        <div class="g-viewlist-bz" id="lineBar" style="width: 100%; height: 100%; padding-top: 20px;top:35px;">
                            <!--<img src="img/u-33.png" />-->
                        </div>
                    </div>
                </div>

            </div>
            <div class="g-viewlist">
                <!--区域特征-->
                <div class="g-viewlistHead clearfix">
                    <h2 class="pull-left">区域特征</h2>
                    <p class="pull-left" id="p3"></p>
                    <%--<p class="pull-left" id="p3">常活动区域：青浦区、闵行区</p>--%>
                    <a href="${ctx}/region?targetPhone=${targetPhone}" class="pull-right more"><i><img src="${img}/more.png"></i>更多</a>
                    <%--<select class="pull-right select" style="position: relative;top:10px">--%>
                        <%--<option>上午</option>--%>
                        <%--<option>下午</option>--%>
                    <%--</select>--%>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 g-viewlist-EcBox" style="padding: 0;">
                    <div class="col-lg-12 col-md-12 col-xs-12 pull-left g-viewlist-l" style="padding-right: 0; height: 530px; padding: 0;">
                        <!--热力图-->
                        <div class="g-viewlist-gx" id="thermodynamicChart" style="width: 100%; height: 100%;">

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!--底部-->
    <footer style="position: relative; margin-top: 45px;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
    <script>
        var myChart1;
        var myChart2;
        var myChart3;
        var myChart4;
        var myChart5;
        var myDate = new Date("2017-12-31");
        var myyear = ""+myDate.getFullYear();    //获取完整的年份(4位,1970-????)

        var avg = 240;
        //展示数据
        $(function () {
            var targetPhone=$("#targetPhone").val();
            $('#tit-person').html("  "+"SE"+targetPhone+"  ");
            var dupresult = [];
            $.ajax({
                type:"GET",
                url:window.ctx+"/getOverView?targetPhone="+targetPhone,
                dataType:"json",
                success:function (data) {
//                    console.log(data);
                    if(data!==null){
                        var dulen = data.duration_length;
                       // var vacon = data.valid_contact;
                        var location = data.top_location;
                        $('#p3').html("常活动区域：");
//                        $('#p1').html("有效联系人"+vacon+"个[高于/低于均值"+Number((vacon-20/20)*100).toFixed(1)+"%]");
//                        $('#p2').html("通话总时长："+dulen+" min");

                        var myGeo = new BMap.Geocoder();
                        var len = location.length;
                        // 根据坐标得到地址描述
                        myGeo.getLocation(new BMap.Point(location[0][0], location[0][1]), function(result){

                            if (result){
                                $('#p3').append(""+result.addressComponents.district);
                                dupresult.push(""+result.addressComponents.district);
                            }
                            for(var i = 1;i<len;i++){

                                myGeo.getLocation(new BMap.Point(location[i][0], location[i][1]), function(result){

                                    if (result){
                                        if(dupresult.indexOf(result.addressComponents.district)===-1){
                                            $('#p3').append("、"+result.addressComponents.district);
                                            dupresult.push(""+result.addressComponents.district);
                                        }else {}
                                    }else {}

                                });
                            }

                        });

                    }else {
                        $('#p1').html("有效联系人"+"--"+"个[相对于均值--%]");
                        $('#p2').html("通话总时长："+"--"+" min");
//                        $('#p3').html("-- min");
                    }

                },
                error:function() {
                    console.log("获取基本信息失败,请联系管理员");
                }
            });


        });
        function allChange(value) {
//            var myDate = new Date();
            var myDate = new Date("2017-12-31");
            var mymonth = myDate.getMonth();//获取当前月份(0-11,0代表1月)
            mymonth = mymonth + 1;
            mymonth = mymonth < 10 ? '0'+mymonth: mymonth;
            var mydate = myDate.getDate();//获取当前日(1-31)
            mydate = mydate-1;
            mydate = mydate < 10 ? '0'+mydate: mydate;
            var timerange = [];

            switch(value){
                case "day":
                    //当天热力
                    timerange[0] = myyear+mymonth+""+mydate;
                    timerange[1] = myyear+mymonth+""+mydate;
                    avg = 20;

                    break;
                case "week":
                    var mywkdate = mydate;
                    timerange[1] = myyear+mymonth+""+mydate;
                    mywkdate = (mydate-6) < 0 ? '0'+1 : mydate-6+"";
                    timerange[0] = myyear+mymonth+""+mywkdate;
                    avg = 110;

                    break;
                case "month":
                    timerange[0] = myyear+mymonth+""+"01";
                    timerange[1] = myyear+mymonth+""+mydate;
                    avg = 240;

                    break;

            }
            calendar(timerange);
            relation(timerange);
            pcher(timerange);

        }
        //初始化
        function initialFunc(){
//            var myDate = new Date();
            var myDate = new Date("2017-12-31");
            var mymonth = myDate.getMonth();//获取当前月份(0-11,0代表1月)
            mymonth = mymonth + 1;
            mymonth = mymonth < 10 ? '0'+mymonth: mymonth;//小于10前面加0
            var mydate = myDate.getDate();//获取当前日(1-31)
            mydate = mydate-1;//得到昨天的日子
            mydate = mydate < 10 ? '0'+mydate: mydate;
            var timerange = [];
//            timerange[0] = myyear+mymonth+""+mydate;
//            timerange[1] = myyear+mymonth+""+mydate;
            timerange[0] = myyear+mymonth+""+"01";
            timerange[1] = myyear+mymonth+""+mydate;

            relation(timerange);
//            relation(["20171221","20171221"]);
            calendar(timerange);
//            calendar(["20171221","20171221"]);
            pcher(timerange);
//            pcher(["20171221","20171221"]);
            lineBar(timerange[0]);
//            lineBar("20171206");
        }
        initialFunc();
        //联系人特征---关系图
        function relation(timerange){
            var targetPhone=$("#targetPhone").val();
            if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
                myChart1.dispose();
            }
            myChart1 = echarts.init(document.getElementById('relation'));
            $.ajax({
                type:"GET",
                url:window.ctx+"/beta/relationGraph",
                <%--url:"${js}/data/gxt.json",--%>
                data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
//                data: {"targetPhone":targetPhone,"startTime":"20171222","endTime":"20171222"},
                dataType:"json",
                success:function (graph) {
                    console.log("gxt"+timerange);

                    var mynode=[];
                    function sortExp(a,b){
                        return b.exp-a.exp
                    }
                    //排序 并且 找到max
                    var brr1=[];
                    var brr2=[];
                    var brr3=[];
                    var max1,max2,max3;
                    for(var i=0;i<graph.nodes.length;i++){
                        if(graph.nodes[i].tag ==="重点人员"){
                            brr3.push(graph.nodes[i]);
                        }else if(graph.nodes[i].category===1){
                            brr1.push(graph.nodes[i]);

                        }else if(graph.nodes[i].category===2){
                            brr2.push(graph.nodes[i]);
                        }else{}
                    }
                    brr1.sort(sortExp);
                    if(brr1.length!==0){max1 = brr1[0].exp;}
                    brr2.sort(sortExp);
                    if(brr2.length!==0){max2 = brr2[0].exp;}
                    brr3.sort(sortExp);
                    if(brr3.length!==0){max3 = brr3[0].exp;}

                    var brr1len = brr1.length;
                    var brr2len = brr2.length;
                    var vacon = brr1len+brr2len;
                    var num = Number((vacon-avg)/avg*100).toFixed(1);
                    if (num > 0){
                        num = "+" + num;
                    }
                    $('#p1').html("有效联系人"+vacon+"个[相对于均值"+num+"%]");

                    if((brr1len+brr2len)>10){
                        if(brr1len > 7 ){
                            for(var k = 0; k<7 ;k++){
                                mynode.push(brr1[k]);
                            }
                            //二度是不是也大于3
                            if(brr2len > 3){
                                for(var m = 0; m<3 ;m++){
                                    mynode.push(brr2[m]);
                                }
                            }else{
                                for(var j = 0; j<brr2len ;j++){
                                mynode.push(brr2[j]);
                                }
                            }
                        }else {
                            mynode = brr1;
                            //一共10个,取10个
                            for(var n = 0; n<(10-brr1len) ;n++){
                                mynode.push(brr2[n]);
                            }
                        }
                        graph.nodes = mynode;
                    }else{
                        mynode = graph.nodes;
                    }

                    var links=[];
                    //构建的当前人，category=0
                    var crtPerNode = {"category":0,"name":targetPhone,"exp":1,"tag":"当前人员"};
                    graph.nodes.push(crtPerNode);

                    graph.nodes.forEach(function (node) {

                        node.name="SE"+node.name;
                        node.value = Number(node.exp).toFixed(3);

                        node.label = {
                            normal: {
                                show: true
                            }
                        };
                        node.isnode = true;

                        //选择一度二度联系人 构造边
                        if(node.category!==0){
                            var link;
                            if(node.tag==="重点人员"){
                                 link = {"source":"SE"+targetPhone,"target":node.name,"lineStyle": {
                                    normal: {
                                        color: '#48a750',
                                        curveness: 0 // 线的弯曲度 0-1之间 越大则歪曲度更大
                                    }
                                }};
                            }else if(node.category===1){
                                link = {"source":"SE"+targetPhone,"target":node.name,"lineStyle": {
                                    normal: {
                                        color: '#38f',
                                        curveness: 0 // 线的弯曲度 0-1之间 越大则歪曲度更大
                                    }
                                }};
                            }else {
                                link = {"source":"SE"+targetPhone,"target":node.name};
                            }

                            links.push(link);
                        }

                        //设置大小
                        //设置一般人员
                        //设置当前人员
                        if(node.category === 0){
                            node.symbolSize = 80;
                            node.symbol='image://${img}/u-35.png';
                            node.itemStyle = {
                                normal: {
                                    color: 'rgba(255,255,255,0)', //圆点的颜色
                                    backgroundColor: '#404359',
                                    padding: [2, 4],
                                    label: {
                                        backgroundColor: 'rgba(255,255,255,0)',
                                        position: 'bottom',
                                        textStyle: {
                                            color: 'rgba(255,255,255,0)'
                                        }
                                    }
                                }
                            };
                        }else{
                            if(node.tag === "一般人员"){
                            switch(node.category){
                                case 1:
                                    if(node.exp/max1 > 0.33){
                                        node.symbolSize = 70*node.exp/max1;
                                    }else{
                                        node.symbolSize = 23.3;
                                    }

                                    node.symbol='image://${img}/u-35.png';
                                    node.itemStyle = {
                                        normal: {
                                            color: 'rgba(255,255,255,0)', //圆点的颜色
                                            backgroundColor: '#404359',
                                            padding: [2, 4],
                                            label: {
                                                backgroundColor: 'rgba(255,255,255,0)',
                                                position: 'bottom',
                                                textStyle: {
                                                    color: 'rgba(255,255,255,0)'
                                                }
                                            }
                                        }
                                    };
                                    break;
                                case 2:
                                    if(node.exp/max2 > 0.33){
                                        node.symbolSize = 60*node.exp/max2;
                                    }else{
                                        node.symbolSize = 20;
                                    }
                                    node.symbol='image://${img}/u-38.png';
                                    node.itemStyle = {
                                        normal: {
//                                            color: '#090',
                                            color: 'rgba(255,255,255,0)', //圆点的颜色
                                            label: {
                                                backgroundColor: 'rgba(255,255,255,0)',
                                                position: 'bottom',
                                                textStyle: {
                                                    color: 'rgba(255,255,255,0)'
                                                }
                                            }
                                        },        emphasis: {
                                            color: "#000"
                                        }
                                    };

                                    break;

                              }

                            }else if(node.tag === "重点人员"){
                                if(node.exp/max3 > 0.33){
                                    node.symbolSize = 75*node.exp/max3;
                                }else{
                                    node.symbolSize = 25;
                                }
                                node.symbol='image://${img}/u-41.png';
                                node.itemStyle = {
                                    normal: {
//                                        color: '#090',
                                        color: 'rgba(255,255,255,0)', //圆点的颜色
                                        label: {
                                            backgroundColor: 'rgba(255,255,255,0)',
                                            position: 'bottom',
                                            textStyle: {
                                                color: 'rgba(255,255,255,0)'
                                            }
                                        }
                                    },
                                    emphasis: {
                                        color: "#000"
                                    }
                                };

                        }else{}

                        }




                    });

                    option = {
                        tooltip: {
                            show: true,
                            textStyle : {
                                color: '#2196f3',
                                decoration: 'none',
                                fontSize: 14
                            },
                            formatter: function (params ) {
                                if(params.data.isnode){
                                    if(params.name === 'SE'+targetPhone){ return params.name+'<br />'+params.data.tag+' '+params.value;}
                                    else{return 'SE'+params.name.slice(-12)+'<br />'+params.data.tag+' '+params.value;}
                                }
                                else {return params.data.source+" > "+'SE'+params.data.target.slice(-12);}
                            }
                        },
                        animation: true,
                        series: [{
                            type: 'graph',
                            layout: 'force',
                            symbol: "circle",
                            symbolSize: 40,//自定义图 大小 设置值
                            roam: false, //禁止用鼠标滚轮缩小放大效果
                            // edgeSymbol: ['circle', 'arrow'],
                            edgeSymbolSize: [0, 6],
                            // 连接线上的文字
                            focusNodeAdjacency: true, //划过只显示对应关系
                            edgeLabel: {
                                normal: {
                                    show: false,
                                    textStyle: {
                                        fontSize: 20,
                                        color: '#237cc8',
                                        padding: [2, 4],
                                        borderRadius: 2

                                    },
                                    formatter: "{c}"
                                }
                            },
                            lineStyle: {
                                normal: {
                                    opacity: 1,
                                    width: 1,
                                    curveness: 0
                                }
                            },
                            // 圆圈内的文字
                            label: {
                                normal: {
                                    show: true
                                }
                            },
                            force: {
//                                repulsion: 2000
                                repulsion: 1000
                            },
                            data: graph.nodes,
                            links: links
                        }]
                    };
                    myChart1.setOption(option);
                },

                error:function() {
                    console.log("获取数据失败,请联系管理员");
                }
            });
        }


//        relation();


        //联系人特征---饼图
        function pcher(timerange){
            var targetPhone=$("#targetPhone").val();
            if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
                myChart2.dispose();
            }
            myChart2 = echarts.init(document.getElementById('pcher'));
            $.ajax({
                type:"GET",
                <%--url:"${js}/data/gxt.json",--%>
                url:window.ctx+"/beta/relationGraph",
                data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
                dataType:"json",
                success: function (data) {

                    var pie1 = [];
                    pie1[0]=0;pie1[1]=0;
                    var pie2 = [];
                    pie2[0]=0;pie2[1]=0;
                    data.nodes.forEach(function (node) {
                        if(node.category===1){
                            pie1[0]++;
                        }else if(node.category===2){
                            pie1[1]++;
                        }else {}
                        if(node.tag==="一般人员"){
                            pie2[0]++;
                        }else if(node.tag==="重点人员"){
                            pie2[1]++;
                        }else {}
                    });

                    //画图
                    option = {
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b}: {c} ({d}%)"
                        },
                        series: [
                            {
                                name:'',
                                type:'pie',
                                selectedMode: 'single',
                                radius: [0, '30%'],
                                color:['#237dc8','#3a3e52'] ,
                                label: {
                                    normal: {
                                        position: 'inner'
                                    }
                                },
                                labelLine: {
                                    normal: {
                                        show: false
                                    }
                                },
                                data:[
                                    {value:pie1[0], name:'一度联系人', selected:true},
                                    {value:pie1[1], name:'二度联系人'}
                                ]
                            },
                            {
                                name:'',
                                type:'pie',
                                radius: ['40%', '55%'],
                                color:['#404359','#4caf50'] ,
                                label: {
                                    normal: {
                                        formatter: '{a|{a}}{abg|}{b|{b}：}{c|{c}} {per|{d}%}  ',
                                        backgroundColor: '#404359',
                                        borderColor: '#404359',
                                        borderWidth: 1,
                                        borderRadius: 6,
                                        // shadowBlur:3,
                                        // shadowOffsetX: 2,
                                        // shadowOffsetY: 2,
                                        shadowColor: '#999',
                                        padding: [0, 7],
                                        rich: {
                                            a: {
                                                color: '#237cc8',
                                                lineHeight: 22,
                                                align: 'center'
                                            },
                                            abg: {
                                                color: '#237cc8',
                                            },
                                            b: {
                                                fontSize: 14,
                                                lineHeight: 33,
                                                color: '#237cc8',
                                            },
                                            c: {
                                                color: '#237dc8',
                                                fontSize: 14,
                                            },
                                            per: {
                                                color: '#fff',
                                                backgroundColor: '#237dc8',
                                                padding: [2, 4],
                                                borderRadius: 2
                                            }
                                        }
                                    }
                                },
                                data:[
                                    {value:pie2[0], name:'一般人员'},
                                    {value:pie2[1], name:'重点人员'}
                                ]
                            }
                        ]
                    };
                    myChart2.setOption(option);


                },

                error: function () {
                    alert("获取失败，请联系管理员！");
                }
            });

        }
//        pcher();



        //通话特征---日期热力图
        function calendar(timerange){
            var targetPhone=$("#targetPhone").val();
            if (myChart3 != null && myChart3 != "" && myChart3 != undefined) {
                myChart3.dispose();
            }
            myChart3 = echarts.init(document.getElementById('calendar'));

            var dateList = [
//                ['2017-1-1', '初四'],
//                ['2017-1-2', '初五'],
//                ['2017-1-3', '初六'],
//                ['2017-1-4', '初七'],
//                ['2017-1-5', '初八'],
//                ['2017-1-6', '初九'],
//                ['2017-1-7', '初十'],
//                ['2017-1-8', '十一'],
//                ['2017-1-9', '十二'],
//                ['2017-1-10', '十三'],
//                ['2017-1-11', '十四'],
//                ['2017-1-12', '十五'],
//                ['2017-1-13', '十六'],
//                ['2017-1-14', '十七'],
//                ['2017-1-15', '十八'],
//                ['2017-1-16', '十九'],
//                ['2017-1-17', '二十'],
//                ['2017-1-18', '廿一'],
//                ['2017-1-19', '廿二'],
//                ['2017-1-20', '廿三'],
//                ['2017-1-21', '廿四'],
//                ['2017-1-22', '廿五'],
//                ['2017-1-23', '廿六'],
//                ['2017-1-24', '廿七'],
//                ['2017-1-25', '廿八'],
//                ['2017-1-26', '廿九'],
//                ['2017-1-27', '三十'],
//                ['2017-1-28', '正月'],
//                ['2017-1-29', '初二'],
//                ['2017-1-30', '初三'],
//                ['2017-1-31', '初四'],
//                ['2017-2-1', '初五'],
//                ['2017-2-2', '初六'],
//                ['2017-2-3', '初七'],
//                ['2017-2-4', '初八'],
//                ['2017-2-5', '初九'],
//                ['2017-2-6', '初十'],
//                ['2017-2-7', '十一'],
//                ['2017-2-8', '十二'],
//                ['2017-2-9', '十三'],
//                ['2017-2-10', '十四'],
//                ['2017-2-11', '十五'],
//                ['2017-2-12', '十六'],
//                ['2017-2-13', '十七'],
//                ['2017-2-14', '十八'],
//                ['2017-2-15', '十九'],
//                ['2017-2-16', '二十'],
//                ['2017-2-17', '廿一'],
//                ['2017-2-18', '廿二'],
//                ['2017-2-19', '廿三'],
//                ['2017-2-20', '廿四'],
//                ['2017-2-21', '廿五'],
//                ['2017-2-22', '廿六'],
//                ['2017-2-23', '廿七'],
//                ['2017-2-24', '廿八'],
//                ['2017-2-25', '廿九'],
//                ['2017-2-26', '二月'],
//                ['2017-2-27', '初二'],
//                ['2017-2-28', '初三'],
//                ['2017-3-1', '初四'],
//                ['2017-3-2', '初五'],
//                ['2017-3-3', '初六'],
//                ['2017-3-4', '初七'],
//                ['2017-3-5', '初八'],
//                ['2017-3-6', '初九'],
//                ['2017-3-7', '初十'],
//                ['2017-3-8', '十一'],
//                ['2017-3-9', '十二'],
//                ['2017-3-10', '十三'],
//                ['2017-3-11', '十四'],
//                ['2017-3-12', '十五'],
//                ['2017-3-13', '十六'],
//                ['2017-3-14', '十七'],
//                ['2017-3-15', '十八'],
//                ['2017-3-16', '十九'],
//                ['2017-3-17', '二十'],
//                ['2017-3-18', '廿一'],
//                ['2017-3-19', '廿二'],
//                ['2017-3-20', '廿三'],
//                ['2017-3-21', '廿四'],
//                ['2017-3-22', '廿五'],
//                ['2017-3-23', '廿六'],
//                ['2017-3-24', '廿七'],
//                ['2017-3-25', '廿八'],
//                ['2017-3-26', '廿九'],
//                ['2017-3-27', '三十'],
//                ['2017-3-28', '三月'],
//                ['2017-3-29', '初二'],
//                ['2017-3-30', '初三'],
//                ['2017-3-31', '初四'],
//                ['2017-4-1', '初五'],
//                ['2017-4-2', '初六'],
//                ['2017-4-3', '初七'],
//                ['2017-4-4', '初八'],
//                ['2017-4-5', '初九'],
//                ['2017-4-6', '初十'],
//                ['2017-4-7', '十一'],
//                ['2017-4-8', '十二'],
//                ['2017-4-9', '十三'],
//                ['2017-4-10', '十四'],
//                ['2017-4-11', '十五'],
//                ['2017-4-12', '十六'],
//                ['2017-4-13', '十七'],
//                ['2017-4-14', '十八'],
//                ['2017-4-15', '十九'],
//                ['2017-4-16', '二十'],
//                ['2017-4-17', '廿一'],
//                ['2017-4-18', '廿二'],
//                ['2017-4-19', '廿三'],
//                ['2017-4-20', '廿四'],
//                ['2017-4-21', '廿五'],
//                ['2017-4-22', '廿六'],
//                ['2017-4-23', '廿七'],
//                ['2017-4-24', '廿八'],
//                ['2017-4-25', '廿九'],
//                ['2017-4-26', '四月'],
//                ['2017-4-27', '初二'],
//                ['2017-4-28', '初三'],
//                ['2017-4-29', '初四'],
//                ['2017-4-30', '初五'],
//                ['2017-5-1', '初六'],
//                ['2017-5-2', '初七'],
//                ['2017-5-3', '初八'],
//                ['2017-5-4', '初九'],
//                ['2017-5-5', '初十'],
//                ['2017-5-6', '十一'],
//                ['2017-5-7', '十二'],
//                ['2017-5-8', '十三'],
//                ['2017-5-9', '十四'],
//                ['2017-5-10', '十五'],
//                ['2017-5-11', '十六'],
//                ['2017-5-12', '十七'],
//                ['2017-5-13', '十八'],
//                ['2017-5-14', '十九'],
//                ['2017-5-15', '二十'],
//                ['2017-5-16', '廿一'],
//                ['2017-5-17', '廿二'],
//                ['2017-5-18', '廿三'],
//                ['2017-5-19', '廿四'],
//                ['2017-5-20', '廿五'],
//                ['2017-5-21', '廿六'],
//                ['2017-5-22', '廿七'],
//                ['2017-5-23', '廿八'],
//                ['2017-5-24', '廿九'],
//                ['2017-5-25', '三十'],
//                ['2017-5-26', '五月'],
//                ['2017-5-27', '初二'],
//                ['2017-5-28', '初三'],
//                ['2017-5-29', '初四'],
//                ['2017-5-30', '初五'],
//                ['2017-5-31', '初六'],
//                ['2017-6-1', '初七'],
//                ['2017-6-2', '初八'],
//                ['2017-6-3', '初九'],
//                ['2017-6-4', '初十'],
//                ['2017-6-5', '十一'],
//                ['2017-6-6', '十二'],
//                ['2017-6-7', '十三'],
//                ['2017-6-8', '十四'],
//                ['2017-6-9', '十五'],
//                ['2017-6-10', '十六'],
//                ['2017-6-11', '十七'],
//                ['2017-6-12', '十八'],
//                ['2017-6-13', '十九'],
//                ['2017-6-14', '二十'],
//                ['2017-6-15', '廿一'],
//                ['2017-6-16', '廿二'],
//                ['2017-6-17', '廿三'],
//                ['2017-6-18', '廿四'],
//                ['2017-6-19', '廿五'],
//                ['2017-6-20', '廿六'],
//                ['2017-6-21', '廿七'],
//                ['2017-6-22', '廿八'],
//                ['2017-6-23', '廿九'],
//                ['2017-6-24', '六月'],
//                ['2017-6-25', '初二'],
//                ['2017-6-26', '初三'],
//                ['2017-6-27', '初四'],
//                ['2017-6-28', '初五'],
//                ['2017-6-29', '初六'],
//                ['2017-6-30', '初七'],
//                ['2017-7-1', '初八'],
//                ['2017-7-2', '初九'],
//                ['2017-7-3', '初十'],
//                ['2017-7-4', '十一'],
//                ['2017-7-5', '十二'],
//                ['2017-7-6', '十三'],
//                ['2017-7-7', '十四'],
//                ['2017-7-8', '十五'],
//                ['2017-7-9', '十六'],
//                ['2017-7-10', '十七'],
//                ['2017-7-11', '十八'],
//                ['2017-7-12', '十九'],
//                ['2017-7-13', '二十'],
//                ['2017-7-14', '廿一'],
//                ['2017-7-15', '廿二'],
//                ['2017-7-16', '廿三'],
//                ['2017-7-17', '廿四'],
//                ['2017-7-18', '廿五'],
//                ['2017-7-19', '廿六'],
//                ['2017-7-20', '廿七'],
//                ['2017-7-21', '廿八'],
//                ['2017-7-22', '廿九'],
//                ['2017-7-23', '閏六',],
//                ['2017-7-24', '初二'],
//                ['2017-7-25', '初三'],
//                ['2017-7-26', '初四'],
//                ['2017-7-27', '初五'],
//                ['2017-7-28', '初六'],
//                ['2017-7-29', '初七'],
//                ['2017-7-30', '初八'],
//                ['2017-7-31', '初九'],
//                ['2017-8-1', '初十'],
//                ['2017-8-2', '十一'],
//                ['2017-8-3', '十二'],
//                ['2017-8-4', '十三'],
//                ['2017-8-5', '十四'],
//                ['2017-8-6', '十五'],
//                ['2017-8-7', '十六'],
//                ['2017-8-8', '十七'],
//                ['2017-8-9', '十八'],
//                ['2017-8-10', '十九'],
//                ['2017-8-11', '二十'],
//                ['2017-8-12', '廿一'],
//                ['2017-8-13', '廿二'],
//                ['2017-8-14', '廿三'],
//                ['2017-8-15', '廿四'],
//                ['2017-8-16', '廿五'],
//                ['2017-8-17', '廿六'],
//                ['2017-8-18', '廿七'],
//                ['2017-8-19', '廿八'],
//                ['2017-8-20', '廿九'],
//                ['2017-8-21', '三十'],
//                ['2017-8-22', '七月'],
//                ['2017-8-23', '初二'],
//                ['2017-8-24', '初三'],
//                ['2017-8-25', '初四'],
//                ['2017-8-26', '初五'],
//                ['2017-8-27', '初六'],
//                ['2017-8-28', '初七'],
//                ['2017-8-29', '初八'],
//                ['2017-8-30', '初九'],
//                ['2017-8-31', '初十'],
//                ['2017-9-1', '十一'],
//                ['2017-9-2', '十二'],
//                ['2017-9-3', '十三'],
//                ['2017-9-4', '十四'],
//                ['2017-9-5', '十五'],
//                ['2017-9-6', '十六'],
//                ['2017-9-7', '十七'],
//                ['2017-9-8', '十八'],
//                ['2017-9-9', '十九'],
//                ['2017-9-10', '二十'],
//                ['2017-9-11', '廿一'],
//                ['2017-9-12', '廿二'],
//                ['2017-9-13', '廿三'],
//                ['2017-9-14', '廿四'],
//                ['2017-9-15', '廿五'],
//                ['2017-9-16', '廿六'],
//                ['2017-9-17', '廿七'],
//                ['2017-9-18', '廿八'],
//                ['2017-9-19', '廿九'],
//                ['2017-9-20', '八月'],
//                ['2017-9-21', '初二'],
//                ['2017-9-22', '初三'],
//                ['2017-9-23', '初四'],
//                ['2017-9-24', '初五'],
//                ['2017-9-25', '初六'],
//                ['2017-9-26', '初七'],
//                ['2017-9-27', '初八'],
//                ['2017-9-28', '初九'],
//                ['2017-9-29', '初十'],
//                ['2017-9-30', '十一'],
//                ['2017-10-1', '十二'],
//                ['2017-10-2', '十三'],
//                ['2017-10-3', '十四'],
//                ['2017-10-4', '十五'],
//                ['2017-10-5', '十六'],
//                ['2017-10-6', '十七'],
//                ['2017-10-7', '十八'],
//                ['2017-10-8', '十九'],
//                ['2017-10-9', '二十'],
//                ['2017-10-10', '廿一'],
//                ['2017-10-11', '廿二'],
//                ['2017-10-12', '廿三'],
//                ['2017-10-13', '廿四'],
//                ['2017-10-14', '廿五'],
//                ['2017-10-15', '廿六'],
//                ['2017-10-16', '廿七'],
//                ['2017-10-17', '廿八'],
//                ['2017-10-18', '廿九'],
//                ['2017-10-19', '三十'],
//                ['2017-10-20', '九月'],
//                ['2017-10-21', '初二'],
//                ['2017-10-22', '初三'],
//                ['2017-10-23', '初四'],
//                ['2017-10-24', '初五'],
//                ['2017-10-25', '初六'],
//                ['2017-10-26', '初七'],
//                ['2017-10-27', '初八'],
//                ['2017-10-28', '初九'],
//                ['2017-10-29', '初十'],
//                ['2017-10-30', '十一'],
//                ['2017-10-31', '十二'],
//                ['2017-11-1', '十三'],
//                ['2017-11-2', '十四'],
//                ['2017-11-3', '十五'],
//                ['2017-11-4', '十六'],
//                ['2017-11-5', '十七'],
//                ['2017-11-6', '十八'],
//                ['2017-11-7', '十九'],
//                ['2017-11-8', '二十'],
//                ['2017-11-9', '廿一'],
//                ['2017-11-10', '廿二'],
//                ['2017-11-11', '廿三'],
//                ['2017-11-12', '廿四'],
//                ['2017-11-13', '廿五'],
//                ['2017-11-14', '廿六'],
//                ['2017-11-15', '廿七'],
//                ['2017-11-16', '廿八'],
//                ['2017-11-17', '廿九'],
//                ['2017-11-18', '十月'],
//                ['2017-11-19', '初二'],
//                ['2017-11-20', '初三'],
//                ['2017-11-21', '初四'],
//                ['2017-11-22', '初五'],
//                ['2017-11-23', '初六'],
//                ['2017-11-24', '初七'],
//                ['2017-11-25', '初八'],
//                ['2017-11-26', '初九'],
//                ['2017-11-27', '初十'],
//                ['2017-11-28', '十一'],
//                ['2017-11-29', '十二'],
//                ['2017-11-30', '十三'],
                ['2017-12-1', '十四'],
                ['2017-12-2', '十五'],
                ['2017-12-3', '十六'],
                ['2017-12-4', '十七'],
                ['2017-12-5', '十八'],
                ['2017-12-6', '十九'],
                ['2017-12-7', '二十'],
                ['2017-12-8', '廿一'],
                ['2017-12-9', '廿二'],
                ['2017-12-10', '廿三'],
                ['2017-12-11', '廿四'],
                ['2017-12-12', '廿五'],
                ['2017-12-13', '廿六'],
                ['2017-12-14', '廿七'],
                ['2017-12-15', '廿八'],
                ['2017-12-16', '廿九'],
                ['2017-12-17', '三十'],
                ['2017-12-18', '十一月'],
                ['2017-12-19', '初二'],
                ['2017-12-20', '初三'],
                ['2017-12-21', '初四'],
                ['2017-12-22', '初五'],
                ['2017-12-23', '初六'],
                ['2017-12-24', '初七'],
                ['2017-12-25', '初八'],
                ['2017-12-26', '初九'],
                ['2017-12-27', '初十'],
                ['2017-12-28', '十一'],
                ['2017-12-29', '十二'],
                ['2017-12-30', '十三'],
                ['2017-12-31', '十四'],
                ['2018-1-1', '十五'],
                ['2018-1-2', '十六'],
                ['2018-1-3', '十七'],
                ['2018-1-4', '十八'],
                ['2018-1-5', '十九'],
                ['2018-1-6', '二十'],
                ['2018-1-7', '廿一'],
                ['2018-1-8', '廿二'],
                ['2018-1-9', '廿三'],
                ['2018-1-10', '廿四'],
                ['2018-1-11', '廿五'],
                ['2018-1-12', '廿六'],
                ['2018-1-13', '廿七'],
                ['2018-1-14', '廿八'],
                ['2018-1-15', '廿九'],
                ['2018-1-16', '三十'],
                ['2018-1-17', '十二月'],
                ['2018-1-18', '初二'],
                ['2018-1-19', '初三'],
                ['2018-1-20', '初四'],
                ['2018-1-21', '初五'],
                ['2018-1-22', '初六'],
                ['2018-1-23', '初七'],
                ['2018-1-24', '初八'],
                ['2018-1-25', '初九'],
                ['2018-1-26', '初十'],
                ['2018-1-27', '十一'],
                ['2018-1-28', '十二'],
                ['2018-1-29', '十三'],
                ['2018-1-30', '十四'],
                ['2018-1-31', '十五'],
                ['2018-2-1', '十六'],
                ['2018-2-2', '十七'],
                ['2018-2-3', '十八'],
                ['2018-2-4', '十九'],
                ['2018-2-5', '二十'],
                ['2018-2-6', '廿一'],
                ['2018-2-7', '廿二'],
                ['2018-2-8', '廿三'],
                ['2018-2-9', '廿四'],
                ['2018-2-10', '廿五'],
                ['2018-2-11', '廿六'],
                ['2018-2-12', '廿七'],
                ['2018-2-13', '廿八'],
                ['2018-2-14', '廿九'],
                ['2018-2-15', '三十'],
                ['2018-2-16', '正月'],
                ['2018-2-17', '初二'],
                ['2018-2-18', '初三'],
                ['2018-2-19', '初四'],
                ['2018-2-20', '初五'],
                ['2018-2-21', '初六'],
                ['2018-2-22', '初七'],
                ['2018-2-23', '初八'],
                ['2018-2-24', '初九'],
                ['2018-2-25', '初十'],
                ['2018-2-26', '十一'],
                ['2018-2-27', '十二'],
                ['2018-2-28', '十三'],
                ['2018-3-1', '十四'],
                ['2018-3-2', '十五'],
                ['2018-3-3', '十六'],
                ['2018-3-4', '十七'],
                ['2018-3-5', '十八'],
                ['2018-3-6', '十九'],
                ['2018-3-7', '二十'],
                ['2018-3-8', '廿一'],
                ['2018-3-9', '廿二'],
                ['2018-3-10', '廿三'],
                ['2018-3-11', '廿四'],
                ['2018-3-12', '廿五'],
                ['2018-3-13', '廿六'],
                ['2018-3-14', '廿七'],
                ['2018-3-15', '廿八'],
                ['2018-3-16', '廿九'],
                ['2018-3-17', '二月'],
                ['2018-3-18', '初二'],
                ['2018-3-19', '初三'],
                ['2018-3-20', '初四'],
                ['2018-3-21', '初五'],
                ['2018-3-22', '初六'],
                ['2018-3-23', '初七'],
                ['2018-3-24', '初八'],
                ['2018-3-25', '初九'],
                ['2018-3-26', '初十'],
                ['2018-3-27', '十一'],
                ['2018-3-28', '十二'],
                ['2018-3-29', '十三'],
                ['2018-3-30', '十四'],
                ['2018-3-31', '十五'],
                ['2018-4-1', '十六'],
                ['2018-4-2', '十七'],
                ['2018-4-3', '十八'],
                ['2018-4-4', '十九'],
                ['2018-4-5', '二十'],
                ['2018-4-6', '廿一'],
                ['2018-4-7', '廿二'],
                ['2018-4-8', '廿三'],
                ['2018-4-9', '廿四'],
                ['2018-4-10', '廿五'],
                ['2018-4-11', '廿六'],
                ['2018-4-12', '廿七'],
                ['2018-4-13', '廿八'],
                ['2018-4-14', '廿九'],
                ['2018-4-15', '三十'],
                ['2018-4-16', '三月'],
                ['2018-4-17', '初二'],
                ['2018-4-18', '初三'],
                ['2018-4-19', '初四'],
                ['2018-4-20', '初五'],
                ['2018-4-21', '初六'],
                ['2018-4-22', '初七'],
                ['2018-4-23', '初八'],
                ['2018-4-24', '初九'],
                ['2018-4-25', '初十'],
                ['2018-4-26', '十一'],
                ['2018-4-27', '十二'],
                ['2018-4-28', '十三'],
                ['2018-4-29', '十四'],
                ['2018-4-30', '十五'],
                ['2018-5-1', '十六'],
                ['2018-5-2', '十七'],
                ['2018-5-3', '十八'],
                ['2018-5-4', '十九'],
                ['2018-5-5', '二十'],
                ['2018-5-6', '廿一'],
                ['2018-5-7', '廿二'],
                ['2018-5-8', '廿三'],
                ['2018-5-9', '廿四'],
                ['2018-5-10', '廿五'],
                ['2018-5-11', '廿六'],
                ['2018-5-12', '廿七'],
                ['2018-5-13', '廿八'],
                ['2018-5-14', '廿九'],
                ['2018-5-15', '四月'],
                ['2018-5-16', '初二'],
                ['2018-5-17', '初三'],
                ['2018-5-18', '初四'],
                ['2018-5-19', '初五'],
                ['2018-5-20', '初六'],
                ['2018-5-21', '初七'],
                ['2018-5-22', '初八'],
                ['2018-5-23', '初九'],
                ['2018-5-24', '初十'],
                ['2018-5-25', '十一'],
                ['2018-5-26', '十二'],
                ['2018-5-27', '十三'],
                ['2018-5-28', '十四'],
                ['2018-5-29', '十五'],
                ['2018-5-30', '十六'],
                ['2018-5-31', '十七'],
                ['2018-6-1', '十八'],
                ['2018-6-2', '十九'],
                ['2018-6-3', '二十'],
                ['2018-6-4', '廿一'],
                ['2018-6-5', '廿二'],
                ['2018-6-6', '廿三'],
                ['2018-6-7', '廿四'],
                ['2018-6-8', '廿五'],
                ['2018-6-9', '廿六'],
                ['2018-6-10', '廿七'],
                ['2018-6-11', '廿八'],
                ['2018-6-12', '廿九'],
                ['2018-6-13', '三十'],
                ['2018-6-14', '五月'],
                ['2018-6-15', '初二'],
                ['2018-6-16', '初三'],
                ['2018-6-17', '初四'],
                ['2018-6-18', '初五'],
                ['2018-6-19', '初六'],
                ['2018-6-20', '初七'],
                ['2018-6-21', '初八'],
                ['2018-6-22', '初九'],
                ['2018-6-23', '初十'],
                ['2018-6-24', '十一'],
                ['2018-6-25', '十二'],
                ['2018-6-26', '十三'],
                ['2018-6-27', '十四'],
                ['2018-6-28', '十五'],
                ['2018-6-29', '十六'],
                ['2018-6-30', '十七'],
                ['2018-7-1', '十八'],
                ['2018-7-2', '十九'],
                ['2018-7-3', '二十'],
                ['2018-7-4', '廿一'],
                ['2018-7-5', '廿二'],
                ['2018-7-6', '廿三'],
                ['2018-7-7', '廿四'],
                ['2018-7-8', '廿五'],
                ['2018-7-9', '廿六'],
                ['2018-7-10', '廿七'],
                ['2018-7-11', '廿八'],
                ['2018-7-12', '廿九'],
                ['2018-7-13', '六月'],
                ['2018-7-14', '初二'],
                ['2018-7-15', '初三'],
                ['2018-7-16', '初四'],
                ['2018-7-17', '初五'],
                ['2018-7-18', '初六'],
                ['2018-7-19', '初七'],
                ['2018-7-20', '初八'],
                ['2018-7-21', '初九'],
                ['2018-7-22', '初十'],
                ['2018-7-23', '十一'],
                ['2018-7-24', '十二'],
                ['2018-7-25', '十三'],
                ['2018-7-26', '十四'],
                ['2018-7-27', '十五'],
                ['2018-7-28', '十六'],
                ['2018-7-29', '十七'],
                ['2018-7-30', '十八'],
                ['2018-7-31', '十九'],
                ['2018-8-1', '二十'],
                ['2018-8-2', '廿一'],
                ['2018-8-3', '廿二'],
                ['2018-8-4', '廿三'],
                ['2018-8-5', '廿四'],
                ['2018-8-6', '廿五'],
                ['2018-8-7', '廿六'],
                ['2018-8-8', '廿七'],
                ['2018-8-9', '廿八'],
                ['2018-8-10', '廿九'],
                ['2018-8-11', '七月'],
                ['2018-8-12', '初二'],
                ['2018-8-13', '初三'],
                ['2018-8-14', '初四'],
                ['2018-8-15', '初五'],
                ['2018-8-16', '初六'],
                ['2018-8-17', '初七'],
                ['2018-8-18', '初八'],
                ['2018-8-19', '初九'],
                ['2018-8-20', '初十'],
                ['2018-8-21', '十一'],
                ['2018-8-22', '十二'],
                ['2018-8-23', '十三'],
                ['2018-8-24', '十四'],
                ['2018-8-25', '十五'],
                ['2018-8-26', '十六'],
                ['2018-8-27', '十七'],
                ['2018-8-28', '十八'],
                ['2018-8-29', '十九'],
                ['2018-8-30', '二十'],
                ['2018-8-31', '廿一'],
                ['2018-9-1', '廿二'],
                ['2018-9-2', '廿三'],
                ['2018-9-3', '廿四'],
                ['2018-9-4', '廿五'],
                ['2018-9-5', '廿六'],
                ['2018-9-6', '廿七'],
                ['2018-9-7', '廿八'],
                ['2018-9-8', '廿九'],
                ['2018-9-9', '三十'],
                ['2018-9-10', '八月'],
                ['2018-9-11', '初二'],
                ['2018-9-12', '初三'],
                ['2018-9-13', '初四'],
                ['2018-9-14', '初五'],
                ['2018-9-15', '初六'],
                ['2018-9-16', '初七'],
                ['2018-9-17', '初八'],
                ['2018-9-18', '初九'],
                ['2018-9-19', '初十'],
                ['2018-9-20', '十一'],
                ['2018-9-21', '十二'],
                ['2018-9-22', '十三'],
                ['2018-9-23', '十四'],
                ['2018-9-24', '十五'],
                ['2018-9-25', '十六'],
                ['2018-9-26', '十七'],
                ['2018-9-27', '十八'],
                ['2018-9-28', '十九'],
                ['2018-9-29', '二十'],
                ['2018-9-30', '廿一'],
                ['2018-10-1', '廿二'],
                ['2018-10-2', '廿三'],
                ['2018-10-3', '廿四'],
                ['2018-10-4', '廿五'],
                ['2018-10-5', '廿六'],
                ['2018-10-6', '廿七'],
                ['2018-10-7', '廿八'],
                ['2018-10-8', '廿九'],
                ['2018-10-9', '九月'],
                ['2018-10-10', '初二'],
                ['2018-10-11', '初三'],
                ['2018-10-12', '初四'],
                ['2018-10-13', '初五'],
                ['2018-10-14', '初六'],
                ['2018-10-15', '初七'],
                ['2018-10-16', '初八'],
                ['2018-10-17', '初九'],
                ['2018-10-18', '初十'],
                ['2018-10-19', '十一'],
                ['2018-10-20', '十二'],
                ['2018-10-21', '十三'],
                ['2018-10-22', '十四'],
                ['2018-10-23', '十五'],
                ['2018-10-24', '十六'],
                ['2018-10-25', '十七'],
                ['2018-10-26', '十八'],
                ['2018-10-27', '十九'],
                ['2018-10-28', '二十'],
                ['2018-10-29', '廿一'],
                ['2018-10-30', '廿二'],
                ['2018-10-31', '廿三'],
                ['2018-11-1', '廿四'],
                ['2018-11-2', '廿五'],
                ['2018-11-3', '廿六'],
                ['2018-11-4', '廿七'],
                ['2018-11-5', '廿八'],
                ['2018-11-6', '廿九'],
                ['2018-11-7', '三十'],
                ['2018-11-8', '十月'],
                ['2018-11-9', '初二'],
                ['2018-11-10', '初三'],
                ['2018-11-11', '初四'],
                ['2018-11-12', '初五'],
                ['2018-11-13', '初六'],
                ['2018-11-14', '初七'],
                ['2018-11-15', '初八'],
                ['2018-11-16', '初九'],
                ['2018-11-17', '初十'],
                ['2018-11-18', '十一'],
                ['2018-11-19', '十二'],
                ['2018-11-20', '十三'],
                ['2018-11-21', '十四'],
                ['2018-11-22', '十五'],
                ['2018-11-23', '十六'],
                ['2018-11-24', '十七'],
                ['2018-11-25', '十八'],
                ['2018-11-26', '十九'],
                ['2018-11-27', '二十'],
                ['2018-11-28', '廿一'],
                ['2018-11-29', '廿二'],
                ['2018-11-30', '廿三'],
                ['2018-12-1', '廿四'],
                ['2018-12-2', '廿五'],
                ['2018-12-3', '廿六'],
                ['2018-12-4', '廿七'],
                ['2018-12-5', '廿八'],
                ['2018-12-6', '廿九'],
                ['2018-12-7', '十一月'],
                ['2018-12-8', '初二'],
                ['2018-12-9', '初三'],
                ['2018-12-10', '初四'],
                ['2018-12-11', '初五'],
                ['2018-12-12', '初六'],
                ['2018-12-13', '初七'],
                ['2018-12-14', '初八'],
                ['2018-12-15', '初九'],
                ['2018-12-16', '初十'],
                ['2018-12-17', '十一'],
                ['2018-12-18', '十二'],
                ['2018-12-19', '十三'],
                ['2018-12-20', '十四'],
                ['2018-12-21', '十五'],
                ['2018-12-22', '十六'],
                ['2018-12-23', '十七'],
                ['2018-12-24', '十八'],
                ['2018-12-25', '十九'],
                ['2018-12-26', '二十'],
                ['2018-12-27', '廿一'],
                ['2018-12-28', '廿二'],
                ['2018-12-29', '廿三'],
                ['2018-12-30', '廿四'],
                ['2018-12-31', '廿五']
            ];


            var heatmapData = [];
            var lunarData = [];
//            var myDate = new Date();
            var myDate = new Date("2017-12-31");
            var mymonth = myDate.getMonth();//获取当前月份(0-11,0代表1月)
            mymonth = mymonth + 1;
            mymonth = mymonth < 10 ? '0'+mymonth: mymonth;
            var mydate = myDate.getDate();//获取当前日(1-31)
            mydate = mydate -1;
            mydate = mydate < 10 ? '0'+mydate: mydate;

            for (var i = 0; i < dateList.length; i++) {

                //构建日历
                lunarData.push([
                    dateList[i][0],
                    1,
                    dateList[i][1]
                ]);
            }


            $.ajax({
                type: "GET",
                <%--url: "${js}/data/rlt.json",--%>
                url: window.ctx+"/beta/dairyDuration",
                data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
                dataType: "json",
                success: function (res) {
                    var len = res.duration.length;
                    var dulen=0;
                    for(var d = 0;d < len;d++){
                        dulen = dulen + res.duration[d];
                    }
                    $('#p2').html("通话总时长："+Number(dulen).toFixed(2)+" min");
                    var mycgdate = mydate;
                    for(var i = 0 ; i < len;i++){
                        heatmapData.push([
                            myyear+"-"+mymonth+"-"+mycgdate--,
                            res.duration[len-1-i]
                        ]);
                    }
                    var date1 = myyear+"-"+mymonth+"-1";
                    var we = String(echarts.number.parseDate(date1)).split(" ");
                    var daynum = new Date(myyear,mymonth,0).getDate();
                    var cellsize;
                    switch(daynum){
                        case 30:
                            if(we[0] === 'Sun'){
                                cellsize = [60, 58.5];
                            }else {
                                cellsize = [60, 70];
                            }
                            break;
                        case 31:
                            if(we[0] === 'Sat'||we[0] === 'Sun'){
                                cellsize = [60, 58.5];
                            }else {
                                cellsize = [60, 70];
                            }
                            break;
                        case 28:
                            if(we[0] === 'Mon'){
                                cellsize = [60, 87.5];
                            }else {
                                cellsize = [60, 70];
                            }
                            break;
                        default:
                            cellsize = [60, 70];
                            break;
                    }
                    option = {
                        tooltip: {
                            formatter: function (params) {
                                return '通话时长: ' + params.value[1].toFixed(2) +'min';
                            }
                        },


                        visualMap: {
                            show: false,
                            min: 0,
                            max: 200,
                            calculable: true,
                            seriesIndex: [2],
                            orient: 'horizontal',
                            left: 'center',
                            bottom: 0,
                            inRange: {
//                                color: ['#8da4c0', '#b4bec7','#96aac1'],
                                color: ['#c3d8e6','#71c3fe','#43b0fe','#169eff','#027ad4'],
                                opacity: 0.9
                            },
                            controller: {
                                inRange: {
                                    opacity: 0.5
                                }
                            }
                        },

                        calendar: [{
                            left: 'center',
                            top: 'bottom',
                            cellSize: cellsize,
                            yearLabel: {show: false},
                            orient: 'vertical',
                            dayLabel: {
                                firstDay: 1,
                                nameMap: 'cn',
                                textStyle: {
                                    color: '#7c7e88'//星期几 颜色
                                }
                            },
                            monthLabel: {
                                show: false
                            },
                            range: myyear+'-'+mymonth

                        }],

                        series: [{
                            type: 'scatter',
                            coordinateSystem: 'calendar',
                            symbolSize: 1,
                            label: {
                                normal: {
                                    show: true,
                                    formatter: function (params) {
                                        var d = echarts.number.parseDate(params.value[0]);
                                        return d.getDate() + '\n\n' + params.value[2] + '\n\n';
                                    },
                                    textStyle: {
                                        color: '#3a404b'
                                    },
                                    offset: [-60/ 2+30, 5]
                                }
                            },
                            data: lunarData
                        }, {
                            type: 'scatter',
                            coordinateSystem: 'calendar',
                            symbolSize: 1,
                            label: {
                                normal: {
                                    show: true,
                                    formatter: function (params) {
                                        return '\n\n\n' + (params.value[3] || '');
                                    },
                                    textStyle: {
                                        fontSize: 14,
                                        fontWeight: 700,
                                        color: '#666974'
                                    }
                                }
                            },
                            data: lunarData
                        }, {
                            name: '通话时长',
                            type: 'heatmap',
                            coordinateSystem: 'calendar',
                            data: heatmapData
                        }]
                    };
                    myChart3.setOption(option);
                    myChart3.off('click');
                    myChart3.on('click', function (params) {
                        var day = params.data[0].split("-");
                        //给2017-1-8变身 20170108
                        var dt1 = day[1] <10 ? '0'+day[1] : day[1];
                        var dt2 = day[2] <10 ? '0'+day[2] : day[2];
                        var dt = myyear+dt1+""+dt2;
                        //点击事件
                        lineBar(dt);
                    });


                },
                error: function () {
                    alert("获取日历图失败，请联系管理员！");
                }
            });




        }
//        calendar("day");



        //柱状图&&折线图
        function lineBar(searchTime){
            var targetPhone=$("#targetPhone").val();
            if (myChart4 != null && myChart4 != "" && myChart4 != undefined) {
                myChart4.dispose();
            }
            myChart4 = echarts.init(document.getElementById('lineBar'));


            $.ajax({
                type: "GET",
                <%--url: "${js}/data/zzt.json",--%>
                url: window.ctx+"/beta/dayDuration",
                data: {"targetPhone":targetPhone,"searchTime":searchTime},
                dataType: "json",
                success: function (data) {
//                    console.log(data);
                    for(var i = 0;i<data.duration.length;i++ ){
                        data.duration[i]= data.duration[i].toFixed(2);
                    }


                    option = {
                        tooltip: {
//                            formatter: function (params) {
//                                return params.value;
//                            },
                            trigger: 'axis',
                            axisPointer: {type: 'cross'}

                        },
                        legend: {
                            data:['时长','次数'],
                            textStyle : {
                                color: '#d5d7d8',
                                decoration: 'none',
                                fontSize: 14
                            }
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23'],
                                axisLine:{
                                    lineStyle:{
                                        color:'#a4a5aa',
                                        width:1 //这里是为了突出显示加上的
                                    }
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                splitLine:{show: false},
                                name: '时长',
                                min: 0,
                                max: 60,
                                interval: 5,
                                axisLabel: {
                                    formatter: '{value} min',
                                    show: true,
                                    textStyle: {
                                        color: '#a4a5aa'
                                    }
                                },
                                axisLine:{
                                    lineStyle:{
                                        color:'#a4a5aa'
                                    }
                                }
                            },
                            {
                                type: 'value',
                                name: '次数',
                                min: 0,
                                max: 8,
                                interval: 1,
                                axisLabel: {
                                    formatter: '{value} ',
                                    show: true,
                                    textStyle: {
                                        color: '#a4a5aa'
                                    }
                                },
                                axisLine:{
                                    lineStyle:{
                                        color:'#a4a5aa'
                                    }
                                },
                                splitLine:{
                                    show:false
                                }
                            }
                        ],
                        series: [
                            {
                                name:'时长',
                                type:'bar',
//                        data:[2.0, 4.9, 7.0, 23.2, 25.6, 40.7, 35.6, 12.2, 32.6, 20.0, 6.4, 3.3,10.6,11,14,15,16,18,12,10,4,5.4,5,6],
                                data:data.duration,
                                barWidth: 15,
                                itemStyle:{
                                    normal:{
                                        color:'#237cc8'
                                    }
                                }
                            },
                            {
                                name:'次数',
                                type:'line',
                                yAxisIndex: 1,
//                        data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 2.3, 2.4, 2.0, 1.5, 12.0, 6.2,3.3,10.6,11,14,15,16,18,12,10,4,5.4,5,6],
                                data: data.count,
                                barWidth: 1,
                                itemStyle:{
                                    normal:{
                                        color:'rgba(197,221,241,0.7)'
                                    }
                                }
                            }
                        ]
                    };
                    myChart4.setOption(option);

                },
                error: function () {
                    alert("获取失败，请联系管理员！");
                }
            });




        }
//        lineBar("20171206");



        //热力图

        function map02(){

            var tp = $("#targetPhone").val();
            if (myChart5 != null && myChart5 != "" && myChart5 != undefined) {
                myChart5.dispose();
            }
            myChart5 = echarts.init(document.getElementById('thermodynamicChart'));
            $.ajax({
                type:"GET",
                url:window.ctx+"/getHeatMap?targetPhone="+tp,
                dataType:"json",
                success:function (data) {
                    var points = data.map(function (seg) {
                        return seg.coord.concat([1]);
                    });
                    myChart5.setOption(option = {
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
                    });

                    // 添加百度地图插件
                    var bmap = myChart5.getModel().getComponent('bmap').getBMap();
                    //变颜色
                    bmap.setMapStyle({style:'grayscale'});//灰色皮肤
                    bmap.addControl(new BMap.MapTypeControl({
                        mapTypes:[
                            BMAP_NORMAL_MAP
                        ]}));

                },
                error:function () {
                    alert("获取失败，请联系管理员！");

                }
            });



        }
        map02();



</script>

</body>
</html>
