<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


  <!DOCTYPE html>
<html >
<head>
    <base href="<%=basePath%>">    
  <meta charset="UTF-8">
  <title>管理员登录</title>
  

      <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlogin/css/style.css">

  
</head>

<body>
  <div class="container">
  <div class="login">
  	<h1 class="login-heading">
      <strong>欢迎使用无纸化考试系统</strong> 请登录......</h1>
      <form method="post" action="adminLogin.html">
          <input type="hidden" name="if" value="A" >
        <input type="text" name="username" placeholder="请输入您的管理员账号" required="required" class="input-txt" />
          <input type="password" name="password" placeholder="密码" required="required" class="input-txt" />
          <div class="login-footer">
             <a href="#" class="lnk">
              <span class="icon icon--min"></span> 
            欢迎使用无纸化考试系统
            </a>
            <button type="submit" class="btn btn--right">登录 </button>
    
          </div>
      </form>
  </div>
</div>
  
    <script src="${pageContext.request.contextPath}/adminlogin/js/index.js"></script>

</body>
</html>
    