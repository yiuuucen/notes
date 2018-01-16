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
<header class="row">
    <!--logo-->
    <div class="col-lg-2  col-md-2 col-xs-2 logo"><a><img src="${img}/1logo.png" alt=""></a></div>
    <div class="col-lg-5 col-md-5 col-xs-5">
        <ul class="nav nav-pills navList" id="navList">
            <li role="presentation" class=""><a href="${ctx}/overview?targetPhone=${targetPhone}"><i><img id="img1" src="${img}/u-03.png"></i>概览</a></li>
            <li role="presentation" class=""><a href="${ctx}/contact?targetPhone=${targetPhone}"><i><img id="img2" src="${img}/u-04.png"></i>联系人列表</a></li>
            <li role="presentation" class=""><a href="${ctx}/region?targetPhone=${targetPhone}"><i><img  id="img3" src="${img}/u-05.png"></i>区域与轨迹</a></li>
            <!--<li role="presentation" class=""><a href="帐号.html"><i></i>帐号</a></li>-->
        </ul>
    </div>
    <!--<div class="col-lg-4">
        <div class="form-group">
            <input type="text"class="form-control"  />
        </div>

    </div>-->
    <div class="col-lg-1 col-md-1 col-xs-1 fr">
        <a href="${ctx}/search"><img src="${img}/u03.png"></a>
    </div>
    <div class="col-lg-1 col-md-1 col-xs-1 pull-right text-right input-group fr" style="margin-top: 27px">
        <select class="pull-right select myselect" onchange="operateManage(this.options[this.options.selectedIndex].value)">
            <option value="configure" selected="">&nbsp;配置</option>
            <option value="userOperateLog" >&nbsp;用户操作日志</option>
            <option value="targetPersonManage" >&nbsp;目标人员管理</option>
            <option value="systemRightManage" >&nbsp;系统权限管理</option>
        </select>
    </div>
</header>
<script>
    function operateManage(value) {
//            var myDate = new Date();
//        var myDate = new Date("2017-12-31");
//        var mymonth = myDate.getMonth();//获取当前月份(0-11,0代表1月)
//        mymonth = mymonth + 1;
//        mymonth = mymonth < 10 ? '0'+mymonth: mymonth;
//        var mydate = myDate.getDate();//获取当前日(1-31)
//        mydate = mydate-1;
//        mydate = mydate < 10 ? '0'+mydate: mydate;
//        var timerange = [];

        switch(value){
            case "configure":
                <%--window.location.href="${ctx}/system";--%>
                break;
            case "userOperateLog":
                window.location.href="${ctx}/system";
                break;
            case "targetPersonManage":
                window.location.href="${ctx}/person";
                break;
            case "systemRightManage":
                window.location.href="${ctx}/system";
                break;

        }

    }

</script>