<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <!DOCTYPE html>
<html>

	<head>
    <base href="<%=basePath%>">    
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>试卷列表</title>
		<meta name="keywords" content="">
		<meta name="description" content="">

		<link rel="shortcut icon" href="favicon.ico">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/plugins/footable/footable.core.css" rel="stylesheet">

		<link href="${pageContext.request.contextPath}/teacher/Reception/css/animate.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/style.css?v=4.1.0" rel="stylesheet">

	</head>

	<body class="gray-bg">
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-sm-12">
				<h2>试卷管理</h2>
				<ol class="breadcrumb">
					<li>
						<a href="info.jsp">主页</a>
					</li>
					<li>
						<strong>试卷列表</strong>
					</li>
				</ol>
			</div>
			<div class="row">
				<a href="${pageContext.request.contextPath}/teacherAction?action=paperListShow" class="btn btn-link">试卷管理</a>
				<a href="${pageContext.request.contextPath}/teacherAction?action=CreatePapers01" class="btn btn-info">创建试卷</a>
			</div>

		</div>

		<div class="wrapper wrapper-content animated fadeInRight">
		<!--
			<div class="ibox-content">

				<form action="#" method="post">
					<div class="row">
						<div class="col-sm-2 m-b-xs">

						</div>
						<div class="col-sm-3 m-b-xs">
							<select class="input-sm form-control input-s-sm inline" name="major">

								<option value="%">所有专业</option>

							</select>
						</div>
						<div class="col-sm-3 m-b-xs">
							<select class="input-sm form-control input-s-sm inline" name="subject">

								<option value="%">所有科目</option>

							</select>
						</div>

						<div class="col-sm-4">
							<div class="input-group">
								<input name="title" type="text" placeholder="请输入试卷标题" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> </span>
							</div>
						</div>

					</div>
				</form>

			</div>
  -->
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>所有试卷列表</h5>

							<div class="ibox-tools">
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>
								</a>
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									<i class="fa fa-wrench"></i>
								</a>
								<ul class="dropdown-menu dropdown-user">

								</ul>
								<a class="close-link">
									<i class="fa fa-times"></i>
								</a>
							</div>
						</div>
						<div class="ibox-content">

							<table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
								<thead>
									<tr>
										<th>ID</th>
										<th data-toggle="true">试卷标题</th>
										<th>出题教师</th>
										<th>考试科目</th>
										<th>总分</th>
									<th>考试时间安排</th>
										<th data-hide="all">单择题</th>
										<th data-hide="all">多择题</th>
										<th data-hide="all">判断题</th>
										<th data-hide="all">简答题</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
                              <c:forEach items="${papers}"  var="paper">
									<tr>
										<td> <input type="checkbox">  </td>
										<td>${paper.pname}</td>
										<td>${paper.tno}</td>									
										<td>${paper.cno}</td>		
										<td><span style="color:#218888; font-family: inherit; font-size:20px; ">${paper.ptotalscore }</span></td>
											<td>开始时间：<span style="color:#218868;">${paper.pstime}</span> <br>结束时间：<span style="color: red;">${paper.petime}</span></td>							
										
										<td><span class="pie">${paper.schoice}</span></td>
										<td>${paper.mchoice}</td>
										<td>${paper.judge}</td>
										<td>${paper.sanswer}</td>
										<td>
										<!--  
										 <button class="btn btn-info " type="button"> 详情</button> <button class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button>
										 -->
										 
											<a href="${pageContext.request.contextPath}/teacherAction?action=delePapers&pnum=${paper.pnum}" class="btn btn-warning " type="button"><i class="fa fa-warning"></i> <span class="bold">删除</span></a></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="5">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/plugins/footable/footable.all.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/content.js?v=1.0.0"></script>
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.footable2').footable();

        });

    </script>

    
    

</body>

</html>