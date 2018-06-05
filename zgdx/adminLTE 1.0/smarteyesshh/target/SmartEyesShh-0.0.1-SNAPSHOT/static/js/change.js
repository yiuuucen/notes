$(function(){
//关系图
    function ectTab1(){
        var targetPhone = $('#targetPhone').val();
        var ectTab1 = echarts.init(document.getElementById('ectTab1'));
        $.ajax({
            type: "GET",
            url: window.ctx+"/getContactList?targetPhone="+targetPhone,
            dataType: "json",
            success: function (data) {

                data.nodes.forEach(function (node) {

                    node.name="SE"+node.name;

                });
                data.edges.forEach(function (edge) {

                    edge.source="SE"+edge.source;
                    edge.target="SE"+edge.target;

                });
                option = {
                    tooltip: {
                        show: false
                    },
                    series: [{
                        type: 'graph',
                        layout: 'force',
                        symbol: 'path://M19.300,3.300 L253.300,3.300 C262.136,3.300 269.300,10.463 269.300,19.300 L269.300,21.300 C269.300,30.137 262.136,37.300 253.300,37.300 L19.300,37.300 C10.463,37.300 3.300,30.137 3.300,21.300 L3.300,19.300 C3.300,10.463 10.463,3.300 19.300,3.300 Z',
                        symbolSize: [250,30],
                        symbolRotate:0,
                        roam: false,
                        draggable:false,
                        hoverAnimation:true,
                        focusNodeAdjacency:true,
                        edgeSymbol: ['none', 'none'],
                        edgeSymbolSize: [10, 10],
                        markPoint:{
                            symbol:"triangle",
                            symbolSize: 120
                        },
                        itemStyle:{
                            normal:{
                                color:"#2d8cf0"
                            }
                        },
                        lineStyle: {
                            normal: {
                                opacity: 1,
                                width: 2,
                                curveness: 0.5,
                                color:"#ccc"
                            }
                        },
                        // 圆圈内的文字
                        label: {
                            normal: {
                                show: true,
                                textStyle:{
                                    color:"#fff"
                                }
                            }
                        },
                        force: {
                            repulsion: 2000
                        },
                        nodes:data.nodes,
                        edges:data.edges
                    }]
                };

                ectTab1.setOption(option);


            },
            error: function () {
                alert("获取失败，请联系管理员！");

            }
        });

    }
    ectTab1();

});
