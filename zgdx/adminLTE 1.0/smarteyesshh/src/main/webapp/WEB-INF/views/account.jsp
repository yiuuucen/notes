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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper account">

  <!-- Main Header -->
  <jsp:include page="/WEB-INF/common/head.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (页眉) -->
    <section class="content-header">
      <h1 style="color:#fff">
        系统权限管理
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box msg hbox">
            <div class="box-header with-border hbox-header">
              <h3 class="box-title hbox-title">账号设置</h3>
            </div> 
            <div class="box-body chang1">
                <div class="sysmg-adduser">                                  
                    <div>
                        <label for="f1">用户ID:</label>
                        <!-- <input type="text" name="adduser1" id="f1"> -->
                        <span id="f1"></span>
                    </div>
                    <div>
                        <label for="f2">姓  名:</label>
                        <!-- <input type="text" name="adduser2" id="f2"> -->
                        <span id="f2"></span>
                    </div>
                    <div>
                        <label for="f3">手机号:</label>
                        <!-- <input type="password" name="adduser3" id="f3"> -->
                        <span id="f3"></span>
                    </div>
                    <input type="submit" value="修改密码" class="change_pwd">
                </div>            
            </div>
            <div class="box-body chang2">
                <div class="doChange">
                  <div>
                      <label for="f4">当前登录密码:</label>
                      <input type="password" name="old_pwd" id="f4" >
                      <a href="#" style="margin: 0 0 0 20px;color: #999;">忘记密码?</a>
                  </div>
                  <div>
                      <label for="f5">新的登录密码:</label>
                      <input type="password" name="new_pwd" id="f5">
                  </div>
                  <div>
                      <label for="f6">确认新的密码:</label>
                      <input type="password" name="new_pwd2" id="f6">
                  </div>
                  <input type="submit" value="确定" class="change_ok">
                </div>           
            </div>
            
            <!-- /.box-body -->
          </div>
          
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
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
<script src="${dist}/js/account.js"></script>

<script> 
  

</script>

</body>
</html>
