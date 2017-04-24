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
		<title>我的成绩</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<!--[if IE 7]><link rel="stylesheet" href="css/font/font-awesome-ie7.min.css"><![endif]-->
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/test-system.css">
		<link rel="stylesheet" type="text/css" href="css/practice/core.css">
		<link rel="shortcut icon" href="assets/ico/favicon.png">
		<script src="js/respond.js"></script>
		<script src="js/practice/textarea.js"></script>
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		<script src="js/time.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () 
		      { $("[data-toggle='popover']").popover();
		    });
		</script>
		
	</head>
	<body style="background-color: #e7eff9;">
		<!--head begin-->
		<div class="headbg">
			<div class="container header">
				<div class="navheader">
					<div class="results_title">
						<span style="color:#FF3030;">温馨提示：如有疑问，请联系相关工作人员</span>
					</div>
				</div>
			</div>
		</div>
		<!--head end-->
		
		<!--body begin-->
		<div class="container" style="margin-top:25px;">
			<c:forEach items="${paper}"  var="p">
			<div class="results_bg body-box" style="margin-top:25px;">
				<div class="results_main_top">
					<p class="results_top">${p.pname}</p>
				</div>
				<div class="results_main_top">
					<p class="top_name">考生学号：<span>${p.sno}</span></p>
					<p class="top_scroe">考试成绩：<span>${p.jscore+p.scscore+p.mcscore+p.apscore}</span></p>
				</div>

				<ul class="results_list" style="padding-bottom:5px;">
					<li>●&nbsp;&nbsp;试卷总分：100分</li>
					<li>●&nbsp;&nbsp;判断题：${p.jscore}分</li>
					<li>●&nbsp;&nbsp;单项选择：${p.scscore}分</li>
					<li>●&nbsp;&nbsp;多项选择：${p.mcscore}分</li>
					<li>●&nbsp;&nbsp;简答题：<c:if test="${p.apstate == '待批阅' }"> <span>得分待定</span></c:if> 
							<c:if test="${p.apstate == '待批阅' }"> ${p.apscore}分</c:if>
					</li>
					<li></li>
					
					
				</ul>	
			</div>
			</c:forEach>
			<ul class="results_list" style="padding-bottom:5px;">
			<li>
						<a class="btn btn-info iknow" href="exam-center.jsp" style="bottom:10px;">我知道了</a>
			</li>
			</ul>
		</div>
		
		<!--body end-->
	 
		<!--footer begin-->
		
		<!--footer end-->
	</body>
</html>

