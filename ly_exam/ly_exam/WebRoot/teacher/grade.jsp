<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
    
<!DOCTYPE html>
<html>

<head>
 <base href="<%=basePath%>">    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 学生成绩查询</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
<link
	href="${pageContext.request.contextPath}/teacher/Reception/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/teacher/Reception/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/teacher/Reception/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/teacher/Reception/css/style.css?v=4.1.0"
	rel="stylesheet">
<link rel="stylesheet" id="pageloader-css"
	href="${pageContext.request.contextPath}/teacher/Reception/css/pageloader.css"
	type="text/css" media="all" />

</head>

<body class="white-bg">
    <div class="wrapper wrapper-content p-xl">
        <div class="ibox-content p-xl">
            <div class="row">
                <div class="col-sm-6">
                    <address>
                        <strong>重庆师范大学涉外商贸学院教务处</strong><br>
                        重庆市合川区合阳街道学府路9号<br>
                        <abbr title="Phone">座机：</abbr> (+86 10) 5992 8888
                    </address>
                </div>
<c:forEach items="${stu }" var="s">
                <div class="col-sm-6 text-right">
                    <h4>学号：</h4>
                    <h4 class="text-navy">${s.sno }</h4>
                    <address>
                    <br>
                        <strong>${s.sname }</strong>
                      <br>
                      <br>
                         <abbr title="性别">性别：</abbr> ${s.ssex }
                    </address>
                    <p>
                     <!--    <span><strong>日期：</strong> 2014-11-11</span> -->
                    </p>
                </div>
                </c:forEach>
            </div>

            <div class="table-responsive m-t">
                <table class="table invoice-table">
                    <thead>
                        <tr>
                            <th>试卷标题</th>
                            <th>考试科目</th>
                            <th>所属班级</th>
                         
                            <th>分数</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach  items="${grade }" var="g">
                       <tr>
                            <td>
                                <div><strong>${g.pname }</strong>
                                </div>
                            </td>
                            <td>${g.cname }</td>
                            <td>${g.sclass }</td>
                           
                            <td><span style="font-size: 24px; color: green;">${g.sscore}</span></td>
                        </tr>
                   </c:forEach>

                    </tbody>
                </table>
            </div>
            <!-- /table-responsive -->
<!-- 
            <table class="table invoice-total">
                <tbody>
                    <tr>
                        <td><strong>总价：</strong>
                        </td>
                        <td>&yen;1026.00</td>
                    </tr>
                    <tr>
                        <td><strong>税：</strong>
                        </td>
                        <td>&yen;235.98</td>
                    </tr>
                    <tr>
                        <td><strong>总计</strong>
                        </td>
                        <td>&yen;1261.98</td>
                    </tr>
                </tbody>
            </table> -->

            <div class="well m-t"><strong>注意：</strong> 该生成绩查询经供参考，不可用于非法用途。
          <!--   <a >打印</a> -->
         
            </div>
             <div class="text-right">
                        <a class="btn btn-primary" onclick="javascript:window.print()">打印</a>
                    </div>
        </div>

    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
<!-- 
    <script type="text/javascript">
        window.print();
    </script>

  -->
    

</body>

</html>
    