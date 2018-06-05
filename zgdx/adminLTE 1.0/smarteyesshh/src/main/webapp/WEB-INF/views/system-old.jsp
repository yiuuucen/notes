
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>操作日志</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${css}/ele-ui.css" />
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap-select.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style4.css" />
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap-select.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <%--<script type="text/javascript" src="${js}/change.js" ></script>--%>
    <script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>
    <script type="text/javascript" src="${js}/bmap.js" ></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <script src="${js}/vue.js"></script>
    <script src="${js}/ele-ui.js"></script>
    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });

        })
    </script>
</head>
<body>
<div class="container-fluid smartEyes-container">

    <jsp:include page="/WEB-INF/common/head2.jsp"/>
    <%--<header class="row">--%>
        <%--<!--logo-->--%>
        <%--<div class="col-lg-2  col-md-2 col-xs-2 logo"><a><img src="${img}/1logo.png" alt=""></a></div>--%>
        <%--<!--<div class="col-lg-4">--%>
            <%--<div class="form-group">--%>
                <%--<input type="text"class="form-control"  />--%>
            <%--</div>--%>

        <%--</div>-->--%>
        <%--<div class="col-lg-1 col-md-1 col-xs-1 fr">--%>
            <%--<a href="${ctx}/search"><img src="${img}/u03.png"></a>--%>
        <%--</div>--%>
        <%--<div class="col-lg-1 col-md-1 col-xs-1 pull-right text-right input-group fr" style="margin-top: 27px">--%>
            <%--<select class="pull-right select myselect" onchange="operateManage(this.options[this.options.selectedIndex].value)">--%>
                <%--<option value="configure" selected="">&nbsp;配置</option>--%>
                <%--<option value="userOperateLog" >&nbsp;用户操作日志</option>--%>
                <%--<option value="targetPersonManage" >&nbsp;目标人员管理</option>--%>
                <%--<option value="systemRightManage" >&nbsp;系统权限管理</option>--%>
            <%--</select>--%>
        <%--</div>--%>
    <%--</header>--%>

    <div class="container-fluid row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
            <h3 class="pul">操作日志</h3>
            <div>
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

        <!--操作表单-->
        <div class="col-lg-12 col-md-12 col-xs-12 operate-box">
            <!--2个echarts图-->
            <div class="two-echarts">
                <div class="tongji-head clearfix">
                    <h3>日志统计</h3>
                    <div>
                        <%--<div id="app2">--%>
                            <%--<template>--%>
                                <%--<div class="block">--%>
                                    <%--<el-date-picker--%>
                                            <%--v-model="value7"--%>
                                            <%--type="daterange"--%>
                                            <%--align="right"--%>
                                            <%--value-format="yyyy-MM-dd"--%>
                                            <%--unlink-panels--%>
                                            <%--:start-placeholder="morenT"--%>
                                            <%--range-separator="至"--%>
                                            <%--:end-placeholder="morenT2"--%>
                                            <%--:picker-options="pickerOptions2"--%>
                                            <%--@change="gettime"--%>
                                    <%-->--%>
                                    <%--</el-date-picker>--%>
                                <%--</div>--%>
                            <%--</template>--%>
                        <%--</div>--%>
                    </div>
                </div>
                <div id="echarts_div1">
	                <div id="sys-echart1"></div>
	                <div class="echart_name">总查询量</div>
                </div>
                <div id="echarts_div2">
	                <div id="sys-echart2"></div>
	                <div class="echart_name">分用户查询量</div>
                </div>
            </div>
            <!--图表展示列表-->
            <div class="operate-log ">
                <div class="table-head clearfix">
                    <h3>日志详情</h3>
                    <div>
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <select id="peopleSel" class="selectpicker" multiple data-live-search="true" data-live-search-placeholder="Search" data-size="5" data-none-selected-text="全部用户">
                                    <%--<option>option1</option>--%>
                                    <%--<option>option2</option>--%>
                                    <%--<option>option3</option>--%>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <div style="position: relative">
                    <table class="operate-table1">
                    <tbody>
                    <!--第二行内容-->
                    <tr class="operate-tr2">
                        <td class="table-responsive operate-table-box">
                            <table class="table table-bordered operate-table">
                                <thead>
                                <tr class="operate-th">
                                    <th>操作日志信息</th>
                                    <th>猎犬用户信息</th>
                                    <th>查询目标人员信息</th>
                                </tr>
                                <tr style="height: 34px;">
                                    <td style="height: 32px;line-height: 32px">日志ID</td>
                                    <td class="row">
                                        <span class="col-lg-3 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">用户ID </span>
                                        <span class="col-lg-3 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">用户姓名 </span>
                                        <span class="col-lg-6 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">查询时间 </span>
                                    </td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">手机号码</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">描述</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">涉案类型</span>
                                    </td>
                                </tr>
                                </thead>
                                <tbody class="container xinxi" id="operatelog-tbody">
                                <%--<tr>--%>
                                <%--<td >1</td>--%>
                                <%--<td class="row">--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-userid">1</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-username">张三</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-querytime">2018.01.12   14:03:36</span>--%>
                                <%--</td>--%>
                                <%--<td class="row">--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-tele">13844556677</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">重点人员</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-type">涉黄</span>--%>
                                <%--</td>--%>
                                <%--</tr>--%>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </div>
                <div class="tabbtn M-box">
                </div>
            </div>
        </div>
    </div>
    <!--底部-->
        <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <script>
        $(function(){
            var ut = $("#userType").val();
            //设置选中
            $("option[value='userOperateLog']").attr("selected","selected").siblings().removeAttr("selected");

        });

        var myChart1;
        var myChart2;
        if(ut==0){
            //当管理员进入时加载这个ajax获取所有人信息
            $.ajax({
                type:"get",
                url:window.ctx+"/log/getNames",
                dataType:"json",
                async:false,
                success:function (arr) {
                    // console.log(arr);
                    var msg='';
                    for(var i=0;i<arr.length;i++){
                        msg+="<option>"+arr[i]+"</option>";
                    }
                    $("#peopleSel").html(msg);
                    $(".selectpicker").selectpicker({
                        width : 220,
                        actionsBox:true, //在下拉选项添加选中所有和取消选中的按钮
                        countSelectedText:"全部用户",
                        selectedTextFormat:"count > "+(arr.length-1)
                    });
                    $(".bs-select-all").html("全选");
                    $(".bs-deselect-all").html("取消全选");
                },
                error:function () {
                    console.log("数据错误")
                }
            });

            //筛选人员功能
            $('.selectpicker').on('hidden.bs.select', function (e) {
                // do something...
                var value = $('.filter-option').html();
                //去除value中所有空格
                value=value.replace(/\s+/g, "");
                if(value=="全部用户"){
                    value='';
                }
                console.log(value);
                myajax2(false,1,value);
                function myajax2(async,num,name){
                    $.ajax({
                        type:"get",
                        url:window.ctx+"/log/searchLog",
                        dataType:"json",
                        async: false,
                        data:{"pageCode":num,"userName":name},
                        success:function (res) {
                            $(".xinxi").children().remove();
                            pageCount=res.data.totalPage;
                            totalData=res.data.totalRecord;
                            showData=res.data.pageSize;
                            for(var i=0;i<res.data.datas.length;i++){
                                newTime = new Date(res.data.datas[i].searchTime);
                                Date.prototype.toLocaleString = function() {
                                    return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                                };
                                stringTime = newTime.toLocaleString();
                                
                                var phone = res.data.datas[i].targetPhone;
                       			phone = phone.slice(-11);//去除86
                                var html='<tr><td>'+'SEL'+res.data.datas[i].id+'</td><td class="row"><span class="col-lg-3 col-md-4 col-xs-4 operate-userid">'+res.data.datas[i].userId+'</span> <span class="col-lg-3 col-md-4 col-xs-4 operate-username">'+res.data.datas[i].userNickname+'</span> <span class="col-lg-6 col-md-4 col-xs-4 operate-querytime">'+stringTime+'</span> </td> <td class="row"> <span class="col-lg-4 col-md-4 col-xs-4 operate-tele">'+phone+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">'+res.data.datas[i].personType+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-type">'+res.data.datas[i].searchType+'</span></td></tr>';
                                $(".xinxi").append(html);
                            }
                        },
                        error:function () {
                            // $(".mag .submit_fail").css('display','block');
                            console.log("数据错误")
                        }
                    })
                }

                $(".M-box").remove();
                $(".operate-log").append('<div class="tabbtn M-box"></div>');
                $('.M-box').pagination({
                    pageCount:pageCount,
                    totalData:totalData,
                    showData:showData,
                    mode:'fixed',
                    // coping:true,
                    // homePage:"首页",
                    // endPage:"尾页",
                    keepShowPN:true,
                    prevContent:'<',
                    nextContent:'>',
                    jump:true,
                    callback:function(index){

                        $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata"></b>条 / 共<b id="allpage"></b>页</div>');
                        $("#alldata").text(totalData);
                        $("#allpage").text(pageCount);
                        //   生成首页和尾页
                        $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none;width: 65px;">首页</a>');
                        $(".tabbtn .next").after('<a href="javascript:;" data-page="'+pageCount+'" style="background: #2196f3;border: none;width: 65px">尾页</a>');

                        // console.log(index.getCurrent());
                        //上一页下一页无法点击
                        if(index.getCurrent()==1){
                            $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
                        }else if(index.getCurrent()==pageCount){
                            $(".tabbtn .next").css("cursor","not-allowed").css("background","#565656");
                        }
                        myajax2(true,index.getCurrent(),value);
                    }
                });
                //上一页下一页无法点击
                if($(".tabbtn span").text()==1){
                    $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
                }else if($(".tabbtn span").text()==pageCount){
                    $("tabbtn .next").css("cursor","not-allowed").css("background","#565656");
                }

                $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">200</b>条 / 共<b id="allpage">12</b>页</div>');
                $("#alldata").text(totalData);
                $("#allpage").text(pageCount);
                //   生成首页和尾页
                $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none;width: 65px">首页</a>');
                $(".tabbtn .next").after('<a href="javascript:;" data-page="'+pageCount+'" style="background: #2196f3;border: none;width: 65px">尾页</a>');
            });

            new Vue({
                el:'#app',
                data:{
                    morenT:new Date()- 3600 * 1000 * 24 * 30,
                    morenT2:new Date(),
                    pickerOptions2: {
                        shortcuts: [{
                            text: '最近一周',
                            onClick:function(picker) {
                                const end = new Date();
                                const start = new Date();
                                start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                                picker.$emit('pick', [start, end]);
                            }
                        }, {
                            text: '最近一个月',
                            onClick:function(picker) {
                                const end = new Date();
                                const start = new Date();
                                start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                                picker.$emit('pick', [start, end]);
                            }
                        }, {
                            text: '最近三个月',
                            onClick:function(picker) {
                                const end = new Date();
                                const start = new Date();
                                start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                                picker.$emit('pick', [start, end]);
                            }
                        }]
                    },
                    value6: '',
                    value7: '',
                },
                methods:{
                    gettime:function(value){
                        value0=value[0].slice(0,4)+value[0].slice(5,7)+value[0].slice(8,10);
                        value1=value[1].slice(0,4)+value[1].slice(5,7)+value[1].slice(8,10);
                        // value0=20180306;
                        //value[0]=2018-03-06;
                        // console.log(value[0]);
                        // console.log(value[1]);
                        sysEchart1_data([value0,value1],value[0],value[1]);
                        sysEchart2_data([value0,value1]);
                    },
                    formatDate1:function(date){
                        var y = date.getFullYear();
                        var m = date.getMonth() + 1;
                        m = m < 10 ? '0' + m : m;
                        var d = date.getDate();
                        d = d < 10 ? ('0' + d) : d;
                        return y + '-' + m + '-' + d;
                    }
                },
                // 钩子函数，页面渲染自动执行
                mounted:function(){
                    this.morenT=this.formatDate1(new Date(this.morenT));
                    this.morenT2=this.formatDate1(this.morenT2);
                    morenTT=this.morenT.slice(0,4)+this.morenT.slice(5,7)+this.morenT.slice(8,10);
                    morenTT2=this.morenT2.slice(0,4)+this.morenT2.slice(5,7)+this.morenT2.slice(8,10);
                    //    初始化
                    sysEchart1_data([morenTT,morenTT2],this.morenT,this.morenT2);
                    sysEchart2_data([morenTT,morenTT2]);
                }

            });
        }else{
            $(".operate-box .two-echarts").css("display","none");
            $("#peopleSel").attr("disabled","disabled");
        }


        Date.prototype.format = function() {
            var s = '';
            var mouth = (this.getMonth() + 1)>=10?(this.getMonth() + 1):('0'+(this.getMonth() + 1));
            var day = this.getDate()>=10?this.getDate():('0'+this.getDate());
            s += this.getFullYear() + '/'; // 获取年份。
            s += mouth + "/"; // 获取月份。
            s += day; // 获取日。
            return (s); // 返回日期。
        };
        // getAll传入的数据样式为(2018-3-5,2018-03-15)
        var arr=[];
        function getAll(begin, end) {
            var ab = begin.split("-");
            var ae = end.split("-");
            var db = new Date();
            db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
            var de = new Date();
            de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
            var unixDb = db.getTime();
            var unixDe = de.getTime();
            for (var k = unixDb; k <= unixDe;) {
                arr.push((new Date(parseInt(k))).format()) ;
                k = k + 24 * 60 * 60 * 1000;
            }
        }
        //system的第一个echart图
        function sysEchart1_data(time,value1,value2){
            if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
                myChart1.dispose();
            }

            myChart1 = echarts.init(document.getElementById('sys-echart1'));

            myChart1.showLoading({
                text: 'loading...',
                color: '#2196f3',
                textColor: '#2196f3',
                maskColor: 'transparent',
                zlevel: 0,
            });
            $.ajax({
                type: "GET",
                url: window.ctx+"/log/daysLog",
                data: {"startTime": time[0], "endTime": time[1]},
                dataType: "json",
                success: function (data) {
                    myChart1.hideLoading();
                    arr=[];
                    getAll(value1,value2);
                    // console.log(arr);
                    // console.log(data);

                    option = {
                        tooltip: {
                            formatter: '{b}<br/>{c} 次',
                            trigger: 'axis',
                            axisPointer: {
                                animation: false,
                                type: 'cross',
                                label:{
                                    color:"rgba(255,255,255,0.6)",
                                    backgroundColor:"rgb(47,50,66)"
                                },
                                lineStyle: {
                                    color: '#4baa4f',
                                    width: 2,
                                    opacity: 0.6
                                },
                                crossStyle: {
                                    color: 'rgb(255,255,255)',
                                    width: 2,
                                    opacity: 0.6,
                                    type:"solid"
                                }
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '3%',
                            bottom: '3%',
                            top:"3%",
                            containLabel: true
                        },
                        xAxis: {
                            type: 'category',
                            axisLine: { lineStyle: { color: 'rgba(255,255,255,0.6)' } },
                            data: arr,
                        },
                        yAxis: {
                            type: 'value',
                            splitLine: { show: false },
                            axisLine: { lineStyle: { color: 'rgba(255,255,255,0.6)' } },
                        },
                        series: [{
                            data: data,
                            type: 'line',
                            itemStyle: {
                                normal:{
                                    color: '#2196f3'
                                }
                            },
                            lineStyle: {
                                normal:{
                                    color: '#2196f3'
                                }
                            },
                        }]
                    };
                    // 为echarts对象加载数据
                    myChart1.setOption(option);
                },
                error:function(){
                    alert("数据有误")
                }
            });
        }

        //system的第二个echart图
        var arr2=[];
        var arr3=[];
        function sysEchart2_data(time){
            if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
                myChart2.dispose();
            }
            // 基于准备好的dom，初始化echarts图表
            myChart2 = echarts.init(document.getElementById('sys-echart2'));

            myChart2.showLoading({
                text: 'loading...',
                color: '#2196f3',
                textColor: '#2196f3',
                maskColor: 'transparent',
                zlevel: 0,
            });
            $.ajax({
                type: "GET",
                url: window.ctx+"/log/personLog",
                data: {"startTime": time[0], "endTime":time[1]},
                dataType: "json",
                success: function (data) {
                    myChart2.hideLoading();
                    // console.log(data);
                    arr2=[];
                    arr3=[];
                    if(data.length>10){
                        for(var i=0;i<data.length;i++){
                            arr2.push(data[i].name);
                            arr3.push(data[i].number);
                        }
                    }else{
                        //如果数据不满10条，则填充name='',number=0,让图形最少显示出10条数据
                        var num;
                        num=10-data.length;
                        for(var i=0;i<data.length;i++){
                            arr2.push(data[i].name);
                            arr3.push(data[i].number);
                        }
                        for(var j=0;j<num;j++){
                            arr2.unshift("");
                            arr3.unshift("0");
                        }
                    }

                    option = {

                        tooltip: {
                            formatter: '{b}：{c} 次',
                            trigger: 'axis',
                            axisPointer: {
                                type: 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '3%',
                            bottom: '3%',
                            top:"3%",
                            containLabel: true
                        },
                        xAxis: {
                            type: 'value',
                            boundaryGap: [0, 0.01],
                            splitLine: { show: false },
                            axisLine: { lineStyle: { color: 'rgba(255,255,255,0.6)' } },
                        },
                        yAxis: {
                            type: 'category',
                            data: arr2,
                            axisLine: { lineStyle: { color: 'rgba(255,255,255,0.6)' } },
                        },
                        series: [
                            {
                                type: 'bar',
                                data: arr3,
                                itemStyle: {
                                    normal:{
                                        color: '#2196f3'
                                    }
                                },
                                lineStyle: {
                                    normal:{
                                        color: '#2196f3'
                                    }
                                },
                            }
                        ]
                    };
                    // 为echarts对象加载数据
                    myChart2.setOption(option);
                },
                error:function(){
                    alert("数据有误")
                }
            });
        }

        var pageCount=null;
        var totalData=null;
        var showData=null;
        myajax(false,1);
        function myajax(async,num) {
            $.ajax({
                type:"get",
                url:window.ctx+"/log/searchLog",
                dataType:"json",
                async: async,
                data:{"pageCode":num},
                success:function (res) {
                    $(".xinxi").children().remove();
                    pageCount=res.data.totalPage;
                    totalData=res.data.totalRecord;
                    showData=res.data.pageSize;
                    for(var i=0;i<res.data.datas.length;i++){
                        newTime = new Date(res.data.datas[i].searchTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();
                        
                        var phone = res.data.datas[i].targetPhone;
                       	phone = phone.slice(-11);//去除86
                        var html='<tr><td>'+"SEL" + res.data.datas[i].id+'</td><td class="row"><span class="col-lg-3 col-md-4 col-xs-4 operate-userid">'+res.data.datas[i].userId+'</span> <span class="col-lg-3 col-md-4 col-xs-4 operate-username">'+res.data.datas[i].userNickname+'</span> <span class="col-lg-6 col-md-4 col-xs-4 operate-querytime">'+stringTime+'</span> </td> <td class="row"> <span class="col-lg-4 col-md-4 col-xs-4 operate-tele">'+phone+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">'+res.data.datas[i].personType+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-type">'+res.data.datas[i].searchType+'</span></td></tr>';
                        $(".xinxi").append(html);
                    }
                },
                error:function () {
                    // $(".mag .submit_fail").css('display','block');
                    console.log("数据错误")
                }
            })
        }

            $('.M-box').pagination({
                pageCount:pageCount,
                totalData:totalData,
                showData:showData,
                mode:'fixed',
                // coping:true,
                // homePage:"首页",
                // endPage:"尾页",
                keepShowPN:true,
                prevContent:'<',
                nextContent:'>',
                jump:true,
                callback:function(index){

                    $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">55</b>条 / 共<b id="allpage"></b>页</div>');
                    $("#alldata").text(totalData);
                    $("#allpage").text(pageCount);
                    //   生成首页和尾页
                    $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none;width: 65px">首页</a>');
                    $(".tabbtn .next").after('<a href="javascript:;" data-page="'+pageCount+'" style="background: #2196f3;border: none;width: 65px">尾页</a>');

                    // console.log(index.getCurrent());
                    //上一页下一页无法点击
                    if(index.getCurrent()==1){
                        $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
                    }else if(index.getCurrent()==pageCount){
                        $(".tabbtn .next").css("cursor","not-allowed").css("background","#565656");
                    }
                    myajax(true,index.getCurrent());
                }
            });
            //上一页下一页无法点击
            if($(".tabbtn span").text()==1){
                $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
            }else if($(".tabbtn span").text()==pageCount){
                $("tabbtn .next").css("cursor","not-allowed").css("background","#565656");
            }

            $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">200</b>条 / 共<b id="allpage">12</b>页</div>');
            $("#alldata").text(totalData);
            $("#allpage").text(pageCount);
            //   生成首页和尾页
            $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none;width: 65px">首页</a>');
            $(".tabbtn .next").after('<a href="javascript:;" data-page="'+pageCount+'" style="background: #2196f3;border: none;width: 65px">尾页</a>');


    </script>

</body>
</html>

