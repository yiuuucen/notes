<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>联系人列表</title>
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
    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });
            $("#navList li").removeClass("active");
            $("#navList li:eq(1)").addClass("active");

            $("#img1").attr("src","${img}/u-03.png");
            $("#img2").attr("src","${img}/u-04c.png");
            $("#img3").attr("src","${img}/u-05.png");




            //关闭窗口
            $(".btn-close").on("click",function(){
                $('#echart-right').hide();
            });
            //图标展示高度
            var h= $(window).height()-60;
            $("#ect").height(h);
            $(".listl .list").height((h/2)-40);

        })
    </script>
    <style>
        .eboxlist{
            display: none;
        }
    </style>
</head>
<body>
<div class="container-fluid smartEyes-container">
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox listbox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
            <div class="pull-left namelistcc col-lg-4 col-md-4 col-xs-4">
                <span>当前重点人员：</span>
                <span id="tit-person"> </span>
            </div>
            <div class="pull-right text-right input-group col-lg-5">
                <!--<input placeholder="2017-10-01 16:49" type="text" class="pull-right datetimepicker" />
                <input placeholder="2017-10-02 16:49" type="text" class="pull-right datetimepicker" />-->
                <select class="pull-right select" onchange="allChange2(this.options[this.options.selectedIndex].value)" style="margin-top: 7px; margin-right: 16px;">
                    <option value="day" >&nbsp;最近一天</option>
                    <option value="week">&nbsp;最近一周</option>
                    <option value="month" selected=''>&nbsp;最近一月</option>
                    <%--<option value="最近一年">&nbsp;最近一年</option>--%>
                    <%--<option value="自定义">&nbsp;自定义</option>--%>
                    <%--<option value="全部">&nbsp;全部</option>--%>
                </select>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-xs-3 listl" style="border-bottom: none;">
            <div class="l-contacts">
                <div class="c-head clearfix">
                    <span class="pull-left"><i></i>一度联系人</span>
                    <span class="pull-right" id="1total">-人</span>
                </div>
                <ul class="list" id="firstcontact">
                    <%--<li class="list-group-item">--%>
                        <%--<span><i> </i> </span>--%>
                        <%--<span> </span>--%>
                        <%--<span> </span>--%>
                    <%--</li>--%>
                </ul>
            </div>
            <div class="l-contacts t-contacts">
                <div class="c-head clearfix">
                    <span class="pull-left"><i></i>二度联系人</span>
                    <span class="pull-right" id="2total">-人</span>
                </div>
                <ul class="list" id="secondcontact">
                    <%--<li class="list-group-item">--%>
                        <%--<span><i> </i> </span>--%>
                        <%--<span> </span>--%>
                        <%--<span> </span>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
        <!--图表展示-->
        <div class="col-lg-9 col-md-9 col-xs-9 echartBox">
            <div class="echart03" id="ect"></div>
        </div>
    </div>
    <div class="echart-right" id="echart-right" style="display: none;">
        <!--点击弹出图表-->
        <div class="head clearfix">
            <h3 class="pull-left">联系人信息</h3>
            <i class="pull-right btn btn-close" style="top:0"><img src="${img}/u-16.png" width="13" height="13"></i>
        </div>
        <div class="csbox">
            <div class="cent clearfix">
                <div class="title pull-left">
                    <img src="${img}/u-18.png" />
                </div>
                <div class="texTtitle pull-left"style="margin-top: 14px">
                    <%--<p id="right-curnum">SE981239123</p>--%>
                    <p id="right-curnum"></p>
                    <%--<p id="right-curlab"style="font-size: 12px;">一度联系人   Rank1   0.9</p>--%>
                    <p id="right-curlab"style="font-size: 10px;"></p>
                </div>
                <div class="pull-right">
                    <%--<a href="#"><img style="margin-top: 16px;" src="${img}/u-19.png"></a>--%>
                </div>
            </div>
        </div>
        <div class="e-right">
            <div class="e-r-l">
                <%--<h1>联系人概览<i class="glyphicon glyphicon-chevron-down"></i></h1>--%>
                <h1>联系人概览</h1>
                <div class="ebox" id="eBox" style="width: 233px; height: 174px; margin-left: 14px;">

                </div>
            </div>
            <div class="e-r-l">
                <div class="ectitle" style="margin-top: 60px;">
                    <span class="active">通话时长</span>
                    <i>|</i>
                    <span>通话频次</span>
                </div>
                <div class="ebox eboxlist" id="eBox02" style="width: 230px; display: block; height: 200px; margin-left: 14px;">

                </div>
                <div class="ebox eboxlist" id="eBox03" style="width: 230px; height: 200px; margin-left: 14px;">

                </div>

            </div>
            <div class="btnBox hide">
                <a href="#">点击查看更多</a>
            </div>
        </div>

    </div>
</div>
<!--底部-->
<footer style="background: none;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
<script type="text/javascript" src="${js}/dataTool.js" ></script>
<script type="text/javascript">
    //图标展示高度
    var h= $(window).height()-60;
    $("#ect").height(h);
    var myChart0;
    var myChart1;
    var myChart2;
    var myChart3;
    var myDate = new Date("2017-12-31");
    var myyear = ""+myDate.getFullYear();    //获取完整的年份(4位,1970-????)

    var targetPhone=$("#targetPhone").val();
    var nodeTimerange=[];
    function allChange2(value) {
//        var myDate = new Date();
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
                nodeTimerange = timerange;

                break;
            case "week":
                var mywkdate = mydate;
                timerange[1] = myyear+mymonth+""+mydate;
                mywkdate = (mydate-6) < 0 ? '0'+1 : mydate-6+"";
                timerange[0] = myyear+mymonth+""+mywkdate;
                nodeTimerange = timerange;

                break;
            case "month":
                timerange[0] = myyear+mymonth+""+"01";
                timerange[1] = myyear+mymonth+""+mydate;
                nodeTimerange = timerange;

                break;

        }
        contactList(timerange);
        relationG(timerange);
        $('#echart-right').hide();

    }
    //初始化
    function initialFunc(){
//        var myDate = new Date();
        var myDate = new Date("2017-12-31");
        var mymonth = myDate.getMonth();//获取当前月份(0-11,0代表1月)
        mymonth = mymonth + 1;
        mymonth = mymonth < 10 ? '0'+mymonth: mymonth;//小于10前面加0
        var mydate = myDate.getDate();//获取当前日(1-31)
        mydate = mydate-1;//得到昨天的日子
        mydate = mydate < 10 ? '0'+mydate: mydate;
        var timerange = [];
//        timerange[0] = myyear+mymonth+""+mydate;
//        timerange[1] = myyear+mymonth+""+mydate;
        timerange[0] = myyear+mymonth+""+"01";
        timerange[1] = myyear+mymonth+""+mydate;

        nodeTimerange = timerange;
        contactList(timerange);
//        console.log("timerange");
//        console.log(timerange);
//            relation(["20171221","20171221"]);
        relationG(timerange);
//            relation2(["20171221","20171221"]);

    }
    initialFunc();

    function sortExp(a,b){
        return b.exp-a.exp;
    }
    function contactList(timerange) {
        $.ajax({
            type:"GET",
            url:window.ctx+"/beta/getContacts",
            data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
            dataType:"json",
            success:function (data) {
//                console.log("data");
//                console.log(data);

                if(data!==null){

                    //初始化变量
                    var firstcon = data.firstContact;
                    var secondcon = data.secondContact;

                    var firlen = firstcon.length;
                    var seclen = secondcon.length;
                    //给一度二度联系人名字加SE；

                    if(firlen!==0){
                        firstcon.forEach(function (f) {

                            f.name="SE"+f.name.slice(-12);

                        });
                    }else {}

                    if(seclen!==0){
                        secondcon.forEach(function (se) {

                            se.name="SE"+se.name.slice(-12);

                        });
                    }else {}
                    //对一度联系人二度联系人排序。
                    firstcon.sort(sortExp);
                    secondcon.sort(sortExp);


                    $('#1total').html(firlen+"人");
                    $('#2total').html(seclen+"人");

                    $('#tit-person').html("SE"+targetPhone+"   有效联系人总数: "+(firlen+seclen));

                    //清空ul下的li
                    $('#firstcontact').html("");
                    $('#secondcontact').html("");

                    //根据获取数据长度每次添加一个li
                    function appendLi(id,len) {
                        for(var j=0;j<len;j++)
                        {
                            var apen="<span></span><span></span>";
                            var selector = '#'+id;
                            $(selector).append(
                                "<li class=\"list-group-item mylist-group-item\"><span><i></i></span>"+apen+"</li>"
                            );
                        }
                    }
                    appendLi('firstcontact',firlen);
                    appendLi('secondcontact',seclen);



                    //给第一联系人第二联系人设置具体值
                    function setValue(id,val) {
                        var selector = '#'+id+' >li';
                        $(selector).each(function (i) {
                            // $(this).children('span:eq(0)').find("i").text()

                            $(this).children('span:eq(0)').html("<i>"+(i+1)+".</i>"+(val[i].name));

                            if(val[i].tag==="重点人员"){
                                $(this).children('span:eq(1)').css({"color":"#ff5353"});
                                $(this).children('span:eq(2)').css({"color":"#ff5353"});
                            }
                            $(this).children('span:eq(1)').html(""+(val[i].tag));
                            $(this).children('span:eq(2)').html("关联指数："+(val[i].exp).toFixed(2));
                        });
                    }
                    setValue('firstcontact',firstcon);
                    setValue('secondcontact',secondcon);

                }else {
                    alert("查不到数据");
                }

            },
            error:function() {
                console.log("获取联系人数据失败,请联系管理员");
            }
        });
    }


    function relationG(timerange) {
        //关系图
        if (myChart0 != null && myChart0 != "" && myChart0 != undefined) {
            myChart0.dispose();
        }
        myChart0 = echarts.init(document.getElementById('ect'));

        myChart0.showLoading();

        $.ajax({
            type:"GET",
            url:window.ctx+"/beta/getGraph",
            data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
            dataType:"json",
            success:function (graph) {

//                console.log("graph");
//                console.log(graph);

                myChart0.hideLoading();

                var categories = [{
                    name:'当前重点人员',
                    itemStyle: {
                        normal: {
                            color: "#478fca"
                        }
                    }
                },
                    {
                        name:'一度联系人',
                        itemStyle: {
                            normal: {
                                color: "#d34831"
                            }
                        }
                    },
                    {
                        name:'二度联系人',
                        itemStyle: {
                            normal: {
                                color: "#de9246"
                            }
                        }
                    }
                ];
                function sortExp(a,b){
                    return b.exp-a.exp
                }
                //找到max

                var mynode = graph.nodes;
                var brr1=[];
                var brr2=[];
                var max1,max2;
                for(var i=0;i<mynode.length;i++){
                    if(mynode[i].category===1){
                        brr1.push(mynode[i]);

                    }else if(mynode[i].category===2){
                        brr2.push(mynode[i]);
                    }else{}
                }
                brr1.sort(sortExp);
                if(brr1.length!==0){max1 = brr1[0].exp;}
                brr2.sort(sortExp);
                if(brr2.length!==0){max2 = brr2[0].exp;}


                graph.nodes.forEach(function (node) {
                    //node.itemStyle = null;
                    //node.draggable = true;


                    //设置大小

                    switch(node.category)
                    {
                        case 0:
                            node.symbolSize = 40;
                            break;
                        case 1:
                            node.symbolSize = 30*node.exp/max1;
                            break;
                        case 2:
                            node.symbolSize = 16*node.exp/max2;
                            break;
                    }
                    node.name="SE"+node.name;
                    node.value=node.exp.toFixed(2);
                    node.label = {
                        normal: {
                            //4.35
                            show: false
                        }
                    };
                    node.isnode = true;

                });
                graph.links.forEach(function (link) {

                    link.source="SE"+link.source;
                    link.target="SE"+link.target;
                    link.islink = true;

                });


                myChart0.off('click');
                myChart0.on("click",nodeClick);

                option = {
                    /*title: {
                     text: 'L',
                     subtext: 'Default layout',
                     top: 'bottom',
                     left: 'right'
                     },*/
                    //4.35
                    tooltip: {
                        formatter: function (params) {
                            if(params.data.islink){
                                if(params.data.source==="SE"+targetPhone){return params.data.source+" > "+'SE'+params.data.target.slice(-12);}
                                else{return 'SE'+params.data.source.slice(-12)+" > "+'SE'+params.data.target.slice(-12);}
                            }
                            else {
                                if(params.name==="SE"+targetPhone){return params.name+": "+params.value;}
                                else{return 'SE'+params.name.slice(-12)+": "+params.value;}
                            }
                        }
                    },
                    legend: [{
                        selectedMode: 'multiple',
                        data: categories.map(function (a) {
                            return a.name;
                        }),
                        textStyle: {
                            color: '#ccc'
                        }

                    }],
                    animationDuration: 1500,
                    animationEasingUpdate: 'quinticInOut',
                    series : [
                        {
                            name: '联系人节点',
                            type: 'graph',
//                            layout: 'circular',
                            layout: 'force',

                            force: {
//                                edgeLength:200,
//                                edgeLength:10,
//                                repulsion: 500
                                repulsion: 60,
                                gravity: 0.2,
//                                edgeLength: 30,
                                edgeLength: 60,
                                layoutAnimation: true

                            },
                            data: graph.nodes,
                            links: graph.links,
                            categories: categories,
                            roam: false,
                            draggable:false,
                            label: {
                                normal: {
                                    position: 'left',
                                    formatter: '{b}'
                                }
                            },

                            lineStyle: {
                                normal: {
                                    curveness: 0.3
                                }

                            }
                        }
                    ]
                };

                myChart0.setOption(option);

//
                function nodeClick(params){
                    if(params.data.category===1){
                        //点击出现右侧弹框
                        $('#echart-right').show();
                        //清空echarts右侧图
                        myradar(['0','0','0','0','0']);
                        mychar02(['0','0']);
                        mychar03(['0','0']);

                        //开始设置
                        $('#right-curnum').html("SE"+params.data.name.slice(-12)+"");
                        var lab="";
                        switch(params.data.category)
                        {
                            case 0:
                                lab = "当前重点人员";
                                break;
                            case 1:
                                lab = "一度联系人";
                                break;
                            case 2:
                                lab = "二度联系人";
                                break;
                        }


                        $('#right-curlab').html(lab+"|"+"Rank"+params.dataIndex+"  |"+params.data.exp.toFixed(2));
                        //console.log(params);
                        //console.log(window.ctx+"/contact/getPerInfo?targetPhone="+params.name);
//                    var para = {"targetPhone":targetPhone,"searchPhone":params.name.slice(2)};
                        //获取右侧弹框相关数据
                        $.ajax({
                            type:"GET",
                            url:window.ctx+"/beta/getPerInfo",
                            data: {"targetPhone":targetPhone,"searchPhone":params.name.slice(2),"startTime":nodeTimerange[0],"endTime":nodeTimerange[1]},
                            dataType:"json",
                            success:function (data) {
                                console.log("radar");
                                console.log(data);
                                console.log(targetPhone);

                                if(data!==null){
                                    var radardata = [data.contactInfo.totalCall,data.contactInfo.WorkCall,data.contactInfo.RestCall,data.contactInfo.UnderFifteenSeconds,data.contactInfo.AboveThreeMin];
                                    var char02 = [data.teleInfo.calledTime,data.teleInfo.callingTime];
                                    var char03 = [data.teleInfo.calledCount,data.teleInfo.callingCount];
                                    myradar(radardata);
                                    mychar02(char02);
                                    mychar03(char03);


                                }else{
                                    console.log("没有数据");

                                }
                                //切换饼图
                                $(".ectitle span").click(function(){
                                    var index=$(this).index();
                                    if(index==0){
                                        $(this).addClass("active").siblings("span").removeClass("active");
                                        $("#eBox02").show();
                                        $("#eBox03").hide();
                                        mychar02(char02);
                                    }else if(index==2){
                                        $(this).addClass("active").siblings("span").removeClass("active");
                                        $("#eBox03").show();
                                        $("#eBox02").hide();
                                        mychar03(char03);
                                    }

                                })
                            },

                            error:function() {
                                console.log("获取弹框数据失败,请联系管理员");
                            }
                        });
                    }else{
                        $('#echart-right').hide();
                    }

                }



            },
            error:function () {
                alert("获取失败，请联系管理员！");

            }
        });

    }



    //右侧隐藏图表

        function myradar(arr){
            if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
                myChart1.dispose();
            }
            myChart1 = echarts.init(document.getElementById('eBox'));

            //雷达图
            option = {
                backgroundColor:'none',
                title: {
                    text: ''
                },
                tooltip: {
                    trigger: 'item'
//                    formatter: "{b}<br/>"+
//                    "总体通话次数:"+"[{value}]<br/>"+
//                    "工作时段通话次数:"+"{arr[1]}<br/>"+
//                    "休息时段通话次数:"+"{arr[2]}<br/>"+
//                    "15秒内通话次数:"+"{arr[3]}<br/>"+
//                    "3分钟以上通话次数:"+"{arr[4]}<br/>"

                },
                legend: {
                    data: []
                },
                radar: [
                    {
                        indicator: [
                            { text: '总通话' },
                            { text: '工作时段' },
                            { text: '休息时段' },
                            { text: '短通话' },
                            { text: '长通话' }

                        ],
                        center: ['52%', '54%'],
                        radius: 60,
                        startAngle: 90,
                        splitNumber: 4,
                        shape: 'circle',
                        name: {
                           // formatter:'',
                            textStyle: {
                                color:'#6292b1'
                            }
                        },
                        splitArea: {
                            areaStyle: {
                                color: [
                                    'rgba(98, 146, 177, 0.2)',
                                    'rgba(98, 146, 177, 0.4)',
                                    'rgba(98, 146, 177, 0.6)',
                                    'rgba(98, 146, 177, 0.8)',
                                    'rgba(98, 146, 177, 1)'
                                ],
                                shadowColor: 'rgba(0, 0, 0, 0.3)',
                                shadowBlur: 10
                            }
                        },
                        axisLine: {
                            lineStyle: {
                                color: 'rgba(255, 255, 255, 0.5)'

                            }
                        },
                        splitLine: {
                            lineStyle: {
                                color: 'rgba(255, 255, 255, 0.5)'
                            }
                        }
                    },

                ],
                series: [
                    {
                        name: '雷达图',
                        type: 'radar',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    type: 'dashed'

                                }
                            },
                            emphasis: {
                                // color: 各异,
                                lineStyle: {
                                    width: 4
                                }
                            }
                        },
                        data: [
                            {
                                //value: [60, 5, 0.30, -100, 1500],
                                value: arr,
                                name:"联系人概览",
                                areaStyle: {
                                    normal: {
                                        color: 'rgba(255, 255, 255, 0.5)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            }


            myChart1.setOption(option);

        }




        function mychar02(arr){
            if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
                myChart2.dispose();
            }
            myChart2 = echarts.init(document.getElementById('eBox02'));
            //饼状图
            option = {
                backgroundColor:'none',
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['']
                },
                series: [{
                    name: '通话时长',
                    type: 'pie',
                    radius: ['60%', '70%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: Number(arr[0]).toFixed(2),
//                        value: 2,
                        name: 'called',
                        label: {
                            normal: {
                                formatter: '总时长',
                                textStyle: {
                                    color: 'rgba(98, 146, 177, 1)',
                                    fontSize: 16
                                }
                            }
                        },
                        tooltip: {
                            show: true
                        },
                        itemStyle: {
                            normal: {
                                color: '#355078'
                            },
                            emphasis: {
                                color: '#355078'
                            }
                        },
                        hoverAnimation: false
                    },{
                        value: Number(arr[1]).toFixed(2),
//                        value: 3,
                        name: 'calling',
                        label: {
                            normal: {
//                                formatter: '{c}min',
                                formatter: function (params) {
                                    return Number(arr[1]+arr[0]).toFixed(2)+'min';
                                },
                                textStyle: {
                                    fontSize: 16,
                                    color: 'rgba(98, 146, 177, 1)'
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#4298cc'
                            },
                            emphasis: {
                                color: '#4298cc'
                            }
                        }

                    }]
                }]
            };

            myChart2.setOption(option);

        }


        function mychar03(arr){
            if (myChart3 != null && myChart3 != "" && myChart3 != undefined) {
                myChart3.dispose();
            }
            myChart3 = echarts.init(document.getElementById('eBox03'));
            //饼状图
            option = {
                backgroundColor:'none',
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',

                    left: 'left',
                    data: ['']
                },
                series: [{
                    name: '通话频次',
                    type: 'pie',
                    radius: ['60%', '70%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: arr[0],
                        name: 'calledCount',
                        label: {
                            normal: {
                                formatter: '总次数',
                                textStyle: {
                                    color: 'rgba(98, 146, 177, 1)',
                                    fontSize: 16
                                }
                            }
                        },
                        tooltip: {
                            show: true
                        },
                        itemStyle: {
                            normal: {
                                color: '#355078'
                            },
                            emphasis: {
                                color: '#355078'
                            }
                        },
                        hoverAnimation: false
                    },{
                        value: arr[1],
                        name: 'callingCount',
                        label: {
                            normal: {
//                                formatter: '{c}次',
                                formatter: function (params) {
                                    return Number(arr[1]+arr[0]).toFixed(2)+'次';
                                },
                                textStyle: {
                                    fontSize: 16,
                                    color: 'rgba(98, 146, 177, 1)'
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#4298cc'
                            },
                            emphasis: {
                                color: '#4298cc'
                            }
                        }
                    }]
                }]
            };

            myChart3.setOption(option);
        };








</script>
</body>
</html>
