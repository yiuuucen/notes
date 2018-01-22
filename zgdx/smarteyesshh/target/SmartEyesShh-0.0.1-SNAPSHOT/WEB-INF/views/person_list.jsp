<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>目标人员管理</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style3.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script>
        $(function(){
            /*$('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });*/
            $(".btnSearch").click(function(){
                //检索条件执行

                //跳转到搜索结果页
                //window.location.href="重点人员-搜索结果列表.html";
            });


        })
    </script>
</head>
<body>
<div class="container-fluid smartEyes-container mag-jilu">

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-xs-12 clearfix smartEyes">
            <div class="logo ">
                <img src="${img}/logo.png">
                <div class="my_dropdown">
                    <select name="" id="">
                        <option value="test1" selected>配置</option>
                        <option value="test2">用户操作日志</option>
                        <option value="test3">目标人员管理</option>
                        <option value="test3">系统权限管理</option>
                    </select>
                </div>
                <img src="${img}/magreturn.png" alt="">
            </div>

            <div class="hr clearfix"></div>
            <div class="hr clearfix"></div>
        </div>

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
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
                </div>
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>
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
<footer><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
<script>
    $(function(){
        $.ajax({
            type:"get",
            url:"/target/searchTarget",
            dataType:"json",
            data:{"pageCode":1},
            success:function (msg) {
                console.log(msg);
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
