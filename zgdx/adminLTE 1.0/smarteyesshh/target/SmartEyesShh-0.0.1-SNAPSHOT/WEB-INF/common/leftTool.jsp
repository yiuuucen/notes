<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<aside class="main-sidebar">
    <input type="hidden" value="${userType}" id="userType"/>
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height: auto;">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/smarteyesshh/static/dist/img/user2-160x160.jpg" class="img-circle" alt="用户图像">
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>
                <!-- Status -->
                <a href="${ctx}/user/logout"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <!-- search form (Optional) -->
        <div class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="输入目标人员手机号...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </div>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">操作</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>目标人员管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/smarteyesshh/personlist?targetPhone=${targetPhone}">提交查询号码</a></li>
                    <li><a href="#">批量提交查询号码</a></li>
                </ul>
            </li>
            <li><a href="/smarteyesshh/system?targetPhone=${targetPhone}"><i class="fa fa-link"></i> <span>用户操作日志</span></a></li>
            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>系统权限管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/smarteyesshh/permission?targetPhone=${targetPhone}">用户管理</a></li>
                    <li><a href="/smarteyesshh/account?targetPhone=${targetPhone}">账号设置</a></li>
                </ul>
            </li>

        </ul>
        <!-- /.sidebar-menu -->
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu xq">
            <li class="header">详情</li>
            <!-- Optionally, you can add icons to the links -->
            <li><a href="/smarteyesshh/overview?targetPhone=${targetPhone}"><i class="fa fa-link"></i> <span>概览</span></a></li>
            <li><a href="/smarteyesshh/contact?targetPhone=${targetPhone}"><i class="fa fa-link"></i> <span>联系人列表</span></a></li>
            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>区域与轨迹</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/smarteyesshh/region?mydata=1&targetPhone=${targetPhone}">热力图</a></li>
                    <li><a href="/smarteyesshh/region?mydata=2&targetPhone=${targetPhone}">活动区域</a></li>
                    <li><a href="/smarteyesshh/region?mydata=3&targetPhone=${targetPhone}">活动轨迹</a></li>
                </ul>
            </li>

        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>

<script>
    var ut = $("#userType").val();
    var tel = $("#targetPhone").val();
    if(!tel){
        $(".xq").remove()
    }
    $("#search").click(function(){

        //检索条件执行
        var inputval =$("input[name='q']").val();
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
                        alert("该号码不存在，请提交！");
                        // var timer=null;
                        // clearTimeout(timer);
                        // $(".S_tanchuang2").show();
                        // timer=setTimeout(function(){
                        //     $(".S_tanchuang2").hide();
                        // },3000);
                    }
                },
                error:function(err) {

                }
            });
        }
    });
</script>