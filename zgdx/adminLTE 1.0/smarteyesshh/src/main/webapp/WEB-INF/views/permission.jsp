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
  <jsp:include page="/WEB-INF/common/head.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (页眉) -->
    <section class="content-header">
      <h1 style="color:#fff">
        系统权限管理
        <small class="label add">添加用户</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box msg hbox">
            <div class="box-header with-border hbox-header">
              <h3 class="box-title hbox-title">用户管理</h3>
            </div>
            <div class="box-body">
                  <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                      <div class="col-sm-12">
                        <table id="example2" class="table table-bordered dataTable" role="grid" aria-describedby="example2_info" style="color: #fff">
                          <thead>                
                            <tr role="row">
                              <th tabindex="0" rowspan="1" colspan="1">序号</th>
                              <th tabindex="0" rowspan="1" colspan="1">用户ID</th>
                              <th tabindex="0" rowspan="1" colspan="1">用户姓名</th>
                              <th tabindex="0" rowspan="1" colspan="1">用户手机号</th>
                              <th tabindex="0" rowspan="1" colspan="1">密码</th>
                              <th tabindex="0" rowspan="1" colspan="2">操作</th>
                            </tr>
                          </thead>
                          <tbody class="xinxi">

                            <%--<tr role="row" class="even">--%>
                              <%--<td class="sorting_1">1</td>--%>
                              <%--<td>10001</td>--%>
                              <%--<td class="sysmg-hidetd">张三</td>--%>
                              <%--<td class="sysmg-hidetd">138****6677</td>--%>
                              <%--<td class="sysmg-hidetd">********</td>--%>
                              <%--<td class="sysmg-hideinput">--%>
                                <%--<input type="text" class="sysmgdata" name="sysmgdata1" value="张三">--%>
                              <%--</td>--%>
                              <%--<td class="sysmg-hideinput">--%>
                                <%--<input type="text" class="sysmgdata" name="sysmgdata2" value="138****6677">--%>
                              <%--</td>--%>
                              <%--<td class="sysmg-hideinput">--%>
                                <%--<input type="text" class="sysmgdata" name="sysmgdata3" value="ac5ad10403ebf0b48f9ab6e81c4ebe3f"></td><td><span class="label label-danger mybtn2">修改</span>--%>
                                <%--<span class="label label-danger mybtn2">禁用</span>--%>
                              <%--</td>--%>
                            <%--</tr>--%>

                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
            </div>
            <div class="box-footer hbox-footer">
              <div class="tabbtn M-box">
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <div class="box adduser hbox">
            <div class="box-header with-border hbox-header">
              <h3 class="box-title hbox-title">添加用户</h3>
            </div>  
            <div class="box-body">
                <div class="sysmg-adduser">                                   
                    <div>
                        <label for="f1">姓  名:</label>
                        <input type="text" name="adduser1" id="f1">
                    </div>
                    <div>
                        <label for="f2">手机号:</label>
                        <input type="text" name="adduser2" id="f2">
                    </div>
                    <div>
                        <label for="f3">密  码:</label>
                        <input type="password" name="adduser3" id="f3">
                    </div>
                    <input type="submit" value="确认添加" class="sysmg-subBtn"> 
                </div>
            </div>
            <!-- /.box-body -->
          </div>
          <div class="box changeuser hbox">
            <div class="box-header with-border hbox-header">
              <h3 class="box-title hbox-title">修改用户信息</h3>
            </div>
            <div class="box-body">
              <div class="sysmg-adduser">
                <div>
                  <label for="f4">用户姓名:</label>
                  <input type="text" name="adduser4" id="f4">
                </div>
                <div>
                  <label for="f5">用户手机号:</label>
                  <input type="text" name="adduser5" id="f5">
                </div>
                <div>
                  <label for="f6">密     码:</label>
                  <input type="password" name="adduser6" id="f6">
                </div>
                <input type="submit" value="完成" class="sysmg-subBtn2">
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
        $(".pg6").addClass("active");
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
        });
        $(".alldata").remove();
        $(".tabbtn").before('<div class="alldata">共<b id="alldata"></b>条 / 共<b id="allpage"></b>页</div>');
        $("#alldata").text(totalData);
        $("#allpage").text(pageCount);
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

                        // var html='<div class="lie clearfix" ><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].id+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+phone+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].personType+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%;">'+res.result.datas[i].searchType+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].status+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userId+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%">'+res.result.datas[i].userNick+'</span><span class="col-lg-3 col-md-3 col-xs-3">'+stringTime+'</span></div>'
                        html += '<tr role="row" class="even"><td class="sorting_1">'+((num-1)*10+1+i)+'</td><td>'+res.data.datas[i].id+'</td><td class="sysmg-hidetd">'+res.data.datas[i].nickname+'</td><td class="sysmg-hidetd">'+omitusername+'</td><td class="sysmg-hidetd">'+"********"+'</td><td class="sysmg-hideinput"><input  type="text" class="sysmgdata"  name="sysmgdata1" value="'+res.data.datas[i].nickname+'"/></td><td class="sysmg-hideinput"><input type="text" class="sysmgdata"  name="sysmgdata2" value="'+res.data.datas[i].username+'"/></td><td class="sysmg-hideinput"><input type="text" class="sysmgdata"  name="sysmgdata3" value="'+res.data.datas[i].password+'"/></td><td><span class="label mybtn2">修改</span></td><td><span class="label  mybtn2">'+status+'</span></td></tr>'
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


        // 修改按钮点击事件
        function changebtnEvent() {

            var myinput = [];
            var myinput2=[];
            //0为没点击
            var changestatus = 0;
            $(".mybtn2").click(function () {

                var mytxt = this.innerHTML;
                var inputuserid = $(this).parent("td").parent("tr").children("td").eq(1).text();

                if(mytxt ==="修改"){
                    $(".msg").css("display","none");
                    $(".changeuser").css("display","block");
                    for(var i = 0;i < 3;i++){
                        var mystring = "sysmgdata"+(i+1);
                        myinput[i] = $(this).parent("td").parent("tr").find("input[name='"+mystring+"']").val();

                    }

                    $("#f4").val(""+myinput[0]).attr("mydata",myinput[0]);
                    $("#f5").val((myinput[1].substr(0,3)+"****"+myinput[1].substr(7)));
                    $("#f6").val("********");


                    $(".sysmg-subBtn2").click(function(){
                        var changename;
                        var changetel;
                        var changepwd;

                        var arr={};
                        arr.userId=inputuserid;

                        //如果没有改变，则传空值过去
                        if($("#f4").val()!=myinput[0]){
                            arr.usernick=$("#f4").val();
                        }
                        if($("#f5").val()!=myinput[1]){
                            arr.username=$("#f5").val()
                        }
                        if($("#f6").val()!="********"){
                            arr.password=$("#f6").val()
                        }

                        $.ajax({
                            type: "GET",
                            url: "user/setUser",
                            dataType: "json",
                            data:arr,
                            success: function (res) {
                                if (res.result === 1) {
                                    alert("修改成功");
                                    window.location.reload();
                                } else {
                                    alert("修改失败");
                                }
                            }, error: function () {
                                console.log("修改提交错误");
                            }
                        })
                    })


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
                                $(".popup").text("禁用成功").animate({top:0});
                                setTimeout(function(){
                                    $(".popup").animate({top:"-40px"});
                                },2000)
                            }else{
                                $(".popup").text("不能禁用").animate({top:0});
                                setTimeout(function(){
                                    $(".popup").animate({top:"-40px"});
                                },2000)
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
                                $(".popup").text("启用成功").animate({top:0});
                                setTimeout(function(){
                                    $(".popup").animate({top:"-40px"});
                                },2000)
                            }else{
                                $(".popup").text("不能启用").animate({top:0});
                                setTimeout(function(){
                                    $(".popup").animate({top:"-40px"});
                                },2000)
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
