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
  <title>联系人列表</title>
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
<div class="wrapper contact">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="${ctx}/index" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>猎犬</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg" style="height: 100%;text-align: left;"><img src="${cenimg}/logo.png" alt="" style="height: 90%"></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">切换导航</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">                  
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="${cenimg}/user2-160x160.jpg" class="user-image" alt="用户图像">
              <!-- hidden-xs 在小型设备上隐藏用户名，只显示图像。 -->
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="${cenimg}/user2-160x160.jpg" class="img-circle" alt="用户图像">

                <p>
                  Alexander Pierce - Web 开发人员
                  <small>注册于2012年11月</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">关注</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">销售</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">好友</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">资料</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">退出</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (页眉) -->
    <section class="content-header">

      <small style="font-size: 18px;">当前重点人员：<span id="tit-person"></span>&nbsp;&nbsp;<small>有效联系人总数:</small><span id="telNum"></span></small>
      <ol class="breadcrumb">
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
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="row" style="position: relative;">
        <div class="col-xs-3">
            <div class="box">
                <div class="listl">
                  <div class="l-contacts clearfix">
                      <div class="c-top clearfix">
                          <span class="pull-left shaixuan-noselect" id="shaixuan">筛选</span> 
                          <span class="pull-right">全部人员</span></div>
                      <div class="c-head clearfix">
                          <span class="pull-left">编号</span>
                          <span class="pull-left">描述</span>
                          <span class="pull-left">关联度</span>
                          <span class="pull-left">关联指数</span>
                      </div>
                      <ul class="list" id="firstcontact" _echarts_instance_="ec_1527822042884" style="height: 440px;">
                        <%--<li class="list-person" nameencval="5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b" nameval="5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b" rankval="1"><span><font>1</font>.SE3947dbd86e3b</span><span>一般人员</span><span>一度</span><span>0.05</span></li>--%>
                      </ul>
                      <div class="daochu" id="daochu">导出列表信息</div>
                      <div class="l-con-tanC" style="display: none;">
                          <div class="tanCont">
                              <div class="tan-choose">
                                  <h3>描述</h3>
                                  <span val="重点人员">重点人员</span>
                                  <span val="一般人员">一般人员</span>
                              </div>
                              <div class="tan-choose2">
                                  <h3>关联度</h3>
                                  <span val="一度联系人">一度联系人</span>
                                  <span val="二度联系人">二度联系人</span>
                              </div>
                              <div class="tan-reset">重置</div>
                              <div class="tan-qued">确定</div>
                          </div>
                      </div>
                  </div>
                </div>
              </div>
        </div>

        <div class="col-xs-9">
            <div class="box">
              <div id="barEchart01" style="width: 90%;height: 600px;">
                
              </div>       
            </div>
        </div>
        <div class="col-xs-2 personMsg">
          <div class="box">
            <div class="echart-right" id="echart-right" style="">
              <!--点击弹出图表-->
              <div class="head clearfix">
                  <h3 class="pull-left">联系人信息</h3>
                  <i class="pull-right btn btn-close" style="top:0"><img src="${cenimg}/u-16.png" width="13" height="13"></i>
              </div>
              <div class="csbox">
                  <div class="cent clearfix">
                      <div class="title pull-left">
                          <img src="${cenimg}/u-18.png">
                      </div>
                      <div class="texTtitle pull-left" style="margin-top: 14px">
                          <p id="right-curnum">SEdbcd729fe224</p>
                          <p id="right-curlab" style="font-size: 10px;">一般人员&nbsp;&nbsp;|&nbsp;&nbsp;Rank2&nbsp;&nbsp;|&nbsp;&nbsp;0.05</p>
                      </div>
                      <div class="pull-right">

                      </div>
                  </div>
              </div>
              <div class="e-right" style="display: block;">
                  <div class="e-r-l">

                    <h1>联系人概览</h1>
                    <div class="ebox" id="eBox" style="width: 233px; height: 174px; margin-left: 14px;">
                    </div>
                  </div>
                  <div class="e-r-l">
                      <div class="ectitle" style="margin-top: 30px;">
                          <span class="active">通话时长</span>
                          <i>|</i>
                          <span>通话频次</span>
                      </div>
                      <div class="ebox eboxlist" id="eBox02" style="width: 230px; display: block; height: 200px; margin-left: 14px;">
                      </div>
                      <div class="ebox eboxlist" id="eBox03" style="width: 230px; height: 200px; margin-left: 14px;display:none">
                      </div>
                  </div>
                  <div class="btnBox hide">
                      <a href="#">点击查看更多</a>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      任何你想要的
    </div>
    <!-- Default to the left -->
    <strong>&copy; 2017 <a href="#"> SmartEyes </a>|</strong> 猎犬上海网安版.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">近期活动</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's 生日</h4>

                <p>23岁生日，在4月24日</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">任务进度</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                自定义模板设计
                <span class="pull-right-container">
                  <span class="label label-danger pull-right">70%</span>
                </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- 统计标签内容 -->
      <div class="tab-pane" id="control-sidebar-stats-tab">统计标签内容</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">常规设置</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              报告面板使用
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              有关此常规设置选项信息
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- 添加侧边栏的背景。
       这个 div必须放在 control-sidebar 之后 -->
  <div class="control-sidebar-bg"></div>
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
<script src="${plugins}/vue/vue.js"></script>
<script src="${plugins}/vue/ele-ui.js"></script>
<script src="${dist}/js/contact.js"></script>

<script>
  
</script>

</body>
</html>
