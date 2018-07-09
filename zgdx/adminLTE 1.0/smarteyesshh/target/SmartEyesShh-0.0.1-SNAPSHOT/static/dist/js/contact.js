//vue的ele日历
new Vue({
    el:'#app',
    data:{
        morenT:new Date()- 3600 * 1000 * 24 * 30,
        morenT2:new Date(),
        pickerOptions2: {
            disabledDate:function(time) {
                let curDate = (new Date()).getTime();
                let three = 186 * 24 * 3600 * 1000;
                let threeMonths = curDate - three;
                return time.getTime() > Date.now() || time.getTime() < threeMonths;;
            },
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
            value0=value[0].slice(0,4)+value[0].slice(5,7)+value[0].slice(8,10);
            value1=value[1].slice(0,4)+value[1].slice(5,7)+value[1].slice(8,10);
            // value[0]=2018-03-06;
            // value0=20180306;
            nodeTimerange=[value0,value1];
            telContactList([value0,value1]);
            relationG([value0,value1]);
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

        //this.morenT=2018-05-06
        //morenTT=20180506
        nodeTimerange = [morenTT,morenTT2];
        telContactList([morenTT,morenTT2])
        relationG([morenTT,morenTT2]);
    }

});

// 筛选弹窗
var contactList;
//当前重点人员
var targetPhone = $("#targetPhone").val();
var targetPhoneNo86=$("#targetPhone").val().slice(-11);
var targetPhoneHide4="SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);

//涉案类型
var showPersonInfo = targetPhoneHide4;
var type = $("#suspectType").val();
if(type!=''){
    showPersonInfo += "&nbsp;&nbsp;&nbsp;"+type+"人员";
}
$('#tit-person').html(showPersonInfo);

//关闭窗口
$(".btn-close").on("click",function(){
    $('#echart-right').hide();
});
function shaixuan_tan(contactList){
    $("#shaixuan").click(function(e){

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

        if($(this).hasClass("tan-select")){
            $(this).removeClass("tan-select");
        }else{
            //$(".tan-choose span").removeAttr("class");
            $(this).attr("class","tan-select");
        }
    });
    $(".tan-choose2 span").click(function(e){

        if($(this).hasClass("tan-select")){
            $(this).removeClass("tan-select");
        }else{
            //$(".tan-choose2 span").removeAttr("class");
            $(this).attr("class","tan-select");
        }
    });
    $(".tan-reset").click(function(e){

        $(".tan-choose span").removeAttr("class");
        $(".tan-choose2 span").removeAttr("class");
    });
    $(".tan-qued").click(function(e){

        $(".c-top span").remove(".pull-right");
        //获取列表并显示
        showContactList(contactList);

        $(".l-con-tanC").css("display","none");
        $("#shaixuan").removeClass("shaixuan-selected");
        $("#shaixuan").addClass("shaixuan-noselect");
    });
}

// 列表点击选中事件
$(".l-contacts .list").delegate('.list-person','click',function(){
    $(this).addClass("li-selected");
    $(this).siblings().removeClass("li-selected");
    $(this).css("border-color","");
    var rank = $(this).attr("rankVal");
    var params=[];
    params.data=[];
    params.data.name= $(this).attr("nameVal");
    params.data.phone=$(this).attr("phoneVal");
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


function getContantHtml(contact,index,rank){
    var msg='';
    var displayStyle='';
    var exp = Number(contact.exp).toFixed(2);
    //contact.exp=contact.exp.toFixed(2);
    //是否隐藏显示
    if(index==''){
        displayStyle ='style="display:none;"';
    }

    if(contact.tag=='重点人员'){
        var name="SE"+contact.phone;
        msg +='<li class="list-person zhongdian-person" '+displayStyle+' nameVal="'+contact.name+'" phoneVal="'+contact.phone+'" rankVal="'+rank+'">'+'<span><font>'+index+'</font>.'+name+'</span>'+'<span>'+contact.tag+'</span>'+'<span>'+contact.type+'</span>'+'<span>'+exp+'</span></li>';
    }else{
        var name="SE"+contact.name.slice(-12);
        msg +='<li class="list-person" '+displayStyle+' phoneVal="'+contact.phone+'" nameVal="'+contact.name+'" rankVal="'+rank+'">'+'<span><font>'+index+'</font>.'+name+'</span>'+'<span>'+contact.tag+'</span>'+'<span>'+contact.type+'</span>'+'<span>'+exp+'</span></li>';
    }
    return msg;
}
// var contactList=[{"exp":0.05010777777777778,"name":"5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b","nameEnc":"5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b","tag":"一般人员","type":"一度"},{"exp":0.05002444444444445,"name":"5cb24c000af6b6fb8b60df9c7049dba5e0fd541f4f3f98dbcd729fe224","nameEnc":"5cb24c000af6b6fb8b60df9c7049dba5e0fd541f4f3f98dbcd729fe224","tag":"一般人员","type":"一度"},{"exp":0.02505388888888889,"name":"189****0796","nameEnc":"5cb24c0b05f0b0f48162dc927244d62afc9759e76aceaead7a44687017","tag":"重点人员","type":"二度"}];
//左侧列表显示,由于数据量可能太大需要等待一段时间，让列表也成为一个Echart图，设置loading
function sortExp(a,b){
    return b.exp-a.exp;
}
function sortExp2(a,b){
    return b.exp-a.exp
}
function showContactList(contactList){

    if(!contactList){
        return;
    }
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
        var title='';
        // for(var j=0;j<selectedList.length;j++){
        //     cTopHmtl +='<span class="pull-right">'+selectedList[j]+'</span>';
        //     if(j<selectedList.length-1){
        //         cTopHmtl +='<span class="pull-right">|</span>';
        //     }
        // }
        for(var j=0;j<selectedList.length;j++){
            title +=selectedList[j]+" ";
        }
        if(selectedList.length>1){
            cTopHmtl='<span class="pull-right" title="'+title+'">'+selectedList[0]+"..."+'</span>'
        }else{
            cTopHmtl='<span class="pull-right" title="'+title+'">'+selectedList[0]+'</span>'
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

//联系人
var myChart;
function telContactList(timerange){

    //导出列表信息接口
    $("#daochu").click(function(){
        window.location.href="new/download?targetPhone="+targetPhone+"&startTime="+timerange[0]+"&endTime="+timerange[1];
    });
    if (myChart != null && myChart != "" && myChart != undefined) {
        myChart.dispose();
    }
    myChart = echarts.init(document.getElementById('firstcontact'));

    myChart.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });
    var targetPhone=$("#targetPhone").val();
    $.ajax({
        type:"GET",
        url:window.ctx+"/new/getAllContacts",
        data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
        //data: {"targetPhone":8615000055827,"startTime":20180220,"endTime":20180307},
        dataType:"json",
        success:function(data){
            console.log(data)
            $("#telNum").html(data.contactList.length)
            myChart.dispose();
            // var msg=$("#firstcontact").html();
            if(data.contactList.length){
                //获取列表
                showContactList(data.contactList);
                shaixuan_tan(data.contactList);
            }else{
                $("#firstcontact").html("无数据")
            }

            myChart.setOption(option);
        },
        error:function() {
            console.log("获取联系人数据失败,请联系管理员");
        }
    });
}

//中间关系图
var nodeList=[];

var myChart0;
var myChart1;
var myChart2;
var myChart3;

function relationG(timerange) {
    //关系图
    if (myChart0 != null && myChart0 != "" && myChart0 != undefined) {
        myChart0.dispose();
    }
    myChart0 = echarts.init(document.getElementById('barEchart01'));

    myChart0.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });
    var targetPhone=$("#targetPhone").val();
    $.ajax({
        type: "GET",
        url: window.ctx + "/new/getGraph",
        data: {"targetPhone": targetPhone, "startTime": timerange[0], "endTime": timerange[1]},
        dataType: "json",
        success:function(graph){
            console.log(graph)
            if(!graph){
                return;
            }
            myChart0.hideLoading();

            var categories=[{"name":"当前重点人员","itemStyle":{"normal":{"color":"#2090ec"}}},{"name":"一般人员","itemStyle":{"normal":{"color":"#4a4f67"}}},{"name":"重点人员","itemStyle":{"normal":{"color":"#7af7d5"}}}]
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
            brr1.sort(sortExp2);
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
                            var source="";
                            var target="";
                            var nodes = nodeList;
                            //设置选中样式start：将选中状态的节点增加边框样式
                            $.each(nodes, function(n){
                                if( nodes[n].name==params.data.source) {
                                    source=nodes[n].phone;
                                    if(source.length==11){//如果是手机号要隐去中间4位
                                        source = "SE"+ source.slice(0,3)+"****"+source.slice(7,11);
                                    }else{
                                        source="SE"+source.slice(-12);
                                    }
                                }else if( nodes[n].name==params.data.target) {
                                    target=nodes[n].phone;
                                    if(target.length==11){//如果是手机号要隐去中间4位
                                        target = "SE"+ target.slice(0,3)+"****"+target.slice(7,11);
                                    }else{
                                        target="SE"+target.slice(-12);
                                    }
                                }
                            });

                            return source+" > "+target;
                        }
                        else {

                            if(params.name===targetPhoneNo86){//当前重点人员
                                return targetPhoneHide4+": "+params.value;
                            }else if(params.data.category=='重点人员'){//重点人员
                                var name = "SE"+params.data.phone.slice(0,3)+"****"+params.data.phone.slice(7,11);
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
        }
    });

    // var nodes=[{"category":"当前重点人员","exp":1,"name":"189****0796","tag":0,"symbolSize":70,"value":"1.00","label":{"normal":{"show":false}},"isnode":true,"fixed":true,"x":462,"y":474.5},{"category":"一般人员","exp":0.05010777777777778,"name":"5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b","nameEnc":"5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b","tag":1,"symbolSize":22.505388888888888,"value":"0.05","label":{"normal":{"show":false}},"isnode":true},{"category":"一般人员","exp":0.05002444444444445,"name":"5cb24c000af6b6fb8b60df9c7049dba5e0fd541f4f3f98dbcd729fe224","nameEnc":"5cb24c000af6b6fb8b60df9c7049dba5e0fd541f4f3f98dbcd729fe224","tag":1,"symbolSize":22.50122222222222,"value":"0.05","label":{"normal":{"show":false}},"isnode":true},{"category":"重点人员","exp":0.02505388888888889,"name":"18917890796","nameEnc":"5cb24c0b05f0b0f48162dc927244d62afc9759e76aceaead7a44687017","tag":2,"symbolSize":21.252694444444444,"value":"0.03","label":{"normal":{"show":false}},"isnode":true}];
    // var links=[{"source":"189****0796","target":"5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b","value":"一度联系人","islink":true},{"source":"189****0796","target":"5cb24c000af6b6fb8b60df9c7049dba5e0fd541f4f3f98dbcd729fe224","value":"一度联系人","islink":true},{"source":"5cb24c060cf1b7fb8960d99b7108b16ad1f3f6d27637953947dbd86e3b","target":"18917890796","value":"二度联系人","islink":true}];
    // var categories=[{"name":"当前重点人员","itemStyle":{"normal":{"color":"#2090ec"}}},{"name":"一般人员","itemStyle":{"normal":{"color":"#4a4f67"}}},{"name":"重点人员","itemStyle":{"normal":{"color":"rgb(76,175,80)"}}}]

}

// 右侧的3个Echart图

function myradar(arr){
    if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
        myChart1.dispose();
    }
    myChart1 = echarts.init(document.getElementById('eBox'));


    //雷达图
    option = {
        backgroundColor:'transparent',
        title: {
            text: ''
        },
        tooltip: {
            trigger: 'item'
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
                        color:'#fff'
                    }
                },
                splitArea: {
                    areaStyle: {
                        color: [
                            'rgb(41, 62,95,)',
                            'rgb(38, 86, 136)',
                            'rgb(35, 119, 192)',
                            'rgb(33, 150, 243)',
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
        backgroundColor:'transparent',
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
        backgroundColor:'transparent',
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


//关系图-点的点击事件

function nodeClick(params){
    //左侧列表选中
    $(".list-person").removeClass("li-selected");

    var rank='';
    $(".list-person").each(function(){
        var name = $(this).attr("nameVal");
        if(name==params.data.name){
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
        if( nodes[n].name==params.data.name) {
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
            var name = params.data.phone.slice(0,3)+"****"+params.data.phone.slice(7,11);
            $('#right-curnum').html("SE"+name+"");
        }else{
            $('#right-curnum').html("SE"+params.data.name.slice(-12)+"");

        }
        var lab="";
        lab=params.data.category;

        $('#right-curlab').html(lab+"&nbsp;&nbsp;|&nbsp;&nbsp;"+"Rank"+rank+"&nbsp;&nbsp;|&nbsp;&nbsp;"+params.data.exp.toFixed(2));
        rightData(targetPhone,params.data.name,nodeTimerange)

    }else{
        $('#echart-right').hide();
    }

}
function rightData(targetPhone,searchPhone,time){
    //获取右侧弹框相关数据
    $.ajax({
        type:"GET",
        url:window.ctx+"/beta/getPerInfo",
        data: {"targetPhone":targetPhone,"searchPhone":searchPhone,"startTime":time[0],"endTime":time[1]},
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
}