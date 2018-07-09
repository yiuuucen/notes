<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<aside class="main-sidebar">
    <input type="hidden" value="${userType}" id="userType"/>
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <input type="hidden" value="${suspectType}" id="suspectType"/>
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height: auto;">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel" style="background:#262739;">
            <div class="pull-left image" style="opacity: 0;">
                <img src="${cenimg}/user2-160x160.jpg" class="img-circle" alt="用户图像">
            </div>
            <div class="pull-left info" style="left: 0;">
                <p>${sessionScope.session_current_user.nicknameDecrypt}</p>
                <!-- Status -->
                <a href="${ctx}/account?targetPhone=${targetPhone}"><i class="fa fa-circle text-success" style="color: #5866e6"></i>账号设置</a>
                <%--<a href="${ctx}/user/logout"><i class="fa fa-circle text-danger"></i>退出</a>--%>
            </div>
        </div>

        <!-- search form (Optional) -->
        <div class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="输入目标人员手机号..." style="background: #3c3f5b">
                <span class="input-group-btn">
                    <button type="submit" name="search"  class="btn btn-flat search" style="background: #3c3f5b"><i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </div>
        <!-- /.search form -->
        <!-- Sidebar Menu -->
        <%--在dom结构上判断，在某些情况下显示的内容，这样页面刷新比生成结构用js去除更好--%>
        <c:choose>
            <c:when test="${not empty targetPhone }">
                <ul class="sidebar-menu xq">
                    <li class="header">功能</li>
                    <!-- Optionally, you can add icons to the links -->
                    <li class="pg1"><a href="${ctx}/overview?targetPhone=${targetPhone}"><img src="${cenimgnew}/1.1.png" alt="" style="width: 18px;margin: 0 10px 0 0;"><span>概览</span></a></li>
                    <li class="pg2"><a href="${ctx}/contact?targetPhone=${targetPhone}"><img src="${cenimgnew}/2.1.png" alt="" style="width: 18px;margin: 0 10px 0 0;"><span>联系人列表</span></a></li>
                    <li class="treeview pg3">
                        <a href="#"><img src="${cenimgnew}/3.1.png" alt="" style="width: 18px;margin: 0 10px 0 0;"><span>区域与轨迹</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="data1"><a href="${ctx}/region?mydata=1&targetPhone=${targetPhone}">热力图</a></li>
                            <li class="data2"><a href="${ctx}/region?mydata=2&targetPhone=${targetPhone}">活动区域</a></li>
                            <li class="data3"><a href="${ctx}/region?mydata=3&targetPhone=${targetPhone}">活动轨迹</a></lic>
                        </ul>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
        <!-- /.sidebar-menu -->
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">操作</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="pg4">
                <a href="${ctx}/personlist?targetPhone=${targetPhone}">
                    <%--<i class="fa fa-link"></i>--%>
                    <img src="${cenimgnew}/4.1.png" alt="" style="width: 18px;margin: 0 10px 0 0;"><span>目标人员管理</span>
                </a>
            </li>
            <li class="pg5"><a href="${ctx}/system?targetPhone=${targetPhone}"><img src="${cenimgnew}/5.1.png" alt="" style="width: 18px;margin: 0 10px 0 0;"><span>用户操作日志</span></a></li>
            <c:choose>
                <c:when test="${userType == 0}">
                    <li class="manage pg6">
                        <a href="${ctx}/permission?targetPhone=${targetPhone}"><img src="${cenimgnew}/6.1.png" alt="" style="width: 18px;margin: 0 10px 0 0;"><span>系统权限管理</span></a>
                    </li>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>

        </ul>
        <!-- /.sidebar-menu -->

    </section>
    <!-- /.sidebar -->
</aside>
<%--弹窗组件--%>
<div class="popup"></div>

<script>
    var ut = $("#userType").val();
    var tel = $("#targetPhone").val();

    $(document).keyup(function (e) {//捕获文档对象的按键弹起事件
        if (e.keyCode == 13) {//按键信息对象以参数的形式传递进来了
            //此处编写用户敲回车后的代码
            var q2tel=$("input[name='q2']").val();
            if(q2tel){
                $(".search2").click();
            }else {
                $(".search").click();
            }
        }
    })

    $(".search").click(function(){
        //检索条件执行
        var inputval =$("input[name='q']").val();
        if(inputval.length==11) {
            inputval = "86" + inputval;
        }
        if(inputval ===""){
            $(".popup").text("请输入查询ID！").animate({top:0});
            setTimeout(function(){
                $(".popup").animate({top:"-40px"});
            },2000)
        }else if(!/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(inputval)){
            $(".popup").text("请输入正确的查询号！").animate({top:0});
            setTimeout(function(){
                $(".popup").animate({top:"-40px"});
            },2000)
        }else{
            $.ajax({
                type: "post",
                url: window.ctx+"/phoneExist",
                data: {"targetPhone":inputval},
                dataType: "json",
                async: true,
                success: function(mes){
                    if(mes.res==true){
                        //跳转到搜索结果页
                        //window.location.href="重点人员-搜索结果列表.html";
                        window.location.href="${ctx}/overview?targetPhone="+inputval;
                    }else{
                        $(".popup").text("该号码尚未入库，请先提交入库").animate({top:0});
                        setTimeout(function(){
                            $(".popup").animate({top:"-40px"});
                        },2000)
                    }
                },
                error:function(err) {

                }
            });
        }
    });
</script>