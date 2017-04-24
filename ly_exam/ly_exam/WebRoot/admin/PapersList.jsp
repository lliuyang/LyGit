<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


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
		<link href="${pageContext.request.contextPath}/admin/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/admin/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/admin/Reception/css/plugins/footable/footable.core.css" rel="stylesheet">

		<link href="${pageContext.request.contextPath}/admin/Reception/css/animate.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/admin/Reception/css/style.css?v=4.1.0" rel="stylesheet">

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
				<a href="${pageContext.request.contextPath }/admin/PapersList.jsp" class="btn btn-link">试卷管理</a>
				<a href="${pageContext.request.contextPath }/admin/Createpapers.jsp" class="btn btn-info">创建试卷</a>
			</div>

		</div>

		<div class="wrapper wrapper-content animated fadeInRight">
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
										<th data-hide="all">考试时间安排</th>
										<th data-hide="all">选择题</th>
										<th data-hide="all">判断题</th>
										<th data-hide="all">简答题</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td> <input type="checkbox"> </td>
										<td>2015年秋期期末考试</td>
										<td>罗根源</td>
										<td>计算机组成原理</td>
										<td>开始时间：2016/12/24 22:33:56 结束时间： 2016/12/25 24:00:00</td>
										<td><span class="pie">21/23/656/8/56/4/54/871/874/47/47/21/7/1/587/15/487/41/578/15</span></td>
										<td>21/23/656/8/56/4/54/871/874/47/47/21/7/1/587/15/487/41/578/</td>
										<td>21/23/656/8/56/4/54/871/874/47/47/21/7/1/587/15/487/41/578/</td>
										<td> <button class="btn btn-info " type="button"> 详情</button> <button class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button>
											<button class="btn btn-warning " type="button"><i class="fa fa-warning"></i> <span class="bold">删除</span></td>
                                </tr>
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
    <script src="${pageContext.request.contextPath}/admin/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/plugins/footable/footable.all.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/admin/Reception/js/content.js?v=1.0.0"></script>
    <script>
        $(document).ready(function() {

            $('.footable').footable();
            $('.footable2').footable();

        });

    </script>

    
    

</body>

</html>