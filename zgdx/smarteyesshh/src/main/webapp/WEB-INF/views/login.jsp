<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style3.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
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
                        <div>
                            <img src="${img}/logcapt.png" alt="">
                            <input type="text" placeholder="请输入验证码">
                            <p>获取短信验证码</p>
                            <a href="findpwd.jsp">忘记密码</a>
                        </div>
                        <input type="submit" value="登录">
                    </div>
            </div>
        </div>
    </div>

    </div>
    <!--底部-->
    <footer style="position: relative;"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>

    <script>
        $(function(){
            $("input[type='submit']").click(function(){
                var tel=$("input[name='username']").val();
                var pwd=$("input[name='password']").val();

                // if(!(/^1\d{10}$/.test(tel))){
                //      alert('您输入的号码有误');
                // }

                $.ajax({
                    type: "post",
                    url: "/user/login",
                    data: {"username":tel,"password":pwd},
                    dataType: "json",
                    async: true,
                    success: function(data){
                        if(!data.status) {
                            console.log(data.res)
                        }else{
                            window.location.href = 'search';
                        }
                    },
                    error:function(err) {
                        console.log("ajax失败");
                    }
                });
            })
        });
    </script>
</body>
</html>