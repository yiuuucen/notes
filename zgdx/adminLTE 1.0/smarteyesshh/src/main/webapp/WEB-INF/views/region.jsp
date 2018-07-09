<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<!--
这是起始页面，你可以使用此页面开始你的项目。
此页面移除了链接，并提供了所需要的标记。
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>区域与轨迹</title>
  <link rel="shortcut icon" href="${dist}/img/ddlogo.ico">
  <!-- 告诉浏览器该页面是自适应布局 -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${plugins}/vue/ele-ui.css" />
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${libs}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${plugins}/datatables/dataTables.bootstrap.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${dist}/css/AdminLTE.min.css">
  <!-- AdminLTE 皮肤。默认使用蓝色皮肤。
        您可以选择其他皮肤。皮肤样式写在 body 标签中，
        以便使之生效。
  -->
  <link rel="stylesheet" href="${dist}/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- 警告：Respond.js 不支持 file:// 方式查看（即本地方式查看）-->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="${dist}/css/myStyle.css">
  <!-- jQuery 2.2.3 -->
  <script src="${plugins}/jQuery/jquery-2.2.3.min.js"></script>
</head>
<!--
BODY 标签选项：
=================
使用下面一个或多个类来
获得所需效果
|---------------------------------------------------------|
| 皮 肤         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|布局选项       | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper region">

  <!-- Main Header -->
  <jsp:include page="/WEB-INF/common/head.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (页眉) -->
    <section class="content-header">
      <small style="font-size: 18px;color:#fff">当前重点人员：<span id="tit-person"></span>&nbsp;&nbsp;<b id="tit-area"></b></small>
      <ol class="breadcrumb">
        <%--<div id="app">--%>
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
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="row">
        <div class="col-xs-12">
            <div class="box hbox">
              <div class="box-header with-border selMap hbox-header" style="display:none">
                <div id="bar01">热力图</div>
                <div id="bar02">活动区域</div>
                <div id="bar03">活动轨迹</div>
              </div>
              <div class="box-body">
                  <div id="barEchart01" style="height: 600px"></div>
                  <div id="barEchart02" style="height: 600px;display: none"></div>
                  <div id="barEchart03" style="height: 600px;display: none"></div>
                  <ul class="track" style="display: none;">
                    <li class="active">
                      <span class="pull-left"></span>
                      <div class="pull-right tracklist">
                        <p>轨迹1:工作轨迹</p>
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
              <div class="DTreset"></div>
            <!-- /.box-body -->        
            </div>
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <jsp:include page="/WEB-INF/common/footer.jsp"/>

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->


<!-- Bootstrap 3.3.6 -->
<script src="${libs}/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${plugins}/datatables/jquery.dataTables.min.js"></script>
<script src="${plugins}/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${plugins}/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${plugins}/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${dist}/js/app.min.js"></script>
<script src="${plugins}/echartsjs/echarts.min.js"></script>
<script type="text/javascript" src="${libs}/bmap.js" ></script>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
<script type="text/javascript" src="https://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
<script type="text/javascript" src="https://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
<script src="${plugins}/vue/vue.js"></script>
<script src="${plugins}/vue/ele-ui.js"></script>
<script src="${dist}/js/region.js"></script>

<script>
  $(function(){
    var h=$(window).height();
    $("#barEchart01").height(h-100);
    $("#barEchart02").height(h-100);
    $("#barEchart03").height(h-100);
    $(".pg3").addClass("active");
    
  })
</script>
</body>
</html>
