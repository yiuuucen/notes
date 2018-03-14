
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>操作日志</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style4.css" />
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <%--<script type="text/javascript" src="${js}/change.js" ></script>--%>
    <script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>
    <script type="text/javascript" src="${js}/bmap.js" ></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>

    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });

        })
    </script>
    <style>
        <%--分页样式--%>
        .tabbtn{
            height: 40px;
            margin: 45px auto 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .tabbtn a{
            display: inline-block;
            height: 28px;
            margin-left: 12px;
            padding: 0 10px;
            color: #fff;
            line-height: 28px;
            text-align: center;
            font-family: "Microsoft YaHei",serif;
            font-size: 14px;
            background-color: #2f3242;
            border: 1px solid #9d9fa6;
        }
        .tabbtn span{
            display: inline-block;
            height: 28px;
            margin-left: 12px;
            padding: 0 10px;
            color: #fff;
            line-height: 28px;
            text-align: center;
            font-family: "Microsoft YaHei",serif;
            font-size: 14px;
            background-color: #2f3242;
            border: 1px solid #9d9fa6;
        }
        .tabbtn span.active{
            background: #2196f3;
        }
        .tabbtn .prev{
            background-color: #2196f3;
            border:none;
        }
        .tabbtn .next{
            background-color: #2196f3;
            border:none;
        }
        .tabbtn .jump-ipt{
            display: inline-block;
            width: 60px;
            height: 28px;
            margin-left: 12px;
            padding: 0 10px;
            color: fff;
            line-height: 28px;
            text-align: center;
            font-family: "Microsoft YaHei",serif;
            font-size: 14px;
            border: 1px solid rgba(255,255,255,0.6);
            background: rgb(47,50,66);
        }
        .tabbtn .jump-btn{
            background-color: #2196f3;
            border: none;
        }
        .alldata{
            color: #fff;
            height: 30px;
            line-height: 30px;
            font-size: 15px;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container-fluid smartEyes-container">

    <jsp:include page="/WEB-INF/common/head2.jsp"/>
    <%--<header class="row">--%>
        <%--<!--logo-->--%>
        <%--<div class="col-lg-2  col-md-2 col-xs-2 logo"><a><img src="${img}/1logo.png" alt=""></a></div>--%>
        <%--<!--<div class="col-lg-4">--%>
            <%--<div class="form-group">--%>
                <%--<input type="text"class="form-control"  />--%>
            <%--</div>--%>

        <%--</div>-->--%>
        <%--<div class="col-lg-1 col-md-1 col-xs-1 fr">--%>
            <%--<a href="${ctx}/search"><img src="${img}/u03.png"></a>--%>
        <%--</div>--%>
        <%--<div class="col-lg-1 col-md-1 col-xs-1 pull-right text-right input-group fr" style="margin-top: 27px">--%>
            <%--<select class="pull-right select myselect" onchange="operateManage(this.options[this.options.selectedIndex].value)">--%>
                <%--<option value="configure" selected="">&nbsp;配置</option>--%>
                <%--<option value="userOperateLog" >&nbsp;用户操作日志</option>--%>
                <%--<option value="targetPersonManage" >&nbsp;目标人员管理</option>--%>
                <%--<option value="systemRightManage" >&nbsp;系统权限管理</option>--%>
            <%--</select>--%>
        <%--</div>--%>
    <%--</header>--%>

    <div class="container-fluid row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
        </div>

        <!--操作表单-->
        <div class="col-lg-12 col-md-12 col-xs-12 operate-box">
            <!--2个echarts图-->
            <div class="two-echarts">
                <div class="tongji-head">
                    <h3>日志统计</h3>
                </div>
            </div>
            <!--图表展示列表-->
            <div class="operate-log ">
                <div class="table-head clearfix">
                    <h3>操作日志</h3>
                    <div>筛选</div>
                </div>
                <div style="position: relative">
                    <table class="operate-table1">
                    <tbody>
                    <!--第二行内容-->
                    <tr class="operate-tr2">
                        <td class="table-responsive operate-table-box">
                            <table class="table table-bordered operate-table">
                                <thead>
                                <tr class="operate-th">
                                    <th>操作日志信息</th>
                                    <th>猎犬用户信息</th>
                                    <th>查询目标人员信息</th>
                                </tr>
                                <tr style="height: 34px;">
                                    <td style="height: 32px;line-height: 32px">日志ID</td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">用户ID </span>
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">用户姓名 </span>
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">查询时间 </span>
                                    </td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">手机号码</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">描述</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4" style="height: 32px;line-height: 32px">涉案类型</span>
                                    </td>
                                </tr>
                                </thead>
                                <tbody class="container xinxi" id="operatelog-tbody">
                                <%--<tr>--%>
                                <%--<td >1</td>--%>
                                <%--<td class="row">--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-userid">1</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-username">张三</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-querytime">2018.01.12   14:03:36</span>--%>
                                <%--</td>--%>
                                <%--<td class="row">--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-tele">13844556677</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">重点人员</span>--%>
                                <%--<span class="col-lg-4 col-md-4 col-xs-4 operate-type">涉黄</span>--%>
                                <%--</td>--%>
                                <%--</tr>--%>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </div>
                <div class="tabbtn M-box">
                </div>
            </div>
        </div>
    </div>
    <!--底部-->
        <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <script>
        $(function(){
            var ut = $("#userType").val();
            console.log(ut);
            //动态获取阴影高度
            // var h= $(window).height();
            // $(".operate-log").height(h-226);
            // $(window).resize(function(){
            //     var h= $(window).height();
            //     $(".operate-log").height(h-226);
            // });
            //设置选中

            $("option[value='userOperateLog']").attr("selected","selected").siblings().removeAttr("selected");

        });

        var pageCount=null;
        var totalData=null;
        var showData=null;
        myajax(false,1);
        function myajax(async,num) {
            $.ajax({
                type:"get",
                url:"/log/searchLog",
                dataType:"json",
                async: async,
                data:{"pageCode":num},
                success:function (res) {
                    $(".xinxi").children().remove();
                    for(var i=0;i<res.data.datas.length;i++){
                        pageCount=res.data.totalPage;
                        totalData=res.data.totalRecord;
                        showData=res.data.pageSize;
                        newTime = new Date(res.data.datas[i].searchTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();
                        var html='<tr><td>'+res.data.datas[i].id+'</td><td class="row"><span class="col-lg-4 col-md-4 col-xs-4 operate-userid">'+res.data.datas[i].userId+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-username">'+res.data.datas[i].userNickname+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-querytime">'+stringTime+'</span> </td> <td class="row"> <span class="col-lg-4 col-md-4 col-xs-4 operate-tele">'+res.data.datas[i].targetPhone+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">'+res.data.datas[i].personType+'</span> <span class="col-lg-4 col-md-4 col-xs-4 operate-type">'+res.data.datas[i].searchType+'</span></td></tr>';
                        $(".xinxi").append(html);
                    }
                },
                error:function () {
                    // $(".mag .submit_fail").css('display','block');
                    console.log("数据错误")
                }
            })
        }
        $('.M-box').pagination({
            pageCount:pageCount,
            totalData:totalData,
            showData:showData,
            mode:'fixed',
            // coping:true,
            // homePage:"首页",
            // endPage:"尾页",
            keepShowPN:true,
            prevContent:'<',
            nextContent:'>',
            jump:true,
            callback:function(index){

                $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">200</b>条 / 共<b id="allpage">12</b>页</div>');
                $("#alldata").text(totalData);
                $("#allpage").text(pageCount);
                //   生成首页和尾页
                $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none">首页</a>');
                $(".tabbtn .next").after('<a href="javascript:;" data-page="73" style="background: #2196f3;border: none">尾页</a>');

                // console.log(index.getCurrent());
                //上一页下一页无法点击
                if(index.getCurrent()==1){
                    $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
                }else if(index.getCurrent()==pageCount){
                    $(".tabbtn .next").css("cursor","not-allowed").css("background","#565656");
                }
                myajax(true,index.getCurrent());
            }
        });
        //上一页下一页无法点击
        if($(".tabbtn span").text()==1){
            $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
        }else if($(".tabbtn span").text()==pageCount){
            $("tabbtn .next").css("cursor","not-allowed").css("background","#565656");
        }

        $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">200</b>条 / 共<b id="allpage">12</b>页</div>');
        $("#alldata").text(totalData);
        $("#allpage").text(pageCount);
        //   生成首页和尾页
        $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none">首页</a>');
        $(".tabbtn .next").after('<a href="javascript:;" data-page="73" style="background: #2196f3;border: none">尾页</a>');
    </script>

</body>
</html>

