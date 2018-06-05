
<%--
  Created by IntelliJ IDEA.
  User: elite
  Date: 2017/11/30
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<header class="row container-fluid">
    <input type="hidden" value="${userType}" id="userType"/>
    <!--logo-->
    <div class="col-lg-2  col-md-2 col-xs-2 logo"><a href="${ctx}/search"><img src="${img}/1logo.png" alt=""></a></div>
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
    <div class="textBox_head2">
        <form action="${ctx}/overview">
            <input type="text" class="text"  name="targetPhone" placeholder="输入目标人员手机号进行搜索"/>
            <button type="button" style="outline:none;" class="btn btnSearch pull-right"></button>
        </form>
    </div>
</header>
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
    $(".btnSearch").click(function(){
        //检索条件执行
        var inputval =$("input[name='targetPhone']").val();
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
                    }
                },
                error:function(err) {

                }
            });
        }
    });


</script>