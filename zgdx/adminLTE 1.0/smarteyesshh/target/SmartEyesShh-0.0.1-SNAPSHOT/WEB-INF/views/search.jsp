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
    <title>账号设置</title>
    <link rel="shortcut icon" href="${cenimg}/ddlogo.ico">
    <!-- 告诉浏览器该页面是自适应布局 -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
<body class="hold-transition skin-blue sidebar-mini searchpage">
<div class="wrapper account">

    <!-- Main Header -->
    <jsp:include page="/WEB-INF/common/head.jsp"/>
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper clearfix">
        <div class="bg clearfix">
            <div>
                <input type="text" name="q2">
                <img src="${cenimg}/uu01.png" alt="" class="search2">
                <img src="${cenimg}/S_updata.png" alt="" class="updata" style="cursor: not-allowed">
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <!-- Main Footer -->
    <jsp:include page="/WEB-INF/common/footer.jsp"/>

    <div class="submit_fail">
        <div class="submit_box">
            <div class="box_top">
                <span>提交查询号码</span>
                <img src="${cenimg}/magclose.png" alt="">
            </div>
            <div class="box_bottom">
                <div class="msg">
                    <div>
                        <p>目标人员号码:</p>
                        <div>
                            <input type="text" name="tel">
                        </div>
                    </div>
                    <div>
                        <p>目标人员描述:</p>
                        <div>
                            <select name="" id="miaoshu">
                                <option value="" selected></option>
                                <option value="重点人员">重点人员</option>
                                <option value="一般人员">一般人员</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <p>目标人员标签:</p>
                        <div>
                            <select name="" id="biaoqian">
                                <option value="" selected></option>
                                <option value="涉毒">涉毒</option>
                                <option value="盗窃">盗窃</option>
                                <option value="强奸">强奸</option>
                                <option value="卖淫">卖淫</option>
                                <option value="抢劫">抢劫</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <h3 id="lessbtn">确认提交</h3>
                        <h3 class="lessclose">取消</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
<script src="${dist}/js/search.js"></script>


</body>
</html>
