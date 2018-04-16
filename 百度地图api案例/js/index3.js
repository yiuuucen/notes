
$(function(){
    map02();
    $("#btn02").click(function(){
        map02();
    })
    function map02(){

        var num11=$("input[my-data='num11']").val();
        var num12=$("input[my-data='num12']").val();

        var num13=$("input[my-data='num13']").val();
        var num14=$("input[my-data='num14']").val();

        var num15=$("input[my-data='num15']").val();
        var num16=$("input[my-data='num16']").val();

        var num17=$("input[my-data='num17']").val();
        var num18=$("input[my-data='num18']").val();

        var num19=$("input[my-data='num19']").val();
        var num20=$("input[my-data='num20']").val();

        // if(num11==''&&num12==''&&num13==''&&num14==''&&num15==''&&num16==''&&num17==''&&num18==''&&num19==''&&num20==''){
        //     num11==121.391;
        //     num12==31.117;
        //     num13==121.558;
        //     num14==31.224;
        //     num15==121.511;
        //     num16==31.268;
        //     num17==121.355;
        //     num18==30.748;
        //     num19==121.283;
        //     num20==31.373;
        // }

        var chart = echarts.init(document.getElementById('allmap2'));
            
            var bmap = {
                center: [121.391,31.117],
                zoom: 10,
                roam: true,
                mapStyle: {
                    styleJson: [{
                        "featureType": "water",
                        "elementType": "all",
                        "stylers": {
                            "color": "#d1d1d1"
                        }
                    }, {
                        "featureType": "land",
                        "elementType": "all",
                        "stylers": {
                            "color": "#f3f3f3"
                        }
                    }, {
                        "featureType": "boundary",
                        "elementType": "geometry",
                        "stylers": {
                            "color": "#979797"
                        }
                    }, {
                        "featureType": "railway",
                        "elementType": "all",
                        "stylers": {
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "highway",
                        "elementType": "geometry",
                        "stylers": {
                            "color": "#ffffff"
                        }
                    }, {
                        "featureType": "highway",
                        "elementType": "geometry.fill",
                        "stylers": {
                            "color": "#979797",
                            "lightness": 1
                        }
                    }, {
                        "featureType": "highway",
                        "elementType": "labels",
                        "stylers": {
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "arterial",
                        "elementType": "geometry",
                        "stylers": {
                            "color": "#ffffff"
                        }
                    }, {
                        "featureType": "arterial",
                        "elementType": "geometry.fill",
                        "stylers": {
                            "color": "#ffffff"
                        }
                    }, {
                        "featureType": "poi",
                        "elementType": "all",
                        "stylers": {
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "gray",
                        "elementType": "all",
                        "stylers": {
                            "color": "#979797",
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "subway",
                        "elementType": "all",
                        "stylers": {
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "manmade",
                        "elementType": "all",
                        "stylers": {
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "local",
                        "elementType": "all",
                        "stylers": {
                            "visibility": "true"
                        }
                    }, {
                        "featureType": "arterial",
                        "elementType": "labels",
                        "stylers": {
                            "visibility": "off"
                        }
                    }, {
                        "featureType": "boundary",
                        "elementType": "geometry.fill",
                        "stylers": {
                            "color": "#979797"
                        }
                    }, {
                        "featureType": "building",
                        "elementType": "all",
                        "stylers": {
                            "color": "#979797"
                        }
                    }, {
                        "featureType": "label",
                        "elementType": "all",
                        "stylers": {
                            "visibility": "true"
                        }
                    }]
                }
            }

        var res=[
            [{coord:[num11,num12]},{coord:[num13,num14]}],
            [{coord:[num13,num14]},{coord:[num15,num16]}],
            [{coord:[num15,num16]},{coord:[num17,num18]}],
            [{coord:[num17,num18]},{coord:[num19,num20]}]
        ];
        var color = ['#237cc8', '#237cc8', '#237cc8'];
        var series = [];

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
                        color: color[1],
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
                        color: color[1],
                        width: 1,
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
                itemStyle: {
                    normal: {
                        color: color[1]
                    }
                },
                data : [{value:[num11,num12,80]},{value:[num13,num14,80]},{value:[num15,num16,80]},{value:[num17,num18,80]},{value:[num19,num20,80]}]    
            }
        ]

        option ={
            bmap:bmap,
            geo: {
                map: 'bmap',
                label: {
                    emphasis: {
                        show: false
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
    }

})
