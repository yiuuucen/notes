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
          allQuery([value0,value1],value[0],value[1]);
          someQuery([morenTT,morenTT2])

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

        allQuery([morenTT,morenTT2],this.morenT,this.morenT2);
        someQuery([morenTT,morenTT2])
    }

});


//第一个echart图
var myChart1;
var myChart2;

var arr=[];
var arr2=[];
var arr3=[];
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
}
function allQuery(time,val1,val2){

    $.ajax({
        type: "GET",
        url: window.ctx+"/log/daysLog",
        data: {"startTime": time[0], "endTime": time[1]},
        dataType: "json",
        success: function (res) {
            arr=[];
            getAll(val1,val2);
            sysEchart1_data(arr,res);
        },
        error: function () {
            console.log("数据错误")
        }
    });
}

function sysEchart1_data(arr,data){

    if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
        myChart1.dispose();
    }

    myChart1 = echarts.init(document.getElementById('barEchart01'));
    if(arr&&data){
        option = {
            title: {
                text: '总查询量',
                bottom:'0',
                left:'40%',
            },
            tooltip: {
                formatter: '{b}<br/>{c} 次',
                trigger: 'axis',
                axisPointer: {
                    animation: false,
                    type: 'cross',
                    label:{
                        color:"rgba(0,0,0,0.6)",
                        backgroundColor:"rgb(222,222,222)"
                    },
                    lineStyle: {
                        color: '#4baa4f',
                        width: 2,
                        opacity: 0.6
                    },
                    crossStyle: {
                        color: 'rgb(0,0,0)',
                        width: 2,
                        opacity: 0.6,
                        type:"solid"
                    }
                }
            },
            grid: {
                left: '3%',
                right: '3%',
                bottom: '10%',
                top:"3%",
                containLabel: true
            },
            xAxis: {
                type: 'category',
                axisLine: { lineStyle: { color: 'rgba(0,0,0,0.6)' } },
                data: arr,
            },
            yAxis: {
                type: 'value',
                splitLine: { show: false },
                axisLine: { lineStyle: { color: 'rgba(0,0,0,0.6)' } },
            },
            series: [{
                data: data,
                type: 'line',
                itemStyle: {
                    normal:{
                        color: '#2196f3'
                    }
                },
                lineStyle: {
                    normal:{
                        color: '#2196f3'
                    }
                },
            }]
        };
        // 为echarts对象加载数据
        myChart1.setOption(option);
    }
    
    // myChart1.showLoading({
    //     text: 'loading...',
    //     color: '#2196f3',
    //     textColor: '#2196f3',
    //     maskColor: 'transparent',
    //     zlevel: 0,
    // });
}


function someQuery(time,val1,val2){

    $.ajax({
        type: "GET",
        url: window.ctx+"/log/personLog",
        data: {"startTime": time[0], "endTime":time[1]},
        dataType: "json",
        success: function (data) {
            // sysEchart2_data(name,number)
            arr2=[];
            arr3=[];
            if(data.length>10){
                for(var i=0;i<data.length;i++){
                    arr2.push(data[i].name);
                    arr3.push(data[i].number);
                }
            }else{
                //如果数据不满10条，则填充name='',number=0,让图形最少显示出10条数据
                var num;
                num=10-data.length;
                for(var i=0;i<data.length;i++){
                    arr2.push(data[i].name);
                    arr3.push(data[i].number);
                }
                for(var j=0;j<num;j++){
                    arr2.unshift("");
                    arr3.unshift("0");
                }
            }
            sysEchart2_data(arr2,arr3)
        },
        error: function () {
            console.log("数据错误")
        }
    });
}
function sysEchart2_data(time){
    if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
        myChart2.dispose();
    }
    // 基于准备好的dom，初始化echarts图表
    myChart2 = echarts.init(document.getElementById('barEchart02'));


    option = {
        title: {
              text: '分用户查询量',
              bottom:'0',
              left:'40%',
        },
        tooltip: {
            formatter: '{b}：{c} 次',
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '3%',
            bottom: '10%',
            top:"3%",
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01],
            splitLine: { show: false },
            axisLine: { lineStyle: { color: 'rgba(0,0,0,0.6)' } },
        },
        yAxis: {
            type: 'category',
            data: arr2,
            axisLine: { lineStyle: { color: 'rgba(0,0,0,0.6)' } },
        },
        series: [
            {
                type: 'bar',
                data: arr3,
                itemStyle: {
                    normal:{
                        color: '#2196f3'
                    }
                },
                lineStyle: {
                    normal:{
                        color: '#2196f3'
                    }
                },
            }
        ]
    };
    // 为echarts对象加载数据
    myChart2.setOption(option);
}