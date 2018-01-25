<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>系统权限管理</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style2.css" />
    <link rel="stylesheet" href="${css}/style4.css" />
    <%--<link rel="stylesheet" href="${css}/style5.css" />--%>
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
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
        <%--&lt;%&ndash;<div class="col-lg-5 col-md-5 col-xs-5">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<ul class="nav nav-pills navList" id="navList">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<li role="presentation" class=""><a href="${ctx}/overview?targetPhone=${targetPhone}"><i><img id="img1" src="${img}/u-03.png"></i>概览</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<li role="presentation" class=""><a href="${ctx}/contact?targetPhone=${targetPhone}"><i><img id="img2" src="${img}/u-04.png"></i>联系人列表</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<li role="presentation" class=""><a href="${ctx}/region?targetPhone=${targetPhone}"><i><img  id="img3" src="${img}/u-05.png"></i>区域与轨迹</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<!--<li role="presentation" class=""><a href="帐号.html"><i></i>帐号</a></li>-->&ndash;%&gt;--%>
            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
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
                <%--<option value="configure" selected=''>&nbsp;配置</option>--%>
                <%--<option value="userOperateLog">&nbsp;用户操作日志</option>--%>
                <%--<option value="targetPersonManage">&nbsp;目标人员管理</option>--%>
                <%--<option value="systemRightManage">&nbsp;系统权限管理</option>--%>
            <%--</select>--%>
        <%--</div>--%>
    <%--</header>--%>

    <div class="sysmg-pannel">
        <ul>
            <li>
                <a class="sysmg-b active" href="${ctx}/permission">
                    <span class="sysmg-icon sysmg-icon1 "></span>
                    <p>用户管理</p>
                </a>
                <p class="holdarea">

                </p>
            </li>

            <li>
                <a class="sysmg-b" href="${ctx}/account">
                    <span class="sysmg-icon sysmg-icon2"></span>
                    <p>账号设置</p>
                </a>
            </li>
        </ul>
    </div>

    <div class="row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
        </div>

        <!--操作表单-->
        <div class="col-lg-12 col-md-12 col-xs-12 sysmg-box">
            <!--图表展示列表-->
            <div class="sysmg-rbox " >
                <table class="sysmg-table1" >
                    <tbody>
                    <tr class="sysmg-tr1">
                        <td>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <button class="mybtn" >添加用户</button>
                                        <%--<button class="mybtn">批量添加用户</button>--%>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <!--第二行内容-->
                    <tr class="sysmg-tr2">
                        <td class="table-responsive ">
                            <table class="table table-bordered tr2-table">
                                <thead>
                                <tr class="row">
                                    <th class="col-lg-2 col-md-2 col-xs-2">序号</th>
                                    <th class="col-lg-2 col-md-2 col-xs-2">用户ID</th>
                                    <th class="col-lg-2 col-md-2 col-xs-2">用户姓名</th>
                                    <th class="col-lg-2 col-md-2 col-xs-2">用户手机号</th>
                                    <th class="col-lg-2 col-md-2 col-xs-2">密码</th>
                                    <th class="col-lg-2 col-md-2 col-xs-2">操作</th>
                                </tr>
                                </thead>
                                <tbody class="container" id="sysmg-content">
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class="mybtn2">修改</button></span>--%>
                                        <%--<span><button class="mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class="mybtn2">修改</button></span>--%>
                                        <%--<span><button class="mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class="mybtn2">修改</button></span>--%>
                                        <%--<span><button class="mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">201229</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">00000123 </td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">张三</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">135****1111</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">******</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                        <%--<span><button class=" mybtn2">修改</button></span>--%>
                                        <%--<span><button class=" mybtn2">禁用</button></span>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>

                                </tbody>
                            </table>
                        </td>

                    </tr>
                    <!--第三行分页按钮-->
                    <tr class="sysmg-tr3">
                        <td>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul class="sysmg-pageTitleCell" id="sysmg-pageupdown">
                                            <%--<li class="fl"><a class="sysmg-pagechange sysmg-pageprev">上一页</a></li>--%>
                                            <%--<li class="fl"><a class="active">1</a></li>--%>
                                            <%--<li class="fl"><a >2</a></li>--%>
                                            <%--<li class="fl"><a >3</a></li>--%>
                                            <%--<li class="fl"><a >4</a></li>--%>
                                            <%--<li class="fl"><a class="sysmg-pagechange sysmg-pagenext">下一页</a></li>--%>
                                        </ul>


                                    </td>

                                </tr>

                                </tbody>

                            </table>
                        </td>

                    </tr>

                    </tbody>

                </table>
                <div class = "sysmg-adduser" style="display: none">
                        <%--<form>--%>
                            <div class="item">
                                <span class="label">姓名 : </span>
                                <input type="text" name="adduser1" class="fl"/>
                            </div>
                            <div class="item">
                                <span class="label">手机号 :  </span>
                                <input type="text" name="adduser2" class="fl"/>
                            </div>
                            <div class="item">
                                <span class="label">密码 :</span>
                                <input type="text" name="adduser3" class="fl" />
                            </div>

                            <input type="submit" value="确认添加" class="sysmg-subBtn" />
                        <%--</form>--%>
                </div>

            </div>

        </div>
    </div>
    <!--底部-->
        <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <%--<footer style="position: fixed; bottom:0px"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>--%>
    <script>
        $(function () {
            var ut = $("#userType").val();

            if(ut === "1"){
               $(".smartEyes-container").css("display","none");
                window.location.href="${ctx}/account";
            }

            console.log("permission is ut");
            console.log(ut);

            //动态获取阴影高度
            var h= $(window).height();
            $(".sysmg-rbox").height(h-226);
            //pannel高度
            $(".sysmg-pannel").height(h-120);

            $(window).resize(function(){
                var h= $(window).height();
                $(".sysmg-rbox").height(h-226);
                $(".sysmg-pannel").height(h-120);
            });
            //设置选中
            $(".myselect").children("option").removeAttr("selected");
            $(".myselect").children("option[value='systemRightManage']").attr("selected",true);
        })

        //change事件
        <%--function operateManage(value) {--%>

            <%--switch(value){--%>
                <%--case "configure":--%>
                <%--&lt;%&ndash;window.location.href="${ctx}/system";&ndash;%&gt;--%>
                    <%--break;--%>
                <%--case "userOperateLog":--%>
                    <%--window.location.href="${ctx}/system";--%>
                    <%--break;--%>
                <%--case "targetPersonManage":--%>
                    <%--window.location.href="${ctx}/person";--%>
                    <%--break;--%>
                <%--case "systemRightManage":--%>
                    <%--window.location.href="${ctx}/permission";--%>
                    <%--break;--%>

            <%--}--%>

        <%--}--%>
        //一些操作
        function initoperate(){
            changebtnEvent();
            adduserEvent();
            //添加用户点击事件
            function adduserEvent() {
                var newuser = [];

                $(".mybtn").click(
                    function () {
                        $(".sysmg-table1").css("display","none");
                        $(".sysmg-adduser").css("display","block");
                        $(".sysmg-subBtn").unbind().click(
                            function () {
                                var newstatus = 1;
                                for(var i= 0;i < 3; i++){
                                    var mystring = "adduser"+(i+1);
                                    newuser[i] = $(".sysmg-adduser").find("input[name='"+mystring+"']").val();
                                    if(newuser[i]===""){
                                        newstatus = 0;
                                        alert("添加内容不能为空");
                                        break;
                                    }
                                }
                                var phoneReg = /[1][3-8]{1}\d{9}($|[^0-9]{1})/;
                                if(!phoneReg.test(newuser[1])){
                                    newstatus = 0;
                                    alert("您输入的号码有误。");
                                }
                                console.log(newuser);
                                if(newstatus===1){
                                    $.ajax({
                                        type:"GET",
                                        url:"user/addUser",
                                        dataType:"json",
                                        data:{"usernick":newuser[0],"username":newuser[1],"password":newuser[2]},
                                        success:function (res) {
                                            if(res.result===1){
                                                alert("添加成功");
//                                            $(".sysmg-table1").css("display","inline-table");
//                                            $(".sysmg-adduser").css("display","none");
                                                window.location.reload();//刷新当前页面.

                                            }else{
                                                alert("当前账号已存在不能添加");
                                                console.log(res);
                                            }
                                        },error:function () {
                                            console.log("添加提交错误");
                                        }

                                    })
                                }else {}


                            }
                        );
                    }
                );

            }

            // 重置按钮点击事件
            function changebtnEvent() {
                var myinput = [];
                var myinput2 = [];
                //0为没点击
                var changestatus = 0;
                $(".mybtn2").click(
                    function () {
                        var mytxt = this.innerHTML;
                        var inputuserid = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();
                        if(mytxt ==="重置"){
                            if(changestatus === 0){
                                this.innerHTML="完成";
                                $(this).parent("span").parent("td").parent("tr").children('.sysmg-hidetd').css("display","none");
                                $(this).parent("span").parent("td").parent("tr").children('.sysmg-hideinput').css("display","table-cell");
                                for(var j = 0;j < 3;j++){
                                    //为什么不行
//                               myinput[i] = $(this).parent("span").parent("td").parent("tr").children("input").eq(i).val();
                                    var mystring2 = "sysmgdata"+(j+1);
                                    myinput2[j] = $(this).parent("span").parent("td").parent("tr").find("input[name='"+mystring2+"']").val();
                                    console.log("myinput2[j]");
                                    console.log(myinput2[j]);
                                }
                                changestatus = 1;
//                           myinput[3] = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();
                            }else {
                                alert("有未完成修改的记录");
                            }

                        }else if(mytxt ==="完成"){

                            this.innerHTML="重置";
                            changestatus = 0;

                            //点击完成时获取它的值
                            //获取输入框的值
//                            for(var j = 0;j < 3;j++){
//                                //为什么不行
////                               myinput[i] = $(this).parent("span").parent("td").parent("tr").children("input").eq(i).val();
//                                var mystring2 = "sysmgdata"+(j+1);
//                                myinput2[j] = $(this).parent("span").parent("td").parent("tr").find("input[name='"+mystring2+"']").val();
//                                console.log("myinput2[j]");
//                                console.log(myinput2[j]);
//                            }
                            for(var i = 0;i < 3;i++){
                                //为什么不行
//                                myinput[i] = $(this).parent("span").parent("td").parent("tr").children("input").eq(i).val();
                                var mystring = "sysmgdata"+(i+1);
                                myinput[i] = $(this).parent("span").parent("td").parent("tr").find("input[name='"+mystring+"']").val();

                            }
                            //userId
//                            inputuserid = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();

                            //把文字显示出来

                            $(this).parent("span").parent("td").parent("tr").find(".sysmg-hidetd").eq(0).text(""+myinput[0]);
                            $(this).parent("span").parent("td").parent("tr").find(".sysmg-hidetd").eq(1).text((myinput[1].substr(0,3)+"****"+myinput[1].substr(7)));
                            $(this).parent("span").parent("td").parent("tr").find(".sysmg-hidetd").eq(2).text("********");

                            $(this).parent("span").parent("td").parent("tr").children('.sysmg-hideinput').css("display","none");
                            $(this).parent("span").parent("td").parent("tr").children('.sysmg-hidetd').css("display","table-cell");
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
                                console.log("parajson");
                                console.log(paraarr);
                                console.log(paraarr.userId);

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

                    }
                );

            }

        }



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
                url:"/user/searchUser",
                dataType:"json",
                data:{"pageCode":currentPage},
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
            $('#sysmg-content').html("");

            for(var i = 0 ;i < arr.length; i++){
                var status;
                if(arr[i].status=== 1){
                    //当前状态为1，为启用状态，提示禁用按钮
                    status = "禁用";
                }else {
                    status = "启用";
                }
                var omitusername = arr[i].username.substr(0,3)+"****"+arr[i].username.substr(7);
                $('#sysmg-content').append("<tr class=\"row\">" +
                    "<td class=\"col-lg-2 col-md-2 col-xs-2\">"+((currentPage-1)*10+1+i)+"</td>" +
                    "<td class=\"col-lg-2 col-md-2 col-xs-2\">"+arr[i].id+"</td>" +
                    "<td class=\"col-lg-2 col-md-2 col-xs-2  sysmg-hidetd \">"+arr[i].nickname+"</td>" +
                    "<td class=\"col-lg-2 col-md-2 col-xs-2 sysmg-hidetd\">"+omitusername+"</td>" +
                    "<td class=\"col-lg-2 col-md-2 col-xs-2 sysmg-hidetd\">"+"********"+"</td>" +
                    "<td class=\"col-lg-2 col-md-2 col-xs-2 sysmg-hideinput \">"+
                    "<input  type=\"text\" class=\"sysmgdata\"  name=\"sysmgdata1\" value=\""+(arr[i].nickname)+"\"/>"+
                    "</td>"+
                    "<td class=\"col-lg-2 col-md-2 col-xs-2 sysmg-hideinput\">"+
                    "<input type=\"text\" class=\"sysmgdata\"  name=\"sysmgdata2\" value=\""+(arr[i].username)+"\"/>"+
                    "</td>"+
                    "<td class=\"col-lg-2 col-md-2 col-xs-2 sysmg-hideinput\">"+
                    "<input type=\"text\" class=\"sysmgdata\"  name=\"sysmgdata3\" value=\""+(arr[i].password)+"\"/>"+
                    "</td>"+
                    "<td class=\"col-lg-2 col-md-2 col-xs-2\">" +
                    "<span><button class=\"mybtn2\">重置</button></span>" +
                    "<span><button class=\"mybtn2\">"+status+"</button></span>" +
                    "</td>" +
                    "</tr>");
            }
            initoperate();


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
            $('#sysmg-pageupdown').html("");
            var _html = "";

            $('#sysmg-pageupdown').append("<li class=\"fl\" ><a class=\"operate-pagechange operate-pageprev\">上一页</a></li>");

            for(var i = 0; i < pagearr.length;i++){
                _html += "<li class=\"fl\"><a >"+ pagearr[i]+"</a></li>";
            }
            $('#sysmg-pageupdown').append(_html);

            //下一页
            $('#sysmg-pageupdown').append("<li class=\"fl\" ><a class=\"operate-pagechange operate-pagenext\">下一页</a></li>");

            //激活当前页。
            var index = getIndex(pagearr,cp);
            console.log(index);
            console.log(cp);
            $('#sysmg-pageupdown').children("li").eq(index+1).children("a").addClass("active");

            //文字总页数pageAll

            $('.operate-text').html("共"+pageall+"页");
            //总页数为1，上下都禁用。
            if(pageall===1){

                $('#sysmg-pageupdown').children("li").eq(0).children("a").addClass("sysmg-disable");
                $('#sysmg-pageupdown li:last-child').children("a").addClass("sysmg-disable");

            }else {
                //如果为1上一页禁用
                if(cp === 1){
                    console.log("cp1");
                    console.log(cp);
                    $('#sysmg-pageupdown li:last-child').children("a").removeClass("sysmg-disable");
                    $('#sysmg-pageupdown').children("li").eq(0).children("a").addClass("sysmg-disable");
                }
                //如果为总页数下一页禁用
                else if(cp === pageall){
                    console.log("cp2");
                    console.log(cp);
                    $('#sysmg-pageupdown').children("li").eq(0).children("a").removeClass("sysmg-disable");
                    $('#sysmg-pageupdown li:last-child').children("a").addClass("sysmg-disable");

                }else {}
            }




            //成功了调用切换tab函数
//            tab("#pageupdown",tp);

        }
        //        clickEvent(currentPage,totalpage);
        //点击事件
        function clickEvent(crp,tp){
            $('#sysmg-pageupdown').children("li").click(function(){
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










    </script>

</body>
</html>

