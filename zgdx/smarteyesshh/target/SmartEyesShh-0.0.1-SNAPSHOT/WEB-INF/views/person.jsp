<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>目标人员管理</title>
		<link rel="stylesheet" href="${js}/bootstrap/css/bootstrap.css" />
    	<link rel="stylesheet" href="${css}/base.css" />
    	<link rel="stylesheet" href="${css}/style.css" />
    	<link rel="stylesheet" href="${css}/style3.css" />
    	<script type="text/javascript" src="${js}/jquery-2.1.0.js" ></script>
    	<script type="text/javascript" src="${js}/bootstrap/js/bootstrap.js" ></script>
	</head>
	<body>
		<div class="container-fluid smartEyes-container mag">

			<jsp:include page="/WEB-INF/common/head.jsp"/>

		<div class="row clearfix">

				<div class="hr clearfix"></div>
				<div class="hr clearfix"></div>

			<div class="search clearfix">
				<div class="findpwd">
					<div class="top clearfix">
						<div>目标人员管理</div>
						<div class="find">查询记录</div>
					</div>
					<div class="bottom clearfix">
						<div class="magtit">
							提交查询号码
							<div id="morebtn">批量提交</div>
						</div>
						<div class="msg">
							<div>
								<p>查询目标手机号码:</p>
								<div>
									<input type="text" name="tel">

								</div>
							</div>
							<div>
								<p>查询目标描述:</p>
								<div>
									<select name="" id="miaoshu">
										<option value="" selected></option>
										<option value="重点人员">重点人员</option>
										<option value="一般人员">一般人员</option>
									</select>
								</div>
							</div>
							<div>
								<p>查询目标标签:</p>
								<div>
									<select name="" id="biaoqian">
										<option value="" selected></option>
										<option value="涉毒">涉毒</option>
										<option value="盗窃">盗窃</option>
										<option value="强奸">强奸</option>
									</select>
								</div>
							</div>
							<div>
								<p></p>
								<div class="queding">
									提交
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="submit_btn">
				<div class="submit_box">
					<div class="box_top">
						<span>批量提交查询号码</span>
						<img src="${img}/magclose.png" alt="">
					</div>
					<div class="box_bottom">
						<form action="${ctx}/target/uploadPhone" method="post" enctype="multipart/form-data" >
							<input type="file" name="csvfile" class="choose" />
							<div class="load">下载批量提交模板</div>
							<input type="submit" value="确认提交">
							<div>取消</div>
						</form>
					</div>
				</div>
			</div>
			<div class="submit_fail">
				<div class="submit_box">
					<img src="${img}/magclose.png" alt="">
					<div>提交失败！请重新提交。</div>
					<div>确定</div>
				</div>
			</div>
		</div>
		<!--底部-->
				<%--<jsp:include page="/WEB-INF/common/footer.jsp"/>--%>
		<footer style="position: relative"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>
		<script>
			$(function(){
			    $("#navList").css("display","none");
			    $(".mag .findpwd .top .find").click(function(){
                    window.location.href="${ctx}/personlist"
				});
                //点击自动下载模板
				$('.mag .submit_btn .box_bottom .load').click(function () {
                    window.location.href="${ctx}/target/download";
                })
				$("input[name='tel']").blur(function () {
	                var tel=$("input[name='tel']").val();
	                if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(tel))){
	                    $(".msg>div:nth-child(1)>div").append("<span>您输入的号码有误!</span>");
	                }
	                if(tel==''){
	                    $(".msg>div:nth-child(1)>div span").css('display','none');
	                }
	            });
	            $("input[name='tel']").focus(function () {
	                $(".msg>div:nth-child(1)>div span").css('display','none');
	            });
                //右上角的选择框设置选中
				$("option[value='targetPersonManage']").attr("selected","selected").siblings().removeAttr("selected");

				$(".queding").click(function () {
				    var loadPhone=$("input[name='tel']").val();
				    var personType=$("#miaoshu option:selected").text();
                    var searchType=$("#biaoqian option:selected").text();
                    if(!(/[1][3-8]{1}\d{9}($|[^0-9]{1})/.test(loadPhone))||personType==""||searchType==""){
                        $(".mag .submit_fail").css('display','block');
                    }else{
                        $.ajax({
                            type:"get",
                            url:"/target/insertTarget",
                            dataType:"json",
                            data:{"loadPhone":loadPhone,"personType":personType,"searchType":searchType},
                            success:function () {
                                window.location.href="${ctx}/personlist"
                            },
                            error:function () {
                                console.log("数据错误")
                            }
                        })
					}

                })
			})
		</script>
		<script type="text/javascript" src="${js}/myuse.js"></script>
	</body>
</html>
