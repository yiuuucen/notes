<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style3.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script>
        $(function(){
            var h= $(window).height();
            $(".search").height(h-130);
            h2=h/2-190;

            $(".log .logdiv").css("top", h2);
        })
    </script>
    <style>
        /*.log .logdiv .shuru>div:nth-child(1){
            position: relative;
        }
        .log .logdiv .shuru>div:nth-child(1) span{
            position: absolute;
            color: red;
            left: 66px;
            bottom: 0;
        }*/
        .log .logdiv .shuru>div:nth-child(1),
        .log .logdiv .shuru>div:nth-child(2){
            position: relative;
        }
        .log .logdiv .shuru>div:nth-child(1) span,
        .log .logdiv .shuru>div:nth-child(2) span{
            position: absolute;
            width: 200px;
            text-align: center;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            left:-242px;
            border: 1px solid #fff;
            background: rgba(255,255,255,0.15);
        }
        .log .logdiv .shuru>div:nth-child(1) span:after,
        .log .logdiv .shuru>div:nth-child(2) span:after{
            content: "";
            position: absolute;
            top: 15px;
            left: 199px;
            display: block;
            width: 13px;
            height: 16px;
            overflow: hidden;
            background: url("${img}/logicon.png") -64px 0 no-repeat;
            text-indent: -9999px;
        }
    </style>
</head>
<body>
    <div class="container-fluid smartEyes-container log">
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-xs-12 clearfix smartEyes">
                <div class="logo "><img src="${img}/logo.png"></div>
                <div class="hr clearfix"></div>
            </div>
        </div>
        <div class="search">
            <div class="logdiv">

                    <div class="shuru">
                        <div>
                            <img src="${img}/logtel.png" alt="">
                            <input type="text" autocomplete="off" placeholder="请输入手机号" name="username">
                        </div>
                        <div>
                            <img src="${img}/logpwd.png" alt="">
                            <input type="password" autocomplete="off" placeholder="请输入密码" name="password">
                        </div>
                        <div style="display: none">
                            <img src="${img}/logcapt.png" alt="">
                            <input type="text" placeholder="请输入验证码" name="verification">
                            <p id="idcode" onclick="sendMes()">获取短信验证码</p>
                            <a href="findpwd.jsp">忘记密码</a>
                        </div>
                        <input type="submit" value="登录">
                    </div>
            </div>
        </div>
    </div>

    </div>
    <!--底部-->
    <jsp:include page="/WEB-INF/common/footer.jsp"/>

    <script>



        $(function(){

            document.onkeydown=function(event){
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if(e && e.keyCode==13){ // enter 键
                    //要做的事情
                    //检索条件执行
                    var tel=$("input[name='username']").val();
                    var pwd=$("input[name='password']").val();

                    $.ajax({
                        type: "post",
                        url: window.ctx+"/user/login",
                        data: {"username":tel,"password":pwd},
                        dataType: "json",
                        async: true,
                        success: function(data){
                            if(!data.status) {
                                if(data.res.indexOf("该账号已被禁用！")>=0){
                                    $(".shuru>div:nth-child(1) span").remove();
                                    $(".shuru>div:nth-child(1)").append("<span>"+data.res+"</span>");
                                }else{
                                    $(".shuru>div:nth-child(2) span").remove();
                                    $(".shuru>div:nth-child(2)").append("<span>"+data.res+"</span>");

                                }
                            }else{
                                window.location.href = '${ctx}/personlist';
                            }
                        },
                        error:function(err) {
                            var tel=$("input[name='username']").val();
                            var pwd=$("input[name='password']").val();

                            if(tel==''){
                                $(".shuru>div:nth-child(1) span").remove();
                            }
                            if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(tel))){
                                $(".shuru>div:nth-child(1) span").remove();
                                $(".shuru>div:nth-child(1)").append("<span>您输入的号码有误!</span>");
                            }
                        }
                    });
                }
            };




            $("input[type='submit']").click(function(){
                var tel=$("input[name='username']").val();
                var pwd=$("input[name='password']").val();
                $.ajax({
                    type: "post",
                    url: window.ctx+"/user/login",
                    data: {"username":tel,"password":pwd},
                    dataType: "json",
                    async: true,
                    success: function(data){
                        if(!data.status) {
	                        if(data.res.indexOf("该账号已被禁用！")>=0){
                                $(".shuru>div:nth-child(1) span").remove();
	                        	$(".shuru>div:nth-child(1)").append("<span>"+data.res+"</span>");
	                        }else{
                                $(".shuru>div:nth-child(2) span").remove();
	                            $(".shuru>div:nth-child(2)").append("<span>"+data.res+"</span>");
	                        
	                        }
                        }else{
                            window.location.href = '${ctx}/personlist';
                        }
                    },
                    error:function(err) {
                        if(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(tel)){
                            $(".shuru>div:nth-child(1) span").remove();
                            $(".shuru>div:nth-child(1)").append("<span>您输入的号码不存在!</span>");
                        }
                    }
                });
            });
            $("input[name='username']").blur(function () {
                var tel=$("input[name='username']").val();
                var pwd=$("input[name='password']").val();
                if(tel==''){
                    $(".shuru>div:nth-child(1) span").remove();
                }
                if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(tel))){
                    $(".shuru>div:nth-child(1) span").remove();
                    $(".shuru>div:nth-child(1)").append("<span>您输入的号码有误!</span>");
                }
                $.ajax({
                    type: "post",
                    url: window.ctx+"/user/login",
                    data: {"username":tel,"password":pwd},
                    dataType: "json",
                    async: true,
                    success: function(){
                    },
                    error:function(err) {
                        if(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(tel)){
                            $(".shuru>div:nth-child(1) span").remove();
                            $(".shuru>div:nth-child(1)").append("<span>您输入的号码不存在!</span>");
                        }
                    }
                });
            });
            $("input[name='username']").focus(function () {
                $(".shuru>div:nth-child(1) span").remove();
                $(".shuru>div:nth-child(2) span").remove();
            });
            $("input[name='password']").focus(function () {
                $(".shuru>div:nth-child(2) span").remove();
            });
            $("input[name='verification']").focus(function () {
                $(".shuru>div:nth-child(2) span").remove();
            });
        });

        //验证码
        function sendMes() {
            var i=11;
            var timer;
            clearInterval(timer);
            timer=setInterval(function () {
                i--;
                $("#idcode").html(i+" 秒").css("font-size","22px");
                if(i==-1){
                    $("#idcode").html("再次获取验证码").css("color","rgba(255,255,255,0.5)").css("font-size","10px");
                    clearInterval(timer);
                }
                if($("#idcode").html().length>6){
                    $("#idcode").attr("onclick","sendMes()")
                }else{
                    $("#idcode").attr("onclick","")
                }
            },1000)
        }

    </script>
</body>
</html>