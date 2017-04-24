<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>

<head>
   
    <base href="<%=basePath%>">    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title> 教育系统超级管理员后台</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath}/admin/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/style.css?v=4.1.0" rel="stylesheet">
     <link rel="stylesheet" id="pageloader-css"  href="${pageContext.request.contextPath}/admin/Reception/css/pageloader.css" type="text/css" media="all" />
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
	
	
		
<!--加载 -->
<div id="bonfire-pageloader">
	<div class="bonfire-pageloader-icon">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			 width="512px" height="512px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
		<path id="loading-12-icon" d="M291,82.219c0,16.568-13.432,30-30,30s-30-13.432-30-30s13.432-30,30-30S291,65.65,291,82.219z
			 M261,404.781c-15.188,0-27.5,12.312-27.5,27.5s12.312,27.5,27.5,27.5s27.5-12.312,27.5-27.5S276.188,404.781,261,404.781z
			 M361.504,113.167c-4.142,7.173-13.314,9.631-20.487,5.489c-7.173-4.141-9.631-13.313-5.49-20.487
			c4.142-7.173,13.314-9.631,20.488-5.489C363.188,96.821,365.645,105.994,361.504,113.167z M188.484,382.851
			c-14.348-8.284-32.697-3.368-40.98,10.98c-8.285,14.349-3.367,32.696,10.98,40.981c14.35,8.283,32.697,3.367,40.98-10.981
			C207.75,409.482,202.834,391.135,188.484,382.851z M421.33,184.888c-8.368,4.831-19.07,1.965-23.901-6.404
			c-4.832-8.368-1.965-19.07,6.404-23.902c8.368-4.831,19.069-1.964,23.9,6.405C432.566,169.354,429.699,180.056,421.33,184.888z
			 M135.399,329.767c-8.285-14.35-26.633-19.266-40.982-10.982c-14.348,8.285-19.264,26.633-10.979,40.982
			c8.284,14.348,26.632,19.264,40.981,10.98C138.767,362.462,143.683,344.114,135.399,329.767z M436.031,277.249
			c-11.044,0-20-8.953-20-19.999c0-11.045,8.955-20.001,20.001-20.001c11.044,0,19.999,8.955,19.999,20.002
			C456.031,268.295,447.078,277.249,436.031,277.249z M115.97,257.251c-0.001-16.57-13.433-30.001-30.001-30.002
			c-16.568,0.001-29.999,13.432-30,30.002c0.001,16.566,13.433,29.998,30.001,30C102.538,287.249,115.969,273.817,115.97,257.251z
			 M401.333,364.248c-10.759-6.212-14.446-19.97-8.234-30.73c6.212-10.759,19.971-14.446,30.731-8.233
			c10.759,6.211,14.445,19.971,8.232,30.73C425.852,366.774,412.094,370.46,401.333,364.248z M135.398,184.736
			c8.285-14.352,3.368-32.698-10.98-40.983c-14.349-8.283-32.695-3.367-40.981,10.982c-8.282,14.348-3.366,32.696,10.981,40.981
			C108.768,204,127.115,199.082,135.398,184.736z M326.869,421.328c-6.902-11.953-2.807-27.242,9.148-34.145
			s27.243-2.806,34.146,9.149c6.902,11.954,2.806,27.243-9.15,34.145C349.059,437.381,333.771,433.284,326.869,421.328z
			 M188.482,131.649c14.352-8.286,19.266-26.633,10.982-40.982c-8.285-14.348-26.631-19.264-40.982-10.98
			c-14.346,8.285-19.264,26.633-10.98,40.982C155.787,135.017,174.137,139.932,188.482,131.649z">
		</svg>

	</div>

</div>
<!--加载 -->

<!-- body-->
	
	
	
    <div id="wrapper" style="margin-top: 50px;">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation" >
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                      
                        <div class="logo-element">超级管理员
                        </div>
                    </li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">总览</span>
                    </li>
                    <li>
                        <a class="J_menuItem" href="${pageContext.request.contextPath }/admin/info.jsp">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">系統信息</span>
                        </a>
                    </li>
                    
                    <!-- 试卷管理注释开始
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">试卷管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                         
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/PapersList.jsp">试卷列表</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/admin/Createpapers.jsp">创建试卷</a>
                            </li>
                          
                           
                        </ul>
                    </li>
                    
                   试卷管理注释结束 -->
                
                   
                   
                    
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">部门管理</span>
                    </li>
                   <li>
                        <a href="#">
                            <span class="J_menuItem">学生班级</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        <c:forEach items="${sclass}" var="sclass">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/adminAction?action=StudentList&sclasse=${sclass.scno}">${sclass.scname}</a>
                            </li>
                          
                          </c:forEach>
                         
                           
                        </ul>
                    </li>
                   
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath }/adminAction?action=teacherList">教师信息</a>
                            </li>
                           
                  
                  
                  
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">专业管理</span>
                    </li>
                <li>
                        <a class="J_menuItem"  href="${pageContext.request.contextPath }/adminAction?action=getScourse"><i class="fa fa-adjust"></i> <span class="nav-label">课程管理</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem"  href="${pageContext.request.contextPath }/adminAction?action=tc"><i class="fa fa-adjust"></i> <span class="nav-label">授课管理</span></a>
                    </li>
                      <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">题库管理</span>
                    </li>
                    <li>
                        <a ><i class="fa fa-flask"></i> <span class="nav-label">题库</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                           <c:forEach items="${course}" var="course">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/adminAction?action=questionList&courses=${course.cno}">${course.cname}题库</a>
                            </li>
                          
                          </c:forEach>                        
                            
                        </ul>
                  
                   
                    </li>
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">成绩查询</span>
                    </li><li><a class="J_menuItem"
					href="${pageContext.request.contextPath }/seleceScoer/index.jsp"><i></i>
						<span>成绩查询入口</span> </a>
						
				</li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                  
                    
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
            	<!--
                	作者：1255070026@qq.com
                	时间：2017-04-07
                	描述：框架内容嵌套开始
                -->
                <iframe id="J_iframe" name="main" width="100%" height="100%" src="${pageContext.request.contextPath}/admin/info.jsp" frameborder="0"  seamless></iframe>
            <!--
                	作者：1255070026@qq.com
                	时间：2017-04-07
                	描述：框架内容嵌套结束
                -->
            </div>
        </div>
        <!--右侧部分结束-->
    </div>




   <!--/body
-->
<script src="${pageContext.request.contextPath}/admin/Reception/js/jquery.min.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/admin/Reception/js/pageloader.js" type="text/javascript"></script>
<!-- BEGIN PLACE LOADING ICON IN THE MIDDLE OF THE PAGE -->
<script>
jQuery(window).resize(function(){
	 resizenow();
});
function resizenow() {
	var browserwidth = jQuery(window).width();
	var browserheight = jQuery(window).height();
	jQuery('.bonfire-pageloader-icon').css('right', ((browserwidth - jQuery(".bonfire-pageloader-icon").width())/2)).css('top', ((browserheight - jQuery(".bonfire-pageloader-icon").height())/2));
};
resizenow();
</script>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/admin/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/admin/Reception/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Reception/js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="${pageContext.request.contextPath}/admin/Reception/js/plugins/pace/pace.min.js"></script>
<div style="text-align:center;">
</div>
</body>

</html>
    
