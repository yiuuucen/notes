// .mag

$("#morebtn").click(function(){
	$(".mag .submit_btn").css('display','block');
})
$(".mag .queding").click(function(){
	$(".mag .submit_fail").css('display','block');
})
// .mag页面下的2个弹窗js
$(".mag .submit_box .box_top img").click(function(){
	$(".mag .submit_btn").css('display','none')
})
$(".mag .submit_box .box_bottom div:nth-child(3) span").click(function(){
	$(".mag .submit_btn").css('display','none')
})

$(".mag .submit_fail .submit_box img").click(function(){
	$(".mag .submit_fail").css('display','none')
})
$(".mag .submit_fail .submit_box div:nth-child(3)").click(function(){
	$(".mag .submit_fail").css('display','none')
})