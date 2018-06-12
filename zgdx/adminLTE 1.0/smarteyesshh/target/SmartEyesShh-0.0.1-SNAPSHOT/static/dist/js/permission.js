
// 添加用户
$(".add").click(function(){
	$(".msg").css("display","none");
	$(".adduser").css("display","block");
    var phoneReg = /[1][3-8]{1}\d{9}($|[^0-9]{1})/;
    $(".sysmg-subBtn").click(function(){
        var name=$('#f1').val();
        var tel=$('#f2').val();
        var pwd=$('#f3').val();
        if(name==''){
        	alert("请输入姓名");
        	return 0;
		}else if(!phoneReg.test(tel)){
        	alert("请输入正确的手机号");
        	return 0;
		}else if(pwd=''){
        	alert("请输入密码")
			return 0;
		}
        $.ajax({
            type:"GET",
            url:window.ctx +"/user/addUser",
            dataType:"json",
            data:{"usernick":name,"username":tel,"password":pwd},
            success:function (res) {
                if(res.result===1){
                    alert("添加成功");
                    window.location.reload();
                }else{
                    alert("当前账号已存在不能添加");

                }
            },error:function () {
                console.log("添加提交错误");
            }
        })
    });
})






