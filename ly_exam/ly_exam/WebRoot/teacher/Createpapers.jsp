<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  
   <!DOCTYPE html>
<html>

<head>
  <base href="<%=basePath%>">    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>创建试卷</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath }/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/teacher/Reception/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/teacher/Reception/css/style.css?v=4.1.0" rel="stylesheet">
  <!--   -->

</head>

<body class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-sm-8">
            <h2>试卷管理</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="info.jsp">主页</a>
                </li>
                <li>
                    <strong>创建试卷</strong>
                </li>
            </ol>
            <div class="row"> <a href="${pageContext.request.contextPath}/teacherAction?action=CreatePapers01" class="btn btn-link">创建试卷</a>
              <a href="${pageContext.request.contextPath}/teacherAction?action=paperListShow" class="btn btn-info">试卷管理</a></div>
       
        </div>
         
    </div>
   
    <div class="wrapper wrapper-content">
    	
    	
    	
        <div class="row">
           
                
                  
                  <!-- 内容开始   -->
                 <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>创建试卷</h5>
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
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/teacherAction?action=CreatePapers02"  method="post">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">试卷标题：</label>

                                <div class="col-sm-8">
                                    <input type="text" autofocus="" placeholder="试卷标题" class="form-control" name="pname"> 
                                    <span class="help-block m-b-none">请输入您的试卷标题</span>
                                </div>
                            </div>
                              
                           <div class="form-group">
                                <label class="col-sm-3 control-label">试卷科目：</label>
                                <div class="col-sm-8">
                                   <select  name="cno"> 
                                   <c:forEach items="${course}" var="coures">
                                   <option value="${coures.cno }">${coures.cname}</option>
                                 </c:forEach>
                                   </select>
                                </div>
                            </div>
                             <div class="form-group">
                                        <label class="col-sm-3 control-label" id="hello">试卷时间规划：</label>
                                        <div class="col-sm-8">
                                            <input name="pstime" placeholder="开始考试时间" class="form-control layer-date" id="start">
                                            <input name="petime" placeholder="结束考试时间" class="form-control layer-date" id="end">
                                        </div>
                                    </div>
                                    
                                        <div class="form-group">
                                <label class="col-sm-3 control-label">试卷类型：</label>
                                <div class="col-sm-1">
                                   <select name="paperType" onchange="checkYear();"  > 
                                   <option value="机选试卷">机选试卷</option>
                                   <option value="自选试卷">自选试卷</option>
                                   </select>                                   
                                </div>
                                <div class="col-sm-7"  id="jx"><span style="color: red;">*系统随机选择试卷所有题目</span></div>
                                 <div class="col-sm-7"  id="zx" style="display:none"><span style="color: red;">*老师自己选择试卷所有题目</span></div>
                              
                            </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">单选题数量：</label>
                                <div class="col-sm-2">
                                    <input name="schoice" type="text"  placeholder="请输入单选题数量 " class="form-control">
                                </div>
                                                                <label class="col-sm-3 control-label">每题分值：</label>
                                <div class="col-sm-2">
                                    <input name="scscore"  type="text"  placeholder="请输入每题分值分" class="form-control">
                                </div>
                                                                <label class="col-sm-3 control-label">多选题数量：</label>
                                <div class="col-sm-2">
                                    <input name="mchoice" type="text"  placeholder="请输入多选题数量 " class="form-control">
                                </div>
                                                                <label class="col-sm-3 control-label">每题分值：</label>
                                <div class="col-sm-2">
                                    <input name="mcscore" type="text"  placeholder="请输入每题分值分" class="form-control">
                                </div>
                                  <label class="col-sm-3 control-label">判断题数量：</label>
                                <div class="col-sm-2">
                                    <input name="judge" type="text"  placeholder="请输入判断题数量 " class="form-control">
                                </div>
                                                                <label class="col-sm-3 control-label">每题分值：</label>
                                <div class="col-sm-2">
                                    <input name="jscore" type="text"  placeholder="请输入每题分值分" class="form-control">
                                </div>
                                  <label class="col-sm-3 control-label">简答题数量：</label>
                                <div class="col-sm-2">
                                    <input id="jdtsl" name="sanswer" type="text"  placeholder="请输入简答题数量 " class="form-control">
                                </div>
                                                                <label class="col-sm-3 control-label">每题分值：</label>
                                <div class="col-sm-2">
                                    <input name="sascore" type="text"  placeholder="请输入每题分值分" class="form-control">
                                </div>
                                
                            </div>
                            <!--  
                             <div class="form-group">
                                <label class="col-sm-3 control-label">试卷说明：</label>
                                <div class="col-sm-8">
                                    <textarea  data-provide="markdown" rows="5" class="col-lg-12" ></textarea>
                                </div>
                            </div>
                           -->
                    <div class="form-group">
                                <label class="col-sm-3 control-label">考试专业：</label>

                                <div class="col-sm-8">
                                <c:forEach items="${sclass}" var="sclass">
                                    <label class="checkbox-inline">
                                        <input name="sclass" type="checkbox" value="${sclass.scno }" id="inlineCheckbox1">${sclass.scname }</label>
                                    </c:forEach> </div>
                            </div>
                            
                           
                            <div class="hr-line-dashed"></div>
                                    
                            <div class="form-group" id="jxt">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-success" type="submit">确认</button>
                                     <button class="btn btn-sm btn-link" type="reset">重置</button>
                                </div>
                            </div>
                                      
                            <div class="form-group"   id="zxt"  style="display:none">
                            
                                <div class="col-sm-offset-0 col-sm-12">
                                
                                <div class="alert alert-success alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                           非常抱歉，自选试卷正在加紧开发中，敬请期待 <a class="alert-link" href="notifications.html#">使用帮助？</a>.
                        </div>
                                <!-- 
                                    <button class="btn btn-sm btn-success" type="submit">下一步</button>
                                     <button class="btn btn-sm btn-link" type="reset">重置</button>
                                      -->
                                </div>
                            </div>
                            
                              
                             
                                     
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
                  <!-- 内容结束      -->
               
               
        </div>
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/teacher/Reception/js/content.js?v=1.0.0"></script>
 <script src="${pageContext.request.contextPath }/teacher/Reception/js/plugins/layer/laydate/laydate.js"></script>
 
  
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
        var selectValue = $("select[name='paperType']").val();  
        if(selectValue == "机选试卷"){  
        	
            $("#zx").hide();  
             $("#zxt").hide();  
             $("#jx").show();  
              $("#jxt").show();  
        }  
        if(selectValue == "自选试卷"){  
            $("#zxt").show();  
             $("#jx").hide();  
             $("#jxt").hide();  
             $("#zx").show();  
        }  
      
    }  
</script>  
  
    <script type="text/javascript">
var text = document.getElementById("jdtsl");
text.onkeyup = function(){
this.value=this.value.replace(/\D/g,'');
if(text.value>1){
  text.value = 1;
}else
{text.value = 1;
}
}
</script>
 
</body>

</html>
   