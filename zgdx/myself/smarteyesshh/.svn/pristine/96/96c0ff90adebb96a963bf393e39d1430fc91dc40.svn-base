<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>查询记录</title>
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/pagination.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style3.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
</head>
<body>
<div class="container-fluid smartEyes-container mag-jilu">
    <jsp:include page="/WEB-INF/common/head2.jsp"/>
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
                <div class="alldata">共<span></span>页</div>
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
            <div class="tabbtn M-box">
            </div>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="/WEB-INF/common/footer.jsp"/>
<script>
    $(function(){
        $("#navList").css("display","none");
        var pageCount=null;
        var totalData=null;
        var showData=null;
        function myajax(async,num) {
            $.ajax({
                type:"get",
                url:"/target/searchTarget",
                dataType:"json",
                async: async,
                data:{"pageCode":num},
                success:function (res) {
                    $(".xinxi").children().remove();
                    for(var i=0;i<res.result.datas.length;i++){
                        pageCount=res.result.totalPage;
                        totalData=res.result.totalRecord;
                        showData=res.result.pageSize;
                        newTime = new Date(res.result.datas[i].createTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();
                        var html='<div class="lie clearfix" ><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].id+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userId+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userNick+'</span><span class="col-lg-3 col-md-3 col-xs-3">'+stringTime+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].targetPhone+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].personType+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].searchType+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].status+'</span></div>';
                        $(".xinxi").append(html);
                    }
                },
                error:function () {
                    // $(".mag .submit_fail").css('display','block');
                    console.log("数据错误")
                }
            })
        }
        myajax(false,1);
        $(".mag-jilu .tabcont .alldata span").text(pageCount);
        $('.M-box').pagination({
            pageCount:pageCount,
            totalData:totalData,
            showData:showData,
            mode:'fixed',
            keepShowPN:true,
            prevContent:'上页',
            nextContent:'下页',
            callback:function(index){
                // console.log(index.getCurrent());
                //上一页下一页无法点击
                if(index.getCurrent()==1){
                    $(".mag-jilu .tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
                }else if(index.getCurrent()==pageCount){
                    $(".mag-jilu .tabbtn .next").css("cursor","not-allowed").css("background","#565656");
                }
                myajax(true,index.getCurrent());
            }
        });
        //上一页下一页无法点击
        if($(".mag-jilu .tabbtn span").text()==1){
            $(".mag-jilu .tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
        }else if($(".mag-jilu .tabbtn span").text()==pageCount){
            $(".mag-jilu .tabbtn .next").css("cursor","not-allowed").css("background","#565656");
        }

    })
</script>
</body>
</html>
