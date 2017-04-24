<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    
    <!DOCTYPE html>
<html>

	<head>
	   <base href="<%=basePath%>"> 
		<meta charset="UTF-8">
		<title>待批阅试卷</title>
		<link rel="shortcut icon" href="favicon.ico">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">

		<!-- Data Tables -->
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

		<link href="${pageContext.request.contextPath}/teacher/Reception/css/animate.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/teacher/Reception/css/style.css?v=4.1.0" rel="stylesheet">
	</head>

	<body class="gray-bg">

		<!--
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：导航开始
        -->
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-sm-12">
				<h2>待批阅试卷管理</h2>
				<ol class="breadcrumb">
					<li>
						<a href="info.jsp">主页</a>
					</li>
					<li>
						<strong>待批阅试卷列表</strong>
					</li>
				</ol>
			</div>
			<div class="row">
				<a href="${pageContext.request.contextPath}/teacherAction?action=DreadPapers" class="btn btn-link">待批阅试卷管理</a>
				<a href="${pageContext.request.contextPath}/teacherAction?action=paperListShow" class="btn btn-info">试卷列表</a>
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
        -->		<!--
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
								<input name="title" type="text" placeholder="请输入准考证号码" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> </span>
							</div>
						</div>

					</div>
				</form>

			</div>

	
        	作者：1255070026@qq.com
        	时间：2017-04-08
        	描述：搜索表单结束
        -->
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>待批阅试卷信息<small>(all)</small></h5>
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
										<th>学号</th>
										<th>试卷标题</th>
										<th>考试科目</th>
										<th>班级</th>
										<th>批阅进度</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="dp" items="${DreadPapers}">
									<tr class="gradeX">
										<td>${dp.sno }</td>
										<td>${dp.qnums }
										</td>
										<td>${dp.cno }</td>
										<td class="center">${dp.sclass }</td>
										<td><small>当前进度： 80%</small>
                                            <div class="progress progress-mini">
                                                <div style="width: 80%;" class="progress-bar"></div>
                                            </div></td>
										<td><a href="${pageContext.request.contextPath}/teacherAction?action=readPaper&pname=${dp.qnums }
										&pcore=${dp.ptotalscore }&apstate=${dp.apstate }&sname=${dp.sname}&sno=${dp.sno }&d01=${dp.scscore }
										&d02=${dp.mcscore }&d03=${dp.jscore }&pstime=${dp.pstime }&petime=${dp.petime}&qname=${dp.qstatement}
										&apscore=${dp.apscore}&apanswer=${dp.apanswer }
										
										
										" class="btn btn-info " type="button"><i class="fa fa-paste"></i> 批阅</a>
										</td>
                                </tr>
                                
                              </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                   <th>Zkz</th>
                                    <th>Sjtitle</th>
                                    <th>Course</th>
                                    <th>Sdept</th>
                                 <th>Speed of progress</th>
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
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/bootstrap.min.js?v=3.3.6"></script>



    <script src="${pageContext.request.contextPath}/teacher/Reception/js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/content.js?v=1.0.0"></script>


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