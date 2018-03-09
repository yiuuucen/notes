<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>账户设置</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
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
    <%--<input type="hidden" value="${userType}" id="userType"/>--%>
    <jsp:include page="/WEB-INF/common/head2.jsp"/>


    <div class="sysmg-pannel">
        <ul>
            <li class="sysmg-tbum">
                <a class="sysmg-b " href="${ctx}/permission">
                    <span class="sysmg-icon sysmg-icon1 "></span>
                    <p>用户管理</p>
                </a>
                <p class="holdarea">

                </p>
            </li>

            <li>
                <a class="sysmg-b active" href="${ctx}/account">
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
                <div class = "sysmg-getuser" >
                    <%--<form>--%>
                    <div class="item">
                        <span class="label">用户ID : </span>
                        <span class="content"></span>
                    </div>
                    <div class="item">
                        <span class="label">姓&nbsp;&nbsp;名 :  </span>
                        <span class="content"></span>
                    </div>
                    <div class="item">
                        <span class="label">手机号 :</span>
                        <span class="content"></span>
                    </div>

                    <input type="submit" value="修改密码" class="sysmg-cgpwBtn " />
                    <%--</form>--%>
                </div>
                <div class="sysmg-cp " style="display: none">
                    <%--<form>--%>
                    <div class="item">
                        <span class="label">当前登录密码 : </span>
                        <input type="text" name="cpuser1" class="fl"/>
                        <span class="label alabel"><a href="#">忘记密码?</a></span>
                    </div>
                    <div class="item">
                        <span class="label">新的登录密码 :  </span>
                        <input type="text" name="cpuser2" class="fl"/>
                    </div>
                    <div class="item">
                        <span class="label">确认新的登录密码 :</span>
                        <input type="text" name="cpuser3" class="fl" />
                    </div>

                    <input type="submit" value="确定" class="sysmg-cfBtn" />
                </div>
                <div class="sysmg-tips" style="display: none">
                    <p>设置成功！请牢记新的登录密码。</p>
                    <a href="${ctx}/user/logout">重新登录</a>
                </div>

            </div>

        </div>
    </div>
    <!--底部-->
    <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <%--<footer style="position: fixed; bottom:0px"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>--%>
    <script>
        var ut = $("#userType").val();
        if(ut==="0"){

        }else {
            $(".sysmg-tbum").css("display","none");
        }


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

        $(function(){
            getUser();

            changePw();

            function getUser() {
                $.ajax({
                    type: "GET",
                    url: "user/getUser",
                    dataType: "json",
//                data:{"usernick":newuser[0],"username":newuser[1],"password":newuser[2]},
                    success: function (res) {

                        $(".sysmg-getuser").find("span.content").eq(0).text("" + res.id);
                        $(".sysmg-getuser").find("span.content").eq(1).text("" + res.name);
                        $(".sysmg-getuser").find("span.content").eq(2).text("" + res.phone);


                    }, error: function () {
                        console.log("添加提交错误");
                    }

                })
            }

            function changePw() {
                var newpw = [];
                $(".sysmg-cgpwBtn").click(
                    function () {
                        $(".sysmg-getuser").css("display", "none");
                        $(".sysmg-cp").css("display", "block");
                        $(".sysmg-tips").css("display", "none");
                        //点击确定按钮
                        $(".sysmg-cfBtn").unbind().click(
                            function () {
                                for (var i = 0; i < 3; i++) {
                                    var mystring = "cpuser" + (i + 1);
                                    newpw[i] = $(".sysmg-cp").find("input[name='" + mystring + "']").val();
                                }
                                if(newpw[0]===""||newpw[1]===""||newpw[2]===""){
                                    alert("请您输入密码");
                                }else if(newpw[0]===newpw[1]){
                                    alert("新密码和原密码不能一致");
                                }else if(newpw[1]!==newpw[2]){
                                    alert("两次输入的密码不一致");
                                }else{
                                    $.ajax({
                                        type: "GET",
                                        url: "user/changePwd",
                                        dataType: "json",
                                        data: {"oldPwd": newpw[0], "newPwd": newpw[1]},
                                        success: function (res) {
                                            if (res.result === 1) {
                                                alert("修改密码成功");
                                            $(".sysmg-tips").css("display","block");
                                            $(".sysmg-cp").css("display","none");
                                            $(".sysmg-getuser").css("display","none");
//                                                window.location.reload();//刷新当前页面.
                                            } else {
                                                alert("您的原密码有误");
                                            }
                                        }, error: function () {
                                            console.log("修改密码提交错误");
                                        }

                                    })
                                }
                            }
                        );

                    })
            }
        })

       
       










    </script>

</body>
</html>

