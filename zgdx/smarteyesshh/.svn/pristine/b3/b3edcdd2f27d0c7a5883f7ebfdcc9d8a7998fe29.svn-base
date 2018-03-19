<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>系统权限管理</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style4.css" />
    <%--<link rel="stylesheet" href="${css}/style5.css" />--%>
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>
    <script type="text/javascript" src="${js}/bmap.js" ></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>

    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });

        })
    </script>
    <style>
        <%--分页样式--%>
        .tabbtn{
            height: 40px;
            margin: 27px auto 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .tabbtn a{
            display: inline-block;
            height: 28px;
            margin-left: 12px;
            padding: 0 10px;
            color: #fff;
            line-height: 28px;
            text-align: center;
            font-family: "Microsoft YaHei",serif;
            font-size: 14px;
            background-color: #2f3242;
            border: 1px solid #9d9fa6;
        }
        .tabbtn span{
            display: inline-block;
            height: 28px;
            margin-left: 12px;
            padding: 0 10px;
            color: #fff;
            line-height: 28px;
            text-align: center;
            font-family: "Microsoft YaHei",serif;
            font-size: 14px;
            background-color: #2f3242;
            border: 1px solid #9d9fa6;
        }
        .tabbtn span.active{
            background: #2196f3;
        }
        .tabbtn .prev{
            width: 148px;
            height: 38px;
            font-size: 16px;
            padding: 0 47px;
            line-height: 38px;
            background-color: #2196f3;
            border: none;
            border-radius: 3px 3px 3px 3px;
        }
        .tabbtn .next{
            width: 148px;
            height: 38px;
            font-size: 16px;
            padding: 0 47px;
            line-height: 38px;
            background-color: #2196f3;
            border: none;
            border-radius: 3px 3px 3px 3px;
        }
        .alldata{
            position: absolute;
            color: #fff;
            width: 100px;
            height: 30px;
            bottom: -40px;
            right: 60px;
            font-size: 15px;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container-fluid smartEyes-container">
    <jsp:include page="/WEB-INF/common/head2.jsp"/>

    <div class="sysmg-pannel">
        <ul>
            <li>
                <a class="sysmg-b active" href="${ctx}/permission">
                    <span class="sysmg-icon sysmg-icon1 "></span>
                    <p>用户管理</p>
                </a>
                <p class="holdarea">

                </p>
            </li>

            <li>
                <a class="sysmg-b" href="${ctx}/account">
                    <span class="sysmg-icon sysmg-icon2"></span>
                    <p>账号设置</p>
                </a>
            </li>
        </ul>
    </div>

    <div class="row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
        </div>

        <!--操作表单-->
        <div class="col-lg-12 col-md-12 col-xs-12 sysmg-box">
            <!--图表展示列表-->
            <div class="sysmg-rbox " >
                <div style="position: relative;">
                    <table class="sysmg-table1" >
                        <tbody>
                        <tr class="sysmg-tr1">
                            <td>
                                <table>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <button class="mybtn" >添加用户</button>
                                            <%--<button class="mybtn">批量添加用户</button>--%>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <!--第二行内容-->
                        <tr class="sysmg-tr2">
                            <td class="table-responsive ">
                                <table class="table table-bordered tr2-table">
                                    <thead>
                                    <tr class="row">
                                        <th class="col-lg-2 col-md-2 col-xs-2">序号</th>
                                        <th class="col-lg-2 col-md-2 col-xs-2">用户ID</th>
                                        <th class="col-lg-2 col-md-2 col-xs-2">用户姓名</th>
                                        <th class="col-lg-2 col-md-2 col-xs-2">用户手机号</th>
                                        <th class="col-lg-2 col-md-2 col-xs-2">密码</th>
                                        <th class="col-lg-2 col-md-2 col-xs-2">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody class="container xinxi" id="sysmg-content">
                                    <%--<tr class="row">--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">((currentPage-1)*10+1+i)</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">arr[i].id</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hidetd">arr[i].nickname</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hidetd">omitusername</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hidetd">********</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hideinput">--%>
                                    <%--<input  type="text" class="sysmgdata"  name="sysmgdata1" value="(arr[i].nickname)"/>--%>
                                    <%--</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hideinput">--%>
                                    <%--<input type="text" class="sysmgdata"  name="sysmgdata2" value="(arr[i].username)"/>--%>
                                    <%--</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hideinput">--%>
                                    <%--<input type="text" class="sysmgdata"  name="sysmgdata3" value="(arr[i].password)"/>--%>
                                    <%--</td>--%>
                                    <%--<td class="col-lg-2 col-md-2 col-xs-2">--%>
                                    <%--<span><button class="mybtn2">重置</button></span>--%>
                                    <%--<span><button class="mybtn2">status</button></span>--%>
                                    <%--</td>--%>
                                    <%--</tr>--%>
                                    </tbody>
                                </table>
                            </td>

                        </tr>

                        </tbody>
                    </table>
                    <div class="alldata">共<span>12</span>页</div>
                </div>
                <!--第三行分页按钮-->
                <div class="tabbtn M-box">
                </div>

                <div class = "sysmg-adduser" style="display: none">
                        <%--<form>--%>
                            <div class="item">
                                <span class="label">姓名 : </span>
                                <input type="text" name="adduser1" class="fl"/>
                            </div>
                            <div class="item">
                                <span class="label">手机号 :  </span>
                                <input type="text" name="adduser2" class="fl"/>
                            </div>
                            <div class="item">
                                <span class="label">密码 :</span>
                                <input type="text" name="adduser3" class="fl" />
                            </div>

                            <input type="submit" value="确认添加" class="sysmg-subBtn" />
                        <%--</form>--%>
                </div>

            </div>

        </div>
    </div>
    <!--底部-->
        <jsp:include page="/WEB-INF/common/footer.jsp"/>
    <script>
        $(function () {
            var ut = $("#userType").val();

            if(ut === "1"){
               $(".smartEyes-container").css("display","none");
                window.location.href="${ctx}/account";
            }

            //动态获取阴影高度
            var h= $(window).height();
            $(".sysmg-rbox").height(h-226);
            //pannel高度
            $(".sysmg-pannel").height(h-120);

            $(window).resize(function(){
                var h= $(window).height();
                $(".sysmg-rbox").height(h-226);
                $(".sysmg-pannel").height(h-120);
            });
            //设置选中
            $(".myselect").children("option").removeAttr("selected");
            $(".myselect").children("option[value='systemRightManage']").attr("selected",true);
        })

        //添加用户点击事件
        function adduserEvent() {
            var newuser = [];

            $(".mybtn").click(
                function () {
                    $(".sysmg-table1").css("display","none");
                    $(".sysmg-adduser").css("display","block");
                    $(".tabbtn").css('display','none');
                    $(".sysmg-subBtn").unbind().click(
                        function () {
                            var newstatus = 1;
                            for(var i= 0;i < 3; i++){
                                var mystring = "adduser"+(i+1);
                                newuser[i] = $(".sysmg-adduser").find("input[name='"+mystring+"']").val();
                                if(newuser[i]===""){
                                    newstatus = 0;
                                    alert("添加内容不能为空");
                                    break;
                                }
                            }
                            var phoneReg = /[1][3-8]{1}\d{9}($|[^0-9]{1})/;
                            if(!phoneReg.test(newuser[1])){
                                newstatus = 0;
                                alert("您输入的号码有误。");
                            }
                            console.log(newuser);
                            if(newstatus===1){
                                $.ajax({
                                    type:"GET",
                                    url:"user/addUser",
                                    dataType:"json",
                                    data:{"usernick":newuser[0],"username":newuser[1],"password":newuser[2]},
                                    success:function (res) {
                                        if(res.result===1){
                                            alert("添加成功");
//                                            $(".sysmg-table1").css("display","inline-table");
//                                            $(".sysmg-adduser").css("display","none");
                                            window.location.reload();//刷新当前页面.

                                        }else{
                                            alert("当前账号已存在不能添加");
                                            console.log(res);
                                        }
                                    },error:function () {
                                        console.log("添加提交错误");
                                    }

                                })
                            }else {}


                        }
                    );
                }
            );

        }
        // 重置按钮点击事件
        function changebtnEvent() {
            var myinput = [];
            var myinput2 = [];
            //0为没点击
            var changestatus = 0;
            $(".mybtn2").click(
                function () {
                    var mytxt = this.innerHTML;
                    var inputuserid = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();
                    if(mytxt ==="重置"){
                        if(changestatus === 0){
                            this.innerHTML="完成";
                            $(this).parent("span").parent("td").parent("tr").children('.sysmg-hidetd').css("display","none");
                            $(this).parent("span").parent("td").parent("tr").children('.sysmg-hideinput').css("display","table-cell");
                            for(var j = 0;j < 3;j++){
                                //为什么不行
//                               myinput[i] = $(this).parent("span").parent("td").parent("tr").children("input").eq(i).val();
                                var mystring2 = "sysmgdata"+(j+1);
                                myinput2[j] = $(this).parent("span").parent("td").parent("tr").find("input[name='"+mystring2+"']").val();
                                console.log("myinput2[j]");
                                console.log(myinput2[j]);
                            }
                            changestatus = 1;
//                           myinput[3] = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();
                        }else {
                            alert("有未完成修改的记录");
                        }

                    }else if(mytxt ==="完成"){

                        this.innerHTML="重置";
                        changestatus = 0;

                        for(var i = 0;i < 3;i++){
                            var mystring = "sysmgdata"+(i+1);
                            myinput[i] = $(this).parent("span").parent("td").parent("tr").find("input[name='"+mystring+"']").val();

                        }
                        //userId
//                            inputuserid = $(this).parent("span").parent("td").parent("tr").children("td").eq(1).text();

                        //把文字显示出来

                        $(this).parent("span").parent("td").parent("tr").find(".sysmg-hidetd").eq(0).text(""+myinput[0]);
                        $(this).parent("span").parent("td").parent("tr").find(".sysmg-hidetd").eq(1).text((myinput[1].substr(0,3)+"****"+myinput[1].substr(7)));
                        $(this).parent("span").parent("td").parent("tr").find(".sysmg-hidetd").eq(2).text("********");

                        $(this).parent("span").parent("td").parent("tr").children('.sysmg-hideinput').css("display","none");
                        $(this).parent("span").parent("td").parent("tr").children('.sysmg-hidetd').css("display","table-cell");
                        //如果确实改了，就提交请求。
                        var paraarr = {};
                        paraarr.userId = inputuserid;
                        var numArr = [];
                        for(var k = 0 ;k<3; k++){
                            //有哪几个改了。
                            if(myinput[k] !== myinput2[k]){
                                numArr.push(k);
                            }
                        }
                        var numArrlen = numArr.length;
                        //确实改了
                        if(numArrlen !== 0) {
                            for (var q = 0; q < numArrlen; q++) {
                                switch (numArr[q]) {
                                    case 0:
                                        paraarr.usernick = myinput[0];
                                        break;
                                    case 1:
                                        paraarr.username = myinput[1];
                                        break;
                                    case 2:
                                        paraarr.password = myinput[2];
                                        break;
                                }
                            }
                            console.log("parajson");
                            console.log(paraarr);
                            console.log(paraarr.userId);

                            //提交保存数据
                            $.ajax({
                                type:"GET",
                                url:"user/setUser",
                                dataType:"json",
//                                    data:{"userId":myinput[3],"usernick":myinput[0],"username":myinput[1],"password":myinput[2]},
                                data: paraarr,
                                success:function (res) {
                                    if(res.result===1){
                                        alert("重置成功");
                                    }else{
                                        alert("不能重置");
                                    }
                                },error:function () {
                                    console.log("修改提交错误");
                                }

                            })
                        }


                    }else if(mytxt ==="禁用"){
                        this.innerHTML="启用";
                        //提交保存数据
                        $.ajax({
                            type:"GET",
                            url:"user/setUser",
                            dataType:"json",
                            data:{"userId":inputuserid,"status":-1},
                            success:function (res) {
                                if(res.result===1){
                                    alert("禁用成功");
                                }else{
                                    alert("不能禁用");
                                }
                            },error:function () {
                                console.log("禁用提交错误");
                            }

                        })
                    }else if(mytxt ==="启用"){
                        this.innerHTML="禁用";
                        //提交保存数据
                        $.ajax({
                            type:"GET",
                            url:"user/setUser",
                            dataType:"json",
                            data:{"userId":inputuserid,"status":1},
                            success:function (res) {
                                if(res.result===1){
                                    alert("启用成功");
                                }else{
                                    alert("不能启用");
                                }
                            },error:function () {
                                console.log("启用提交错误");
                            }

                        })
                    }

                }
            );

        }
        //一些操作
        function initoperate(){
            changebtnEvent();
            adduserEvent();
        }

        var pageCount=null;
        var totalData=null;
        var showData=null;
        myajax(false,1);
        $(".alldata span").text(pageCount);
        function myajax(async,num) {
            $.ajax({
                type:"get",
                url:"/user/searchUser",
                dataType:"json",
                async: async,
                data:{"pageCode":num},
                success:function (res) {
                    $(".xinxi").children().remove();
                    for(var i=0;i<res.data.datas.length;i++){
                        var status;
                        if(res.data.datas[i].status=== 1){
                            //当前状态为1，为启用状态，提示禁用按钮
                            status = "禁用";
                        }else {
                            status = "启用";
                        }
                        pageCount=res.data.totalPage;
                        totalData=res.data.totalRecord;
                        showData=res.data.pageSize;
                        var omitusername = res.data.datas[i].username.substr(0,3)+"****"+res.data.datas[i].username.substr(7);
                        newTime = new Date(res.data.datas[i].searchTime);
                        Date.prototype.toLocaleString = function() {
                            return (this.getFullYear() <10 ? "0"+this.getFullYear() : this.getFullYear()) + "." + ((this.getMonth()+ 1) <10 ? "0"+(this.getMonth() + 1) : (this.getMonth() + 1)) + "." + (this.getDate()  <10 ? "0"+this.getDate() : this.getDate() ) + "&nbsp&nbsp&nbsp" + (this.getHours()<10 ? "0"+this.getHours() : this.getHours()) + ":" + (this.getMinutes()<10 ? "0"+this.getMinutes() : this.getMinutes())+ ":" + (this.getSeconds()<10 ? "0"+this.getSeconds() : this.getSeconds());
                        };
                        stringTime = newTime.toLocaleString();
                        var html='<tr class="row"><td class="col-lg-2 col-md-2 col-xs-2">'+((num-1)*10+1+i)+'</td><td class="col-lg-2 col-md-2 col-xs-2">'+res.data.datas[i].id+'<td class="col-lg-2 col-md-2 col-xs-2 sysmg-hidetd">'+res.data.datas[i].nickname+'</td><td class="col-lg-2 col-md-2 col-xs-2 sysmg-hidetd">'+omitusername+'</td><td class="col-lg-2 col-md-2 col-xs-2 sysmg-hidetd">'+"********"+'</td><td class="col-lg-2 col-md-2 col-xs-2 sysmg-hideinput"><input  type="text" class="sysmgdata"  name="sysmgdata1" value="'+res.data.datas[i].nickname+'"/></td><td class="col-lg-2 col-md-2 col-xs-2 sysmg-hideinput"><input type="text" class="sysmgdata"  name="sysmgdata2" value="'+res.data.datas[i].username+'"/></td><td class="col-lg-2 col-md-2 col-xs-2 sysmg-hideinput"><input type="text" class="sysmgdata"  name="sysmgdata3" value="'+res.data.datas[i].password+'"/></td><td class="col-lg-2 col-md-2 col-xs-2"><span><button class="mybtn2">重置</button></span><span><button class="mybtn2">'+status+'</button></span></td></tr>'
                        $(".xinxi").append(html);
                    }
                    initoperate();
                },
                error:function () {
                    // $(".mag .submit_fail").css('display','block');
                    console.log("数据错误")
                }
            })
        }
        var count=0;
        if(pageCount<5){
            count=pageCount/2+1;
        }else{
            count=4;
        }
        console.log(count);
        $('.M-box').pagination({
            pageCount:pageCount,
            totalData:totalData,
            showData:showData,
            mode:'fixed',
            count:count,
            keepShowPN:true,
            prevContent:'上页',
            nextContent:'下页',
            callback:function(index){
                // console.log(index.getCurrent());
                //上一页下一页无法点击
                if(index.getCurrent()==1){
                    $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
                }else if(index.getCurrent()==pageCount){
                    $(".tabbtn .next").css("cursor","not-allowed").css("background","#565656");
                }
                myajax(true,index.getCurrent());

            }
        });
        //上一页下一页无法点击
        if($(".tabbtn span").text()==1){
            $(".tabbtn .prev").css("cursor","not-allowed").css("background","#565656");
        }else if($(".tabbtn span").text()==pageCount){
            $("tabbtn .next").css("cursor","not-allowed").css("background","#565656");
        }

    </script>

</body>
</html>

