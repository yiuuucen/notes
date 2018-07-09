
$(".box_top img").click(function(){
    $(".submit_fail").css("display","none");
})
$(".lessclose").click(function(){
    $(".submit_fail").css("display","none");
})



$("#lessbtn").click(function () {
    var loadPhone=$("input[name='tel']").val();
    var personType=$("#miaoshu option:selected").text();
    var searchType=$("#biaoqian option:selected").text();
    if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(loadPhone))||personType==""||searchType==""){
        $(".popup").text("请完善信息!").animate({top:0});
        setTimeout(function(){
            $(".popup").animate({top:"-40px"});
        },2000)
    }else{
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

$(".search2").click(function(){
    //检索条件执行
    var inputval =$("input[name='q2']").val();
    if(inputval.length==11) {
        inputval = "86" + inputval;
    }
    if(inputval ===""){
        $(".popup").text("请输入查询ID！").animate({top:0});
        setTimeout(function(){
            $(".popup").animate({top:"-40px"});
        },2000)
    }else if(!/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(inputval)){
        $(".popup").text("请输入正确的查询号！").animate({top:0});
        setTimeout(function(){
            $(".popup").animate({top:"-40px"});
        },2000)
    }else{
        $.ajax({
            type: "post",
            url: window.ctx+"/phoneExist",
            data: {"targetPhone":inputval},
            dataType: "json",
            async: true,
            success: function(mes){
                if(mes.res==true){
                    //跳转到搜索结果页
                    //window.location.href="重点人员-搜索结果列表.html";
                    window.location.href=window.ctx+"/overview?targetPhone="+inputval;
                }else{
                    $(".popup").text("该号码尚未入库，请先提交入库").animate({top:0});
                    setTimeout(function(){
                        $(".popup").animate({top:"-40px"});
                    },2000)
                    $(".updata").css("cursor","pointer")
                    $(".updata").click(function(){
                        $(".submit_fail").css("display","block");
                        $("input[name='tel']").val(inputval);
                    })
                }
            },
            error:function(err) {

            }
        });
    }
});