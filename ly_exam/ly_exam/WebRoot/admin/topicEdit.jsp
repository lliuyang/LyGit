<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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


    <title>编辑题目</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/Reception/css/style.css?v=4.1.0" rel="stylesheet">
  <!--   -->

</head>

<body class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-sm-8">
            <h2>编辑题目</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="info.jsp">主页</a>
                </li>
                <li>
                    <strong>修改试题</strong>
                </li>
            </ol>
            <div class="row"> <a href="${pageContext.request.contextPath}/admin/topicEdit.jsp" class="btn btn-link">修改试题</a>  <a href="${pageContext.request.contextPath}/admin/TkList.jsp" class="btn btn-info">题目管理</a></div>
       
        </div>
         
    </div>
   
    <div class="wrapper wrapper-content">
        <div class="row">
           
                  
                  
                  <!-- 内容开始   -->
                 <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改试题</h5>
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
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" action="${pageContext.request.contextPath }/adminAction?action=questionMod" method="post">
                             <c:forEach items="${Question}"  var="question">
                             <div class="form-group">
                                <label class="col-sm-3 control-label">题目编号：</label>
                                 <div class="col-sm-8">
                                    <input type="text" name="qno" value="${question.qno}" readonly="readonly" placeholder="题目编号" class="form-control"> 
                                </div> 
                            </div>
                              
                           <div class="form-group">
                                <label class="col-sm-3 control-label">试卷科目：</label>
                                <div class="col-sm-8">
                                   <select name="cno">
                                   <c:forEach items="${Course}"  var="c">
                                   <option value="${c.cno}" <c:if test='${question.cno == c.cno}'>selected="selected"</c:if>>${c.cname}</option>
                                   </c:forEach> 
                                   </select>
                                </div>
                            </div>
                           

                                <div class="form-group">
                                <label class="col-sm-3 control-label">试题类型：</label>
                                <div class="col-sm-8">
                                   <select name="qtype" onchange="checkYear();" > 
                                   <option value="选择题" <c:if test="${question.qtype=='选择题'}">selected</c:if>>选择题</option>
                                   <option value="多选题" <c:if test="${question.qtype=='多选题'}">selected</c:if>>多选题</option>
                                   <option value="判断题" <c:if test="${question.qtype=='判断题'}">selected</c:if>>判断题</option>
                                   <option value="简答题" <c:if test="${question.qtype=='简答题'}">selected</c:if>>简答题</option>
                                   </select>
                                </div>
                            </div>
                            
                            <div class="form-group" >
                            <label class="col-sm-3 control-label">题目：</label>
                                <div class="col-sm-8">
                                    <input type="text" name="qstatement" value="${question.qstatement}" class="form-control"><span class="help-block m-b-none">请输入题目内容</span>
                                </div> 
                                </div>
                                
                           <div id="abcd">
                             <div class="form-group" >
                                <label class="col-sm-3 control-label">答案A：</label>
                                <div class="col-sm-8">
                                    <input type="text" name="qchoicea" value="${question.qchoicea}" class="form-control"> <span class="help-block m-b-none">请输入答案</span>
                                </div>
                            </div> <div class="form-group">
                                <label class="col-sm-3 control-label">答案B：</label>
                                <div class="col-sm-8">
                                    <input type="text" name="qchoiceb" value="${question.qchoiceb}" class="form-control"> <span class="help-block m-b-none">请输入答案</span>
                                </div>
                            </div> <div class="form-group">
                                <label class="col-sm-3 control-label">答案C：</label>
                                <div class="col-sm-8">
                                    <input type="text" name="qchoicec" value="${question.qchoicec}" class="form-control"> <span class="help-block m-b-none">请输入答案</span>
                                </div>
                            </div> <div class="form-group">
                                <label class="col-sm-3 control-label">答案D：</label>
                                <div class="col-sm-8">
                                    <input type="text" name="qchoiced" value="${question.qchoiced}" class="form-control"> <span class="help-block m-b-none">请输入答案</span>
                                </div>
                            </div>
                          </div>
                    <div class="form-group" id="dxt" style="display:none">
                                <label class="col-sm-3 control-label">正确答案（多选题）：</label>

                                <div class="col-sm-8">
                                    <label class="checkbox-inline">
                                    <%-- <c:set var="thestring" value="${question.qanswer }"/> --%>
                                        <input type="checkbox" name="manswer" value="A" <c:if test="${fn:contains(question.qanswer,'A')}">checked</c:if> id="inlineCheckbox1">A</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="manswer" value="B" <c:if test="${fn:contains(question.qanswer,'B')}">checked</c:if> id="inlineCheckbox2">B</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" name="manswer" value="C" <c:if test="${fn:contains(question.qanswer,'C')}">checked</c:if> id="inlineCheckbox3">C</label>
                                         <label class="checkbox-inline">
                                        <input type="checkbox" name="manswer" value="D" <c:if test="${fn:contains(question.qanswer,'D')}">checked</c:if> id="inlineCheckbox2">D</label>
                                </div>
                            </div>
                             <div class="form-group" id="xzt" >
                                <label class="col-sm-3 control-label">正确答案（选择题）：</label>

                                <div class="col-sm-8">
                                    <label class="checkbox-inline">
                                         <input type="radio" name="sanswer" value="A" <c:if test="${question.qanswer=='A'}">checked</c:if>>A</label>
                                    <label class="checkbox-inline">
                                        <input type="radio"name="sanswer"  value="B"  <c:if test="${question.qanswer=='B'}">checked</c:if>>B</label>
                                    <label class="checkbox-inline">
                                         <input type="radio" name="sanswer" value="C" <c:if test="${question.qanswer=='C'}">checked</c:if>>C</label>
                                         <label class="checkbox-inline">
                                         <input type="radio"name="sanswer"  value="D" <c:if test="${question.qanswer=='D'}">checked</c:if>>D</label>
                                </div>
                            </div>
                              <div class="form-group" id="pdt" style="display:none">
                                <label class="col-sm-3 control-label">正确答案(判断题)：</label>

                                <div class="col-sm-8">
                                    <label class="checkbox-inline">
                                         <input type="radio" name="janswer" value="T" <c:if test="${question.qanswer=='T'}">checked</c:if>>T</label>
                                    <label class="checkbox-inline">
                                        <input type="radio"name="janswer"  value="F"  <c:if test="${question.qanswer=='F'}">checked</c:if>>F</label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                                    
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-success" type="submit">修改</button>
                                     <button class="btn btn-sm btn-link" type="reset">取消</button>
                                </div>
                            </div>
           				</c:forEach>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                  <!-- 内容结束      -->
               
        </div>
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/admin/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/admin/Reception/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/admin/Reception/js/content.js?v=1.0.0"></script>
 <script src="${pageContext.request.contextPath}/admin/Reception/js/plugins/layer/laydate/laydate.js"></script>
 
  
 <script>
        //外部js调用
        laydate({
            elem: '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });

        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-06-16 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
    </script>
    
   
 
   <script>  
    function checkYear() {  //下拉列表框的显示与隐藏
        var selectValue = $("select[name='qtype']").val();  
        if(selectValue == "选择题"){  
        	
            $("#pdt").hide();  
             $("#dxt").hide();  
             $("#xzt").show();  
              $("#abcd").show();  
        }  
        if(selectValue == "多选题"){  
            $("#dxt").show();  
             $("#pdt").hide();  
             $("#xzt").hide();  
             $("#abcd").show();  
        }  
        if(selectValue == "判断题"){  
            $("#dxt").hide();  
             $("#pdt").show();  
             $("#xzt").hide();  
              $("#abcd").hide();  
        }  
        if(selectValue == "简答题"){  
            $("#dxt").hide();  
             $("#pdt").hide();  
             $("#xzt").hide();  
               $("#abcd").hide();  
        }  
    }  
</script>  
  

       
   
</body>

</html>
   