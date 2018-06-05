<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>搜索</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <%--<link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />--%>
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <%--<script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>--%>
    <%--<script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>--%>
    <script>
        $(function(){
//            $('input.datetimepicker').datetimepicker({
//                format: 'yyyy-mm-dd hh:ii',
//                language:'zh-CN'
//            });
            $(".btnSearch").click(function(){
                //检索条件执行
                var inputval =$("input[name='targetPhone']").val();
                if(inputval ===""){
                    alert("请输入查询ID！");
                }else{
                    this.form.submit();
                }

                //跳转到搜索结果页
                //window.location.href="重点人员-搜索结果列表.html";
            });
            var h= $(window).height();
            $(".search").height(h-130);
        });

    </script>
    <style>
        .smartEyes{
            height: 130px;
            background-color: #2f3242;
            box-shadow:15px 35px 35px rgba(37,41,56,0.8);
        }
        .search{
		        background: url(${img}/u-01.png) no-repeat center top;
		        background-size: 100%;
        }
        .select{
            min-width: 146px;
        }
        button{
            outline:none;
        }

    </style>




</head>
<body>

    <div class="container-fluid smartEyes-container">

        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-xs-12 clearfix smartEyes">
                <div class="logo pull-left"><img src="${img}/logo.png"style="margin-top: 20px;"></div>
                <div class="textBox pull-left">
                    <form action="${ctx}/overview">
                        <input type="text" class="text"  name="targetPhone" />
                        <button type="button" style="outline:none" class="btn btnSearch pull-right"></button>
                    </form>
                </div>

            </div>
        </div>
        <div class="search">

        </div>
    </div>

    <%--</div>--%>
    <!--底部-->
    <footer style="position: fixed; background: url(${img}/b01.png) 100% top no-repeat #3a3e52;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>

</body>
</html>

