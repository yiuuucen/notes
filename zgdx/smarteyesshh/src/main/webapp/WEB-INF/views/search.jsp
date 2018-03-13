<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <input type="hidden" value="${userType}" id="userType"/>
    <title>搜索</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <%--<link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />--%>
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <%--<script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>--%>
    <%--<script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>--%>
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
                <div class="logo pull-left"><a href="${ctx}/search"></a><img src="${img}/logo.png" style="margin-top: 20px;"></a></div>
                <div class="textBox pull-left">
                    <form action="${ctx}/overview">
                        <input type="text" class="text"  name="targetPhone" />
                        <button type="button" disabled style="outline:none;" class="btn btnSubmit pull-right"></button>
                        <div style="width: 3px;height: 90%;background: #2f3242;float: right;margin-top: 2.25px;"></div>
                        <button type="button" style="outline:none;" class="btn btnSearch pull-right"></button>
                    </form>
                </div>
                <%--<div class="col-lg-1 col-md-1 col-xs-1 fr" style="margin-top: 42px">--%>
                    <%--<a href="${ctx}/login"><img src="${img}/u03.png"></a>--%>
                <%--</div>--%>
                <%--<div class="col-lg-1 col-md-1 col-xs-1 pull-right text-right input-group fr" style="margin-top: 52px">--%>
                    <%--<select class="pull-right select myselect" onchange="operateManage(this.options[this.options.selectedIndex].value)">--%>
                        <%--<option value="configure" selected="">&nbsp;配置</option>--%>
                        <%--<option value="userOperateLog" >&nbsp;用户操作日志</option>--%>
                        <%--<option value="targetPersonManage" >&nbsp;目标人员管理</option>--%>
                        <%--<option value="systemRightManage" >&nbsp;系统权限管理</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <div class="fr geren">
                    <img src="${img}/S_geren.png">
                    <div style="visibility: hidden">
                        <a href="${ctx}/account">账户设置</a>
                        <a href="${ctx}/user/logout">退出账户</a>
                    </div>
                </div>
                <div class="fr peizhi">
                    <img src="${img}/S_peizhi.png">
                    <div style="visibility: hidden">
                        <a href="${ctx}/system">目标人员管理</a>
                        <a href="${ctx}/person">用户操作日志</a>
                        <a href="${ctx}/permission">系统权限管理</a>
                    </div>
                </div>

            </div>
        </div>
        <div class="search">
        </div>

    </div>
    <div class="S_tanchuang">
        <%--search页的提交框--%>
        <div class="submit_btn" style="display: none;">
            <div class="submit_box">
                <div class="box_top">
                    <span>提交查询号码</span>
                    <img src="/static/img/magclose.png" alt="">
                </div>
                <div class="box_bottom clearfix">
                    <div class="msg">
                        <div>
                            <p>查询目标手机号码:</p>
                            <div>
                                <input type="text" name="tel">

                            </div>
                        </div>
                        <div>
                            <p>查询目标描述:</p>
                            <div>
                                <select name="" id="miaoshu">
                                    <option value="" selected></option>
                                    <option value="重点人员">重点人员</option>
                                    <option value="一般人员">一般人员</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <p>查询目标标签:</p>
                            <div>
                                <select name="" id="biaoqian">
                                    <option value="" selected></option>
                                    <option value="涉毒">涉毒</option>
                                    <option value="盗窃">盗窃</option>
                                    <option value="强奸">强奸</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <div class="queding">
                                确认提交
                            </div>
                            <div class="quxiao">
                                取消
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--</div>--%>
    <!--底部-->
    <footer style="position: fixed; background: url(${img}/b01.png) 100% top no-repeat #3a3e52;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>

</body>
</html>
<script>
    var ut = $("#userType").val();

    if(ut!=0){
        $(".peizhi>div>a:last-child").remove();
    }
    $(".peizhi img").click(function(){
        if($(".peizhi div").css("visibility")=="hidden"){
            $(".peizhi div").css("visibility","visible");
            $(".geren div").css("visibility","hidden");
        }else{
            $(".peizhi div").css("visibility","hidden");
        }
    });
    $(".geren img").click(function(){
        if($(".geren div").css("visibility")=="hidden"){
            $(".geren div").css("visibility","visible");
            $(".peizhi div").css("visibility","hidden");
        }else{
            $(".geren div").css("visibility","hidden");
        }
    });

    $(function(){
        $(".btnSearch").click(function(){

            //检索条件执行
            var inputval =$("input[name='targetPhone']").val();
            if(inputval.length==11) {
                inputval = "86" + inputval;
            }
            if(inputval ===""){
                alert("请输入查询ID！");
            }else if(!/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(inputval)){
                alert("请输入正确的查询号！");
            }else{
                $.ajax({
                    type: "post",
                    url: "/phoneExist",
                    data: {"targetPhone":inputval},
                    dataType: "json",
                    async: true,
                    success: function(mes){
                        if(mes.res==true){
                            //跳转到搜索结果页
                            //window.location.href="重点人员-搜索结果列表.html";
                            window.location.href="/overview?targetPhone="+inputval;
                        }else{
                            alert("该号码不存在，请提交！");
                            $(".btnSubmit").removeAttr("disabled");
                            $(".btnSubmit").click(function (){
                                $(".submit_btn").css("display","block");
                                $("input[name='tel']").val(inputval);
                                $(".queding").click(function () {
                                    var loadPhone=$("input[name='tel']").val();
                                    var personType=$("#miaoshu option:selected").text();
                                    var searchType=$("#biaoqian option:selected").text();
                                    if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(loadPhone))||personType==""||searchType==""){
                                        alert("请完善信息!")
                                    }else{
                                        if(loadPhone.length==11) {
                                            loadPhone = "86" + loadPhone;
                                        }
                                        $.ajax({
                                            type:"get",
                                            url:"/target/insertTarget",
                                            dataType:"json",
                                            data:{"loadPhone":loadPhone,"personType":personType,"searchType":searchType},
                                            success:function () {
                                                window.location.href="${ctx}/personlist"
                                            },
                                            error:function () {
                                                console.log("数据错误")
                                            }
                                        })
                                    }

                                });
                            });
                        }
                    },
                    error:function(err) {

                    }
                });
            }
        });

        var h= $(window).height();
        $(".search").height(h-130);

        //  弹窗取消
        $(".box_top img").click(function(){
            $(".submit_btn").css("display","none");
        })
        $(".quxiao").click(function(){
            $(".submit_btn").css("display","none");
        })
    });
</script>


