<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>查询记录</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style3.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
</head>
<body>
<div class="container-fluid smartEyes-container mag-jilu">
    <jsp:include page="/WEB-INF/common/head.jsp"/>
    <div class="row clearfix">
        <div class="hr clearfix"></div>
        <div class="hr clearfix"></div>
    </div>

    <div class="jilu clearfix">
        <h3>查询信息</h3>
        <div class="mytable">
            <div class="tabhead row">
                <span class="col-lg-6 col-md-6 col-xs-6">猎犬用户信息</span>
                <span class="col-lg-4 col-md-4 col-xs-4">查询目标人员信息</span>
                <span class="col-lg-2 col-md-2 col-xs-2">查询记录信息</span>
            </div>
            <div class="tabcont row">
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">序号</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">用户ID</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">用户姓名</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">提交时间</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">手机号码</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">描述</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉案类型</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">查询状态</span>
                </div>
                <div class="xinxi">
                    <%--<div class="lie clearfix" >--%>
                        <%--<span class="col-lg-1 col-md-1 col-xs-1">20171229</span>--%>
                        <%--<span class="col-lg-1 col-md-1 col-xs-1">00000123</span>--%>
                        <%--<span class="col-lg-1 col-md-1 col-xs-1">张三</span>--%>
                        <%--<span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>--%>
                        <%--<span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>--%>
                        <%--<span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>--%>
                        <%--<span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>--%>
                        <%--<span class="col-lg-2 col-md-2 col-xs-2">已提交</span>--%>
                    <%--</div>--%>
                </div>
            </div>
            <div class="tabbtn">
                <nav>
                    <ul class="pagination">
                        <li>
                            <a class="prev">
                                上一页
                            </a>
                        </li>
                        <li><a class="active">1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                        <li><a>4</a></li>
                        <li><a>5</a></li>
                        <li><a>...</a></li>
                        <li>
                            <a class="next">
                                下一页
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!--底部-->
<footer style="position: relative;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
<script>
    $(function(){
        $.ajax({
            type:"get",
            url:"/target/searchTarget",
            dataType:"json",
            data:{"pageCode":1},
            success:function (res) {
                // console.log(res.result);
                // console.log(res.result.datas[3]);
                // console.log(res.result.totalPage);
                for(let i=0;i<res.result.datas.length;i++){
                    var html=`<div class="lie clearfix" >
                        <span class="col-lg-1 col-md-1 col-xs-1">${res.result.datas[i].id}</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">${res.result.datas[i].userId}</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">${res.result.datas[i].userNick}</span>
                        <span class="col-lg-3 col-md-3 col-xs-3">${res.result.datas[i].creatTime}</span>
                        <span class="col-lg-2 col-md-2 col-xs-2">${res.result.datas[i].targetPhone}</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">${res.result.datas[i].personType}</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">${res.result.datas[i].searchType}</span>
                        <span class="col-lg-2 col-md-2 col-xs-2">${res.result.datas[i].status}</span>
                    </div>`;
                }
                $(".xinxi .lie").append(html);
            },
            error:function () {
                // $(".mag .submit_fail").css('display','block');
                console.log("数据错误")
            }
        })
    })
</script>
</body>
</html>
