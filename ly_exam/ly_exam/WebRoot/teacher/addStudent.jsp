<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 
  <!DOCTYPE html>
<html>
	<head>
	    <base href="<%=basePath%>">   
		<meta charset="UTF-8">
		<title></title>
		
		<link rel="shortcut icon" href="favicon.ico">
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/plugins/footable/footable.core.css" rel="stylesheet">

		<link href="${pageContext.request.contextPath }/teacher/Reception/css/animate.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/style.css?v=4.1.0" rel="stylesheet">
	</head>
	<body class="gray-bg">
		<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：导航开始
        -->
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-sm-12">
				<h2>学生添加</h2>
				<ol class="breadcrumb">
					<li>
						<a href="info.jsp">主页</a>
					</li>
					<li>
						<strong>学生添加</strong>
					</li>
				</ol>
			</div>
			<div class="row">
				<a href="${pageContext.request.contextPath }/teacher/addStudent.jsp" class="btn btn-link">学生添加</a>
				<a href="${pageContext.request.contextPath }/teacher/studentinfo.jsp" class="btn btn-info">学生管理</a>
			</div>

		</div>
		<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：导航结束
        -->
		
		
		
		    <div class="row">
             <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>学生信息录入</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                               
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                        <div class="ibox-content">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">学生姓名：</label>

                                <div class="col-sm-8">
                                    <input type="text" placeholder="真实姓名" class="form-control"> 
                                    <span class="help-block m-b-none">请输入学生的真实姓名</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-8">
                                    <input type="password" placeholder="密码" class="form-control">
                                </div>
                            </div>
                         
                              <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                             <div class="col-sm-8">
                                        <label>
                                            <input type="radio" value="option1" name="a"> <i></i>男</label>
                                   
                                        <label style="margin-left: 30px;">
                                            <input type="radio" checked="" value="option2" name="a"> <i></i>女</label>
                                     </div>
                            
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-3 control-label">系别：</label>
                                <div class="col-sm-8">
                                   <select>
                                   	<option>计算机科学</option>
                                   	<option>商业智能</option>
                                   	<option>软件工程</option>
                                   	<option>物联网</option>
                                   	
                                   </select>
                                </div>
                            </div>
                               <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-info" type="submit">添加</button>
                                     <button class="btn btn-sm btn-link" type="reset">取消</button>
                                </div>
                            </div>
                            
                        </form>
                    </div>
                    </div>
                  </div>
                    </div>
                
	</body>
</html>
  