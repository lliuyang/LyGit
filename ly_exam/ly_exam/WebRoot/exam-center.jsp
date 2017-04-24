<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
		<!--[if IE 7]><link rel="stylesheet" href="../css/font/font-awesome-ie7.min.css"><![endif]-->
		<link rel="stylesheet" type="text/css" href="./css/common.css">
		<link rel="stylesheet" type="text/css" href="./css/test-system.css">
		<link rel="shortcut icon" href="assets/ico/favicon.png">
		<link href='css/feature.presenter.1.5.css' rel='stylesheet' type='text/css'>

		<script type="text/javascript" src="./js/jquery-2.1.1.min.js"></script>
		<script src="./js/respond.js"></script>
		
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='./js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='./js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		<script src="./js/time.js"></script>
		<script src="./js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () 
		      { $("[data-toggle='popover']").popover();
		    });
		</script>
		
	</head>
<script type="text/javascript">

				
function keydown(){
	if(event.keyCode==13){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前模式不允许使用回车键");
	  }if(event.keyCode==116){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前模式不允许使用F5刷新键");
	  }if((event.altKey)&&((window.event.keyCode==37)||(window.event.keyCode==39))){
		event.returnValue=false;
		alert("当前模式不允许使用Alt+方向键←或方向键→");
	  }if((event.ctrlKey)&&(event.keyCode==78)){
	   event.returnValue=false;
	   alert("当前模式不允许使用Ctrl+n新建IE窗口");
	  }if((event.shiftKey)&&(event.keyCode==121)){
	   event.returnValue=false;
	   alert("当前模式不允许使用shift+F10");
	  }if(event.keyCode==27){
	  	event.returnValue=false;
	   alert("当前模式不允许使用ESC");
	  }
}
</script>
	<body style="background-color: #e7eff9;" onkeydown="keydown();">
		<!--head begin-->
		<div class="headbg">
			<div class="container header">
				<div class="navheader">
					<div class="results_title">
						个人中心
					</div>
				</div>
			</div>
		</div>
		<!--head end-->
		
		<!--body begin-->
		<div class="container">
			<div class="results_bg body-box" style="margin-top: 20px;">
				<div id="test-element"></div>
			</div>
		</div>
		<!--body end-->
	 <script src="./js/feature.presenter.1.5.min.js"></script>
	
	 <script>
		/* 图片地址可以是相对路径或绝对路径；标题和描述可以包含HTML */
		
		var settings = [ 
						
						{image: 'images/zzsc1.png', heading: '查看成绩', 
						 description: '<a href="${pageContext.request.contextPath}/Exam_Query">SCORE</a>'}, 
						 
						 {image: 'images/zzsc4.png', heading: '退出系统', 
						 description: '<a href="${pageContext.request.contextPath}/">EXIT</a>'}, 

						{image: 'images/zzsc2.png', heading: '开始考试',
						 description: ' <c:forEach items="${user}"  var="user"><a href="${pageContext.request.contextPath}/Exam_start?sno=${user.sno}">ENTER</a></c:forEach>'}, 
						
						];

		var options = {
			circle_radius: 220,
			normal_feature_size: 100,
			highlighted_feature_size: 150,
			top_margin: 100,
			bottom_margin: 50,
			spacing: 40,
			min_padding: 50,
			heading_font_size: 30,
			description_font_size: 20,
			type: 'image'
		};

		var fp = new FeaturePresenter($("#test-element"), settings, options);
		fp.createPresenter();

		</script>
	
	</body>
</html>

