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


    <title>试卷批阅</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/teacher/Reception/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/teacher/Reception/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/teacher/Reception/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/teacher/Reception/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-sm-12">
            <h2>试卷详情</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="${pageContext.request.contextPath}/teacher/info.jsp">主页</a>
                </li>
                <li>
                    <strong>批阅试卷</strong>
                </li>
            </ol>
        </div>
        <div class="row"> <a href="${pageContext.request.contextPath}/teacher/DreadPaperList.jsp" class="btn btn-link">批阅试卷</a> <a href="${pageContext.request.contextPath}/teacherAction?action=DreadPapers" class="btn btn-info">待批阅试卷</a> </div>
               
    </div>

    <div class="wrapper wrapper-content">
        <div class="row">
        	   
            <div class="col-sm-12">
                <div class=" text-center ">
           <!-- 内容开始   -->
      
        <div class="row">
        <div class="col-sm-12">
        <form action="teacherAction?action=addScore" method="post">
            <div class="wrapper wrapper-content animated fadeInUp">
                <div class="ibox">
                    <div class="ibox-content">
                    
                     <c:forEach items="${Ditile }" var="d">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="m-b-md">
                                    <a  class="btn btn-white btn-xs pull-right " style="color: red;" >总分${d.ptotalscore }</a>
                                    <h2>${d.pname }</h2>
                                </div>
                                <dl class="dl-horizontal">
                                    <dt>状态：</dt>
                                    <dd><span class="label label-primary">${d.apstate }</span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <dl class="dl-horizontal">

                                    <dt>姓名：</dt>
                                    <dd>${d.sname }</dd>
                                    <dt>单选题分数：</dt>
                                    <dd style="color:#00625A;">${d.d01 }</dd>
                                    <dt>多选题分数：</dt>
                                    <dd style="color:#00625A;">${d.d02 }
                                    </dd>
                                    <dt>判断题分数：</dt>
                                    <dd style="color:#00625A;">${d.d03 }</dd>
                                </dl>
                            </div>
                            <div class="col-sm-7" id="cluster_info">
                                <dl class="dl-horizontal">

                                    <dt>学号：</dt>
                                    <dd>${d.sno }</dd>
                                    <dt>开始时间：</dt>
                                    <dd>${d.pstime }</dd>
                                    <dt>结束时间：</dt>
                                    <dd >${d.petime }                                
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <dl class="dl-horizontal">
                                    <dt>当前试卷批阅进度</dt>
                                    <dd>
                                        <div class="progress progress-striped active m-b-sm">
                                            <div style="width:80%;" class="progress-bar"></div>
                                        </div>
                                        <small>当前已完成批阅总进度的 <strong>80%</strong></small>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="row m-t-sm">
                             </c:forEach>
                             <%int i=1; %>
                            <c:forEach items="${ answer}" var="a">
        <div class="row" >
       
            <div class="col-sm-12" style="margin-top: 20px;">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>这是第<%=i++ %>道答题（<span style="color: red;">${a.sascore }分满分</span>)</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content no-padding">

                                                 
                         
                        <div class="summernote">
                            <h2 style="margin-top: 20px;">${a.title }</h2>
                            <p style="margin-top: 30px;">${a.answer }</p>
                               <div class="form-group">                              
                                <div class="col-sm-12">
                                
                                    <input id="fs" name="allscore" type="text" placeholder="请在此输入该简答题得分，在0-${a.anscoretip}分之间，不能输入小数点！" class="form-control">
                                </div>
                            </div>
                        </div>
                      
                         
                               
        </div>
          </c:forEach>
        
                                 
                                 
                                 <c:forEach items="${Ditile }" var="d">
                                 <input type="hidden" name="sno" value=${d.sno } readonly="readonly" />
                                   <input type="hidden" name="cno" value=${d.cno }  readonly="readonly" />
                                      <input type="hidden" name="pnums" value=${d.pnums } readonly="readonly"  />
                                   
                                 </c:forEach>
                               
                                

                    </div>
                    
                   
                </div>
                
            
                   
            </div>
        </div>
         
                 <div class=" form-group"> 
    <button class="btn btn-sm btn-success" type="submit">确认</button>
                                     <button class="btn btn-sm btn-link" type="reset">返回</button>
                                
                            </div>
                       </form>       
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
    </div>
     
                  <!-- 内容结束      -->
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/teacher/Reception/js/content.js?v=1.0.0"></script>

    
    <script>
        $(document).ready(function () {

            $('#loading-example-btn').click(function () {
                btn = $(this);
                simpleLoad(btn, true)

                // Ajax example
                //                $.ajax().always(function () {
                //                    simpleLoad($(this), false)
                //                });

                simpleLoad(btn, false)
            });
        });

        function simpleLoad(btn, state) {
            if (state) {
                btn.children().addClass('fa-spin');
                btn.contents().last().replaceWith(" Loading");
            } else {
                setTimeout(function () {
                    btn.children().removeClass('fa-spin');
                    btn.contents().last().replaceWith(" Refresh");
                }, 2000);
            }
        }
    </script>
    


</body>

</html>
