
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
            $(".popup").text("请输入姓名").animate({top:0});
            setTimeout(function(){
                $(".popup").animate({top:"-40px"});
            },2000)
        	return 0;
		}else if(!phoneReg.test(tel)){
            $(".popup").text("请输入正确的手机号").animate({top:0});
            setTimeout(function(){
                $(".popup").animate({top:"-40px"});
            },2000)
        	return 0;
		}else if(pwd=''){
            $(".popup").text("请输入密码").animate({top:0});
            setTimeout(function(){
                $(".popup").animate({top:"-40px"});
            },2000)
			return 0;
		}
        $.ajax({
            type:"GET",
            url:window.ctx +"/user/addUser",
            dataType:"json",
            data:{"usernick":name,"username":tel,"password":pwd},
            success:function (res) {
                if(res.result===1){
                    $(".popup").text("添加成功").animate({top:0});
                    setTimeout(function(){
                        $(".popup").animate({top:"-40px"});
                        window.location.reload();
                    },2000)
                }else{
                    $(".popup").text("当前账号已存在不能添加").animate({top:0});
                    setTimeout(function(){
                        $(".popup").animate({top:"-40px"});
                    },2000)
                }
            },error:function () {
                console.log("添加提交错误");
            }
        })
    });
})






