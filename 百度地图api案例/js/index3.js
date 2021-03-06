
$(function(){
    map02();
    $("#btn02").click(function(){
        map02();
    })

    $("#switch").click(function(){
        
        if($(".tab ol").css("left")=='0px'){
            
            $(".tab ol").animate({
                left:"-255px",
            })
            $("#switch").animate({
                left:"0px",
            })
            $("#switch>img").attr("src","img/close.png")
        }else{
            $(".tab ol").animate({
                left:"0px",
            })
            $("#switch").animate({
                left:"255px",
            })
            $("#switch>img").attr("src","img/open.png")
        }
    })

    function mydata(str){
        var n,m;
        // if(str.indexOf("，")>=0){
        //     str=str.replace(/，/ig,',');
        // }
        str=str.replace(/，/ig,',');
        n=str.split(",")[0];
        m=str.split(",")[1];
        return [n,m]
    }

    function map02(){

        var num1=$("input[my-data='num1']").val();
        var num2=$("input[my-data='num2']").val();
        var num3=$("input[my-data='num3']").val();
        var num4=$("input[my-data='num4']").val();
        var num5=$("input[my-data='num5']").val();
        var num6=$("input[my-data='num6']").val();

        var num7=$("input[my-data='num7']").val();
        var num8=$("input[my-data='num8']").val();
        var num9=$("input[my-data='num9']").val();
        var num10=$("input[my-data='num10']").val();
        var num11=$("input[my-data='num11']").val();
        var num12=$("input[my-data='num12']").val();

        var arr1=[num1,num2,num3,num4,num5,num6];
        var arr2=[num7,num8,num9,num10,num11,num12];
       
        function change(arr){
            for(var i=0;i<arr.length;i++){
                if(arr[i]==''){
                    for(var j=i+1;j<arr.length;j++){
                        if(arr[j]!=''){
                            arr[i]=arr[j]
                            break;
                        }
                    }
                }
            }
            for(var i=arr.length-1;i>=0;i--){
                if(arr[i]==''){
                    for(var j=i-1;j>=0;j--){
                        if(arr[j]!=''){
                            arr[i]=arr[j]
                            break;
                        }
                    }
                }
            }
            return arr;
        }
        change(arr1);
        change(arr2);
        
        num1=arr1[0];
        num2=arr1[1];
        num3=arr1[2];
        num4=arr1[3];
        num5=arr1[4];
        num6=arr1[5];

        num7=arr2[0];
        num8=arr2[1];
        num9=arr2[2];
        num10=arr2[3];
        num11=arr2[4];
        num12=arr2[5];

        var chart = echarts.init(document.getElementById('allmap2'));
            
            var bmap = {
                
                roam: true,
                mapStyle: {
                    styleJson: [{
                        "featureType": "all",
                        "elementType": "all",
                        "stylers": {
                            "lightness": 10,
                            "saturation": -100
                        }
                    }]
                }
            }

        var res=[
            [{coord:[mydata(num1)[0],mydata(num1)[1]]},{coord:[mydata(num2)[0],mydata(num2)[1]]}],
            [{coord:[mydata(num2)[0],mydata(num2)[1]]},{coord:[mydata(num3)[0],mydata(num3)[1]]}],
            [{coord:[mydata(num3)[0],mydata(num3)[1]]},{coord:[mydata(num4)[0],mydata(num4)[1]]}],
            [{coord:[mydata(num4)[0],mydata(num4)[1]]},{coord:[mydata(num5)[0],mydata(num5)[1]]}],
            [{coord:[mydata(num5)[0],mydata(num5)[1]]},{coord:[mydata(num6)[0],mydata(num6)[1]]}]
        ];
        var res2=[
            [{coord:[mydata(num7)[0],mydata(num7)[1]]},{coord:[mydata(num8)[0],mydata(num8)[1]]}],
            [{coord:[mydata(num8)[0],mydata(num8)[1]]},{coord:[mydata(num9)[0],mydata(num9)[1]]}],
            [{coord:[mydata(num9)[0],mydata(num9)[1]]},{coord:[mydata(num10)[0],mydata(num10)[1]]}],
            [{coord:[mydata(num10)[0],mydata(num10)[1]]},{coord:[mydata(num11)[0],mydata(num11)[1]]}],
            [{coord:[mydata(num11)[0],mydata(num11)[1]]},{coord:[mydata(num12)[0],mydata(num12)[1]]}]
        ];

        //根据提供的地理区域或坐标设置地图视野，调整后的视野会保证包含提供的地理区域或坐标
		var pointArray=new Array();
		pointArray[0] = new BMap.Point(mydata(num1)[0],mydata(num1)[1]); // 创建坐标
		pointArray[1] = new BMap.Point(mydata(num2)[0],mydata(num2)[1]); // 创建坐标
		pointArray[2] = new BMap.Point(mydata(num3)[0],mydata(num3)[1]); // 创建坐标
		pointArray[3] = new BMap.Point(mydata(num4)[0],mydata(num4)[1]); // 创建坐标
		pointArray[4] = new BMap.Point(mydata(num5)[0],mydata(num5)[1]); // 创建坐标
		pointArray[5] = new BMap.Point(mydata(num6)[0],mydata(num6)[1]); // 创建坐标

		pointArray[6] = new BMap.Point(mydata(num7)[0],mydata(num7)[1]); // 创建坐标
		pointArray[7] = new BMap.Point(mydata(num8)[0],mydata(num8)[1]); // 创建坐标
		pointArray[8] = new BMap.Point(mydata(num9)[0],mydata(num9)[1]); // 创建坐标
		pointArray[9] = new BMap.Point(mydata(num10)[0],mydata(num10)[1]); // 创建坐标
		pointArray[10] = new BMap.Point(mydata(num11)[0],mydata(num11)[1]); // 创建坐标
		pointArray[11] = new BMap.Point(mydata(num12)[0],mydata(num12)[1]); // 创建坐标


        var color = ['#237cc8', '#f4a942'];
        var series = [];
        var series2 = [];

        series=[
            {
                type: 'lines',
                coordinateSystem: 'bmap',
                zlevel: 1,
                effect: {
                    show: true,
                    period: 6,
                    trailLength: 0.7,
                    color: '#fff',
                    symbolSize: 3
                },
                lineStyle: {
                    normal: {
                        color: color[0],
                        width: 0,
                        curveness: 0.2
                    }
                },
                data: res
            },
            {
                type: 'lines',
                coordinateSystem: 'bmap',
                zlevel: 2,
                effect: {
                    show: true,
                    period: 6,
                    trailLength: 0,
                    symbol: "triangle",
                    symbolSize: 8
                },
                lineStyle: {
                    normal: {
                        color: color[0],
                        width: 3,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                data:res
            },
            {
                type: 'effectScatter',
                coordinateSystem: 'bmap',
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                symbolSize: function (val) {
                     return val[2] / 8;
                },
                showEffectOn: 'render',
                itemStyle: {
                    normal: {
                        color: color[0]
                    }
                },
                data : [{value:[mydata(num1)[0],mydata(num1)[1],80]},{value:[mydata(num2)[0],mydata(num2)[1],80]},{value:[mydata(num3)[0],mydata(num3)[1],80]},{value:[mydata(num4)[0],mydata(num4)[1],80]},{value:[mydata(num5)[0],mydata(num5)[1],80]},{value:[mydata(num6)[0],mydata(num6)[1],80]}]    
            },

            // 22222222222222222222222222
            {
                type: 'lines',
                coordinateSystem: 'bmap',
                zlevel: 1,
                effect: {
                    show: true,
                    period: 6,
                    trailLength: 0.7,
                    color: '#fff',
                    symbolSize: 3
                },
                lineStyle: {
                    normal: {
                        color: color[1],
                        width: 0,
                        curveness: 0.2
                    }
                },
                data: res2
            },
            {
                type: 'lines',
                coordinateSystem: 'bmap',
                zlevel: 2,
                effect: {
                    show: true,
                    period: 6,
                    trailLength: 0,
                    symbol: "triangle",
                    symbolSize: 8
                },
                lineStyle: {
                    normal: {
                        color: color[1],
                        width: 3,
                        opacity: 0.4,
                        curveness: 0.2
                    }
                },
                data:res2
            },
            {
                type: 'effectScatter',
                coordinateSystem: 'bmap',
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke'
                },
                label: {
                    normal: {
                        show: true,
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                symbolSize: function (val) {
                     return val[2] / 8;
                },
                itemStyle: {
                    normal: {
                        color: color[1]
                    }
                },
                data : [{value:[mydata(num7)[0],mydata(num7)[1],80]},{value:[mydata(num8)[0],mydata(num8)[1],80]},{value:[mydata(num9)[0],mydata(num9)[1],80]},{value:[mydata(num10)[0],mydata(num10)[1],80]},{value:[mydata(num11)[0],mydata(num11)[1],80]},{value:[mydata(num12)[0],mydata(num12)[1],80]}]    
            }
        ]


        option ={
            bmap:bmap,
            tooltip: {
                trigger: 'item'
            },
            geo: {
                map: 'bmap',
                label: {
                    emphasis: {
                        show: true
                    }
                },
                roam: true,
                zoom:1,
                itemStyle: {
                    normal: {
                        areaColor: '#323c48',
                        borderColor: '#404a59'
                    },
                    emphasis: {
                        areaColor: '#2a333d'
                    }
                }
            },
            series: series
        }

        chart.setOption(option);
        var bmap = chart.getModel().getComponent('bmap').getBMap();
		bmap.setViewport(pointArray);
    }

})
