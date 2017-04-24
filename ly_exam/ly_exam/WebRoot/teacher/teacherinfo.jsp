<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <base href="<%=basePath%>">    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>教师信息</title>
		<link rel="shortcut icon" href="favicon.ico">
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">

		<!-- Data Tables -->
		<link href="${pageContext.request.contextPath }/teacher/Reception/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

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
				<h2>教师管理</h2>
				<ol class="breadcrumb">
					<li>
						<a href="info.jsp">主页</a>
					</li>
					<li>
						<strong>教师列表</strong>
					</li>
				</ol>
			</div>
			<div class="row">
				<a href="${pageContext.request.contextPath }/teacher/teacherinfo.jsp" class="btn btn-link">教师管理</a>
				<a href="${pageContext.request.contextPath }/teacher/addTeacher.jsp" class="btn btn-info">添加教师</a>
			</div>

		</div>
		<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：导航结束
        -->

		<div class="wrapper wrapper-content animated fadeInRight">

			<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：搜索表单
        -->
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
								<input name="title" type="text" placeholder="请输入学生姓名" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> </span>
							</div>
						</div>

					</div>
				</form>

			</div>

			<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：搜索表单结束
        -->
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>教师信息<small>(all)</small></h5>
							<div class="ibox-tools">
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>
								</a>
								<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
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

							<table class="table table-striped table-bordered table-hover dataTables-example">
								<thead>
									<tr>
										<th>教师号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>系别</th>
										<th>密码</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									
                                <tr class="gradeX">
                                    <td>20140553018</td>
                                    <td>潘铁民 </td>
                                    <td>男</td>
                                    <td class="center">数学与计算机科学</td>
                                    <td class="center">password</td>
                                    <td><a href="${pageContext.request.contextPath}/teacher/teacherEdit.jsp" class="btn btn-info " type="button"><i class="fa fa-paste"></i> 编辑</a>
											<a class="btn btn-warning " type="button"><i class="fa fa-warning"></i> <span class="bold">删除</span></a></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                   <th>Tno</th>
                                    <th>Tname</th>
                                    <th>Tsex</th>
                                    <th>Tdept</th>
                                    <th>Tpassword</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
            </div>
        </div>
		</div>
		
		
		
		
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/bootstrap.min.js?v=3.3.6"></script>



    <script src="${pageContext.request.contextPath }/teacher/Reception/js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/content.js?v=1.0.0"></script>


    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $('.dataTables-example').dataTable();

            /* Init DataTables */
            var oTable = $('#editable').dataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable('../example_ajax.php', {
                "callback": function (sValue, y) {
                    var aPos = oTable.fnGetPosition(this);
                    oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                },
                "submitdata": function (value, settings) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition(this)[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            });


        });

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData([
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row"]);

        }
    </script>
	</body>
</html>    