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
		<meta charset="UTF-8">
		<title>授课管理</title>

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
				<h2>授课</h2>
				<ol class="breadcrumb">
					<li>
						<a href="info.jsp">主页</a>
					</li>
					<li>
						<strong>授课列表</strong>
					</li>
				</ol>
			</div>
			<div class="row">
				<a href="${pageContext.request.contextPath }/admin/TC.jsp" class="btn btn-link">授课管理</a>
				<a href="#" class="btn btn-info">添加授课</a>
			</div>

		</div>
		<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：导航结束
        -->

		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>授课列表（all）</h5>

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
							<input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="搜索表格...">

							<table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
								<thead>
									<tr>
										<th>教师名称</th>
										<th>授课名称</th>
										<th>所在系别</th>
										<th>班级</th>

										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${tc}" var="c"  >
									<tr class="gradeC">
										<td>${c.tno }</td>
										<td>${c.cno }
										</td>
										<td>${c.tsdept}
										</td>
										<td>${c.tclass}</td>
										<td class="center">
											<button class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button>
											<button class="btn btn-warning " type="button"><i class="fa fa-warning"></i> <span class="bold">删除</span>
                                            
                                            </td>
                                          
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
    <script src="${pageContext.request.contextPath }/admin/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/admin/Reception/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath }/admin/Reception/js/plugins/footable/footable.all.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/admin/Reception/js/content.js?v=1.0.0"></script>
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.footable2').footable();

        });

    </script>
	</body>
</html>