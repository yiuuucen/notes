getUser()
changePw()
function getUser() {
    $.ajax({
        type: "GET",
        url: "user/getUser",
        dataType: "json",
        success: function (res) {

            $("#f1").text(res.id);
            $("#f2").text(res.name);
            var phone = res.phone.slice(0,3)+"****"+res.phone.slice(7,11);
            $("#f3").text(phone);

        }, error: function () {
            console.log("添加提交错误");
        }

    })
}

function changePw() {
    $(".chang1 .change_pwd").click(function(){
        $(".chang1").css("display","none");
        $(".chang2").css("display","block");
        $(".change_ok").click(function(){
            var oldPwd=$("#f4").val();
            var newPwd=$("#f5").val();
            var reNew=$("#f6").val();
            if(oldPwd==''||newPwd===''||reNew===''){
                $(".popup").text("请输入密码").animate({top:0});
                setTimeout(function(){
                    $(".popup").animate({top:"-40px"});
                },2000)
            }else if(oldPwd==newPwd){
                $(".popup").text("新密码不能和旧密码相同").animate({top:0});
                setTimeout(function(){
                    $(".popup").animate({top:"-40px"});
                },2000)
            }else if(newPwd!=reNew){
                $(".popup").text("两次输入的新密码不相同").animate({top:0});
                setTimeout(function(){
                    $(".popup").animate({top:"-40px"});
                },2000)
            }else{
                $.ajax({
                    type: "GET",
                    url: "user/changePwd",
                    dataType: "json",
                    data:{"oldPwd": oldPwd, "newPwd": newPwd},
                    success:function(res){
                        if (res.result == 1) {
                            $(".popup").text("修改密码成功").animate({top:0});
                            setTimeout(function(){
                                $(".popup").animate({top:"-40px"});
                            },2000)
                            $(".chang1").css("display","block");
                            $(".chang2").css("display","none");
                        } else {
                            $(".popup").text("输入的旧密码有误").animate({top:0});
                            setTimeout(function(){
                                $(".popup").animate({top:"-40px"});
                            },2000)
                        }
                    },
                    error:function(){
                        console.log("修改密码错误")
                    }
                })
            }
		})
    })
}