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
		<title>确认考试信息</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<!--[if IE 7]><link rel="stylesheet" href="css/font/font-awesome-ie7.min.css"><![endif]-->
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" href="text/css" href="css/ly.css">
		<link rel="stylesheet" type="text/css" href="css/test-system.css">
		<link rel="shortcut icon" href="assets/ico/favicon.png">
		<script src="js/respond.js"></script>
		<script src="js/textarea.js"></script>
		
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		
		<script type="text/javascript">
			window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		
		<script src="js/bootstrap.min.js"></script>
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
		
	</head>
	<body style="background-color: #e4ebf4;" onkeydown="keydown();">
		<!--head begin-->
		<div class="headbg position_fixed">
			<div class="container header">
				<div class="navheader">
					<p class="nav-title">无纸化在线考试系统</p>
				</div>
			</div>
		</div>
		<!--head end-->
		
		<!--body begin-->
		<div class="container exam_content">
			<div class="exam_tip">
				<p class="notice" style="color: red;">请确认你的信息，准确无误后单击进入考试</p>
				
				
				<div class="container">
					<div class="row stu_msg">
					
					<c:forEach items="${user}"  var="stu">
					  	<div class="col-md-2 " style="margin-top: 10px;" ><img src="./stu_img/${stu.sno}.jpg" alt=""></div>
						<div class="col-md-3">
						  <div class="row">
						  	<div class="col-md-10" style="margin-top: 20px;">姓名：${stu.sname}</div>
							<div class="col-md-10" style="margin-top: 20px;">学号：${stu.sno}</div>
							<div class="col-md-10" style="margin-top: 20px;">班级：${stu.sclass}</div>
						  </div>						  
						</div>
					</c:forEach>
					 <c:forEach items="${paper_info}"  var="p">
					    <div class="col-md-3">
							<div class="row">
								<div class="col-md-15" style="margin-top: 20px;">考试科目：${p.pname}</div>
								<div class="col-md-15" style="margin-top: 20px;">开考时间：${p.pstime}</div>
								<div class="col-md-15" style="margin-top: 20px;">结束时间：${p.petime}</div>
							</div>
					    </div>
					  </c:forEach>
					</div>			
				</div>
			</div>
			
			<div class="exam_tip">
				<p class="notice" style="color: rgb(218, 68, 68);">注意事项：</p>
				<ul class="notice_main">
					<li>确认考试的信息(包括学号，姓名，考试科目，考试时间等)</li>
					<li>答题开始后系统会自动计时，请注意考试时间，考试时间结束系统自动交卷；</li>
					<li>靠前请关闭屏幕保护以及其他可能出现弹窗的应用程序，以免对考试造成影响；</li>
					<li>考试过程中请勿关闭、最小化或切换考试窗口页面</li>
					<li>如果以考过该科目，没有管理员允许重复考试这门课程将不得分；</li>
					<li>如果没有当前考试科目时间等信息 请先确认您当前是否有考试后联系管理员</li>
				</ul>
			</div>

			<div class="exam_title" id="ent">
				<c:forEach items="${paper_info}"  var="p">
				<span class="exam_name" id="ename">${p.pname}</span>
				</c:forEach>
				
				<c:forEach items="${paper_info}"  var="p">
					<c:forEach items="${user}"  var="stu">
					<span class="exam_date" >总分:${p.ptotalscore}</span>
					<span class="exam_sj">考试时间:${p.antime}分钟</span>
					<a  class="en-btn"  href="${pageContext.request.contextPath}/Exam_begin?po=${p.pnum}&ti=${p.antime}&sno=${stu.sno}">进入考试</a>
					</c:forEach>
					</c:forEach>
			</div>
			<script type="text/javascript">
			$(function(){
				var mes=$("#ename").val();
				if(mes==null){
					$("#ent").hide();
					alert("提示：您当前无考试!");
					history.back(-1); 
				}
			})
			</script>
		</div>
		<!--body end-->
	   
	</div>
		
		<!--footer end-->
		<script src="js/jquery.countdown.js"></script>
		<script type="text/javascript">
			$(function(){
				$('#counter').countdown({
					image:'images/digits.png',
					startTime: '00:10:00'
				});
			
			});
		</script>
		
		
	</body>
</html>
