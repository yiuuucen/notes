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
                window.location.href = 'personlist';
            }
        },
        error:function() {
            alert("您输入的号码不存在!")
        }
    });
});