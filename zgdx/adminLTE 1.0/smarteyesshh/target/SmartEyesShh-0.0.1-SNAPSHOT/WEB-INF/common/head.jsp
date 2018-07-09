<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<header class="main-header">

    <!-- Logo -->
    <a href="${ctx}/search" class="logo" style="background-color: #34384e">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>猎犬</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg" style="height: 100%;text-align: left;"><img src="${cenimg}/logo.png" alt="" style="height: 90%"></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation" style="background:linear-gradient(to right,#2296f3,#5e6bf5);display: flex;align-items: center">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button" style="flex: 1">
            <span class="sr-only">切换导航</span>
        </a>
        <span class="pull-right" style="color: #fff;flex: 20;text-align: right;" id="riqi">2018年1月29日  星期一</span>
        <a href="${ctx}/user/logout" class="pull-right" style="text-align: center;color: #fff;margin:0 20px;flex: 1 ">退出</a>
    </nav>
</header>

<script>
    function getCurrentDate() {
        var now = new Date();
        var year = now.getFullYear(); //得到年份
        var month = now.getMonth();//得到月份
        var date = now.getDate();//得到日期
        var day = now.getDay();//得到周几
        month = month + 1;
        var a = new Array("日", "一", "二", "三", "四", "五", "六");
        day= "星期"+ a[day];
        // if (month < 10) month = "0" + month;
        // if (date < 10) date = "0" + date;
        var time = "";
        //精确到天
        time = year + "年" + month + "月" + date + "日" +"  "+ day;
        return time;
    }
    $("#riqi").html(getCurrentDate())
</script>