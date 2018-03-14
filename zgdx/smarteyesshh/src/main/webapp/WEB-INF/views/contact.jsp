<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>联系人列表</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${css}/ele-ui.css" />
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
    <script src="${js}/vue.js"></script>
    <script src="${js}/ele-ui.js"></script>
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

            $(".listl .list").height(440);

        })
    </script>
    <style>
        .eboxlist{
            display: none;
        }
    </style>
</head>
<body>
<div class="container-fluid smartEyes-container contact">
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox listbox container-fluid">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
            <div class="pull-left namelistcc col-lg-4 col-md-4 col-xs-4">
                <span>当前重点人员：</span>
                <span id="tit-person"> </span>
            </div>
            <div class="pull-right text-right input-group col-lg-5">
                <div id="app">
                    <template>
                        <div class="block">
                            <el-date-picker
                                    v-model="value7"
                                    type="daterange"
                                    align="right"
                                    value-format="yyyy-MM-dd"
                                    unlink-panels
                                    :start-placeholder="morenT"
                                    range-separator="至"
                                    :end-placeholder="morenT2"
                                    :picker-options="pickerOptions2"
                                    @change="gettime"
                            >
                            </el-date-picker>
                        </div>
                    </template>
                </div>
            </div>
        </div>
        <div class="listl" style="border-bottom: none;">
            <div class="l-contacts">
                <div class="c-top clearfix">
                    <span class="pull-left" id="shaixuan">筛选</span>
                    <span class="pull-right">全部人员</span>
                </div>
                <div class="c-head clearfix">
                    <span class="pull-left">编号</span>
                    <span class="pull-left">描述</span>
                    <span class="pull-left">关联度</span>
                    <span class="pull-left">关联指数</span>
                </div>
                <ul class="list" id="firstcontact">
                    <%--<li class="list-person">--%>
                        <%--<span>1.SE5cb3fv9sc0d3</span>--%>
                        <%--<span>重点人员</span>--%>
                        <%--<span>一度</span>--%>
                        <%--<span>0.90</span>--%>
                    <%--</li>--%>
                </ul>
                <div class="daochu" id="daochu">导出列表信息</div>
                <div class="l-con-tanC">
                    <div class="tanCont">
                        <div class="tan-choose">
                            <h3>描述</h3>
                            <span >重点人员</span>
                            <span >一般人员</span>
                        </div>
                        <div class="tan-choose2">
                            <h3>关联度</h3>
                            <span >一度联系人</span>
                            <span >二度联系人</span>
                        </div>
                        <div class="tan-reset">重置</div>
                        <div class="tan-qued">确定</div>
                    </div>
                </div>
            </div>

        </div>
        <!--图表展示-->
        <div class="list2 echartBox col-lg-8 col-md-8 col-xs-8">
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
<footer><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
<script type="text/javascript" src="${js}/dataTool.js" ></script>
<script type="text/javascript">
    //图标展示高度
    var h= $(window).height()-60;
    $("#ect").height(h);
    var myChart0;
    var myChart1;
    var myChart2;
    var myChart3;
    var myDate = new Date();
    var myyear = ""+myDate.getFullYear();    //获取完整的年份(4位,1970-????)

    var targetPhone=$("#targetPhone").val();
    //判断传过来的电话是否为86开头，如果不是则帮它加上
    if(targetPhone.length!=13){
        targetPhone="86"+targetPhone;
    }
    var nodeTimerange=[];
    var timerange;


    // 筛选弹窗
    function shaixuan_tan(time){

        //导出列表信息接口
        $("#daochu").click(function(){
            window.location.href="${ctx}/new/download?targetPhone="+targetPhone+"&startTime="+time[0]+"&endTime="+time[1];
        });

        $("#shaixuan").click(function(){
            $(".l-con-tanC").css("display","block");
        });
        $(".tan-choose span").click(function(){
            $(".tan-choose span").removeAttr("class");
            $(this).attr("class","tan-select");
        });
        $(".tan-choose2 span").click(function(){
            $(".tan-choose2 span").removeAttr("class");
            $(this).attr("class","tan-select");
        });
        $(".tan-reset").click(function(){
            $(".tan-choose span").removeAttr("class");
            $(".tan-choose2 span").removeAttr("class");
        });
        $(".tan-qued").click(function(){
            console.log(time);
            $(".c-top span").remove(".pull-right");
            $.ajax({
                type:"GET",
                url:"/new/getAllContacts",
                data: {"targetPhone":targetPhone,"startTime":time[0],"endTime":time[1]},
                //data: {"targetPhone":8615000055827,"startTime":20180220,"endTime":20180307},
                dataType:"json",
                //有个小bug，每次点击确定后都会加载3次这个ajax。。（没有找到原因），会导致页面出现一闪一闪的效果
                //解决办法：给这个ajax设置为同步，也就是等待它加载最后一个ajax完成再生产数据
                async: false,
                success:function(data){
                    var msg=$("#firstcontact").html();
                    var arr=[];
                    msg='';
                    if($(".tan-select").length==0){
                        $(".c-top").append('<span class="pull-right">全部人员</span>');
                        for(var i=0;i<data.contactList.length;i++){
                            data.contactList[i].name="SE"+data.contactList[i].name.slice(-12);
                            data.contactList[i].exp=data.contactList[i].exp.toFixed(2);
                            // console.log(typeof(data.contactList[i].exp));
                            msg+='<li class="list-person">'+'<span>'+(i+1)+'.'+data.contactList[i].name+'</span>'+'<span>'+data.contactList[i].tag+'</span>'+'<span>'+data.contactList[i].type+'</span>'+'<span>'+data.contactList[i].exp+'</span></li>';
                        }
                    }else if($(".tan-select").length==1){
                        $(".c-top").append('<span class="pull-right">'+$(".tan-select").html()+'</span>');
                        for(var i=0;i<data.contactList.length;i++){
                            if(data.contactList[i].tag==$(".tan-select").html()||data.contactList[i].type==$(".tan-select").html().slice(0,2)){
                                arr.push(data.contactList[i]);
                            }
                        }
                        // console.log(arr);
                        if(arr.length==0){
                            msg='';
                        }else{
                            for(var i=0;i<arr.length;i++){
                                arr[i].name="SE"+arr[i].name.slice(-12);
                                arr[i].exp=arr[i].exp.toFixed(2);
                                // console.log(typeof(data.contactList[i].exp));
                                msg+='<li class="list-person">'+'<span>'+(i+1)+'.'+arr[i].name+'</span>'+'<span>'+arr[i].tag+'</span>'+'<span>'+arr[i].type+'</span>'+'<span>'+arr[i].exp+'</span></li>';
                            }
                        }
                    }else if($(".tan-select").length==2){
                        $(".c-top").append('<span class="pull-right">'+$(".tan-choose2 .tan-select").html()+'</span><span class="pull-right">'+$(".tan-choose .tan-select").html()+'</span>');
                        for(var i=0;i<data.contactList.length;i++){
                            if(data.contactList[i].tag==$(".tan-choose .tan-select").html()&&data.contactList[i].type==$(".tan-choose2 .tan-select").html().slice(0,2)){
                                arr.push(data.contactList[i]);
                            }
                        }
                        // console.log(arr);
                        if(arr.length==0){
                            msg='';
                        }else{
                            for(var i=0;i<arr.length;i++){
                                arr[i].name="SE"+arr[i].name.slice(-12);
                                arr[i].exp=arr[i].exp.toFixed(2);
                                // console.log(typeof(data.contactList[i].exp));
                                msg+='<li class="list-person">'+'<span>'+(i+1)+'.'+arr[i].name+'</span>'+'<span>'+arr[i].tag+'</span>'+'<span>'+arr[i].type+'</span>'+'<span>'+arr[i].exp+'</span></li>';
                            }
                        }
                    }
                    $("#firstcontact").html(msg);
                },
                error:function() {
                    console.log("获取联系人数据失败,请联系管理员");
                }
            });
            $(".l-con-tanC").css("display","none");
        });
    }

    new Vue({
        el:'#app',
        data:{
            morenT:new Date()- 3600 * 1000 * 24 * 7,
            morenT2:new Date(),
            pickerOptions2: {
                shortcuts: [{
                    text: '最近一周',
                    onClick(picker) {
                        const end = new Date();
                        const start = new Date();
                        start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                        picker.$emit('pick', [start, end]);
                    }
                }, {
                    text: '最近一个月',
                    onClick(picker) {
                        const end = new Date();
                        const start = new Date();
                        start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                        picker.$emit('pick', [start, end]);
                    }
                }, {
                    text: '最近三个月',
                    onClick(picker) {
                        const end = new Date();
                        const start = new Date();
                        start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                        picker.$emit('pick', [start, end]);
                    }
                }]
            },
            value6: '',
            value7: ''
        },
        methods:{
            gettime(value){
                value[0]=value[0].slice(0,4)+value[0].slice(5,7)+value[0].slice(8,10);
                value[1]=value[1].slice(0,4)+value[1].slice(5,7)+value[1].slice(8,10);
                // value[0]=20180306;
                // console.log(value[0]);
                // console.log(value[1]);
                timerange = [value[0],value[1]];
                contactList(timerange);
                relationG(timerange);
                shaixuan_tan(timerange);
                $('#echart-right').hide();
            },
            formatDate1(date){
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                m = m < 10 ? '0' + m : m;
                var d = date.getDate();
                d = d < 10 ? ('0' + d) : d;
                return y + '-' + m + '-' + d;
            }
        },
        // 钩子函数，页面渲染自动执行
        mounted(){
            this.morenT=this.formatDate1(new Date(this.morenT));
            this.morenT2=this.formatDate1(this.morenT2);
            morenTT=this.morenT.slice(0,4)+this.morenT.slice(5,7)+this.morenT.slice(8,10);
            morenTT2=this.morenT2.slice(0,4)+this.morenT2.slice(5,7)+this.morenT2.slice(8,10);
            //    初始化
            nodeTimerange = [morenTT,morenTT2];
            relationG(nodeTimerange);
            contactList(nodeTimerange);
        }

    });
    function sortExp(a,b){
        return b.exp-a.exp;
    }
    //联系人
    function contactList(timerange){
        $.ajax({
            type:"GET",
            url:"/new/getAllContacts",
            data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
            //data: {"targetPhone":8615000055827,"startTime":20180220,"endTime":20180307},
            dataType:"json",
            success:function(data){
                var msg=$("#firstcontact").html();
                msg='';
                for(var i=0;i<data.contactList.length;i++){
                    data.contactList[i].name="SE"+data.contactList[i].name.slice(-12);
                    data.contactList[i].exp=data.contactList[i].exp.toFixed(2);
                    // console.log(typeof(data.contactList[i].exp));
                    msg+='<li class="list-person">'+'<span>'+(i+1)+'.'+data.contactList[i].name+'</span>'+'<span>'+data.contactList[i].tag+'</span>'+'<span>'+data.contactList[i].type+'</span>'+'<span>'+data.contactList[i].exp+'</span></li>';
                }
                $("#firstcontact").html(msg);
                shaixuan_tan(timerange);
            },
            error:function() {
                console.log("获取联系人数据失败,请联系管理员");
            }
        });
    }
    //有个小bug,
    // shaixuan_tan(nodeTimerange)
    //中间关系图
    function relationG(timerange) {
        //关系图
        if (myChart0 != null && myChart0 != "" && myChart0 != undefined) {
            myChart0.dispose();
        }
        myChart0 = echarts.init(document.getElementById('ect'));

        myChart0.showLoading();

        $.ajax({
            type:"GET",
            url:"/new/getGraph",
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
                            color: "#2090ec"
                        }
                    }
                },
                    {
                        name:'重点人员',
                        itemStyle: {
                            normal: {
                                color: "rgb(76,175,80)"
                            }
                        }
                    },
                    {
                        name:'一般人员',
                        itemStyle: {
                            normal: {
                                color: "#4a4f67"
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
                    if(mynode[i].category==1){
                        brr1.push(mynode[i]);

                    }else if(mynode[i].category==2){
                        brr2.push(mynode[i]);
                    }
                }
                brr1.sort(sortExp);
                if(brr1.length!==0){max1 = brr1[0].exp;}

                graph.nodes.forEach(function (node) {
                    //node.itemStyle = null;
                    //node.draggable = true;
                    // graph.nodes
                    //设置大小
                    // console.log(node);
                    switch(node.category)
                    {
                        case 0:
                            node.symbolSize = 70;
                            break;
                        case 1:
                            node.symbolSize = 60*node.exp/max1;
                            break;
                        case 2:
                            node.symbolSize = 60*node.exp/max1;
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
                            layout: 'force',

                            force: {
                                repulsion: 100,
                                gravity: 0.01,
                                edgeLength: 70,
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
                                    //curveness影响让节点中的线曲直
                                    curveness: 0
                                }

                            }
                        }
                    ]
                };

                myChart0.setOption(option);

//
                function nodeClick(params){
                    if(params.data.category!=0){
                        //点击出现右侧弹框
                        $('#echart-right').show();
                        //只有不是一度联系人，都只显示基本信息
                        if(params.data.category!=1){
                            $("#echart-right .e-right").hide()
                        }else{
                            $("#echart-right .e-right").show()
                        }
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
                                lab = "重点人员";
                                break;
                            case 2:
                                lab = "一般人员";
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
