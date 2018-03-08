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
<div class="container-fluid smartEyes-container log-fail">

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-xs-12 clearfix smartEyes">
            <div class="logo "><img src="${img}/logo.png"></div>

            <div class="hr clearfix"></div>
        </div>

    </div>

    <div class="search clearfix">
        <div class="findpwd">
            <div class="top clearfix">
                <div>找回密码</div>
                <a href="login.jsp">
                    <img src="${img}/logfail.png" alt="">
                    <span>返回登录</span>
                </a>
            </div>
            <div class="bottom clearfix">
                <div class="msg">
                    <div>
                        <p>手机号:</p>
                        <div>*******6888</div>
                    </div>
                    <div>
                        <p>验证码:</p>
                        <div>
                            <input type="text">
                            <span>获取验证码</span>
                        </div>
                    </div>
                    <div>
                        <p>新的登录密码:</p>
                        <div>
                            <input type="password">
                        </div>
                    </div>
                    <div>
                        <p>确认新的登录密码:</p>
                        <div>
                            <input type="password">
                        </div>
                    </div>
                    <div>
                        <p></p>
                        <div id="queding">
                            确定
                        </div>
                    </div>
                </div>
                <div class="change" style="display: none">
                    <p>设置成功！请牢记新的登录密码。</p>
                    <a href="login.jsp">重新登录</a>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<!--底部-->
    <jsp:include page="/WEB-INF/common/footer.jsp"/>

<script>
    $(function(){
        $('#queding').click(function(){
            $('.msg').css('display','none');
            $('.change').css('display','block');
        })
    })
</script>
</body>
</html>