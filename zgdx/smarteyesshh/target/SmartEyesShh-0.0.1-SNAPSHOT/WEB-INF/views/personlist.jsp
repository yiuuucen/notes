<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>查询记录</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
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
    </div>

    <div class="jilu clearfix">
        <h3 style="letter-spacing: 2px;font-weight: 300">目标人员列表
            <div class="lesscommit">提交查询号码</div>
            <div class="morecommit">批量提交查询号码</div>
        </h3>
        <div class="mytable">
            <div class="tabhead row">
                <span class="col-lg-7 col-md-7 col-xs-7">目标人员信息猎犬用户信息</span>
                <span class="col-lg-5 col-md-5 col-xs-5">猎犬用户信息</span>
            </div>
            <div class="tabcont row">
                <div class="lie clearfix">
                    <span class="col-lg-1 col-md-1 col-xs-1">序号</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">手机号码</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">描述</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">涉案类型</span>
                    <span class="col-lg-2 col-md-2 col-xs-2">查询状态</span>

                    <span class="col-lg-1 col-md-1 col-xs-1">用户ID</span>
                    <span class="col-lg-1 col-md-1 col-xs-1">用户姓名</span>
                    <span class="col-lg-3 col-md-3 col-xs-3">提交时间</span>
                </div>
                <div class="xinxi">
                    <div class="lie clearfix" >
                        <span class="col-lg-1 col-md-1 col-xs-1">20171229</span>
                        <span class="col-lg-2 col-md-2 col-xs-2">123****4342</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">重点人员</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">涉毒</span>
                        <span class="col-lg-2 col-md-2 col-xs-2">已提交</span>

                        <span class="col-lg-1 col-md-1 col-xs-1">00000123</span>
                        <span class="col-lg-1 col-md-1 col-xs-1">张三</span>
                        <span class="col-lg-3 col-md-3 col-xs-3">2017.12.29&nbsp;&nbsp;15:56:32</span>
                    </div>
                </div>
            </div>
            <div class="tabbtn M-box">
            </div>
        </div>
    </div>
    <div class="submit_btn">
        <div class="submit_box">
            <div class="box_top">
                <span>批量提交查询号码</span>
                <img src="${img}/magclose.png" alt="">
            </div>
            <div class="box_bottom">
                <%--<form action="${ctx}/target/uploadPhone" method="post" enctype="multipart/form-data" >--%>
                <form method="post" enctype="multipart/form-data" id="myform">
                    <input type="file" name="csvfile" class="choose" />
                    <div class="load">下载批量提交模板</div>
                    <input value="确认提交" id="btn" type="button">
                    <div>取消</div>
                </form>
            </div>
        </div>
    </div>
    <div class="submit_fail">
        <div class="submit_box">
            <div class="box_top">
                <span>提交查询号码</span>
                <img src="${img}/magclose.png" alt="">
            </div>
            <div class="box_bottom">
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
                                <option value="强奸">卖淫</option>
                                <option value="强奸">抢劫</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <h3 id="lessbtn">确认提交</h3>
                        <h3 class="lessclose">取消</h3>
                    </div>
                </div>
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
                        var html='<div class="lie clearfix" ><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].id+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].targetPhone+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].personType+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].searchType+'</span><span class="col-lg-2 col-md-2 col-xs-2">'+res.result.datas[i].status+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userId+'</span><span class="col-lg-1 col-md-1 col-xs-1">'+res.result.datas[i].userNick+'</span><span class="col-lg-3 col-md-3 col-xs-3">'+stringTime+'</span></div>'
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
            // coping:true,
            // homePage:"首页",
            // endPage:"尾页",
            keepShowPN:true,
            prevContent:'<',
            nextContent:'>',
            jump:true,
            callback:function(index){

                $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">200</b>条 / 共<b id="allpage">12</b>页</div>');
                $("#alldata").text(totalData);
                $("#allpage").text(pageCount);
                //   生成首页和尾页
                $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none;width: 65px;">首页</a>');
                $(".tabbtn .next").after('<a href="javascript:;" data-page="'+pageCount+'" style="background: #2196f3;border: none;width: 65px;">尾页</a>');

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

        $(".tabbtn .prev").before('<div class="alldata">共<b id="alldata">200</b>条 / 共<b id="allpage">12</b>页</div>');
        $("#alldata").text(totalData);
        $("#allpage").text(pageCount);
        //   生成首页和尾页
        $(".tabbtn .prev").before('<a href="javascript:;" data-page="1" style="background: #2196f3;border: none;width: 65px;">首页</a>');
        $(".tabbtn .next").after('<a href="javascript:;" data-page="'+pageCount+'" style="background: #2196f3;border: none;width: 65px;">尾页</a>');

        // .mag-jilu页面下的2个弹窗js
        $(".morecommit").click(function(){
            $(".mag-jilu .submit_btn").css('display','block');
        });
        $(".lesscommit").click(function(){
            $(".mag-jilu .submit_fail").css('display','block');
        })
        $(".mag-jilu .submit_box .box_top img").click(function(){
            $(".mag-jilu .submit_btn").css('display','none')
        });
        $(".mag-jilu .submit_box .box_bottom div:last-child").click(function(){
            $(".mag-jilu .submit_btn").css('display','none')
        });
        $(".mag-jilu .submit_fail .submit_box img").click(function(){
            $(".mag-jilu .submit_fail").css('display','none')
        });
        $(".mag-jilu .submit_fail .submit_box .lessclose").click(function(){
            $(".mag-jilu .submit_fail").css('display','none')
        });

        //morecommit弹窗
        //点击自动下载模板
        $('.mag-jilu .submit_btn .box_bottom .load').click(function () {
            window.location.href="${ctx}/target/download";
        });
        // form表单提交
        function test(){
            var form = new FormData($("#myform")[0]);
            var upfile=$("#myform input[type='file']").val();
            //如果文件以.csv结尾则进行数据传输
            if(upfile==''){
                alert("请您上传文件");
            }else{
                if(/^.*.csv$/.test(upfile)){
                    $.ajax({
                        url:"target/uploadPhone",
                        type:"post",
                        data:form,
                        processData:false,
                        contentType:false,
                        success:function(data){
                            var data=$.parseJSON(data);
                            if(data.result!=0){
                                // alert("提交成功"+data.result+"条数据");
                                alert("提交成功");
                                window.location.href="${ctx}/personlist"
                            }else{
                                alert("您上传文件中的数据内容有误！");
                            }
                        },
                        error:function(e){
                            alert("错误！！");
                        }
                    });
                }else{
                    alert("您上传的文件类型有误，请下载批量提交模板")
                }
            }
        }
        $("#btn").click(function(){
            test();
        })
    //    lesscommit弹窗
        $("#lessbtn").click(function () {
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

    })
</script>
</body>
</html>
