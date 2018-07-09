// 2个弹窗效果
$(".content-header .up-one").click(function(){
	$(".submit_fail").css("display","block");
})
$(".box_top img").click(function(){
	$(".submit_fail").css("display","none");
})
$(".lessclose").click(function(){
	$(".submit_fail").css("display","none");
})

$(".content-header .up-some").click(function(){
	$(".submit_btn").css("display","block");
})
$(".box_top img").click(function(){
	$(".submit_btn").css("display","none");
})
$("#myform div:last-child").click(function(){
	$(".submit_btn").css("display","none");
})

//morecommit弹窗
//点击自动下载模板
$('.personlist .submit_btn .box_bottom .load').click(function () {
    window.location.href=window.ctx+"/target/download";
});
// form表单提交
function test(){
    var form = new FormData($("#myform")[0]);
    var upfile=$("#myform input[type='file']").val();
    //如果文件以.csv结尾则进行数据传输
    if(upfile==''){
        $(".popup").text("请您上传文件").animate({top:0});
        setTimeout(function(){
            $(".popup").animate({top:"-40px"});
        },2000)
    }else{
        if(/^.*.csv$/.test(upfile)){
            $.ajax({
                url:window.ctx+"/target/uploadPhone",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
                    var data=$.parseJSON(data);
                    if(data.result!=0){
                        // alert("提交成功"+data.result+"条数据");
                        $(".popup").text("提交成功").animate({top:0});
                        setTimeout(function(){
                            $(".popup").animate({top:"-40px"});
                            window.location.href=window.ctx+"/personlist"
                        },2000)
                    }else{
                        $(".popup").text("您上传文件中的数据内容有误！").animate({top:0});
                        setTimeout(function(){
                            $(".popup").animate({top:"-40px"});
                        },2000)
                    }
                },
                error:function(e){
                    alert("错误！！");
                }
            });
        }else{
            $(".popup").text("您上传的文件类型有误，请下载批量提交模板").animate({top:0});
            setTimeout(function(){
                $(".popup").animate({top:"-40px"});
            },2000)
        }
    }
}
$("#btn").click(function(){
    test();
})
//    lesscommit弹窗
$("#lessbtn").click(function () {
    var loadPhone=$("input[name='tel']").val();
    var personType=$("#miaoshu option:selected").text();
    var searchType=$("#biaoqian option:selected").text();
    if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(loadPhone))){
        $(".popup").text("输入的号码有误").animate({top:0});
        setTimeout(function(){
            $(".popup").animate({top:"-40px"});
        },2000)
    }else if(personType==""||searchType==""){
        $(".popup").text("请完善信息!").animate({top:0});
        setTimeout(function(){
            $(".popup").animate({top:"-40px"});
        },2000)
    } else{
        if(loadPhone.length==11) {
            loadPhone = "86" + loadPhone;
        }
        $.ajax({
            type:"get",
            url:window.ctx+"/target/insertTarget",
            dataType:"json",
            data:{"loadPhone":loadPhone,"personType":personType,"searchType":searchType},
            success:function () {
                window.location.href=window.ctx+"/personlist"
            },
            error:function () {
                console.log("数据错误")
            }
        })
    }

});

