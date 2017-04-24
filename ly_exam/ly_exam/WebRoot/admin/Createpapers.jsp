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


    <title>创建试卷</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath }/admin/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/Reception/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/Reception/css/style.css?v=4.1.0" rel="stylesheet">
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
            <div class="row"> <a href="${pageContext.request.contextPath }/admin/Createpapers.jsp" class="btn btn-link">创建试卷</a>
              <a href="${pageContext.request.contextPath }/admin/PapersList.jsp" class="btn btn-info">试卷管理</a></div>
       
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
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">试卷标题：</label>

                                <div class="col-sm-8">
                                    <input type="text" autofocus="" placeholder="试卷标题" class="form-control"> 
                                    <span class="help-block m-b-none">请输入您的试卷标题</span>
                                </div>
                            </div>
                              
                           <div class="form-group">
                                <label class="col-sm-3 control-label">试卷科目：</label>
                                <div class="col-sm-8">
                                   <select > 
                                   <option>JSp</option>
                                   <option>java</option>
                                   <option>高等数学</option>
                                   <option>其他</option>
                                   </select>
                                </div>
                            </div>
                             <div class="form-group">
                                        <label class="col-sm-3 control-label" id="hello">试卷时间规划：</label>
                                        <div class="col-sm-8">
                                            <input placeholder="开始考试时间" class="form-control layer-date" id="start">
                                            <input placeholder="结束考试时间" class="form-control layer-date" id="end">
                                        </div>
                                    </div>
                                    
                                        <div class="form-group">
                                <label class="col-sm-3 control-label">试卷类型：</label>
                                <div class="col-sm-8">
                                   <select > 
                                   <option>普通试卷</option>
                                   <option>随机试卷</option>
                                   </select>
                                </div>
                            </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">考试时长：</label>
                                <div class="col-sm-2">
                                    <input type="text"  placeholder="单位分钟" class="form-control">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">试卷说明：</label>
                                <div class="col-sm-8">
                                    <textarea  data-provide="markdown" rows="5" class="col-lg-12" ></textarea>
                                </div>
                            </div>
                          
                    <div class="form-group">
                                <label class="col-sm-3 control-label">考试专业：</label>

                                <div class="col-sm-8">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="option1" id="inlineCheckbox1">计算机商业智能</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="option2" id="inlineCheckbox2">计算机软件工程</label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="option3" id="inlineCheckbox3">计算机物联网</label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                                    
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-success" type="submit">下一步</button>
                                     <button class="btn btn-sm btn-link" type="reset">取消</button>
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
    <script src="${pageContext.request.contextPath }/admin/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/admin/Reception/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/admin/Reception/js/content.js?v=1.0.0"></script>
 <script src="${pageContext.request.contextPath }/admin/Reception/js/plugins/layer/laydate/laydate.js"></script>
 
  
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
    
 
</body>

</html>
   