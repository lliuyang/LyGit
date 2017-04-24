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

    <title>信息初始化总览</title>

   <link href="<%=basePath%>/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/teacher/Reception/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>/teacher/Reception/css/style.css?v=4.1.0" rel="stylesheet">
   

</head>

<body class="gray-bg">
	


<!-- body-->
	
	
	
	
    <div class="wrapper wrapper-content">
    	 <div class="alert alert-success alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            欢迎XXXX管理员回来，现在北京时间是2017/4/8 09:50:26 <a class="alert-link" href="notifications.html#">使用帮助？</a>.
                        </div>
        <div class="row">
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="row row-sm text-center">
                            <div class="col-xs-6">
                                <div class="panel padder-v item">
                                    <div class="h1 text-info font-thin h1">521</div>
                                    <span class="text-muted text-xs">学生总数</span>
                                    <div class="top text-right w-full">
                                        <i class="fa fa-caret-down text-warning m-r-sm"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="panel padder-v item bg-info">
                                    <div class="h1 text-fff font-thin h1">521</div>
                                    <span class="text-muted text-xs">教师总数</span>
                                    <div class="top text-right w-full">
                                        <i class="fa fa-caret-down text-warning m-r-sm"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="panel padder-v item bg-primary">
                                    <div class="h1 text-fff font-thin h1">521</div>
                                    <span class="text-muted text-xs">试卷套数</span>
                                    <div class="top text-right w-full">
                                        <i class="fa fa-caret-down text-warning m-r-sm"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="panel padder-v item">
                                    <div class="font-thin h1">129</div>
                                    <span class="text-muted text-xs">题库总数</span>
                                    <div class="bottom text-left">
                                        <i class="fa fa-caret-up text-warning m-l-sm"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title" style="border-bottom:none;background:#fff;">
                                <h5>服务器信息</h5>
                            </div>
                            <div class="ibox-content" style="border-top:none;">
                                <div id="flot-line-chart-moving" style="height:217px;">
                                	
                                	服務器信息
                                	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-9" style="padding-right:0;">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title" style="border-bottom:none;background:#fff;">
                                <h5>2016年数据</h5>
                            </div>
                            <div class="ibox-content" style="border-top:none;">
                                <div style="height:217px;">
                                	
                                	
                                	數據
                                	
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3" style="padding-left:0;">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content" style="border-top:none;background-color:#e4eaec;">
                                <h5>教师上线率</h5>
                                <div class="progress progress-striped active">
                                    <div style="width: 75%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar">
                                        <span class="sr-only"></span>
                                    </div>
                                </div>
                                <h5>学生上线率</h5>
                                <div class="progress progress-striped active">
                                    <div style="width: 75%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar progress-bar-warning">
                                        <span class="sr-only"></span>
                                    </div>
                                </div>
                                <h5>全校合格率</h5>
                                <div class="progress progress-striped active">
                                    <div style="width: 75%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar .progress-bar-danger">
                                        <span class="sr-only"></span>
                                    </div>
                                </div>
                                <h5>最高合格率专业</h5>
                                <div class="progress progress-striped active">
                                    <div style="width: 75%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar progress-bar-info">
                                        <span class="sr-only"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             
            </div>
            <div class="col-sm-2">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>最新试卷列表</h5>
                    </div>
                    <div class="ibox-content">
                        <ul class="todo-list m-t small-list ui-sortable">
                           
                            <li>
                                <a href="widgets.html#" class="check-link"><i class="fa fa-square-o"></i> </a>
                                <span class="m-l-xs">睡觉</span>
                                <small class="label label-primary"><i class="fa fa-clock-o"></i> 1小时</small>
                            </li>
                           
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/body
-->

    <!-- 全局js -->
    <script src="<%=basePath%>/teacher/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>/teacher/Reception/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="<%=basePath%>/teacher/Reception/js/content.js?v=1.0.0"></script>
    </body>

</html>
   