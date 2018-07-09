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
    <title>用户操作日志</title>
    <link rel="shortcut icon" href="${cenimg}/ddlogo.ico">
    <!-- 告诉浏览器该页面是自适应布局 -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${plugins}/vue/ele-ui.css" />
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${libs}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${libs}/bootstrap/css/bootstrap-select.css">
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
<div class="wrapper system">

    <!-- Main Header -->
    <jsp:include page="/WEB-INF/common/head.jsp"/>
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="/WEB-INF/common/leftTool.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (页眉) -->
        <section class="content-header">
            <h1 style="color: #fff">
                操作日志
            </h1>
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
            <c:choose>
                <c:when test="${userType == 0}">
                <div class="box allCount hbox">
                    <div class="box-header with-border hbox-header">
                        <h3 class="box-title hbox-title">日志统计</h3>
                    </div>
                    <div class="box-body">
                        <div style="display: flex;justify-content: space-around;height: 300px">
                            <div id="barEchart01" style="width: 40%;height: 100%"></div>
                            <div id="barEchart02" style="width: 45%;height: 100%"></div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                </div>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>
            <!-- /.box -->

            <!-- Default box -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box hbox">
                        <div class="box-header hbox-header" style="display:flex;align-items: center;">
                            <h3 class="box-title hbox-title">日志详情</h3>
                            <div style="margin: 0 0 0 30px" class="choose">
                                <select id="peopleSel" class="selectpicker" multiple data-live-search="true" data-live-search-placeholder="Search" data-size="5" data-none-selected-text="全部用户" data-actions-box="true">
                                    <%--<option>option1</option>--%>
                                    <%--<option>option2</option>--%>
                                    <%--<option>option3</option>--%>
                                </select>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table id="example1" class="table table-bordered dataTable" role="grid" aria-describedby="example1_info" style="color: #fff">
                                            <thead>
                                            <tr role="row">
                                                <th tabindex="0" rowspan="1" colspan="1" style="border-right:1px solid rgba(255,255,255,0.3)">操作日志信息</th>
                                                <th tabindex="0" rowspan="1" colspan="3" style="border-right:1px solid rgba(255,255,255,0.3)">猎犬用户信息</th>
                                                <th tabindex="0" rowspan="1" colspan="3">查询目标人员信息</th>
                                            </tr>
                                            <tr role="row">
                                                <th tabindex="0" rowspan="1" colspan="1" style="border-right:1px solid rgba(255,255,255,0.3)">日志ID</th>
                                                <th tabindex="0" rowspan="1" colspan="1">用户ID</th>
                                                <th tabindex="0" rowspan="1" colspan="1">用户姓名</th>
                                                <th tabindex="0" rowspan="1" colspan="1" style="border-right:1px solid rgba(255,255,255,0.3)">查询时间</th>
                                                <th tabindex="0" rowspan="1" colspan="1">手机号码</th>
                                                <th tabindex="0" rowspan="1" colspan="1">描述</th>
                                                <th tabindex="0" rowspan="1" colspan="1">涉案类型</th>
                                            </tr>
                                            </thead>
                                            <tbody class="xinxi">
                                            <%--<tr role="row" class="even">--%>
                                                <%--<td class="sorting_1">SEL1000001</td>--%>
                                                <%--<td>10001</td>--%>
                                                <%--<td>张三</td>--%>
                                                <%--<td>2018.01.10   15:55:56</td>--%>
                                                <%--<td>177****8993</td>--%>
                                                <%--<td>一般人员</td>--%>
                                                <%--<td>盗窃</td>--%>
                                            <%--</tr>--%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer operate-log hbox-footer" style="position: relative;">
                            <div class="tabbtn M-box">
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
<script src="${plugins}/vue/vue.js"></script>
<script src="${plugins}/vue/ele-ui.js"></script>
<script src="${dist}/js/system.js"></script>
<%--下拉列表--%>
<script src="${libs}/bootstrap/js/bootstrap-select.js"></script>
<!-- 图中的2个echart图 -->
<script>
    $(function() {

        $(".pg5").addClass("active");
        var pageCount;
        var totalData;
        var showData;

        if(ut!=0){
            $(".choose").remove()
        }else if(ut==0){
            //当超级管理员进入时加载这个ajax获取所有人信息
            $.ajax({
                type:"get",
                url:window.ctx +"/log/getNames",
                dataType:"json",
                async:false,
                success:function (arr) {
                    // console.log(arr);
                    var msg='';
                    for(var i=0;i<arr.length;i++){
                        msg+="<option>"+arr[i]+"</option>";
                    }
                    $("#peopleSel").html(msg);
                },
                error:function () {
                    console.log("数据错误")
                }
            });
            $('.selectpicker').on('loaded.bs.select',function(){
                $(".choose .dropdown-toggle").css("color","#fff").css("background","transparent");
            })
            $('.selectpicker').on('hidden.bs.select', function (e) {
                $(".choose .dropdown-toggle").css("color","#fff").css("background","transparent");
                // do something...
                var value = $('.filter-option').html();
                //去除value中所有空格
                // value=value.trim();
                var arr=[];
                arr=value.split(',');
                for(var i=0;i<arr.length;i++){
                    arr[i]=arr[i].trim();
                }
                value=arr.join(",")
                if(value=="全部用户"){
                    value='';
                }
                myajax2(1,value);
                function myajax2(num,name){
                    $.ajax({
                        type: "get",
                        url: window.ctx+"/log/searchLog",
                        dataType: "json",
                        async: false,
                        data: {"pageCode": num, "userName": name},
                        success:function(res){
                            $(".xinxi").children().remove();
                            var html;
                            pageCount = res.data.totalPage;
                            totalData = res.data.totalRecord;
                            showData = res.data.pageSize;
                            for (var i = 0; i < res.data.datas.length; i++) {
                                newTime = new Date(res.data.datas[i].searchTime);
                                Date.prototype.toLocaleString = function() {
                                    return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                                };
                                stringTime = newTime.toLocaleString();

                                var phone = res.data.datas[i].targetPhone;
                                phone = phone.slice(-11);//去除86

                                // var html='<div class="lie clearfix" ><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].id+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+phone+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].personType+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%;">'+res.result.datas[i].searchType+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].status+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userId+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%">'+res.result.datas[i].userNick+'</span><span class="col-lg-3 col-md-3 col-xs-3">'+stringTime+'</span></div>'

                                html+='<tr role="row" class="even"><td class="sorting_1" style="border-right:1px solid rgba(255,255,255,0.3)">'+"SEL" + res.data.datas[i].id+'</td><td>'+res.data.datas[i].userId+'</td><td>'+res.data.datas[i].userNickname+'</td><td style="border-right:1px solid rgba(255,255,255,0.3)">'+stringTime+'</td><td>'+phone+'</td><td>'+res.data.datas[i].personType+'</td><td>'+res.data.datas[i].searchType+'</td></tr>'
                            }

                            $(".xinxi").append(html);
                        }
                    })
                }
                $(".M-box").remove();
                $(".operate-log").append('<div class="tabbtn M-box"></div>');
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
                        myajax2(index.getCurrent(),value);
                    }
                });
                $(".alldata").remove();
                $(".tabbtn").before('<div class="alldata">共<b id="alldata"></b>条 / 共<b id="allpage"></b>页</div>');
                $("#alldata").text(totalData);
                $("#allpage").text(pageCount);
            });

        }



        //目标人员数据展示
        doData(false, 1);
        //分页插件配置放在JS文件中不生效，因此放在页面下面
        $(".alldata").remove();
        $(".tabbtn").before('<div class="alldata">共<b id="alldata"></b>条 / 共<b id="allpage"></b>页</div>');
        $("#alldata").text(totalData);
        $("#allpage").text(pageCount);
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
                doData(true,index.getCurrent());
            }
        });
        function doData(async, num) {

            $.ajax({
                type: "get",
                url: window.ctx + "/log/searchLog",
                dataType: "json",
                async: async,
                data: {"pageCode": num},
                success: function (res) {
                    $(".xinxi").children().remove();
                    var html;
                    pageCount = res.data.totalPage;
                    totalData = res.data.totalRecord;
                    showData = res.data.pageSize;
                    for (var i = 0; i < res.data.datas.length; i++) {
                        newTime = new Date(res.data.datas[i].searchTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();

                        var phone = res.data.datas[i].targetPhone;
                        phone = phone.slice(-11);//去除86

                        // var html='<div class="lie clearfix" ><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].id+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+phone+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].personType+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%;">'+res.result.datas[i].searchType+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].status+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userId+'</span><span class="col-lg-1 col-md-1 col-xs-1" style="padding: 0 0 0 3%">'+res.result.datas[i].userNick+'</span><span class="col-lg-3 col-md-3 col-xs-3">'+stringTime+'</span></div>'

                       html+='<tr role="row" class="even"><td class="sorting_1" style="border-right:1px solid rgba(255,255,255,0.3)">'+"SEL" + res.data.datas[i].id+'</td><td>'+res.data.datas[i].userId+'</td><td>'+res.data.datas[i].userNickname+'</td><td style="border-right:1px solid rgba(255,255,255,0.3)">'+stringTime+'</td><td>'+phone+'</td><td>'+res.data.datas[i].personType+'</td><td>'+res.data.datas[i].searchType+'</td></tr>'
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
