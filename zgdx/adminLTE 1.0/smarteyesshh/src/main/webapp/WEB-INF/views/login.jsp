<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录页面</title>
  <link rel="shortcut icon" href="${dist}/img/ddlogo.ico">
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
<body class="hold-transition login-page clearfix login">
<div class="login-box clearfix">
  <div class="login-logo">
    <a href="${cxt}/index">
      <img src="${cenimgnew}/logo.png" alt="">
    </a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <div>
      <span>账号:</span>
      <input type="text" placeholder="请输入手机号" name="username">
    </div>
    <div>
      <span>密码:</span>
      <input type="password" placeholder="请输入密码" name="password">
    </div>
    <p id="submit">登录</p>
  </div>
  <!-- /.login-box-body -->
</div>
<div class="footer">
  <strong>&copy; 2018  SmartEyes </a>|</strong> 猎犬上海网安版
</div>
<!-- /.login-box -->

<!-- Bootstrap 3.3.6 -->
<script src="${libs}/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${plugins}/iCheck/icheck.min.js"></script>
<script src="${dist}/js/login.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>


</body>
</html>