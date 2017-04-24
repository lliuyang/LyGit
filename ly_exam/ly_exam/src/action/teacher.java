package action;
/**
 * 教师端所有URL处理
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dao.AdminDao;
import dao.ReadPaperDao;
import dao.TearcherDao;
public class teacher extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		

		HttpSession session=request.getSession();//获取session
		String logintag=(String) session.getAttribute("teacherID");
		
		if(logintag!=null&&logintag.length()>0){
		
		
		
		
		
		
	
		request.setCharacterEncoding("utf-8");   //设置中文乱码	
		
		String action="";
		if(request.getParameter("action")!=null){
			
			action =request.getParameter("action");//获取动作
			}
			
		String courses="%";
		if(request.getParameter("courses")!=null){
		
		courses =courses+request.getParameter("courses")+courses;//获课程题库
		}
		String qnos="%";
		if(request.getParameter("qnos")!=null){
		qnos =qnos+request.getParameter("qnos")+"%";//获课程题库
		
		}
	
		
	
	if(action.equals("index.html")){
			AdminDao A=new AdminDao();
			request.setAttribute("course", A.sendAddQuestion());
			request.setAttribute("sclass", A.getStuClass());
			request.getRequestDispatcher("teacher/index.jsp").forward(request, response);	
		
			
	}
		
		
		
		
		
		
		
		

		TearcherDao T=new TearcherDao();
		if(action==null||action.equals("paperListShow")){
			
			/**
			 * 默认显示试卷列表类
			 */
			
			 request.setAttribute("papers", T.paperList(logintag));		//传递的是教师的教师号	 
			 request.getRequestDispatcher("teacher/PapersList.jsp").forward(request, response);
		}
		
		else if(action!=null&&action.equals("CreatePapers01")){	
			/**
			 * 显示添加试卷页面考试科目以及考试班级处理类
			 */
			
			 request.setAttribute("course", 	T.courseList(logintag));//传递教师号过去			 
			 request.setAttribute("sclass", 	T.sclassList());		
			 request.getRequestDispatcher("teacher/Createpapers.jsp").forward(request, response);
			
		
		}else if(action!=null&&action.equals("CreatePapers02")){	
			/**
			 * 添加试卷方法调用
			 */
			
			//处理复选框的值；
			 String[] arraysclass=request.getParameterValues("sclass");
			 String sclass="";
			if(arraysclass!=null&&arraysclass.length>0){
				for(int i =0;i<arraysclass.length;i++)
					sclass=sclass+arraysclass[i]+"/";				
			}
			
			String tno=(String)session.getAttribute("teacherID");//测试的时候获取教师登录session的tno号码
			String pname=request.getParameter("pname");
			String cno=request.getParameter("cno");
			String pstime=request.getParameter("pstime");
			String petime=request.getParameter("petime");
			String schoice=request.getParameter("schoice");
			String scscore=request.getParameter("scscore");
			String mchoice=request.getParameter("mchoice");
			String mcscore=request.getParameter("mcscore");
			String judge=request.getParameter("judge");
			String jscore=request.getParameter("jscore");
			String sanswer=request.getParameter("sanswer");
			String sascore=request.getParameter("sascore");
			
			boolean tag=false;
			
			tag=T.addPapers(pname, cno, tno, pstime, petime, schoice, scscore, mchoice, mcscore, judge, jscore, sanswer, sascore,sclass);
			if(tag){
				response.setContentType( "text/html;charset=utf-8 "); 
			    PrintWriter  out   = response.getWriter(); 
			    out.println("<script>alert('试卷添加成功！');window.location='teacherAction?action=paperListShow'; </script>");
				
				
			}else{
			
				 response.setContentType( "text/html;charset=utf-8 "); 
			     PrintWriter  out   = response.getWriter(); 
			     out.println("<script>alert('试卷添加失败，请检查输入是否有误！');history.back(-1); </script>");
			}
			
		}else if(action!=null&&action.equals("delePapers")){
			/**
			 * 删除试卷调用类
			 */
			
			String pnum=request.getParameter("pnum");
			if(	T.deldelePapers(pnum)){
				
				response.sendRedirect("teacherAction?action=paperListShow");
			}else{
				
				 response.setContentType( "text/html;charset=utf-8 "); 
			     PrintWriter  out   = response.getWriter(); 
			     out.println("<script>alert('删除失败，当前有学生试卷还未批改，请批阅后重新尝试！');window.location='teacherAction?action=DreadPapers'; </script>");
		
			}
		
			
		}else if(action!=null&&action.equals("DreadPapers")){
			/**
			 * 待批阅试卷列表方法调用
			 */
			
			
			 request.setAttribute("DreadPapers", 	T.answerPaperList(logintag));		//传递教师号过去
			 request.getRequestDispatcher("teacher/DreadPaperList.jsp").forward(request, response);
		}else if(action!=null&&action.equals("readPaper")){
			/**
			 * 批改试卷详情页
			 */
			
			ReadPaperDao d=new ReadPaperDao();
			
			 request.setAttribute("Ditile",d.Paperdtile(request, response));		
			 request.setAttribute("answer", d.answerList(request, response));
			 request.getRequestDispatcher("teacher/readPaper.jsp").forward(request, response);
			
			
			
			
		}else if(action!=null&&action.equals("addScore")){
			String sno=request.getParameter("sno");//获取学生学号
			String cno=request.getParameter("cno");//获取学生考试科目
			String pnums=request.getParameter("pnums");//获取学生考试科目
			
			//处理简答题的值；
			 String[] arraysclass=request.getParameterValues("allscore");
			 
			 int sscore=0;	
			if(arraysclass!=null&&arraysclass.length>0){
				for(int i =0;i<arraysclass.length;i++)
					sscore =sscore+ Integer.parseInt(arraysclass[i]);// 转换
							
			}			
			
		 boolean tag=T.StudentAddScore(sno, cno, pnums, sscore);
		 if(tag){
			 
			 response.setContentType( "text/html;charset=utf-8 "); 
		     PrintWriter  out   = response.getWriter(); 
		     out.println("<script>alert('亲爱的老师，辛苦你了，批阅完成！');window.location='teacherAction?action=DreadPapers'; </script>");
	
		 }else{
			 
			 response.setContentType( "text/html;charset=utf-8 "); 
		     PrintWriter  out   = response.getWriter(); 
		     out.println("<script>alert('试卷批改失败，请重新批阅！');window.location='teacherAction?action=DreadPapers'; </script>");
	
			 
			 
		 }
			
		}else
		
		
		/******************************************************************
		 * 题库管理action
		 * 
		 ******************************************************************/
		if (action.equals("sendAddQuestion")){
			AdminDao dao = new AdminDao();
			System.out.println("调用了题库管理");
			request.setAttribute("Course", dao.sendAddQuestion());
			request.getRequestDispatcher("teacher/CreateTopic.jsp").forward(request, response);
		}else if (action.equals("questionAdd")){
			String cno,qtype,qstatement,qchoicea,qchoiceb,qchoicec,qchoiced,sanswer,janswer;
			cno=qtype=qstatement=qchoicea=qchoiceb=qchoicec=qchoiced=sanswer=janswer = "";
			cno = request.getParameter("cno");
			qtype = request.getParameter("qtype");
			qstatement = request.getParameter("qstatement");
			qchoicea = request.getParameter("qchoicea");
			qchoiceb = request.getParameter("qchoiceb");
			qchoicec = request.getParameter("qchoicec");
			qchoiced = request.getParameter("qchoiced");
			String[] manswer = request.getParameterValues("manswer");
			sanswer = request.getParameter("sanswer");
			janswer = request.getParameter("janswer");
			
			String answer = "";
			if(qtype.equals("选择题")){
				answer = sanswer;
			}else if(qtype.equals("多选题")){
				if (manswer != null) {
			    	int len = java.lang.reflect.Array.getLength(manswer);
			    	for (int i = 0; i < len; i++) {
			    		answer += manswer[i];
			   		}
			    }
			}else if(qtype.equals("判断题")){
				 answer = janswer;
			}
			
			System.out.println("答案是："+answer);
			
			AdminDao dao = new AdminDao();
			boolean tag = dao.questionAdd(cno, qtype, qstatement, qchoicea, qchoiceb, qchoicec, qchoiced, answer);
			if(tag){
				System.out.println("添加成功");
				request.setAttribute("Question", dao.questionList(cno, qnos));
				request.getRequestDispatcher("teacher/TkList.jsp").forward(request, response);	
			}else{
				System.out.println("添加失败");
			}
			
		}else if (action.equals("questionList")){
			AdminDao dao = new AdminDao();
			request.setAttribute("Question", dao.questionList( courses, qnos));
			request.getRequestDispatcher("teacher/TkList.jsp").forward(request, response);
		}else if (action.equals("sQuestionMod")){
			String qno = request.getParameter("qno");
			
			AdminDao dao = new AdminDao();
			request.setAttribute("Question", dao.sQuestionMod(qno));
			request.setAttribute("Course", dao.sendAddQuestion());
			request.getRequestDispatcher("teacher/topicEdit.jsp").forward(request, response);
		}else if (action.equals("questionMod")){
			String qno,cno,qtype,qstatement,qchoicea,qchoiceb,qchoicec,qchoiced,sanswer,janswer;
			cno=qtype=qstatement=qchoicea=qchoiceb=qchoicec=qchoiced=sanswer=janswer = "";
			qno = request.getParameter("qno");
			cno = request.getParameter("cno");
			qtype = request.getParameter("qtype");
			qstatement = request.getParameter("qstatement");
			qchoicea = request.getParameter("qchoicea");
			qchoiceb = request.getParameter("qchoiceb");
			qchoicec = request.getParameter("qchoicec");
			qchoiced = request.getParameter("qchoiced");
			String[] manswer = request.getParameterValues("manswer");
			sanswer = request.getParameter("sanswer");
			janswer = request.getParameter("janswer");
			
			String answer = "";
			if(qtype.equals("选择题")){
				answer = sanswer;
			}else if(qtype.equals("多选题")){
				if (manswer != null) {
			    	int len = java.lang.reflect.Array.getLength(manswer);
			    	for (int i = 0; i < len; i++) {
			    		answer += manswer[i];
			   		}
			    }
			}else if(qtype.equals("判断题")){
				 answer = janswer;
			}
			System.out.println("修改题目"+answer);
			System.out.println("题目的数据"+qno+cno+qstatement+qtype+qchoicea+qchoiceb+qchoicec+qchoiced+answer);
			AdminDao dao = new AdminDao();
			boolean tag = dao.questionMod(cno,qstatement,qtype,qchoicea,qchoiceb,qchoicec,qchoiced,answer,qno);
			if(tag){
				
				System.out.println("修改成功");
				
				
				request.setAttribute("Question", dao.questionList(courses,qno));
				request.getRequestDispatcher("teacher/TkList.jsp").forward(request, response);	
				
				
			}else{
				System.out.println("修改失败");
			}
		}else if (action.equals("questionDel")){
			String qno = request.getParameter("qno");
			AdminDao dao = new AdminDao();
			boolean tag = dao.questionDel(qno);
			if(tag){
				System.out.println("删除成功");
				request.setAttribute("Question", dao.questionList(courses, qno));
				request.getRequestDispatcher("teacher/TkList.jsp").forward(request, response);	
			}else{
				System.out.println("删除失败");
			}
		}
		
		
		else if (action.equals("questionAdd")){
				String cno,qtype,qstatement,qchoicea,qchoiceb,qchoicec,qchoiced,sanswer,janswer;
				cno=qtype=qstatement=qchoicea=qchoiceb=qchoicec=qchoiced=sanswer=janswer = "";
				cno = request.getParameter("cno");
				qtype = request.getParameter("qtype");
				qstatement = request.getParameter("qstatement");
				qchoicea = request.getParameter("qchoicea");
				qchoiceb = request.getParameter("qchoiceb");
				qchoicec = request.getParameter("qchoicec");
				qchoiced = request.getParameter("qchoiced");
				String[] manswer = request.getParameterValues("manswer");
				sanswer = request.getParameter("sanswer");
				janswer = request.getParameter("janswer");
				
				String answer = "";
				if(qtype.equals("选择题")){
					answer = sanswer;
				}else if(qtype.equals("多选题")){
					if (manswer != null) {
				    	int len = java.lang.reflect.Array.getLength(manswer);
				    	for (int i = 0; i < len; i++) {
				    		answer += manswer[i];
				   		}
				    }
				}else if(qtype.equals("判断题")){
					 answer = janswer;
				}
				
				System.out.println("答案是："+answer);
				
				AdminDao dao = new AdminDao();
				boolean tag = dao.questionAdd(cno, qtype, qstatement, qchoicea, qchoiceb, qchoicec, qchoiced, answer);
				if(tag){
					System.out.println("添加成功");
					request.setAttribute("Question", dao.questionList(cno, qnos));
					request.getRequestDispatcher("teacher/TkList.jsp").forward(request, response);	
				}else{
					System.out.println("添加失败");
				}
				
			}
		
		/**
		 * 
		 * 
		 */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		}else{//没有登录的情况
			
			response.sendRedirect("adminlogin/logintea.jsp");//跳转到老师登录页面
			
		}
		
	}

}
