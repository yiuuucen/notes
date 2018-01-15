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
		<script>
			$(function(){
				/*$('input.datetimepicker').datetimepicker({
			    	format: 'yyyy-mm-dd hh:ii',
			    	language:'zh-CN'
			    });*/
			    $(".btnSearch").click(function(){
			    	//检索条件执行
			    	
			    	//跳转到搜索结果页
			    	//window.location.href="重点人员-搜索结果列表.html"; 
			    });
			    
			    
			})
		</script>		
	</head>
	<body>
		<div class="container-fluid smartEyes-container mag">
		
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-xs-12 clearfix smartEyes">
				<div class="logo ">
					<img src="img/logo.png">
					<div class="my_dropdown">
					  <select name="" id="">
					  	<option value="test1" selected>配置</option>
					  	<option value="test2">用户操作日志</option>
					  	<option value="test3">目标人员管理</option>
					  	<option value="test3">系统权限管理</option>
					  </select>
					</div>
					<img src="${img}/magreturn.png" alt="">
				</div>
				
				<div class="hr clearfix"></div>
				<div class="hr clearfix"></div>	
				</div>

			</div>

			<div class="search clearfix">
				<div class="findpwd">
					<div class="top clearfix">
						<div>目标人员管理</div>
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
									<select name="" id="">
										<option value="" selected></option>
										<option value="">重点人员</option>
										<option value="">一般人员</option>
									</select>
								</div>
							</div>
							<div>
								<p>查询目标标签:</p>
								<div>
									<select name="" id="">
										<option value="" selected></option>
										<option value="">涉毒</option>
										<option value="">盗窃</option>
										<option value="">强奸</option>
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
						<div>
							 <input type="file" name="fileUpload" class="choose" />
						</div>
						<div>下载批量提交模板</div>
						<div>
							<span>确认提交</span>
							<span>取消</span>
						</div>
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
		<footer style="position: relative;"><p class="text-center">© 2017 SmarttEyes | 猎犬上海网安版</p></footer>
		<script>
			$(function(){
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
			})
		</script>
		<script type="text/javascript" src="${js}/cenu.js"></script>
	</body>
</html>
