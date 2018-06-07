<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>概览</title>
    <link rel="shortcut icon" href="${img}/ddlogo.ico">
    <link rel="stylesheet" href="${css}/ele-ui.css" />
    <link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${css}/base.css" />
    <link rel="stylesheet" href="${css}/style.css" />
    <link rel="stylesheet" href="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.css" />
    <script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.js" ></script>
    <script type="text/javascript" src="${js}/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" ></script>
    <script type="text/javascript" src="${js}/echarts.js" ></script>
    <%--<script type="text/javascript" src="${js}/change.js" ></script>--%>
    <script type="text/javascript" src="${js}/ZUONbpqGBsYGXNIYHicvbAbM.js" ></script>
    <script type="text/javascript" src="${js}/bmap.js" ></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <script src="${js}/vue.js"></script>
    <script src="${js}/ele-ui.js"></script>
    <script>
        $(function(){
            $('input.datetimepicker').datetimepicker({
                format: 'yyyy-mm-dd hh:ii',
                language:'zh-CN'
            });
            $("#navList li").removeClass("active");
            $("#navList li:eq(0)").addClass("active");
            $("#img1").attr("src","${img}/u-03c.png");
            $("#img2").attr("src","${img}/u-04.png");
            $("#img3").attr("src","${img}/u-05.png");

        })
    </script>
</head>
<body>

<div class="container-fluid smartEyes-container">
    <input type="hidden" value="${targetPhone}" id="targetPhone"/>
    <input type="hidden" value="" id="address"/>
    <jsp:include page="/WEB-INF/common/head.jsp"/>

    <div class="row searchBox">
        <div class="col-lg-12 col-md-12 col-xs-12 namelist clearfix">
            <div class="pull-left namelistcc">
                <%--<span>当前重点人员：</span>--%>
                <%--<span id="tit-person">张*强  3101001986  疑似涉毒人员</span>--%>
                <span>当前重点人员：</span>
                <span id="tit-person"></span>
            </div>
            <div class="pull-right text-right input-group col-lg-5 col-md-5 col-xs-5">
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
        <%--图表展示--%>
        <div class="col-lg-12 col-md-12 col-xs-12 echartBox">
            <!--图表展示列表-->
            <div class="g-viewlist">
                <!--联系人特征-->
                <div class="g-viewlistHead clearfix">
                    <h2 class="pull-left">联系人特征</h2>
                    <%--<p class="pull-left">有效联系人147个[高于/低于均值60%]</p>--%>
                    <p class="pull-left" id="p1"></p>
                    <a href="${ctx}/contact?targetPhone=${targetPhone}" class="pull-right more"><i><img src="${img}/more.png"></i>更多</a>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 g-viewlist-EcBox">
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-right: 0;">
                        <!--关系图-->
                        <div class="g-viewlist-gx" id="relation" style="width: 100%; height: 100%;padding-top: 28px">

                            <!--<img src="img/u-30.png" />
                            -->
                        </div>
                        <p class="g-import-title" style="left: 42%;top: 28px;color: #2196f3;position: absolute;">Top10核心联系人</p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-left: 0;">
                        <!--饼状图-->
                        <div class="g-viewlist-bz" id="pcher" style="ovwidth: 100%; height: 100%;padding-top: 48px">
                            <!---->
                        </div>
                        <p class="g-import-title" style="left: 42%;top: 28px;color:#2196f3;position: absolute;" >联系人属性分布</p>
                    </div>
                </div>

            </div>
            <div class="g-viewlist">
                <!--通话特征-->
                <div class="g-viewlistHead clearfix">
                    <h2 class="pull-left">通话特征</h2>
                    <%--<p class="pull-left" id="p2">通话总时长：1140 min</p>--%>
                    <p class="pull-left" id="p2"></p>
                    <a href="${ctx}/contact?targetPhone=${targetPhone}" class="pull-right more"><i><img src="${img}/more.png"></i>更多</a>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 g-viewlist-EcBox">
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-right: 0;">
                        <!--日历热力图-->
                        <div class="g-viewlist-gx"  id="calendar" style="width: 100%; height: 100%;">
                            <!--<img src="img/u-32.png" />-->
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6 pull-left g-viewlist-l" style="padding-left: 4%;">
                        <!--柱状图-->
                        <div class="g-viewlist-bz" id="lineBar" style="width: 100%; height: 100%;top:20px">
                            <!--<img src="img/u-33.png" />-->
                        </div>
                    </div>
                </div>

            </div>
            <div class="g-viewlist">
                <!--区域特征-->
                <div class="g-viewlistHead clearfix">
                    <h2 class="pull-left">区域特征</h2>
                    <p class="pull-left" id="p3"></p>
                    <%--<p class="pull-left" id="p3">常活动区域：青浦区、闵行区</p>--%>
                    <a href="${ctx}/region?targetPhone=${targetPhone}" class="pull-right more"><i><img src="${img}/more.png"></i>更多</a>
                    <select class="pull-right select" style="position: relative;top:10px">
                        <option value="allday">全天</option>
                        <option value="morning">上午</option>
                        <option value="afternoon">下午</option>
                        <option value="evening">晚上</option>
                    </select>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12 g-viewlist-EcBox" style="padding: 0;">
                    <div class="col-lg-12 col-md-12 col-xs-12 pull-left g-viewlist-l" style="padding-right: 0; height: 530px; padding: 0;">
                        <!--热力图-->
                        <div class="g-viewlist-gx" id="thermodynamicChart" style="width: 100%; height: 100%;">

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!--底部-->
    <footer style="position: relative; margin-top: 45px;"><p class="text-center">© 2017 SmartEyes | 猎犬上海网安版</p></footer>
    <script>
    	var targetPhoneNo86=$("#targetPhone").val().slice(-11);
    	var targetPhoneHide4="SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);
		//当前重点人员
		var showPersonInfo = targetPhoneHide4;
		//showPersonInfo = "SE"+targetPhoneNo86.slice(0,3)+"****"+targetPhoneNo86.slice(7,11);
		//涉案类型
		var type = '${suspectType}';
		if(type!=''){
		    showPersonInfo += "&nbsp;&nbsp;&nbsp;"+type+"人员";
		}
		$('#tit-person').html(showPersonInfo);
		
        var myChart1;
        var myChart2;
        var myChart3;
        var myChart4;
        var myChart5;
        var myDate = new Date();
        var myyear = ""+myDate.getFullYear();    //获取完整的年份(4位,1970-????)


        var timerange;
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

                    timerange = [value0,value1];
                    calendar(timerange,value[0],value[1]);
                    contacts(timerange,value[0],value[1]);
                    //relation(timerange,value[0],value[1]);
                    //pcher(timerange);
                    map02(timerange);
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
                contacts([morenTT,morenTT2],this.morenT,this.morenT2);
                //relation([morenTT,morenTT2],this.morenT,this.morenT2);
                //pcher([morenTT,morenTT2]);
                calendar([morenTT,morenTT2],this.morenT,this.morenT2);
                lineBar(morenTT);
//              lineBar("20171206");
                map02([morenTT,morenTT2]);
            }

        });

        Date.prototype.format = function() {
            var s = '';
            var mouth = (this.getMonth() + 1)>=10?(this.getMonth() + 1):('0'+(this.getMonth() + 1));
            var day = this.getDate()>=10?this.getDate():('0'+this.getDate());
            s += this.getFullYear() + '/'; // 获取年份。
            s += mouth + "/"; // 获取月份。
            s += day; // 获取日。
            return (s); // 返回日期。
        };
        // getAll传入的数据样式为(2018-3-5,2018-03-15)
        var arr=[];
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
        //联系人特征
        function contacts(timerange,val1,val2){
        	if (myChart1 != null && myChart1 != "" && myChart1 != undefined) {
                myChart1.dispose();
            }
            if (myChart2 != null && myChart2 != "" && myChart2 != undefined) {
                myChart2.dispose();
            }
        	myChart1 = echarts.init(document.getElementById('relation'));
        	myChart1.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
        	});
        	myChart2 = echarts.init(document.getElementById('pcher'));
        	myChart2.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
        	});
        	var targetPhone=$("#targetPhone").val();
        	$.ajax({
                type:"GET",
                url:window.ctx+"/beta/relationGraph",
                <%--url:"${js}/data/gxt.json",--%>
                data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
//                data: {"targetPhone":targetPhone,"startTime":"20171222","endTime":"20171222"},
                dataType:"json",
                success:function (data) {
                	myChart1.hideLoading();
                	myChart2.hideLoading();
                	
                	relation(data,val1,val2);
                	pcher(data);
                }
             });
        }
        //联系人特征---关系图
        function relation(graph,val1,val2){
            myChart1 = echarts.init(document.getElementById('relation'));
           
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
                    

            arr=[];
            getAll(val1,val2);
            // var num = Number((vacon-avg)/avg*100).toFixed(1);
            var num=Number(((graph.nodes.length/arr.length)*30-240)/240*100).toFixed(1);
            if (num > 0){
                num ="\u2191" + num;
            }else{
                num=Math.abs(num);
                num="\u2193" + num
            }
            $('#p1').html("有效联系人"+graph.nodes.length+"个&nbsp;&nbsp;["+num+"%]");
            
			//graph.nodes = mynode;
            var links=[];
            //构建的当前人，category=0
            var crtPerNode = {"category":0,"name":targetPhoneHide4,"exp":1,"tag":"当前人员"};
            mynode.push(crtPerNode);

            mynode.forEach(function (node) {
            	node.value = Number(node.exp).toFixed(3);

                node.label = {
                    normal: {
                        show: true
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
                    node.symbol='image://${img}/u-35.png';
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
                                    

                            node.symbol='image://${img}/u-35.png';
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
                                   
                             node.symbol='image://${img}/u-38.png';
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
                                    
                         node.symbol='image://${img}/u-41.png';
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
                       // 圆圈内的文字
                       label: {
                           normal: {
                               show: true
                           }
                       },
                       force: {
//                        repulsion: 2000
                          repulsion: 1000
                       },
                       data: mynode,
                       links: links
                   }]
             };
            myChart1.setOption(option);
            
        }


        //联系人特征---饼图
        function pcher(data){
            myChart2 = echarts.init(document.getElementById('pcher'));

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

            //画图
            option = {
               tooltip: {
                   trigger: 'item',
                   formatter: "{a}{b}: {c} ({d}%)"
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


        //通话特征---日期热力图
        function calendar(timerange,startTime,endTime){
            var targetPhone=$("#targetPhone").val();
            if (myChart3 !== null && myChart3 !== "" && myChart3 !== undefined) {
                myChart3.dispose();
            }
            myChart3 = echarts.init(document.getElementById('calendar'));
        	myChart3.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
        	});

            var Nowyear=new Date();
            // Nowyear.getFullYear()

            $.ajax({
                type: "GET",
                url: window.ctx+"/beta/dairyDuration",
                data: {"targetPhone":targetPhone,"startTime":timerange[0],"endTime":timerange[1]},
                dataType: "json",
                async:true,
                success: function (res) {

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

                    // $('#p2').html("通话总时长："+Number(dulen).toFixed(2)+" min&nbsp;&nbsp;[相对于均值"+num2+"%]");
                    $('#p2').html("通话总时长："+Number(dulen).toFixed(2)+" min&nbsp;&nbsp;["+num2+"%]");
                    // "有效联系人"+vacon+"个[相对于均值"+num+"%]"

                    // console.log(res.duration);
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
                    // console.log( getVirtulData(nowyear,startTime));
                    option = {
                        title: {

                            text: '通话日历热力图',
                            left: 'center',
                            top:'3%',
                            textStyle: {
                                color: '#2196f3',
                                fontSize:14,
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
                                    color:"#eee"
                                },
                                monthLabel:{
                                    color:"#eee"
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
                                top: 260,
                                range: [oldyear+"-07-01",oldyear+"-12-31"],
                                cellSize: ['auto', 20],
                                dayLabel:{
                                    color:"#eee"
                                },
                                monthLabel:{
                                    color:"#eee"
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
                        }, {
                            type: 'heatmap',
                            coordinateSystem: 'calendar',
                            calendarIndex: 1,
                            data: getVirtulData(oldyear,startTime,endTime)
                        }]

                    };
                    myChart3.hideLoading();
                    myChart3.setOption(option);
                    myChart3.off('click');
                    myChart3.on('click', function (params) {
                        var day = params.data[0].replace(/-/g,"");
                        // console.log(day)
                        //给2017-1-8变身 20170108
                        //点击事件
                        lineBar(day);

                    });

                },
                error: function () {
                    alert("获取日历图失败，请联系管理员！");
                }
            });




        }
//        calendar("day");



        //柱状图&&折线图
        function lineBar(searchTime){
            var targetPhone=$("#targetPhone").val();
            if (myChart4 != null && myChart4 != "" && myChart4 != undefined) {
                myChart4.dispose();
            }
            myChart4 = echarts.init(document.getElementById('lineBar'));
            myChart4.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
        	});


            $.ajax({
                type: "GET",
                <%--url: "${js}/data/zzt.json",--%>
                url: window.ctx+"/beta/dayDuration",
                data: {"targetPhone":targetPhone,"searchTime":searchTime},
                dataType: "json",
                success: function (data) {
//                    console.log(data);
                    for(var i = 0;i<data.duration.length;i++ ){
                        data.duration[i]= data.duration[i].toFixed(2);
                    }

                    option = {
                        tooltip: {
//                            formatter: function (params) {
//                                return params.value;
//                            },
                            trigger: 'axis',
                            axisPointer: {type: 'cross'}

                        },
                        legend: {
                            data:['时长','次数'],
                            textStyle : {
                                color: '#d5d7d8',
                                decoration: 'none',
                                fontSize: 14
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
                                //自适应
//                                min: 0,
//                                max: 8,
//                                interval: 1,
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
                        series: [
                            {
                                name:'时长',
                                type:'bar',
//                        data:[2.0, 4.9, 7.0, 23.2, 25.6, 40.7, 35.6, 12.2, 32.6, 20.0, 6.4, 3.3,10.6,11,14,15,16,18,12,10,4,5.4,5,6],
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
//                        data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 2.3, 2.4, 2.0, 1.5, 12.0, 6.2,3.3,10.6,11,14,15,16,18,12,10,4,5.4,5,6],
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
                    myChart4.hideLoading();
                    myChart4.setOption(option);

                },
                error: function () {
                    alert("获取失败，请联系管理员！");
                }
            });




        }
//        lineBar("20171206");



        //热力图

        function map02(timerange){


            var tp = $("#targetPhone").val();
            if (myChart5 != null && myChart5 != "" && myChart5 != undefined) {
                myChart5.dispose();
            }
            myChart5 = echarts.init(document.getElementById('thermodynamicChart'));
            myChart5.showLoading({
	            text: 'loading...',
	            color: '#2196f3',
	            textColor: '#2196f3',
	            maskColor: 'transparent',
	            zlevel: 0,
        	});

            $.ajax({
                type:"GET",
                url:window.ctx+"/location/getHeatMap",
                data:{"targetPhone":tp,"startTime":timerange[0],"endTime":timerange[1],"type":$(".select").val()},
                dataType:"json",
                async:true,
                success:function (data) {

                    var myGeo = new BMap.Geocoder();
                    var often = data.map(function (seg) {
                        return seg.coord;
                    });
                    // console.log(often);
                    var len=often.length;
                    $("#address").val("");
                    for(var i=0;i<len;i++){
                        myGeo.getLocation(new BMap.Point(often[i][0], often[i][1]), function(result){
                            $("#address").val(result.addressComponents.district+","+$("#address").val());
                        });
                    };
                    //这里有个小bug，尽管这里设置了延迟5S，但仍然不会等id=address中的val加载完后执行下面代码。
                    setTimeout(function(){
                        var str=$("#address").val();

                        var arr=[];

                        arr=str.split(",");

                        var res = {};
                        // 遍历数组
                        for (var i=0;i<arr.length;i++) {
                            if (!res[arr[i]]) {
                                res[arr[i]] = 1
                            } else {
                                res[arr[i]]++
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
                            $('#p3').html("暂无常活动区域");
                        }else{
                            $('#p3').html("常活动区域："+maxEle);
                        }

                    },5000);

					myChart5.hideLoading();
                    if (myChart5 != null && myChart5 != "" && myChart5 != undefined) {
                        myChart5.dispose();
                    }
                    myChart5 = echarts.init(document.getElementById('thermodynamicChart'));
                    var points = data.map(function (seg) {
                        return seg.coord.concat(1);
                    });
                    // console.log(points);
                    myChart5.setOption(option = {
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
                    });

                    // 添加百度地图插件
                    var bmap = myChart5.getModel().getComponent('bmap').getBMap();

                    //变颜色
                    bmap.setMapStyle({style:'grayscale'});//灰色皮肤
                    bmap.addControl(new BMap.MapTypeControl({
                        mapTypes:[
                            BMAP_NORMAL_MAP
                        ]}));

                },
                error:function () {
                    alert("获取失败，请联系管理员！");

                }
            });
            // console.log($(".select").val())
            $(".select").change(function(){
                // console.log($(".select").val());
                $.ajax({
                    type:"GET",
                    url:window.ctx+"/location/getHeatMap",
                    data:{"targetPhone":tp,"startTime":timerange[0],"endTime":timerange[1],"type":$(".select").val()},
                    dataType:"json",
                    async:true,
                    success:function (data) {
                        if (myChart5 != null && myChart5 != "" && myChart5 != undefined) {
                            myChart5.dispose();
                        }
                        myChart5 = echarts.init(document.getElementById('thermodynamicChart'));

                        var myGeo = new BMap.Geocoder();
                        var often = data.map(function (seg) {
                            return seg.coord;
                        });
                        // console.log(often);
                        var len=often.length;
                        $("#address").val("");
                        for(var i=0;i<len;i++){
                            myGeo.getLocation(new BMap.Point(often[i][0], often[i][1]), function(result){
                                $("#address").val(result.addressComponents.district+","+$("#address").val());
                            });
                        };
                        setTimeout(function(){
                            var str=$("#address").val();
                            // console.log(str);
                            var arr=str.split(",");

                            var res = {};
                            // 遍历数组
                            for (var i=0;i<arr.length;i++) {
                                if (!res[arr[i]]) {
                                    res[arr[i]] = 1
                                } else {
                                    res[arr[i]]++
                                }
                            }
                            // 遍历 res
                            // console.log(res);
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

                            $('#p3').html("常活动区域："+maxEle);
                        },5000);

                        var points = data.map(function (seg) {
                            return seg.coord.concat(1);
                        });
                        // console.log(points);
                        myChart5.setOption(option = {
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
                        });

                        // 添加百度地图插件
                        var bmap = myChart5.getModel().getComponent('bmap').getBMap();
                        //变颜色

                        bmap.setMapStyle({style:'grayscale'});//灰色皮肤
                        bmap.addControl(new BMap.MapTypeControl({
                            mapTypes:[
                                BMAP_NORMAL_MAP
                            ]}));

                    },
                    error:function () {
                        alert("获取失败，请联系管理员！");

                    }
                });
            });

        }


</script>

</body>
</html>