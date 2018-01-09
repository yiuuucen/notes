/**
 *
 * @param start {lng:LNG, lat:LAT}
 * @param end {lng:LNG, lat:LAT}
 */
function track(start, end) {
    var url = 'http://api.map.baidu.com/direction/v2/transit?ak=Zl1DTZtwQh8Vfk7G8PpVExYywZAmET9p';
    url += '&origin=' + start.lat + ',' + start.lng;
    url += '&destination=' + end.lat + ',' + end.lng;

    var res = [];
    $.ajax({
        type: "GET",
        async: false,
        url: url,
        dataType: "jsonp",
        success: function (data) {
            if (data.message === '成功') {
                var route = data.result.routes[0].steps;
                for (var s = 0; s < route.length; s++) {
                    var arr = route[s][0].path.split(';');
                    for (var i = 0; i < arr.length; i += 5) {
                        var point = arr[i].split(',');
                        res.push({lng: point[0], lat: point[1]});
                    }
                }
            }
        },
        error: function () {
            alert("获取失败，请联系管理员！");
        }
    });
    return res;
}