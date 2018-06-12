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
          relation([value0,value1],value[0],value[1]);
          sel([value0,value1]);
          // calendar([morenTT,morenTT2],value[0],value[1])
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

        relation([morenTT,morenTT2],this.morenT,this.morenT2);
        calendar([morenTT,morenTT2],this.morenT,this.morenT2);
        lineBar(morenTT2);
        sel([morenTT,morenTT2]);
    }

});

//联系人特征
var myChart1;
var myChart2;
var myChart3;
var myChart4;
var myChart5;

var targetPhoneNo86=$("#targetPhone").val().slice(-11);
var targetPhoneHide4="SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);
//当前重点人员
var showPersonInfo = targetPhoneHide4;
//showPersonInfo = "SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);
//涉案类型
var type = $("#suspectType").val();
if(type!=''){
    showPersonInfo += "&nbsp;&nbsp;&nbsp;"+type+"人员";
}
$('#tit-person').html(showPersonInfo);

var arr=[];
Date.prototype.format = function() {
    var s = '';
    var mouth = (this.getMonth() + 1)>=10?(this.getMonth() + 1):('0'+(this.getMonth() + 1));
    var day = this.getDate()>=10?this.getDate():('0'+this.getDate());
    s += this.getFullYear() + '/'; // 获取年份。
    s += mouth + "/"; // 获取月份。
    s += day; // 获取日。
    return (s); // 返回日期。
};
function getAll(begin, end) {
    var ab = begin.split("-");
    var ae = end.split("-");
    var db = new Date();
    db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
    var de = new Date();
    de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
    var unixDb = db.getTime();
    var unixDe = de.getTime();
    for (var k = unixDb; k <= unixDe;) {
        arr.push((new Date(parseInt(k))).format()) ;
        k = k + 24 * 60 * 60 * 1000;
    }
    return arr;
}

//联系人特征2个Echart图是用的同一接口
function relation(time,val1,val2){
    var targetPhone=$("#targetPhone").val();
    contacts();
    pcher();
    $.ajax({
        type:"GET",
        url:window.ctx+"/beta/relationGraph",
        data: {"targetPhone":targetPhone,"startTime":time[0],"endTime":time[1]},
        dataType:"json",
        success:function (data) {
            contacts(data,val1,val2);
            pcher(data);
            myChart1.hideLoading();
            myChart2.hideLoading();
        }
    });
}

//联系人特征---力图
function contacts(graph,val1,val2){
    if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
        myChart1.dispose();
    }

    myChart1 = echarts.init(document.getElementById('barEchart01'));
    myChart1.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });

    if(graph){
        var mynode=[];
        function sortExp(a,b){
            return b.exp-a.exp
        }
        //排序 并且 找到max
        graph.nodes.sort(sortExp);
        var brr1=[];
        var brr2=[];
        var brr3=[];
        var max1,max2,max3;
        var nodeNum = graph.nodes.length>=10?10: graph.nodes.length;//只显示top10，所以只循环前10个即可
        for(var i=0;i<nodeNum;i++){
            mynode.push(graph.nodes[i]);
            if(graph.nodes[i].tag ==="重点人员"){
                brr3.push(graph.nodes[i]);
            }
            if(graph.nodes[i].category===1){
                brr1.push(graph.nodes[i]);

            }else if(graph.nodes[i].category===2){
                brr2.push(graph.nodes[i]);
            }
        }

        getAll(val1,val2);

        var num=Number(((graph.nodes.length/arr.length)*30-240)/240*100).toFixed(1);
        if (num > 0){
            num ="\u2191" + num;
        }else{
            num=Math.abs(num);
            num="\u2193" + num
        }
        $('.perNum').html(graph.nodes.length+"个&nbsp;&nbsp;["+num+"%]");
        //graph.nodes = mynode;
        var links=[];
        //构建的当前人，category=0
        var crtPerNode = {"category":0,"name":targetPhoneHide4,"exp":1,"tag":"当前人员"};
        mynode.push(crtPerNode);

        mynode.forEach(function (node) {
            node.value = Number(node.exp).toFixed(3);

            node.label = {
                normal: {
                    show: false
                }
            };
            node.isnode = true;

            //选择一度二度联系人 构造边
            if(node.category!==0){
                node.name="SE"+node.name.slice(-12);
                var link;
                if(node.tag==="重点人员"){
                    link = {"source":targetPhoneHide4,"target":node.name,"lineStyle": {
                            normal: {
                                color: '#48a750',
                                curveness: 0 // 线的弯曲度 0-1之间 越大则歪曲度更大
                            }
                        }};
                }else if(node.category===1){
                    link = {"source":targetPhoneHide4,"target":node.name,"lineStyle": {
                            normal: {
                                color: '#38f',
                                curveness: 0 // 线的弯曲度 0-1之间 越大则歪曲度更大
                            }
                        }};
                }else {
                    link = {"source":targetPhoneHide4,"target":node.name};
                }

                links.push(link);
            }

            //设置大小
            //设置一般人员
            //设置当前人员
            if(node.category === 0){
                node.symbolSize = 80;
                node.symbol='image://static/dist/img/old/u-35.png';
                node.itemStyle = {
                    normal: {
                        color: 'rgba(255,255,255,0)', //圆点的颜色
                        backgroundColor: '#404359',
                        padding: [2, 4],
                        label: {
                            backgroundColor: 'rgba(255,255,255,0)',
                            position: 'bottom',
                            textStyle: {
                                color: 'rgba(255,255,255,0)'
                            }
                        }
                    }
                };
            }else{
                if(node.tag === "一般人员"){
                    switch(node.category){
                        case 1://一度联系人
                            node.symbolSize = 30+50*node.exp;


                            node.symbol='image://static/dist/img/old/u-35.png';
                            node.itemStyle = {
                                normal: {
                                    color: 'rgba(255,255,255,0)', //圆点的颜色
                                    backgroundColor: '#404359',
                                    padding: [2, 4],
                                    label: {
                                        backgroundColor: 'rgba(255,255,255,0)',
                                        position: 'bottom',
                                        textStyle: {
                                            color: 'rgba(255,255,255,0)'
                                        }
                                    }
                                }
                            };
                            break;
                        case 2://二度联系人
                            node.symbolSize = 30+50*node.exp;

                            node.symbol='image://static/dist/img/old/u-38.png';
                            node.itemStyle = {
                                normal: {
//                                            color: '#090',
                                    color: 'rgba(255,255,255,0)', //圆点的颜色
                                    label: {
                                        backgroundColor: 'rgba(255,255,255,0)',
                                        position: 'bottom',
                                        textStyle: {
                                            color: 'rgba(255,255,255,0)'
                                        }
                                    }
                                },
                                emphasis: {
                                    color: "#000"
                                }
                            };
                            break;

                    }

                }else if(node.tag === "重点人员"){
                    node.symbolSize = 30+50*node.exp;

                    node.symbol='image://static/dist/img/old/u-41.png';
                    node.itemStyle = {
                        normal: {
                            color: 'rgba(255,255,255,0)', //圆点的颜色
                            label: {
                                backgroundColor: 'rgba(255,255,255,0)',
                                position: 'bottom',
                                textStyle: {
                                    color: 'rgba(255,255,255,0)'
                                }
                            }
                        },
                        emphasis: {
                            color: "#000"
                        }
                    };

                }
            }

        });

        option = {
            tooltip: {
                show: true,
                textStyle : {
                    color: '#2196f3',
                    decoration: 'none',
                    fontSize: 14
                },
                formatter: function (params ) {
                    if(params.data.isnode){
                        if(params.data.tag=='重点人员'){
                            var name = params.name.slice(0,5)+"****"+params.name.slice(9,13);
                            return name+'<br />'+params.data.tag+' '+params.value;
                        }else{
                            return params.name+'<br />'+params.data.tag+' '+params.value;
                        }
                    }else {
                        //手机号要隐去中间4位
                        var source = params.data.source;
                        var target=params.data.target;
                        if(source.length==13){
                            source = source.slice(0,5)+"****"+source.slice(9,13);
                        }

                        if(target.length==13){
                            target = target.slice(0,5)+"****"+target.slice(9,13);
                        }

                        return source+" > "+target;
                    }
                }
            },
            animation: true,
            title: {
                text: 'Top10核心联系人',
                top:'0',
                left:'40%',
            },
            series: [{
                type: 'graph',
                layout: 'force',
                symbol: "circle",
                symbolSize: 40,//自定义图 大小 设置值
                roam: false, //禁止用鼠标滚轮缩小放大效果
                edgeSymbolSize: [0, 6],
                // 连接线上的文字
                focusNodeAdjacency: true, //划过只显示对应关系
                edgeLabel: {
                    normal: {
                        show: false,
                        textStyle: {
                            fontSize: 20,
                            color: '#237cc8',
                            padding: [2, 4],
                            borderRadius: 2
                        },
                        formatter: "{c}"
                    }
                },
                lineStyle: {
                    normal: {
                        opacity: 1,
                        width: 1,
                        curveness: 0
                    }
                },
                force: {
                    repulsion: 500
                },
                data: mynode,
                links: links,
            }]
        };
        myChart1.setOption(option);
    }

    
}

//联系人特征---饼图
function pcher(data){
    if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
        myChart2.dispose();
    }

    myChart2 = echarts.init(document.getElementById('barEchart02'));
    myChart2.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });

    if(data){
        var pie1 = [];
        pie1[0]=0;pie1[1]=0;
        var pie2 = [];
        pie2[0]=0;pie2[1]=0;
        data.nodes.forEach(function (node) {
            if(node.category===1){
                pie1[0]++;
            }else if(node.category===2){
                pie1[1]++;
            }
            if(node.tag==="一般人员"){
                pie2[0]++;
            }else if(node.tag==="重点人员"){
                pie2[1]++;
            }
        });

        // var pie1=[301, 132];
        // var pie2=[431, 2];
        //画图
        option = {
            tooltip: {
                trigger: 'item',
                formatter: "{a}{b}: {c} ({d}%)"
            },
            title: {
                text: '联系人属性分布',
                top:'0',
                left:'40%',
            },
            series: [
                {
                    name:'',
                    type:'pie',
                    selectedMode: 'single',
                    radius: [0, '30%'],
                    color:['#237dc8','#3a3e52'] ,
                    label: {
                        normal: {
                            position: 'inner'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:pie1[0], name:'一度联系人'},
                        {value:pie1[1], name:'二度联系人'}
                    ]
                },
                {
                    name:'',
                    type:'pie',
                    radius: ['40%', '55%'],
                    color:['#404359','#4caf50'] ,
                    label: {
                        normal: {
                            formatter: '{a|{a}}{abg|}{b|{b}：}{c|{c}} {per|{d}%}  ',
                            backgroundColor: '#404359',
                            borderColor: '#404359',
                            borderWidth: 1,
                            borderRadius: 6,
                            shadowColor: '#999',
                            padding: [0, 7],
                            rich: {
                                a: {
                                    color: '#237cc8',
                                    lineHeight: 22,
                                    align: 'center'
                                },
                                abg: {
                                    color: '#237cc8',
                                },
                                b: {
                                    fontSize: 14,
                                    lineHeight: 33,
                                    color: '#237cc8',
                                },
                                c: {
                                    color: '#237dc8',
                                    fontSize: 14,
                                },
                                per: {
                                    color: '#fff',
                                    backgroundColor: '#237dc8',
                                    padding: [2, 4],
                                    borderRadius: 2
                                }
                            }
                        }
                    },
                    data:[
                        {value:pie2[0], name:'一般人员'},
                        {value:pie2[1], name:'重点人员'}
                    ]
                }
            ]
        };
        myChart2.setOption(option);
    }

}

//通话特征---日期热力图
function calendar(timerange,startTime,endTime){
    
    if (myChart3 !== null && myChart3 !== "" && myChart3 !== undefined) {
        myChart3.dispose();
    }
    myChart3 = echarts.init(document.getElementById('barEchart03'));
    myChart3.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });

    var targetPhone=$("#targetPhone").val();
    var Nowyear=new Date();
    $.ajax({
        type: "GET",
        url: window.ctx + "/beta/dairyDuration",
        data: {"targetPhone": targetPhone, "startTime": timerange[0], "endTime": timerange[1]},
        dataType: "json",
        async: true,
        success:function(res){
            myChart3.hideLoading();

            var len = res.duration.length;
            var dulen=0;
            var num2=0;
            for(var d = 0;d < len;d++){
                dulen = dulen + res.duration[d];
            }
            num2=dulen/(20*len)*100;
            num2=num2.toFixed(1);
            if (num2 > 0){
                num2 ="\u2191" + num2;
            }else{
                num2=Math.abs(num2);
                num2="\u2193" + num2;
            }

            $('.telNum').html(+Number(dulen).toFixed(2)+" min&nbsp;&nbsp;["+num2+"%]");


            var Talkmax=Math.max.apply(null,res.duration);
            var Talkmin=Math.min.apply(null,res.duration);
            var nowyear=Nowyear.getFullYear();
            var oldyear=nowyear-1;
            function getVirtulData(year,startTime,endTime) {
                year = year || oldyear;
                //展示该年的前后2年数据
                var date = +echarts.number.parseDate(year-2 + '-01-01');
                var end = +echarts.number.parseDate((+year + 2) + '-01-01');
                var dayTime = 3600 * 24 * 1000;
                var data = [];
                for (var time = date; time < end; time += dayTime) {
                    data.push([
                        echarts.format.formatTime('yyyy-MM-dd', time),
                        null
                    ]);
                }
                // console.log(data);
                for(var i=0;i<data.length;i++){
                    if(data[i][0]==startTime){
                        for(var j=0;j<res.duration.length;j++){
                            data[i+j][1]=res.duration[j].toFixed(2);
                        }
                    }
                }
                return data;
            }
            option = {
                title: {

                    text: '通话日历热力图',
                    left: 'center',
                    top:'1%',
                    textStyle: {
                        color: '#2196f3',
                    }
                },
                tooltip: {
                    // formatter: '{b0}: {c0}<br />{b1}: {c1}'
                    // formatter:'日期：{b0}通话时间:{c0}'
                    formatter: function (params) {
                        // console.log(params.data)
                        return "日期："+params.data[0]+"<br/>通话时间:  "+params.data[1]+" min";
                    }
                },
                visualMap: {
                    show:false,
                    min: Talkmin,
                    max: Talkmax,
                    splitNumber: 5,
                    color: ['#027ad4','#43b0fe','#c3d8e6'],
                    textStyle: {
                        color: '#fff'
                    }
                },

                calendar: [
                    {
                        right:'5%',
                        range: [nowyear+"-01-01",nowyear+"-06-30"],
                        cellSize: ['auto', 20],
                        dayLabel:{
                            color:"#333"
                        },
                        monthLabel:{
                            color:"#333"
                        },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#999',
                                width: 2,
                                type: 'solid'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#3b3e51',
                                borderWidth: 1,
                                borderColor: '#282937'
                            }
                        }
                    },
                    {
                        right:'5%',
                        top: 240,
                        range: [oldyear+"-07-01",oldyear+"-12-31"],
                        cellSize: ['auto', 20],
                        dayLabel:{
                            color:"#333"
                        },
                        monthLabel:{
                            color:"#333"
                        },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#999',
                                width: 2,
                                type: 'solid'
                            }
                        },
                        itemStyle: {
                            normal: {
                                color: '#3b3e51',
                                borderWidth: 1,
                                borderColor: '#282937'
                            }
                        }
                    }],

                series: [{
                    type: 'heatmap',
                    coordinateSystem: 'calendar',
                    calendarIndex: 0,
                    data: getVirtulData(nowyear,startTime,endTime)
                    // data:getVirtulData(2018,"2018-04-30","2018-05-30")
                }, {
                    type: 'heatmap',
                    coordinateSystem: 'calendar',
                    calendarIndex: 1,
                    data: getVirtulData(oldyear,startTime,endTime)
                    // data:getVirtulData(2017,"2018-04-30","2018-05-30")
                }]

            };
            myChart3.setOption(option);
            myChart3.off('click');
            myChart3.on('click', function (params) {
                var day = params.data[0].replace(/-/g,"");
                lineBar(day);

            });
        }
    })


    // var res={"duration":[0.5833333333333334,0,0,0,3.1166666666666667,0,3.5166666666666666,3.8666666666666667,1.1333333333333333,1.3666666666666667,8.316666666666666,5.616666666666666,11.8,6.383333333333334,5.25,4.45,7.1,7.516666666666667,18.333333333333332,4.95,2.05,15.316666666666666,4.5,0,0,0,0,0,0,0,0]};

}

//柱状图&&折线图
function lineBar(searchTime){
    
    if (myChart4 != null && myChart4 != "" && myChart4 != undefined) {
        myChart4.dispose();
    }
    myChart4 = echarts.init(document.getElementById('barEchart04'));
    var targetPhone=$("#targetPhone").val();
    myChart4.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });

    $.ajax({
        type: "GET",
        url: window.ctx+"/beta/dayDuration",
        data: {"targetPhone":targetPhone,"searchTime":searchTime},
        dataType: "json",
        success:function(data){
            myChart4.hideLoading();
            for(var i = 0;i<data.duration.length;i++ ){
                data.duration[i]= data.duration[i].toFixed(2);
            }
            option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {type: 'cross'}
                },
                legend: {
                    data:['时长','次数'],
                    textStyle : {
                        color: '#d5d7d8',
                        decoration: 'none',
                    }
                },
                xAxis: [
                    {
                        type: 'category',
                        data: ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23'],
                        axisLine:{
                            lineStyle:{
                                color:'#a4a5aa',
                                width:1 //这里是为了突出显示加上的
                            }
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        splitLine:{show: false},
                        name: '时长',
                        min: 0,
                        max: 60,
                        interval: 5,
                        axisLabel: {
                            formatter: '{value} min',
                            show: true,
                            textStyle: {
                                color: '#a4a5aa'
                            }
                        },
                        axisLine:{
                            lineStyle:{
                                color:'#a4a5aa'
                            }
                        }
                    },
                    {
                        type: 'value',
                        name: '次数',
                        axisLabel: {
                            formatter: '{value} ',
                            show: true,
                            textStyle: {
                                color: '#a4a5aa'
                            }
                        },
                        axisLine:{
                            lineStyle:{
                                color:'#a4a5aa'
                            }
                        },
                        splitLine:{
                            show:false
                        }
                    }
                ],
                grid: {
                    left: '3%',
                    right: '3%',
                    bottom: '3%',
                    top:"18%",
                    containLabel: true
                },
                series: [
                    {
                        name:'时长',
                        type:'bar',
                        // data:[0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.58,0.00,0.00,0.00,0.00,0.00,0.00],
                        data:data.duration,
                        barWidth: 15,
                        itemStyle:{
                            normal:{
                                color:'#237cc8'
                            }
                        }
                    },
                    {
                        name:'次数',
                        type:'line',
                        yAxisIndex: 1,
                        // data:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0],
                        data: data.count,
                        barWidth: 1,
                        itemStyle:{
                            normal:{
                                color:'rgba(197,221,241,0.7)'
                            }
                        }
                    }
                ]
            };
            myChart4.setOption(option);
        }
    })


}

// 热力图

function sel(time){
    reliMap(time,$(".select").val());
    $(".select").change(function(){
        reliMap(time,$(".select").val());
    })
}
function reliMap(time,chose){
    if (myChart5 != null && myChart5 != "" && myChart5 != undefined) {
        myChart5.dispose();
    }
    // 基于准备好的dom，初始化echarts图表
    myChart5 = echarts.init(document.getElementById('barEchart05'));
    var targetPhone=$("#targetPhone").val();
    myChart5.showLoading({
        text: 'loading...',
        color: '#2196f3',
        textColor: '#2196f3',
        maskColor: 'transparent',
        zlevel: 0,
    });

    $.ajax({
        type: "GET",
        url: window.ctx + "/location/getHeatMap",
        data: {"targetPhone": targetPhone, "startTime": time[0], "endTime": time[1], "type": chose},
        dataType: "json",
        async: true,
        success:function(data){

            myChart5.hideLoading();

            var myGeo = new BMap.Geocoder();
            var often = data.map(function (seg) {
                return seg.coord;
            });
            // console.log(often);
            var len=often.length;
            // $("#address").val("");
            var arr2=[]
            //地图获取地点位置这个接口是异步进行的，这里使用的是设置定时器延迟5秒，
            //但有个小BUG，如果数据太大，或者信号不好，超过5秒后还没生成完数据，
            //常活动区域就用这5秒内产生的地点进行选择，而不是所有数据。
            for(var i=0;i<len;i++){
                myGeo.getLocation(new BMap.Point(often[i][0], often[i][1]), function(result){
                    // $("#address").val(result.addressComponents.district+","+$("#address").val());
                    arr2.push(result.addressComponents.district)
                });
            };
            setTimeout(function(){
                console.log(arr2);
                var res = {};
                // 遍历数组
                for (var i=0;i<arr2.length;i++) {
                    if (!res[arr2[i]]) {
                        res[arr2[i]] = 1
                    } else {
                        res[arr2[i]]++
                    }
                }
                // console.log(res);
                // 遍历 res
                var keys = Object.keys(res);
                var maxNum = 0,secNum=0, maxEle,secEle;
                for (var i=0;i<keys.length;i++) {
                    if (res[keys[i]] > maxNum) {
                        maxNum = res[keys[i]];
                        maxEle = keys[i];
                    }else if(res[keys[i]] > secNum){
                        secNum = res[keys[i]];
                        secEle = keys[i];
                    }
                }
                if(!len){
                    $('.addNum').html("");
                }else{
                    if(!secEle){
                        $('.addNum').html(maxEle);
                    }else{
                        $('.addNum').html(maxEle+","+secEle);
                    }
                }
            },5000)



            var points = data.map(function (seg) {
                return seg.coord.concat(1);
            });

            option = {
                animation: false,
                bmap: {
                    center: [121.477208, 31.23152],
                    zoom: 10,
                    roam: 'move'

                },
                visualMap: {
                    show: false,
                    top: 'top',
                    min: 0,
                    max: 5,
                    seriesIndex: 0,
                    calculable: true,
                    inRange: {
                        color: ['blue', 'blue', 'green', 'yellow', 'red']
                    }
                },
                series: [{
                    type: 'heatmap',
                    coordinateSystem: 'bmap',
                    data: points,
                    pointSize: 5,
                    blurSize: 6
                }]
            };
            myChart5.setOption(option);
            // 添加百度地图插件
            var bmap = myChart5.getModel().getComponent('bmap').getBMap();

            //变颜色
            bmap.setMapStyle({style:'grayscale'});//灰色皮肤
            bmap.addControl(new BMap.MapTypeControl({
                mapTypes:[
                    BMAP_NORMAL_MAP
                ]
            }));
        }
    })
    // points=[[121.42722,31.21944,1],[121.42167,31.21278,1],[121.42342,31.22018,1],[121.42167,31.21278,1],[121.412064,31.214897,1],[121.41192,31.21782,1],[121.42402,31.20622,1],[121.42228,31.20025,1],[121.43356,31.19635,1],[121.43356,31.19635,1],[121.42167,31.21278,1],[121.42722,31.21944,1],[121.43583,31.20778,1],[121.42722,31.21944,1],[121.43806,31.21681,1],[121.4155556,31.22055556,1],[121.43332,31.21072,1],[121.4187,31.19832,1],[121.432822,31.220543,1],[121.43806,31.21681,1],[121.42722,31.21944,1],[121.432822,31.220543,1],[121.43806,31.21681,1],[121.412064,31.214897,1],[121.42722,31.21944,1],[121.42402,31.20622,1],[121.412064,31.214897,1],[121.4155556,31.22055556,1],[121.42402,31.20622,1],[121.4155556,31.22055556,1],[121.4155556,31.22055556,1],[121.407074,31.214736,1],[121.42167,31.21278,1],[121.417482,31.227097,1],[121.42342,31.22018,1],[121.42167,31.21278,1],[121.42722,31.21944,1],[121.6328,31.30666,1],[121.41389,31.20528,1],[121.4155556,31.19305556,1],[121.4122222,31.21194444,1],[121.43332,31.21072,1],[121.43332,31.21072,1],[121.432822,31.220543,1],[121.4122222,31.21194444,1],[121.43306,31.22417,1],[121.42167,31.21278,1],[121.412064,31.214897,1],[121.4288611,31.21716667,1],[121.42722,31.21944,1],[121.42722,31.21944,1],[121.4288611,31.21716667,1],[121.42722,31.21944,1],[121.4288611,31.21716667,1]];

}