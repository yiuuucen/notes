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
  <title>目标人员管理</title>
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
<div class="wrapper personlist">

  <!-- Main Header -->
    <jsp:include page="/WEB-INF/common/head.jsp"/>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (页眉) -->
    <section class="content-header">
      <h1 style="color: #fff">
        目标人员管理
        <small class="label up-some">批量提交查询号码</small>
        <small class="label up-one">提交查询号码</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box hbox">
            <div class="box-header with-border hbox-header">
              <h3 class="box-title hbox-title">目标人员列表</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                  <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                      <div class="col-sm-12">
                        <table id="example2" class="table table-bordered dataTable" role="grid" aria-describedby="example2_info" style="color: #fff">
                          <thead>
                            <tr role="row">
                              <th tabindex="0" rowspan="1" colspan="5" style="border-right:1px solid rgba(255,255,255,0.3)">目标人员信息</th>
                              <th tabindex="0" rowspan="1" colspan="3">猎犬用户信息</th>
                            </tr>
                            <tr role="row">
                              <th tabindex="0" rowspan="1" colspan="1">序号</th>
                              <th tabindex="0" rowspan="1" colspan="1">手机号码</th>
                              <th tabindex="0" rowspan="1" colspan="1">描述</th>
                              <th tabindex="0" rowspan="1" colspan="1">涉案类型</th>
                              <th tabindex="0" rowspan="1" colspan="1" style="border-right:1px solid rgba(255,255,255,0.3)">查询状态</th>
                              <th tabindex="0" rowspan="1" colspan="1">用户ID</th>
                              <th tabindex="0" rowspan="1" colspan="1">用户姓名</th>
                              <th tabindex="0" rowspan="1" colspan="1">提交时间</th>
                            </tr>
                          </thead>
                          <tbody class="xinxi">
                            <%--<tr role="row" class="even">--%>
                              <%--<td class="sorting_1">61</td>--%>
                              <%--<td>138****7658</td>--%>
                              <%--<td>重点人员</td>--%>
                              <%--<td>涉毒</td>--%>
                              <%--<td>已提交</td>--%>
                              <%--<td>10001</td>--%>
                              <%--<td>张三</td>--%>
                              <%--<td>2018.01.17   09:33:50</td>--%>
                            <%--</tr>--%>
                        </tbody>
                        </table>
                      </div>
                    </div>
                    </div>
                </div>
            <!-- /.box-body -->
            <div class="box-footer hbox-footer">
                <div class="tabbtn M-box">
                </div>
            </div>
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


  <div class="submit_btn">
        <div class="submit_box">
            <div class="box_top">
                <span>批量提交查询号码</span>
                <img src="${cenimg}/magclose.png" alt="">
            </div>
            <div class="box_bottom">
                <!-- <form action="${ctx}/target/uploadPhone" method="post" enctype="multipart/form-data" > -->
                <form method="post" enctype="multipart/form-data" id="myform">
                    <input type="file" name="csvfile" class="choose" />
                    <div class="load">下载批量提交模板</div>
                    <input value="确认提交" id="btn" type="button">
                    <div>取消</div>
                </form>
            </div>
        </div>
  </div>
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
<script src="${dist}/js/personlist.js"></script>
<script>

    $(function() {
        $(".pg4").addClass("active");
        var pageCount;
        var totalData;
        var showData;
        //目标人员数据展示
        perdata(false, 1);
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
                perdata(true,index.getCurrent());
            }
        });
        $(".alldata").remove();
        $(".tabbtn").before('<div class="alldata">共<b id="alldata"></b>条 / 共<b id="allpage"></b>页</div>');
        $("#alldata").text(totalData);
        $("#allpage").text(pageCount);

        function perdata(async, num) {

            $.ajax({
                type: "get",
                url: window.ctx + "/target/searchTarget",
                dataType: "json",
                async: async,
                data: {"pageCode": num},
                success: function (res) {

                    $(".xinxi").children().remove();
                    var html;
                    pageCount = res.result.totalPage;
                    totalData = res.result.totalRecord;
                    showData = res.result.pageSize;
                    for (var i = 0; i < res.result.datas.length; i++) {
                        newTime = new Date(res.result.datas[i].createTime);
                        Date.prototype.toLocaleString = function () {
                            return (this.getFullYear() < 10 ? "0" + this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth() + 1) < 10 ? "0" + (this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate() < 10 ? "0" + this.getDate() : this.getDate()) + "&nbsp&nbsp&nbsp" + (this.getHours() < 10 ? "0" + this.getHours() : this.getHours()) + ":" + (this.getMinutes() < 10 ? "0" + this.getMinutes() : this.getMinutes()) + ":" + (this.getSeconds() < 10 ? "0" + this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();
                        var phone = res.result.datas[i].targetPhone;
                        phone = phone.slice(-11);

                        // var html='<div class="lie clearfix" ><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].id+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+phone+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].personType+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%;">'+res.result.datas[i].searchType+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].status+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userId+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%">'+res.result.datas[i].userNick+'</span><span class="col-lg-3 col-md-3 col-xs-3">'+stringTime+'</span></div>'
                        html += '<tr role="row"><td class="sorting_1">' + res.result.datas[i].id + '</td><td>' + phone + '</td><td>' + res.result.datas[i].personType + '</td><td>' + res.result.datas[i].searchType + '</td><td style="border-right:1px solid rgba(255,255,255,0.3)">' + res.result.datas[i].status + '</td><td>' + res.result.datas[i].userId + '</td><td>' + res.result.datas[i].userNick + '</td><td>' + stringTime + '</td></tr>'
                    }

                    $(".xinxi").append(html);
                },
                error: function () {
                    // $(".mag .submit_fail").css('display','block');
                    console.log("数据错误")
                }
            });
        }
    });
</script>

</body>
</html>
