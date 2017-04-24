<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
		<title>开始考试</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<!--[if IE 7]><link rel="stylesheet" href="css/font/font-awesome-ie7.min.css"><![endif]-->
		<link rel="stylesheet" type="text/css" href="css/ly.css">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/test-system.css">
		<link rel="stylesheet" type="text/css" href="css/core.css">
		<link rel="shortcut icon" href="assets/ico/favicon.png">
		<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
		<script type="text/javascript" src="jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="js/myPlug.js"></script>
		<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script> 
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
		
		<script src="js/time.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function () 
		      { $("[data-toggle='popover']").popover();
		    });
		</script>
<script type="text/javascript">
	$(function runtime(){
	
    var m=$('#time').html()-1;
    var s=59;
    setInterval(function(){
        if(s<10){
            $('#time').html(m+':0'+s);
        }else{
            $('#time').html(m+':'+s);
        }
        s--;
        if(s<0){
            s=59;
            m--;
        }
        if(m==0){
        alert("考试结束，系统将自动提交试卷！")
        $("#answer_form").submit();
        }
    },1000)
    
})
</script>		

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
<script type="text/javascript">
function click() {
 event.returnValue=false;
	 alert("当前模式不允许使用右键！");
}
document.oncontextmenu=click;
</script>
		

<!-- <script type="text/javascript"><!--
	$(function(){
		$("#sub").click(function(){ 
		console.log($("#answer_from").serializeJson());
		$.ajax({  
	    type:"POST",  
	    url:"Exam_answer",  
	    data:JSONObj,  
	    dataType:"text",  
	    success:function(data){  
	        alert(data);  
	    }  
	}); 
	}); 
	});
</script> -->
</head>
<body onLoad="runtime();" onkeydown="keydown();">
	<form id="answer_form" action="Exam_answer" method="post" >
		<!--head begin-->	
		<c:forEach items="${paper}"  var="p">
		<div class="headbg position_fixed">
			<div class="container header">
				<div class="navheader">
					<div class="nav-title">
						
					</div>
					<div class="nav-right">
						<span class="numtitle">考试剩余时间:<a id="time">${p.antime}</a></span>
								
						<!-- Button trigger modal -->
						<div class="border-right-none"></div>
						<button  type="button" class="btn btn-default btn-lg overtest" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-open gameover"></i><span>交卷</span></button>
						
					</div>
				</div>
			</div>
		</div>
		<!--head end-->
		
		
		<!--body begin-->
		<!--判断题 begin-->
		
		<div class="container main">
		<div class="paper_title">
			
			<div class="center-block stitle">
			
					<h2>${p.pname}</h2>
				<div class="center-block title_about">
					<p>总分:${p.ptotalscore}分 考试时间:${p.antime}分钟</p>
				</div>
			
			</div>

			
		</div>
			<%int i=1;int j=1;int k=1;%>

			<div class="single-box">
				<div class="single-container">
					<div class="single-title">
						<span class="font-title">一、判断题</span>
						<span class="single_score">（每题${p.jscore}分）</span>
					</div>
				</div>

				<div class="line"></div>
				
			<c:forEach items="${jude}"  var="jude" varStatus="status">
				<div class="single-main">
					<p><span><%=i++%>.</span>${jude.qstatement}</p>
				</div>
				<div class="choose-box">
					<div class="radio">
						<label class="choose">
							<input type="radio" name="jude_${status.index}" id="th" value="${p.pnum}@${jude.qno}@A#" >
							<p><span>A.</span>&nbsp;正确</p>
						</label>
						
						<label class="choose">
							<input type="radio" name="jude_${status.index}" id="th" value="${p.pnum}@${jude.qno}@B#" >
							<p><span>B.</span>&nbsp;错误</p>
						</label>
						 	
						
					</div>
					
				</div>
			</c:forEach>
			
			
			<!--判断题 end-->
			
		
			
			<!--单选题 begin-->
			<div class="single-box mt-20" >
				<div class="single-container">
					<div class="single-title">
						<span class="font-title">二、单选题</span>
						<span class="single_score">（每题${p.scscore}分）</span>
					</div>
					
				</div>
				<div class="line"></div>
				
				<c:forEach items="${schoice}"  var="schoice" varStatus="status">
				<div class="single-main">
				<%j++;%>
					<p><%=i++%>.${schoice.qstatement}</p>
				</div>
				
				<div class="choose-box">
				
					<div class="radio">
						<label class="choose">
							<input type="radio" name="sc_${status.index}"  value="${p.pnum}@${schoice.qno}@A#">
							<p><span>A.</span>&nbsp;${schoice.qchoicea}</p>
						</label>
						<label class="choose">
							<input type="radio" name="sc_${status.index}"  value="${p.pnum}@${schoice.qno}@B#">
							<p><span>B.</span>&nbsp;${schoice.qchoiceb}</p>
						</label>
						<label class="choose">
							<input type="radio" name="sc_${status.index}"  value="${p.pnum}@${schoice.qno}@C#">
							<p><span>C.</span>&nbsp;${schoice.qchoicec}</p>
						</label>
						<label class="choose">
							<input type="radio" name="sc_${status.index}"  value="${p.pnum}@${schoice.qno}@D#">
							<p><span>D.</span>&nbsp;${schoice.qchoiced}</p>
						</label>
					</div>
				</div>
				</c:forEach>
			</div>
			<!--单选题 end-->
		
			<!--多选题 begin-->
			<div class="single-box mt-20" >
				<div class="single-container">
					<div class="single-title">
						<span class="font-title">多选题</span>
						<span class="single_score">（每题${p.mcscore}分）</span>
					</div>
				</div>
				<div class="line"></div>
				<c:forEach items="${mchoice}"  var="mchoice" varStatus="status">
				<div class="single-main">
					<p><%=i++%>.${mchoice.qstatement}</p>
				</div>
				<div class="choose-box">
					<div class="checkbox">
						<label class="choose">
							<input type="checkbox" value="${p.pnum}@${mchoice.qno}@A/" name="mch_${status.index}">
							<p><span>A.</span>&nbsp;${mchoice.qchoicea}</p>
						</label>
					</div>
					<div class="checkbox">
						<label class="choose">
							<input type="checkbox" value="${p.pnum}@${mchoice.qno}@B/" name="mch_${status.index}">
							<p><span>B.</span>&nbsp;${mchoice.qchoiceb}</p>
						</label>
					</div>
					<div class="checkbox">
						<label class="choose">
							<input type="checkbox" value="${p.pnum}@${mchoice.qno}@C/" name="mch_${status.index}">
							<p><span>C.</span>&nbsp;${mchoice.qchoicec}</p>
						</label>
					</div>
					<div class="checkbox">
						<label class="choose">
							<input type="checkbox" value="${p.pnum}@${mchoice.qno}@D/" name="mch_${status.index}">
							<p><span>D.</span>&nbsp;${mchoice.qchoiced}</p>
						</label>
					</div>
				</div>
				</c:forEach>
			</div>
		<!-- 	</form> -->

</div>
	
		
			<!--多选题 end-->


			<!-- 简答题 begin-->

			<div class="single-box mt-20" >
				<div class="single-container">
					<div class="single-title">
						<span class="font-title">简答题</span>
						<span class="single_score">（每题${p.sascore}分）</span>
					</div>
				</div>
				<div class="line"></div>
				<c:forEach items="${sanswer}"  var="sanswer" varStatus="status">
				<div class="single-main">
					<p>${status.index+1}.${sanswer.qstatement}</p>
				</div>
				<div class="choose-box">
					<div id="sanswer" style="width:100%;height:150px;border:1px solid #666;" >
						<textarea name="sanswer" cols="20" rows="5" style="width:100%;height:150px;" ></textarea>
					</div>
				</div>
				</c:forEach>
			</div>
</c:forEach>	
</form>
			<!-- 简答题 end  --> 
</div>
	
		
		<!--body end-->
	
	

	</body>
	<!-- 提交弹出框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog mtk-box" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title text-tip" id="myModalLabel">考试提示：</h4>
				</div>
				<div class="modal-body bigbox">
					<p class="text-over">您确认现在交卷么？</p>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn btn-info" onclick='exam_submit()' ><i class="glyphicon glyphicon-open"></i>确认交卷</a>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	function exam_submit(){
	$("#answer_form").submit();
	}
</script>
	
	<!-- 提交弹出框 -->
	<script src="js/test-system.js"></script>
	<script type="text/javascript">
		
			//打开模态窗口
			$('#dtmb').modal({backdrop: 'static', keyboard: false , show: false});
			$('#myModal').modal({backdrop: 'static', keyboard: false , show: false});
	</script> 
</html>
