<%--
  Created by IntelliJ IDEA.
  User: lishuang
  Date: 2018/1/11
  Time: 下午3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>操作日志</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style2.css" />
    <link rel="stylesheet" href="${css}/style4.css" />
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

        })
    </script>
    <style>
    </style>
</head>
<body>
<div class="container-fluid smartEyes-container">

    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
        </div>

        <!--操作表单-->
        <div class="col-lg-12 col-md-12 col-xs-12 operate-box">
            <!--图表展示列表-->
            <div class="operate-log ">
                <table class="operate-table1">
                    <tbody>
                    <tr class="operate-tr1">
                        <td class="h1" >操作日志</td>
                    </tr>
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
                                </thead>
                                <tbody class="container" id="operatelog-tbody">
                                <tr>
                                    <td >日志ID</td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-userid">用户ID </span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-username">用户姓名 </span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-querytime">查询时间 </span>
                                    </td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-tele">手机号码</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">描述</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-type">涉案类型</span>
                                    </td>

                                </tr>

                                </tbody>
                            </table>
                        </td>

                    </tr>
                    <!--第三行分页按钮-->
                    <tr class="operate-tr3">
                        <td>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul class="operate-pageTitleCell clearfix" id="pageupdown">
                                            <%--<li class="fl"><a class="operate-pagechange operate-pageprev">上一页</a></li>--%>
                                            <%--<li class="fl"><a class="active">1</a></li>--%>
                                            <%--<li class="fl"><a >2</a></li>--%>
                                            <%--<li class="fl"><a >3</a></li>--%>
                                            <%--<li class="fl"><a >4</a></li>--%>
                                            <%--<li class="fl"><a class="operate-pagechange operate-pagenext">下一页</a></li>--%>
                                        </ul>

                                    </td>

                                </tr>

                                </tbody>

                            </table>
                        </td>

                    </tr>

                    </tbody>

                </table>


            </div>
        </div>
    </div>
    <!--底部-->
    <footer style="position: fixed; bottom:0px"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>
    <script>
        var h= $(window).height();
        $(".operate-log").height(h-226);
        $(window).resize(function(){
            var h= $(window).height();
            $(".operate-log").height(h-226);
            $(".operate-table1").height(h-226);
            $(".operate-table1").css("overflow","auto");
        });
        //设置选中
        $(".myselect").children("option").removeAttr("selected");
        $(".myselect").children("option[value='userOperateLog']").attr("selected",true);
        var tp = 1;
        init();
        //1页面初始化dom操作。2点击数字或翻页更新。
        function init() {
            $.ajax({
                type:"GET",
                url:"/log/searchLog",
                dataType:"json",
                data:{pageCode:1},
                success:function (res) {
                    var mylog = res.data.datas;
                    var newTime;
                    var stringTime;
                    for(var i = 0 ;i < mylog.length; i++){
                        newTime = new Date(mylog[i].searchTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();

                        $('#operatelog-tbody').append("<tr>" +
                            "<td >"+mylog[i].id+"</td>" +
                            "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">"+mylog[i].userId+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">"+mylog[i].userNickname+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">"+stringTime+"</span></td>" +
                            "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">"+mylog[i].targetPhone+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">"+mylog[i].personType+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">"+mylog[i].searchType+"</span></td>" +
                            "</tr>");
                    }
                    tp = res.data.totalPage;
                    //分页栏
                    //上一页
                    $('#pageupdown').append("<li class=\"fl\" ><a class=\"operate-pagechange operate-pageprev\">上一页</a></li>");

                    for(var j = 0;j < res.data.totalPage; j++){
                        $('#pageupdown').append("<li class=\"fl\"><a >"+(j+1)+"</a></li>");
                    }
                    //下一页
                    $('#pageupdown').append("<li class=\"fl\" ><a class=\"operate-pagechange operate-pagenext\">下一页</a></li>");
                    //默认第一页激活。
                    $('#pageupdown li:eq(1) a').addClass("active");
                    //默认上一页禁用
                    $('#pageupdown').children("li").eq(0).children("a").addClass("operate-disable");
                    //成功了调用切换tab函数
                    tab("#pageupdown",tp);

                },
                error:function() {
                    console.log("获取基本信息失败,请联系管理员");
                }
            })


        }

        function tab(selector,tp){
            var index = -1;
            var curindex=1;

            $(selector).children("li").click(function(){
                //获取当前点击的index
                index=$(this).index();

                //当点的不是上下按钮时，添加active，重新加载数据。
                if(index !== 0 && index !== tp+1){
                    $(this).siblings("li").children("a").removeClass("active");
                    $(this).children("a").addClass("active");
                    curindex = $("#pageupdown").find("a").index($(".active"));
                    logdataajax(index);

                }else if(index===0){
                    if(curindex!==1){
                        $(selector).children("li").eq(curindex-1).siblings("li").children("a").removeClass("active");
                        $(selector).children("li").eq(curindex-1).children("a").addClass("active");
                        curindex = $("#pageupdown").find("a").index($(".active"));
                        logdataajax(curindex);

                    }else {

                    }
                }else if(index===tp+1){
                    if(curindex!==tp){
                        $(selector).children("li").eq(curindex+1).siblings("li").children("a").removeClass("active");
                        $(selector).children("li").eq(curindex+1).children("a").addClass("active");
                        curindex = $("#pageupdown").find("a").index($(".active"));
                        logdataajax(curindex);
                    }else {

                    }
                }

                if(curindex===1){
//                    把上箭头变成禁止按钮。
                    $(selector).children("li").eq(tp+1).children("a").removeClass("operate-disable");
                    $(selector).children("li").eq(0).children("a").addClass("operate-disable");

                }else if(curindex===tp){
                    $(selector).children("li").eq(0).children("a").removeClass("operate-disable");
                    $(selector).children("li").eq(tp+1).children("a").addClass("operate-disable");
                }else {
                    $(selector).children("li").eq(tp+1).children("a").removeClass("operate-disable");
                    $(selector).children("li").eq(0).children("a").removeClass("operate-disable");
                }


            });



        }


        function logdataajax(pageCode) {
            $.ajax({
                type:"GET",
                url:"/log/searchLog",
                dataType:"json",
                data:{pageCode:pageCode},
                success:function (res) {
                    var mylog = res.data.datas;
                    var newTime;
                    var stringTime;
                    $('#operatelog-tbody').html("");
                    $('#operatelog-tbody').append("<tr>"+
                        "<td>日志ID</td>" + "<td class=\"row\">" + "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">用户ID </span>" +
                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">用户姓名 </span>" +
                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">查询时间 </span>" +
                        "</td>" +
                        "<td class=\"row\">" +
                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">手机号码</span>" +
                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">描述</span>" +
                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">涉案类型</span>" +
                        "</td>" +
                        "</tr>");
                    for(var i = 0 ;i < mylog.length; i++){
                        newTime = new Date(mylog[i].searchTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();

                        $('#operatelog-tbody').append("<tr>" +
                            "<td >"+mylog[i].id+"</td>" +
                            "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">"+mylog[i].userId+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">"+mylog[i].userNickname+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">"+stringTime+"</span></td>" +
                            "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">"+mylog[i].targetPhone+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">"+mylog[i].personType+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">"+mylog[i].searchType+"</span></td>" +
                            "</tr>");
                    }

                },
                error:function() {
                    console.log("获取基本信息失败,请联系管理员");
                }
            })
        }





    </script>

</body>
</html>

