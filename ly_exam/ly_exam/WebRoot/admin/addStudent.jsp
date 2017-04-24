<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link href="${pageContext.request.contextPath }/admin/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/admin/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/admin/Reception/css/plugins/footable/footable.core.css" rel="stylesheet">

		<link href="${pageContext.request.contextPath }/admin/Reception/css/animate.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/admin/Reception/css/style.css?v=4.1.0" rel="stylesheet">
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
				<a href="${pageContext.request.contextPath }/admin/addStudent.jsp" class="btn btn-link">学生添加</a>
				<a href="${pageContext.request.contextPath }/admin/studentinfo.jsp" class="btn btn-info">学生管理</a>
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
                        <form class="form-horizontal" action="${pageContext.request.contextPath }/adminAction?action=addStudent" method="post">
                            <div class="form-group">
                            	<label class="col-sm-3 control-label">学生学号：</label>

                                <div class="col-sm-8">
                                    <input type="text" name="sno" placeholder="学生学号" class="form-control"> 
                                    
                                </div>
                                <label class="col-sm-3 control-label">学生姓名：</label>

                                <div class="col-sm-8">
                                    <input type="text" name="sname" placeholder="真实姓名" class="form-control"> 
                                    <span class="help-block m-b-none">请输入学生的真实姓名</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-8">
                                    <input type="password" name="password" placeholder="密码" class="form-control">
                                </div>
                            </div>
                         
                              <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                             <div class="col-sm-8">
                                        <label>
                                            <input type="radio" value="男" name="ssex"> <i></i>男</label>
                                   
                                        <label style="margin-left: 30px;">
                                            <input type="radio" checked="" value="女" name="ssex"> <i></i>女</label>
                                     </div>
                            
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-3 control-label">班级：</label>
                                <div class="col-sm-8">
                                   <select name="sclass">
                                   <c:forEach items="${sclass}"  var="sclass">				
 								   	   <option value="${sclass.scno}">${sclass.scname}</option>		
 								</c:forEach>
                                   	
                                  
                                   </select>
                                </div>
                            </div>
                               <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-info" type="submit">添加
                                    </button>
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
  