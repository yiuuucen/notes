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
  <title>用户管理</title>
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
<div class="wrapper permission">

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
      <h1>
        系统权限管理
        <small class="label label-success add">添加用户</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box msg">  
            <div class="box-header with-border">
              <h3 class="box-title">用户管理</h3>
            </div>
            <div class="box-body">
                  <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                      <div class="col-sm-12">
                        <table id="example2" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example2_info">
                          <thead>                
                            <tr role="row">
                              <th class="sorting_asc" tabindex="0" rowspan="1" colspan="1">序号</th>
                              <th class="sorting_asc" tabindex="0" rowspan="1" colspan="1">用户ID</th>
                              <th class="sorting_asc" tabindex="0" rowspan="1" colspan="1">用户姓名</th>
                              <th class="sorting_asc" tabindex="0" rowspan="1" colspan="1">用户手机号</th>
                              <th class="sorting_asc" tabindex="0" rowspan="1" colspan="1">密码</th>
                              <th class="sorting_asc" tabindex="0" rowspan="1" colspan="2">操作</th>
                            </tr>
                          </thead>
                          <tbody class="xinxi">

                          <%--<tr role="row" class="even"><td class="sorting_1">1</td><td>10001</td><td class="sysmg-hidetd">张三</td><td class="sysmg-hidetd">138****6677</td><td class="sysmg-hidetd">********</td><td class="sysmg-hideinput"><input type="text" class="sysmgdata" name="sysmgdata1" value="张三"></td><td class="sysmg-hideinput"><input type="text" class="sysmgdata" name="sysmgdata2" value="138****6677"></td><td class="sysmg-hideinput"><input type="text" class="sysmgdata" name="sysmgdata3" value="ac5ad10403ebf0b48f9ab6e81c4ebe3f"></td><td><span class="label label-danger mybtn2">重置</span></td><td><span class="label label-danger mybtn2">禁用</span></td></tr>--%>

                        </tbody>
                        </table>
                      </div>
                    </div>
                    </div>
            </div>
            <div class="box-footer">
              <div class="tabbtn M-box">
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <div class="box adduser"> 
            <div class="box-header with-border">
              <h3 class="box-title">添加用户</h3>
            </div>  
            <div class="box-body">
                <div class="sysmg-adduser">                                   
                    <div>
                        <label for="f1">姓名:</label>
                        <input type="text" name="adduser1" id="f1">
                    </div>
                    <div>
                        <label for="f2">手机号:</label>
                        <input type="text" name="adduser2" id="f2">
                    </div>
                    <div>
                        <label for="f3">密码:</label>
                        <input type="password" name="adduser3" id="f3">
                    </div>
                    <input type="submit" value="确认添加" class="sysmg-subBtn"> 
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
<!-- 分页插件 -->
<script src="${libs}/jquery.pagination.js"></script>
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
<script src="${dist}/js/permission.js"></script>
<!-- 图中的2个echart图 -->
<script>

    $(function() {

        var ut = $("#userType").val();

        if(ut === "1"){
            window.location.href="${ctx}/account";
        }

        var pageCount;
        var totalData;
        var showData;
        //目标人员数据展示
        manData(false, 1);
        //分页插件配置放在JS文件中不生效，因此放在页面下面
        $('.M-box').pagination({
            pageCount: pageCount,
            totalData: totalData,
            showData: showData,
            mode: 'fixed',
            coping: true,
            homePage: "首页",
            endPage: "尾页",
            keepShowPN: true,
            prevContent: '<',
            nextContent: '>',
            jump: true,
            callback: function (index) {
                // console.log(index.getCurrent())
                manData(true,index.getCurrent());
            }
        })
        function manData(async, num) {

            $.ajax({
                type: "get",
                url: window.ctx + "/user/searchUser",
                dataType: "json",
                async: async,
                data: {"pageCode": num},
                success: function (res) {

                    $(".xinxi").children().remove();
                    var html;
                    pageCount=res.data.totalPage;
                    totalData=res.data.totalRecord;
                    showData=res.data.pageSize;
                    for (var i=0;i<res.data.datas.length;i++) {
                        var status;
                        if(res.data.datas[i].status=== 1){
                            //当前状态为1，为启用状态，提示禁用按钮
                            status = "禁用";
                        }else {
                            status = "启用";
                        }
                        var omitusername = res.data.datas[i].username.substr(0, 3) + "****" + res.data.datas[i].username.substr(7);
                        newTime = new Date(res.data.datas[i].searchTime);
                        Date.prototype.toLocaleString = function () {
                            return (this.getFullYear() < 10 ? "0" + this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth() + 1) < 10 ? "0" + (this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate() < 10 ? "0" + this.getDate() : this.getDate()) + "&nbsp&nbsp&nbsp" + (this.getHours() < 10 ? "0" + this.getHours() : this.getHours()) + ":" + (this.getMinutes() < 10 ? "0" + this.getMinutes() : this.getMinutes()) + ":" + (this.getSeconds() < 10 ? "0" + this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();
                        html += '<tr role="row" class="even"><td class="sorting_1">'+((num-1)*10+1+i)+'</td><td>'+res.data.datas[i].id+'</td><td class="sysmg-hidetd">'+res.data.datas[i].nickname+'</td><td class="sysmg-hidetd">'+omitusername+'</td><td class="sysmg-hidetd">'+"********"+'</td><td class="sysmg-hideinput"><input  type="text" class="sysmgdata"  name="sysmgdata1" value="'+res.data.datas[i].nickname+'"/></td><td class="sysmg-hideinput"><input type="text" class="sysmgdata"  name="sysmgdata2" value="'+res.data.datas[i].username+'"/></td><td class="sysmg-hideinput"><input type="text" class="sysmgdata"  name="sysmgdata3" value="'+res.data.datas[i].password+'"/></td><td><span class="label label-danger mybtn2">重置</span></td><td><span class="label label-danger mybtn2">'+status+'</span></td></tr>'
                    }

                    $(".xinxi").append(html);
                    changebtnEvent();
                },
                error: function () {
                    // $(".mag .submit_fail").css('display','block');
                    console.log("数据错误")
                }
            });
        }


        // 重置按钮点击事件
        
        function changebtnEvent() {
            var myinput = [];
            var myinput2 = [];
            //0为没点击
            var changestatus = 0;
            $(".mybtn2").click(function () {
                var mytxt = this.innerHTML;
                var inputuserid = $(this).parent("td").parent("tr").children("td").eq(1).text();

                if(mytxt ==="重置"){
                    if(changestatus === 0){
                        this.innerHTML="完成";
                        $(this).parent("td").parent("tr").children('.sysmg-hidetd').css("display","none");
                        $(this).parent("td").parent("tr").children('.sysmg-hideinput').css("display","table-cell");
                        for(var j = 0;j < 3;j++){
                            //为什么不行
//                               myinput[i] = $(this).parent("span").parent("td").parent("tr").children("input").eq(i).val();
                            var mystring2 = "sysmgdata"+(j+1);
                            myinput2[j] = $(this).parent("td").parent("tr").find("input[name='"+mystring2+"']").val();
                        }
                        changestatus = 1;
//                           myinput[3] = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();
                    }else {
                        alert("有未完成修改的记录");
                    }

                }else if(mytxt ==="完成"){

                    this.innerHTML="重置";
                    changestatus = 0;

                    for(var i = 0;i < 3;i++){
                        var mystring = "sysmgdata"+(i+1);
                        myinput[i] = $(this).parent("td").parent("tr").find("input[name='"+mystring+"']").val();

                    }
                    //userId
//                            inputuserid = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();

                    //把文字显示出来

                    $(this).parent("td").parent("tr").find(".sysmg-hidetd").eq(0).text(""+myinput[0]);
                    $(this).parent("td").parent("tr").find(".sysmg-hidetd").eq(1).text((myinput[1].substr(0,3)+"****"+myinput[1].substr(7)));
                    $(this).parent("td").parent("tr").find(".sysmg-hidetd").eq(2).text("********");

                    $(this).parent("td").parent("tr").children('.sysmg-hideinput').css("display","none");
                    $(this).parent("td").parent("tr").children('.sysmg-hidetd').css("display","table-cell");
                    //如果确实改了，就提交请求。
                    var paraarr = {};
                    paraarr.userId = inputuserid;
                    var numArr = [];
                    for(var k = 0 ;k<3; k++){
                        //有哪几个改了。
                        if(myinput[k] !== myinput2[k]){
                            numArr.push(k);
                        }
                    }
                    var numArrlen = numArr.length;
                    //确实改了
                    if(numArrlen !== 0) {
                        for (var q = 0; q < numArrlen; q++) {
                            switch (numArr[q]) {
                                case 0:
                                    paraarr.usernick = myinput[0];
                                    break;
                                case 1:
                                    paraarr.username = myinput[1];
                                    break;
                                case 2:
                                    paraarr.password = myinput[2];
                                    break;
                            }
                        }

                        //提交保存数据
                        $.ajax({
                            type:"GET",
                            url:"user/setUser",
                            dataType:"json",
//                                    data:{"userId":myinput[3],"usernick":myinput[0],"username":myinput[1],"password":myinput[2]},
                            data: paraarr,
                            success:function (res) {
                                if(res.result===1){
                                    alert("重置成功");
                                }else{
                                    alert("不能重置");
                                }
                            },error:function () {
                                console.log("修改提交错误");
                            }

                        })
                    }


                }else if(mytxt ==="禁用"){
                    this.innerHTML="启用";
                    //提交保存数据
                    $.ajax({
                        type:"GET",
                        url:"user/setUser",
                        dataType:"json",
                        data:{"userId":inputuserid,"status":-1},
                        success:function (res) {
                            if(res.result===1){
                                alert("禁用成功");
                            }else{
                                alert("不能禁用");
                            }
                        },error:function () {
                            console.log("禁用提交错误");
                        }

                    })
                }else if(mytxt ==="启用"){
                    this.innerHTML="禁用";
                    //提交保存数据
                    $.ajax({
                        type:"GET",
                        url:"user/setUser",
                        dataType:"json",
                        data:{"userId":inputuserid,"status":1},
                        success:function (res) {
                            if(res.result===1){
                                alert("启用成功");
                            }else{
                                alert("不能启用");
                            }
                        },error:function () {
                            console.log("启用提交错误");
                        }

                    })
                }
            });

        }
    });
</script>

</body>
</html>
