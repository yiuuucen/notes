
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>操作日志</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style2.css" />
    <link rel="stylesheet" href="${css}/style4.css" />
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
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

    <div class="row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
        </div>

        <!--操作表单-->
        <div class="col-lg-12 col-md-12 col-xs-12 operate-box">
            <!--图表展示列表-->
            <div class="operate-log ">
                <table class="operate-table1">
                    <tbody>
                    <tr class="operate-tr1">
                        <td class="h1" >操作日志</td>
                    </tr>
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
                                </thead>
                                <tbody class="container" id="operatelog-tbody">
                                <tr>
                                    <td >日志ID</td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-userid">用户ID </span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-username">用户姓名 </span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-querytime">查询时间 </span>
                                    </td>
                                    <td class="row">
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-tele">手机号码</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-descrip">描述</span>
                                        <span class="col-lg-4 col-md-4 col-xs-4 operate-type">涉案类型</span>
                                    </td>

                                </tr>

                                </tbody>
                            </table>
                        </td>

                    </tr>
                    <!--第三行分页按钮-->
                    <tr class="operate-tr3">
                        <td>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul class="operate-pageTitleCell clearfix" id="pageupdown">
                                            <%--<li class="fl"><a class="operate-pagechange operate-pageprev">上一页</a></li>--%>

                                            <%--<li class="fl"><a class="active">1</a></li>--%>
                                            <%--<li class="fl"><a >2</a></li>--%>
                                            <%--<li class="fl"><a >3</a></li>--%>
                                            <%--<li class="fl"><a >4</a></li>--%>


                                            <%--<li class="fl"><a class="operate-pagechange operate-pagenext">下一页</a></li>--%>
                                        </ul>
                                        <span class="operate-text">

                                        </span>

                                    </td>


                                </tr>

                                </tbody>

                            </table>
                        </td>

                    </tr>

                    </tbody>

                </table>


            </div>
        </div>
    </div>
    <!--底部-->
    <footer style="position: fixed; bottom:0px"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>
    <script>
        $(function(){
            //动态获取阴影高度
            var h= $(window).height();
            $(".operate-log").height(h-226);
            $(window).resize(function(){
                var h= $(window).height();
                $(".operate-log").height(h-226);
            });
            //设置选中

            $("option[value='userOperateLog']").attr("selected","selected").siblings().removeAttr("selected");

        });


        //分页操作
        //定义三个全局变量
        var currentPage = 1;//当前页
        var totalpage = 1;//总页数
        //        var pagesize = 10;//每页显示页数
        //一共分成两步，一步加载数据，一步为变换分页
        loadData();

        function loadData() {
            $.ajax({
                type:"GET",
                url:"/log/searchLog",
                dataType:"json",
                data:{pageCode:currentPage},
                success:function (res) {
                    showData(res.data.datas);
                    showPage(res.data.totalPage,currentPage);
                    console.log("showPage(res.data.totalPage,currentPage)");
                    console.log(currentPage);
                    clickEvent(currentPage,totalpage);
                },
                error:function () {
                    console.log("error");
                }

            })

        }
        function showData(arr){
            $('#operatelog-tbody').html("");
            $('#operatelog-tbody').append("<tr>"+
                "<td>日志ID</td>" + "<td class=\"row\">" + "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">用户ID </span>" +
                "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">用户姓名 </span>" +
                "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">查询时间 </span>" +
                "</td>" +
                "<td class=\"row\">" +
                "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">手机号码</span>" +
                "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">描述</span>" +
                "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">涉案类型</span>" +
                "</td>" +
                "</tr>");
            for(var i = 0 ;i < arr.length; i++){
                $('#operatelog-tbody').append("<tr>" +
                    "<td >"+arr[i].id+"</td>" +
                    "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">"+arr[i].userId+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">"+arr[i].userNickname+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">"+timeStamp(arr[i].searchTime)+"</span></td>" +
                    "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">"+arr[i].targetPhone+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">"+arr[i].personType+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">"+arr[i].searchType+"</span></td>" +
                    "</tr>");
            }

        }
        function showPage(pageAll,cp) {
            //询问考虑没数据情况后台返回，只显示一页
            var _LENGTH = 5;
            var midpage = Math.floor(_LENGTH/2)+1;
            var pageArr = [];
            totalpage = pageAll;
            //总页数小于9页
            if(pageAll < _LENGTH){
                for(var i = 0 ;i < pageAll; i++){
                    pageArr[i] = i+1;
                }
            }//总页数大于9页
            else{
                //小于等于中间数不变
                if(cp <= midpage){
                    for(var j = 0 ;j < _LENGTH; j++){
                        pageArr[j] = j+1;
                    }
                    console.log("pageArr");
                    console.log(pageArr);
                }//左边一半右边一半
                else if(cp <= pageAll-midpage+1){
                    for(var k =0 ; k < _LENGTH; k++){
                        pageArr[k] = cp-midpage+1+k;
                    }
                    console.log("pageArr2");
                    console.log(pageArr);
                }//不变
                else {
                    for(var m =0 ; m < _LENGTH; m++){
                        pageArr[m] = pageAll-_LENGTH+1+m;
                    }
                    console.log("pageArr3");
                    console.log(pageArr);
                }

            }
            drawPage(pageArr,cp,pageAll);

        }
        function drawPage(pagearr,cp,pageall) {
            $('#pageupdown').html("");
            var _html = "";

            $('#pageupdown').append("<li class=\"fl\" ><a class=\"operate-pagechange operate-pageprev\">上一页</a></li>");

            for(var i = 0; i < pagearr.length;i++){
                _html += "<li class=\"fl\"><a >"+ pagearr[i]+"</a></li>";
            }
            $('#pageupdown').append(_html);

            //下一页
            $('#pageupdown').append("<li class=\"fl\" ><a class=\"operate-pagechange operate-pagenext\">下一页</a></li>");

            //激活当前页。
            var index = getIndex(pagearr,cp);
            console.log(index);
            console.log(cp);
            $('#pageupdown').children("li").eq(index+1).children("a").addClass("active");

            //文字总页数pageAll

            $('.operate-text').html("共"+pageall+"页");
            //总页数为1，上下都禁用。
            if(pageall===1){
                $('#pageupdown').children("li").eq(0).children("a").addClass("operate-disable");
                $('#pageupdown li:last-child').children("a").addClass("operate-disable");

            }else{
                //如果为1上一页禁用
                if(cp === 1){
                    console.log("cp1");
                    console.log(cp);
                    $('#pageupdown li:last-child').children("a").removeClass("operate-disable");
                    $('#pageupdown').children("li").eq(0).children("a").addClass("operate-disable");
                }
                //如果为总页数下一页禁用
                else if(cp === pageall){
                    console.log("cp2");
                    console.log(cp);
                    $('#pageupdown').children("li").eq(0).children("a").removeClass("operate-disable");
                    $('#pageupdown li:last-child').children("a").addClass("operate-disable");

                }else {}
            }




            //成功了调用切换tab函数
//            tab("#pageupdown",tp);

        }
//        clickEvent(currentPage,totalpage);
        //点击事件
        function clickEvent(crp,tp){
            $('#pageupdown').children("li").click(function(){
//                alert("a");
                var text = $(this).children("a").text();//获取当前点击页数
//                alert(text);
                if(text === "上一页"){ //如果是点击的上一页
//                alert(text);
                    if( crp > 1){
                        currentPage--;
                    }else{
                        //alert("已经是第一页");
                       // $('#pageupdown').children("li").eq(tp+1).children("a").removeClass("operate-disable");
                       // $('#pageupdown').children("li").eq(0).children("a").addClass("operate-disable");
                    }
                }else if(text === "下一页"){//如果是点击的下一页
                    if(crp < tp){
                        currentPage++;
                        console.log("currentPage");
                        console.log(currentPage);
                    }else{
//                        alert("已经是最后一页");
                       // $('#pageupdown').children("li").eq(0).children("a").removeClass("operate-disable");
                       // $('#pageupdown').children("li").eq(tp+1).children("a").addClass("operate-disable");
                    }
                }else{
                    currentPage = parseInt(text);//将获取的页数转化成数字
                }
                loadData();



            });
        }



        function getIndex(pagearr,cp) {
            var index = 0;
            for (var i = 0 ; i < pagearr.length; i++){
                if(pagearr[i] === cp ){
                    index = i;
                }
            }
            return index;
        }
        function timeStamp(searchTime) {
            var newTime = new Date(searchTime);
            Date.prototype.toLocaleString = function() {
                return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
            };
            return newTime.toLocaleString();
        }


        //        function logdataajax(pageCode) {
        //            $.ajax({
        //                type:"GET",
        //                url:"/log/searchLog",
        //                dataType:"json",
        //                data:{pageCode:pageCode},
        //                success:function (res) {
        //                    var mylog = res.data.datas;
        //                    var newTime;
        //                    var stringTime;
        //                    $('#operatelog-tbody').html("");
        //                    $('#operatelog-tbody').append("<tr>"+
        //                        "<td>日志ID</td>" + "<td class=\"row\">" + "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">用户ID </span>" +
        //                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">用户姓名 </span>" +
        //                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">查询时间 </span>" +
        //                        "</td>" +
        //                        "<td class=\"row\">" +
        //                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">手机号码</span>" +
        //                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">描述</span>" +
        //                        "<span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">涉案类型</span>" +
        //                        "</td>" +
        //                        "</tr>");
        //                    for(var i = 0 ;i < mylog.length; i++){
        //                        newTime = new Date(mylog[i].searchTime);
        //                        Date.prototype.toLocaleString = function() {
        //                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
        //                        };
        //                        stringTime = newTime.toLocaleString();
        //
        //                        $('#operatelog-tbody').append("<tr>" +
        //                            "<td >"+mylog[i].id+"</td>" +
        //                            "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-userid\">"+mylog[i].userId+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-username\">"+mylog[i].userNickname+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-querytime\">"+stringTime+"</span></td>" +
        //                            "<td class=\"row\"><span class=\"col-lg-4 col-md-4 col-xs-4 operate-tele\">"+mylog[i].targetPhone+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-descrip\">"+mylog[i].personType+"</span><span class=\"col-lg-4 col-md-4 col-xs-4 operate-type\">"+mylog[i].searchType+"</span></td>" +
        //                            "</tr>");
        //                    }
        //
        //                },
        //                error:function() {
        //                    console.log("获取基本信息失败,请联系管理员");
        //                }
        //            })
        //        }





    </script>

</body>
</html>

