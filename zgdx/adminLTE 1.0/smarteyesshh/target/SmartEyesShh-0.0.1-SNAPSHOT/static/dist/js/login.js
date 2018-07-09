$("#submit").click(function(){
    var tel=$("input[name='username']").val();
    var pwd=$("input[name='password']").val();
    $.ajax({
        type: "post",
        url: window.ctx+"/user/login",
        data: {"username":tel,"password":pwd},
        dataType: "json",
        async: true,
        success: function(data){
            if(!data.status) {
                alert(data.res);
            }else{
                window.location.href = window.ctx+'/search?targetPhone=';
            }
        },
        error:function() {
            alert("您输入的号码不存在!")
        }
    });
});

$(document).keyup(function (e) {//捕获文档对象的按键弹起事件
    if (e.keyCode == 13) {//按键信息对象以参数的形式传递进来了
        //此处编写用户敲回车后的代码
        $("#submit").click();
    }
})