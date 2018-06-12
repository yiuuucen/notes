<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>联系人列表</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${css}/ele-ui.css" />
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${css}/style2.css" />
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <script src="${js}/vue.js"></script>
    <script src="${js}/ele-ui.js"></script>
    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });
            $("#navList li").removeClass("active");
            $("#navList li:eq(1)").addClass("active");

            $("#img1").attr("src","${img}/u-03.png");
            $("#img2").attr("src","${img}/u-04c.png");
            $("#img3").attr("src","${img}/u-05.png");




            //关闭窗口
            $(".btn-close").on("click",function(){
                $('#echart-right').hide();
            });
            //图标展示高度
            var h= $(window).height()-60;
            $("#ect").height(h);


        })
    </script>
    <style>
        .eboxlist{
            display: none;

        }
    </style>
</head>
<body>
<div class="container-fluid smartEyes-container contact">
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox listbox container-fluid">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix" style="padding-left:15px;">
            <div class="pull-left namelistcc col-lg-4 col-md-4 col-xs-4" style="width:50%;">
                <span>当前重点人员：</span>
                <span id="tit-person"> </span>
                <span>&nbsp;&nbsp;&nbsp;有效联系人总数：</span>
                <span id="tit-contactNum"> </span>
            </div>
            <div class="pull-right text-right input-group col-lg-5">
                <div id="app">
                    <template>
                        <div class="block">
                            <el-date-picker
                                    v-model="value7"
                                    type="daterange"
                                    align="right"
                                    value-format="yyyy-MM-dd"
                                    unlink-panels
                                    :start-placeholder="morenT"
                                    range-separator="至"
                                    :end-placeholder="morenT2"
                                    :picker-options="pickerOptions2"
                                    @change="gettime"
                            >
                            </el-date-picker>
                        </div>
                    </template>
                </div>
            </div>
        </div>
        <div class="listl" style="border-bottom: none;">
            <div class="l-contacts">
                <div class="c-top clearfix" style="margin-right:15px;">
                    <span class="pull-left shaixuan-noselect" id="shaixuan">筛选</span>
                    <span class="pull-right">全部人员</span>
                </div>
                <div class="c-head clearfix">
                    <span class="pull-left">编号</span>
                    <span class="pull-left">描述</span>
                    <span class="pull-left">关联度</span>
                    <span class="pull-left">关联指数</span>
                </div>
                <ul class="list" id="firstcontact">
                    <%--<li class="list-person">--%>
                        <%--<span>1.SE5cb3fv9sc0d3</span>--%>
                        <%--<span>重点人员</span>--%>
                        <%--<span>一度</span>--%>
                        <%--<span>0.90</span>--%>
                    <%--</li>--%>
                </ul>
                <div class="daochu" id="daochu">导出列表信息</div>
                <div class="l-con-tanC">
                    <div class="tanCont">
                        <div class="tan-choose">
                            <h3>描述</h3>
                            <span val="重点人员">重点人员</span>
                            <span val="一般人员">一般人员</span>
                        </div>
                        <div class="tan-choose2">
                            <h3>关联度</h3>
                            <span val="一度联系人">一度联系人</span>
                            <span val="二度联系人">二度联系人</span>
                        </div>
                        <div class="tan-reset">重置</div>
                        <div class="tan-qued">确定</div>
                    </div>
                </div>
            </div>

        </div>
        <!--图表展示-->
        <div class="list2 echartBox col-lg-8 col-md-8 col-xs-8">
            <div class="echart03" id="ect"></div>
        </div>
    </div>
    <div class="echart-right" id="echart-right" style="display: none;">
        <!--点击弹出图表-->
        <div class="head clearfix">
            <h3 class="pull-left">联系人信息</h3>
            <i class="pull-right btn btn-close" style="top:0"><img src="${img}/u-16.png" width="13" height="13"></i>
        </div>
        <div class="csbox">
            <div class="cent clearfix">
                <div class="title pull-left">
                    <img src="${img}/u-18.png" />
                </div>
                <div class="texTtitle pull-left" style="margin-top: 14px">
                    <%--<p id="right-curnum">SE981239123</p>--%>
                    <p id="right-curnum"></p>
                    <%--<p id="right-curlab"style="font-size: 12px;">一度联系人   Rank1   0.9</p>--%>
                    <p id="right-curlab" style="font-size: 10px;"></p>
                </div>
                <div class="pull-right">
                    <%--<a href="#"><img style="margin-top: 16px;" src="${img}/u-19.png"></a>--%>
                </div>
            </div>
        </div>
        <div class="e-right">
            <div class="e-r-l">
                <%--<h1>联系人概览<i class="glyphicon glyphicon-chevron-down"></i></h1>--%>
                <h1>联系人概览</h1>
                <div class="ebox" id="eBox" style="width: 233px; height: 174px; margin-left: 14px;">

                </div>
            </div>
            <div class="e-r-l">
                <div class="ectitle" style="margin-top: 30px;">
                    <span class="active">通话时长</span>
                    <i>|</i>
                    <span>通话频次</span>
                </div>
                <div class="ebox eboxlist" id="eBox02" style="width: 230px; display: block; height: 200px; margin-left: 14px;">

                </div>
                <div class="ebox eboxlist" id="eBox03" style="width: 230px; height: 200px; margin-left: 14px;">

                </div>

            </div>
            <div class="btnBox hide">
                <a href="#">点击查看更多</a>
            </div>
        </div>

    </div>
</div>
<!--底部-->
<footer><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
<script type="text/javascript" src="${js}/dataTool.js" ></script>
<script type="text/javascript">
	var contactList=[];
	$(document).bind('click',function(){
		//筛选层隐藏
	    $(".l-con-tanC").css("display","none");
	    $("#shaixuan").removeClass("shaixuan-selected");
	    $("#shaixuan").addClass("shaixuan-noselect");
	    $(".tanCont span").removeAttr("class");
	    
    });
    
	//当前重点人员
	var targetPhone = $("#targetPhone").val();
	var targetPhoneNo86=$("#targetPhone").val().slice(-11);
	var targetPhoneHide4="SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);
	
	var showPersonInfo = targetPhoneHide4;
    //涉案类型
    var type = '${suspectType}';
	if(type!=''){
		showPersonInfo += "&nbsp;&nbsp;&nbsp;"+type+"人员";
	}
    $('#tit-person').html(showPersonInfo);
    //图标展示高度
    var h= $(window).height()-60;
    $("#ect").height(h);
    var myChart0;
    var myChart1;
    var myChart2;
    var myChart3;
    var myDate = new Date();
    var myyear = ""+myDate.getFullYear();    //获取完整的年份(4位,1970-????)

    var targetPhone=$("#targetPhone").val();
    //判断传过来的电话是否为86开头，如果不是则帮它加上
    if(targetPhone.length!=13){
        targetPhone="86"+targetPhone;
    }
    var nodeTimerange=[];
    var timerange;


    // 筛选弹窗
    function shaixuan_tan(time){

        //导出列表信息接口
        $("#daochu").click(function(){
            window.location.href="${ctx}/new/download?targetPhone="+targetPhone+"&startTime="+time[0]+"&endTime="+time[1];
        });
        
        $(".l-con-tanC .tanCont").click(function(e){
        	stopPropagation(e);//调用停止冒泡方法,阻止document方法的执行
        });

        $("#shaixuan").click(function(e){
        	stopPropagation(e);//调用停止冒泡方法,阻止document方法的执行
	        if($(".l-con-tanC").is(":hidden")){
	        	//筛选层显示
	            $(".l-con-tanC").css("display","block");
	            $("#shaixuan").removeClass("shaixuan-noselect");
	            $("#shaixuan").addClass("shaixuan-selected");
	            //
	            $(".tanCont span").removeAttr("class");
	            $(".c-top .pull-right").each(function(){
	            	var htmlStr=$(this).html();
	            	$(".tanCont span[val='"+htmlStr+"']").attr("class","tan-select");
	            });
	        
	        }else{
	        	//筛选层隐藏
	        	 $(".l-con-tanC").css("display","none");
	        	 $("#shaixuan").removeClass("shaixuan-selected");
	        	 $("#shaixuan").addClass("shaixuan-noselect");
	        }
        });
        $(".tan-choose span").click(function(e){
        	stopPropagation(e);//调用停止冒泡方法,阻止document方法的执行
        	if($(this).hasClass("tan-select")){
        		$(this).removeClass("tan-select");
        	}else{
	            //$(".tan-choose span").removeAttr("class");
	            $(this).attr("class","tan-select");
        	}
        });
        $(".tan-choose2 span").click(function(e){
        	stopPropagation(e);//调用停止冒泡方法,阻止document方法的执行
        	if($(this).hasClass("tan-select")){
        		$(this).removeClass("tan-select");
        	}else{
	            //$(".tan-choose2 span").removeAttr("class");
	            $(this).attr("class","tan-select");
        	}
        });
        $(".tan-reset").click(function(e){
        	stopPropagation(e);//调用停止冒泡方法,阻止document方法的执行
            $(".tan-choose span").removeAttr("class");
            $(".tan-choose2 span").removeAttr("class");
        });
        $(".tan-qued").click(function(e){
        	stopPropagation(e);//调用停止冒泡方法,阻止document方法的执行
            console.log(time);
            $(".c-top span").remove(".pull-right");
            //获取列表并显示
            showContactList();
            
            /*$.ajax({
                type:"GET",
                url:window.ctx+"/new/getAllContacts",
                data: {"targetPhone":targetPhone,"startTime":time[0],"endTime":time[1]},
                //data: {"targetPhone":8615000055827,"startTime":20180220,"endTime":20180307},
                dataType:"json",
                //有个小bug，每次点击确定后都会加载3次这个ajax。。（没有找到原因），会导致页面出现一闪一闪的效果
                //解决办法：给这个ajax设置为同步，也就是等待它加载最后一个ajax完成再生产数据
                async: false,
                success:function(data){
                	//获取列表并显示
                	showContactList(data.contactList);
                },
                error:function() {
                    console.log("获取联系人数据失败,请联系管理员");
                }
            });*/
            $(".l-con-tanC").css("display","none");
            $("#shaixuan").removeClass("shaixuan-selected");
	       	$("#shaixuan").addClass("shaixuan-noselect");
        });
    }

    new Vue({
        el:'#app',
        data:{
            morenT:new Date()- 3600 * 1000 * 24 * 30,
            morenT2:new Date(),
            pickerOptions2: {
                shortcuts: [{
                    text: '最近一周',
                    onClick:function(picker) {
                        const end = new Date();
                        const start = new Date();
                        start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                        picker.$emit('pick', [start, end]);
                    }
                }, {
                    text: '最近一个月',
                    onClick:function(picker) {
                        const end = new Date();
                        const start = new Date();
                        start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                        picker.$emit('pick', [start, end]);
                    }
                }, {
                    text: '最近三个月',
                    onClick:function(picker) {
                        const end = new Date();
                        const start = new Date();
                        start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                        picker.$emit('pick', [start, end]);
                    }
                }]
            },
            value6: '',
            value7: ''
        },
        methods:{
            gettime:function(value){
                value[0]=value[0].slice(0,4)+value[0].slice(5,7)+value[0].slice(8,10);
                value[1]=value[1].slice(0,4)+value[1].slice(5,7)+value[1].slice(8,10);
                // value[0]=20180306;
                // console.log(value[0]);
                // console.log(value[1]);
                timerange = [value[0],value[1]];
                telContactList(timerange);
                relationG(timerange);
                shaixuan_tan(timerange);
                $('#echart-right').hide();
            },
            formatDate1:function(date){
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                m = m < 10 ? '0' + m : m;
                var d = date.getDate();
                d = d < 10 ? ('0' + d) : d;
                return y + '-' + m + '-' + d;
            }
        },
        // 钩子函数，页面渲染自动执行
        mounted:function(){
            this.morenT=this.formatDate1(new Date(this.morenT));
            this.morenT2=this.formatDate1(this.morenT2);
            morenTT=this.morenT.slice(0,4)+this.morenT.slice(5,7)+this.morenT.slice(8,10);
            morenTT2=this.morenT2.slice(0,4)+this.morenT2.slice(5,7)+this.morenT2.slice(8,10);
            //    初始化
            nodeTimerange = [morenTT,morenTT2];
            relationG(nodeTimerange);
            telContactList(nodeTimerange);
        }

    });
    
    //列表点击选中事件
    $(".l-contacts .list").delegate('.list-person','click',function(){
    	$(this).addClass("li-selected");
    	$(this).siblings().removeClass("li-selected");
    	$(this).css("border-color","");
        var rank = $(this).attr("rankVal");
    	var params=[];
    	params.data=[];
        params.data.name= $(this).attr("nameVal");
        params.data.nameEnc=$(this).attr("nameEncVal");
        params.data.category=$(this).find("span:eq(1)").html();//重点人员，一般人员
        var type=$(this).find("span:eq(2)").html();
        if(type=='一度'){
        	params.data.tag = 1;
        }if(type=='二度'){
        	params.data.tag = 2;
        }
        params.data.exp=parseFloat($(this).find("span:eq(3)").html());
        selectedNode(params,rank);
         
    });
    
    function sortExp(a,b){
        return b.exp-a.exp;
    }

    //左侧列表显示
    function showContactList(){
        // alert("end");
    	//更新有效联系人总数
		if(contactList!=null){
			$('#tit-contactNum').html(""+contactList.length);
		}else{
			$('#tit-contactNum').html(""+0);
		}
		//清空筛选条件
    	$(".c-top span").remove(".pull-right");
    
    	//列表排序
    	contactList.sort(sortExp);
        var msg='';
        if($(".tan-select").length==0||$(".tan-select").length==4){
            $(".c-top").append('<span class="pull-right">全部人员</span>');
            //获取列表
            var num=0;//序号
            for(var i=0;i<contactList.length;i++){
            	num++;
            	msg += getContantHtml(contactList[i],num,i+1);
            }
        }else {
        	var tag = '';
        	var type ='';
        	var selectedList=[];
        	$(".tan-choose .tan-select").each(function(){
        		tag+=','+$(this).html();
        		selectedList.push($(this).html());
        	});
        	$(".tan-choose2 .tan-select").each(function(){
        		type+=','+$(this).html();
        		selectedList.push($(this).html());
        	});
        	
        	//选中标签更新
        	var cTopHmtl = '';
        	for(var j=0;j<selectedList.length;j++){
        		cTopHmtl +='<span class="pull-right">'+selectedList[j]+'</span>';
        		if(j<selectedList.length-1){
        			cTopHmtl +='<span class="pull-right">|</span>';
        		}
        	}
        	$(".c-top").append(cTopHmtl);
        	
        	
        	var num=0;//序号
        	for(var i=0;i<contactList.length;i++){
        	 	if(tag!='' && tag.indexOf(contactList[i].tag)<0){
        	 		continue;
        	 	}
        	 	
        	 	if(type!='' && type.indexOf(contactList[i].type)<0){
        	 		continue;
        	 	}
        	 	num++;
            	msg += getContantHtml(contactList[i],num,i+1);
        	 }
        }
        $("#firstcontact").html(msg);           
    }
    
    function getContantHtml(contact,index,rank){
        console.log(1)
    	var msg='';
    	var displayStyle='';
    	var exp = Number(contact.exp).toFixed(2);
    	//contact.exp=contact.exp.toFixed(2);
    	//是否隐藏显示
    	if(index==''){
    		displayStyle ='style="display:none;"';
    	}
    	
	    if(contact.tag=='重点人员'){
	       	var name="SE"+contact.name;
	       	msg +='<li class="list-person zhongdian-person" '+displayStyle+' nameEncVal="'+contact.nameEnc+'" nameVal="'+contact.name+'" rankVal="'+rank+'">'+'<span><font>'+index+'</font>.'+name+'</span>'+'<span>'+contact.tag+'</span>'+'<span>'+contact.type+'</span>'+'<span>'+exp+'</span></li>';
	    }else{
	        var name="SE"+contact.name.slice(-12);
	        msg +='<li class="list-person" '+displayStyle+' nameEncVal="'+contact.nameEnc+'" nameVal="'+contact.name+'" rankVal="'+rank+'">'+'<span><font>'+index+'</font>.'+name+'</span>'+'<span>'+contact.tag+'</span>'+'<span>'+contact.type+'</span>'+'<span>'+exp+'</span></li>';
	    }
	    return msg;
    }
    
    //联系人
    function telContactList(timerange){
        var myChart = echarts.init(document.getElementById('firstcontact'));

        myChart.showLoading({
            text: 'loading...',
            color: '#2196f3',
            textColor: '#2196f3',
            maskColor: 'transparent',
            zlevel: 0,
        });

        $.ajax({
            type:"GET",
            url:window.ctx+"/new/getAllContacts",
            data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
            //data: {"targetPhone":8615000055827,"startTime":20180220,"endTime":20180307},
            dataType:"json",
            success:function(data){
                myChart.dispose();
                var msg=$("#firstcontact").html();
                console.log(data);
                contactList = data.contactList;
                //获取列表
                showContactList();
                shaixuan_tan(timerange);
                myChart.setOption(option);
            },
            error:function() {
                console.log("获取联系人数据失败,请联系管理员");
            }
        });
    }
    //有个小bug,
    // shaixuan_tan(nodeTimerange)
    //中间关系图
    var nodeList=[];
    function relationG(timerange) {
        $(".listl .list").height(440);
        //关系图
        if (myChart0 != null && myChart0 != "" && myChart0 != undefined) {
            myChart0.dispose();
        }
        myChart0 = echarts.init(document.getElementById('ect'));

        myChart0.showLoading({
            text: 'loading...',
            color: '#2196f3',
            textColor: '#2196f3',
            maskColor: 'transparent',
            zlevel: 0,
        });

        $.ajax({
            type:"GET",
            url:window.ctx+"/new/getGraph",
            data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
            dataType:"json",
            success:function (graph) {

                myChart0.hideLoading();

                var categories = [{
                    name:'当前重点人员',
                    itemStyle: {
                        normal: {
                            color: "#2090ec"
                        }
                    }
                },
                    {
                        name:'一般人员',
                        itemStyle: {
                            normal: {
                                color: "#4a4f67"
                            }
                        }
                    }
                    ,
                    {
                        name:'重点人员',
                        itemStyle: {
                            normal: {
                                color: "rgb(76,175,80)"
                            }
                        }
                    }
                ];
                function sortExp(a,b){
                    return b.exp-a.exp
                }
                //找到max

                var mynode = graph.nodes;
                var brr1=[];
                var brr2=[];
                var max1,max2;
                for(var i=0;i<mynode.length;i++){
                    if(mynode[i].tag==1){
                        brr1.push(mynode[i]);

                    }else if(mynode[i].tag==2){
                        brr2.push(mynode[i]);
                    }
                }
                brr1.sort(sortExp);
                if(brr1.length!==0){max1 = brr1[0].exp;}

                graph.nodes.forEach(function (node) {
                    //设置大小
                    node.symbolSize = 50*node.exp+20;
                    node.value=node.exp.toFixed(2);
                    node.label = {
                        normal: {
                            //4.35
                            show: false
                        }
                    };
                    node.isnode = true;
                    if(node.tag==0){//当前重点联系人
	                    node.fixed= true;
    					node.x=myChart0.getWidth() / 2;
    					node.y= myChart0.getHeight() / 2;
                    }
                    
                    
                    
                });
				nodeList = graph.nodes;
                graph.links.forEach(function (link) {
                    link.islink = true;
                });


                myChart0.off('click');
                myChart0.on("click",nodeClick);
                option = {
                    tooltip: {
                        formatter: function (params) {
                        	
                            if(params.data.islink){
	                        	//判断是否是重点联系人，如果是则显示手机号码
	                        	var target = '';
	                        	
                                var source = params.data.source;
                                var target=params.data.target;
                                if(source.length==11){//如果是手机号要隐去中间4位
	                            	source = "SE"+ source.slice(0,3)+"****"+source.slice(7,11);
	                            }else{
	                            	source="SE"+params.data.source.slice(-12);
	                            } 
	                            
                                if(target.length==11){//如果是手机号要隐去中间4位
	                            	target = "SE"+ target.slice(0,3)+"****"+target.slice(7,11);
	                            }else{
	                            	target="SE"+params.data.target.slice(-12);
	                            } 
	                        	
	                        	return source+" > "+target;
                            }
                            else {
                            	
                                if(params.name===targetPhoneNo86){//当前重点人员
                                	return targetPhoneHide4+": "+params.value;
                                }else if(params.data.category=='重点人员'){//重点人员
	                                var name = "SE"+params.name.slice(0,3)+"****"+params.name.slice(7,11);
	                                return name+": "+params.value;
                                }else{  //一般人员
                                	return 'SE'+params.name.slice(-12)+": "+params.value;
                                }
                            }
                        }
                    },
                    legend: [{
                        selectedMode: 'multiple',
                        data: categories.map(function (a) {
                            return a.name;
                        }),
                        /*['一般人员','重点人员'],*/
                        textStyle: {
                            color: '#ccc'
                        },
                        top: 10

                    }],
                    animationDuration:1500,
                    animationEasingUpdate:'quinticInOut',
                    series : [
                        {
                            name: '联系人节点',
                            type: 'graph',
                            layout: 'force',

                            force: {
                                repulsion: 150,
                                gravity: 0.1,
                                edgeLength: 70,
                                layoutAnimation: true

                            },
                            data: graph.nodes,
                            links: graph.links,
                            categories: categories,
                            roam: false,
                            draggable:false,
                            label: {
                                normal: {
                                    position: 'left',
                                    formatter: '{b}'
                                }
                            },

                            lineStyle: {
                                normal: {
                                    //curveness影响让节点中的线曲直
                                    curveness: 0
                                }

                            }
                        }
                    ]
                };

                myChart0.setOption(option);

//
                



            },
            error:function () {
                alert("获取失败，请联系管理员！");

            }
        });

    }
    //关系图-点的点击事件
    function nodeClick(params){
    	//左侧列表选中
    	$(".list-person").removeClass("li-selected");
    	
    	var rank='';
    	$(".list-person").each(function(){
    		var nameEnc = $(this).attr("nameEncVal");
    		if(nameEnc==params.data.nameEnc){
    			rank=$(this).attr("rankVal");
		    	$(this).addClass("li-selected");
		    	$(this).focus();
		    	//return false;
		    	var offset = $("#firstcontact").scrollTop() + $(this).offset().top - $("#firstcontact").offset().top;
		    	var now = $("#firstcontact").scrollTop();
		    	if(offset<400){
		    		$("#firstcontact").scrollTop(0);
		    	}else{
		    		$("#firstcontact").scrollTop(offset-200);
		    	}
		    	
    		}
    	});
    	//关系图选中、右侧弹框更新
    	selectedNode(params,rank);
    
    }
	
	//关系图选中、右侧弹框更新
	function selectedNode(params,rank){
		var nodes = nodeList;
		var selectedColor;
		//设置选中样式start：将选中状态的节点增加边框样式
	    $.each(nodes, function(n){ 
			if( nodes[n].nameEnc==params.data.nameEnc) {
				if(nodes[n].category=='当前重点人员'){
		            selectedColor = '#2090ec';
		        }else if(nodes[n].category=='重点人员'){
		            selectedColor = 'rgb(76,175,80)';
		        }else {
		            selectedColor = '#4a4f67';
		        }
				var itemS = {
		             normal: {
						borderColor: {
		                    type: 'radial',
							x: 0.5,
							y: 0.5,
							r: 0.5,
							colorStops: [{
								offset: 0.9, color: 'rgba(128, 128, 128, 0)' // 0% 处的颜色
							}, {
								offset: 1, color: selectedColor // 100% 处的颜色
							}],
							globalCoord: false // 缺省为 false
		                 },
		                 borderWidth:15
					}
				};
				nodes[n].itemStyle=itemS;
		                
		    }else{
		        nodes[n].itemStyle=null;
		    }
		});
	                
	    var chart0_option={
			series:[
            	{
                	name: '联系人节点',
                    data: nodes
                }
            ]
		};
	    myChart0.setOption(chart0_option);
	    //设置选中样式end
	           
		if(params.data.tag!=0){
			//点击出现右侧弹框
			$('#echart-right').show();
			//只有不是一度联系人，都只显示基本信息
			if(params.data.tag!=1){
				$("#echart-right .e-right").hide();
			}else{
				$("#echart-right .e-right").show();
			}
			//清空echarts右侧图
            myradar(['0','0','0','0','0']);
            mychar02(['0','0']);
            mychar03(['0','0']);

            //开始设置
            if(params.data.category=='重点人员'){
             	  var name = params.data.name.slice(0,3)+"****"+params.data.name.slice(7,11);
                  $('#right-curnum').html("SE"+name+"");
            }else{
	              $('#right-curnum').html("SE"+params.data.name.slice(-12)+"");
                        
            }
            var lab="";
            lab=params.data.category;


            $('#right-curlab').html(lab+"&nbsp;&nbsp;|&nbsp;&nbsp;"+"Rank"+rank+"&nbsp;&nbsp;|&nbsp;&nbsp;"+params.data.exp.toFixed(2)); 
            //console.log(params);
            //console.log(window.ctx+"/contact/getPerInfo?targetPhone="+params.name);
//          var para = {"targetPhone":targetPhone,"searchPhone":params.name.slice(2)};
            //获取右侧弹框相关数据
            $.ajax({
				type:"GET",
                url:window.ctx+"/beta/getPerInfo",
                data: {"targetPhone":targetPhone,"searchPhone":params.data.nameEnc,"startTime":nodeTimerange[0],"endTime":nodeTimerange[1]},
                dataType:"json",
                success:function (data) {

					if(data!==null){
                    	var radardata = [data.contactInfo.totalCall,data.contactInfo.WorkCall,data.contactInfo.RestCall,data.contactInfo.UnderFifteenSeconds,data.contactInfo.AboveThreeMin];
                        var char02 = [data.teleInfo.calledTime,data.teleInfo.callingTime];
                        var char03 = [data.teleInfo.calledCount,data.teleInfo.callingCount];
                        myradar(radardata);
                        mychar02(char02);
                        mychar03(char03);

                     }else{
                        console.log("没有数据");

                     }
                     //切换饼图
                     $(".ectitle span").click(function(){
						var index=$(this).index();
                        if(index==0){
                                        $(this).addClass("active").siblings("span").removeClass("active");
                                        $("#eBox02").show();
                                        $("#eBox03").hide();
                                        mychar02(char02);
						}else if(index==2){
                                        $(this).addClass("active").siblings("span").removeClass("active");
                                        $("#eBox03").show();
                                        $("#eBox02").hide();
                                        mychar03(char03);
                        }

                    })
				},

                error:function() {
                    console.log("获取弹框数据失败,请联系管理员");
                }
            });
		}else{
            $('#echart-right').hide();
        }

	}


    //右侧隐藏图表

        function myradar(arr){
            if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
                myChart1.dispose();
            }
            myChart1 = echarts.init(document.getElementById('eBox'));

            //雷达图
            option = {
                backgroundColor:'none',
                title: {
                    text: ''
                },
                tooltip: {
                    trigger: 'item'
//                    formatter: "{b}<br/>"+
//                    "总体通话次数:"+"[{value}]<br/>"+
//                    "工作时段通话次数:"+"{arr[1]}<br/>"+
//                    "休息时段通话次数:"+"{arr[2]}<br/>"+
//                    "15秒内通话次数:"+"{arr[3]}<br/>"+
//                    "3分钟以上通话次数:"+"{arr[4]}<br/>"

                },
                legend: {
                    data: []
                },
                radar: [
                    {
                        indicator: [
                            { text: '总通话' },
                            { text: '工作时段' },
                            { text: '休息时段' },
                            { text: '短通话' },
                            { text: '长通话' }

                        ],
                        center: ['52%', '54%'],
                        radius: 60,
                        startAngle: 90,
                        splitNumber: 4,
                        shape: 'circle',
                        name: {
                           // formatter:'',
                            textStyle: {
                                color:'#6292b1'
                            }
                        },
                        splitArea: {
                            areaStyle: {
                                color: [
                                    'rgba(98, 146, 177, 0.2)',
                                    'rgba(98, 146, 177, 0.4)',
                                    'rgba(98, 146, 177, 0.6)',
                                    'rgba(98, 146, 177, 0.8)',
                                    'rgba(98, 146, 177, 1)'
                                ],
                                shadowColor: 'rgba(0, 0, 0, 0.3)',
                                shadowBlur: 10
                            }
                        },
                        axisLine: {
                            lineStyle: {
                                color: 'rgba(255, 255, 255, 0.5)'

                            }
                        },
                        splitLine: {
                            lineStyle: {
                                color: 'rgba(255, 255, 255, 0.5)'
                            }
                        }
                    },

                ],
                series: [
                    {
                        name: '雷达图',
                        type: 'radar',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    type: 'dashed'

                                }
                            },
                            emphasis: {
                                // color: 各异,
                                lineStyle: {
                                    width: 4
                                }
                            }
                        },
                        data: [
                            {
                                //value: [60, 5, 0.30, -100, 1500],
                                value: arr,
                                name:"联系人概览",
                                areaStyle: {
                                    normal: {
                                        color: 'rgba(255, 255, 255, 0.5)'
                                    }
                                }
                            }
                        ]
                    }
                ]
            }


            myChart1.setOption(option);

        }




        function mychar02(arr){
            if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
                myChart2.dispose();
            }
            myChart2 = echarts.init(document.getElementById('eBox02'));
            //饼状图
            option = {
                backgroundColor:'none',
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}min ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['']
                },
                series: [{
                    name: '通话时长',
                    type: 'pie',
                    radius: ['60%', '70%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: Number(arr[0]).toFixed(2),
//                        value: 2,
                        name: '被叫',
                        label: {
                            normal: {
                                formatter: '总时长',
                                textStyle: {
                                    color: 'rgba(98, 146, 177, 1)',
                                    fontSize: 16
                                }
                            }
                        },
                        tooltip: {
                            show: true
                        },
                        itemStyle: {
                            normal: {
                                color: '#355078'
                            },
                            emphasis: {
                                color: '#355078'
                            }
                        },
                        hoverAnimation: false
                    },{
                        value: Number(arr[1]).toFixed(2),
//                        value: 3,
                        name: '主叫',
                        label: {
                            normal: {
//                                formatter: '{c}min',
                                formatter: function (params) {
                                    return Number(arr[1]+arr[0]).toFixed(2)+'min';
                                },
                                textStyle: {
                                    fontSize: 16,
                                    color: 'rgba(98, 146, 177, 1)'
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#4298cc'
                            },
                            emphasis: {
                                color: '#4298cc'
                            }
                        }

                    }]
                }]
            };

            myChart2.setOption(option);

        }


        function mychar03(arr){
            if (myChart3 != null && myChart3 != "" && myChart3 != undefined) {
                myChart3.dispose();
            }
            myChart3 = echarts.init(document.getElementById('eBox03'));
            //饼状图
            option = {
                backgroundColor:'none',
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}次 ({d}%)"
                },
                legend: {
                    orient: 'vertical',

                    left: 'left',
                    data: ['']
                },
                series: [{
                    name: '通话频次',
                    type: 'pie',
                    radius: ['60%', '70%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: arr[0],
                        name: '被叫次数',
                        label: {
                            normal: {
                                formatter: '总次数',
                                textStyle: {
                                    color: 'rgba(98, 146, 177, 1)',
                                    fontSize: 16
                                }
                            }
                        },
                        tooltip: {
                            show: true
                        },
                        itemStyle: {
                            normal: {
                                color: '#355078'
                            },
                            emphasis: {
                                color: '#355078'
                            }
                        },
                        hoverAnimation: false
                    },{
                        value: arr[1],
                        name: '主叫次数',
                        label: {
                            normal: {
//                                formatter: '{c}次',
                                formatter: function (params) {
                                    return Number(arr[1]+arr[0]).toFixed(2)+'次';
                                },
                                textStyle: {
                                    fontSize: 16,
                                    color: 'rgba(98, 146, 177, 1)'
                                }
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#4298cc'
                            },
                            emphasis: {
                                color: '#4298cc'
                            }
                        }
                    }]
                }]
            };

            myChart3.setOption(option);
        };








</script>
</body>
</html>
