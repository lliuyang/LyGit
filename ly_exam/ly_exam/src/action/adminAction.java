package action;
/**
 * 管理员Url同意分配
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;

public class adminAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		this.doPost(request, response);
		
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * 
		 * 
		 * 
		 */
		
		HttpSession session=request.getSession();//获取session
		String logintag=(String) session.getAttribute("adminID");
		
		if(logintag!=null&&logintag.length()>0){
		

		request.setCharacterEncoding("utf-8");
		String action="";
		if(request.getParameter("action")!=null){
			
			action =request.getParameter("action");//获取动作
			}
				String sclasse="%";
		String courses="%";
		if(request.getParameter("courses")!=null){
		
		courses =courses+request.getParameter("courses")+courses;//获课程题库
		}
		String qnos="%";
		if(request.getParameter("qnos")!=null){
		qnos =qnos+request.getParameter("qnos")+"%";//获课程题库
		
		}
	
		sclasse=request.getParameter("sclasse");//获取班级序列号			

	if(action.equals("index.html")){
			AdminDao A=new AdminDao();
			request.setAttribute("course", A.sendAddQuestion());
			request.setAttribute("sclass", A.getStuClass());
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);	
		
			
	}
		
		/**
		 * 
		 * 学生管理action动作
		 */
		if(action!=null&&action.equals("addStudent")){
			String sno=request.getParameter("sno");
			String password=request.getParameter("password");
			String ssex=request.getParameter("ssex");
			String sclass=request.getParameter("sclass");
			String sname=request.getParameter("sname");
			AdminDao A=new AdminDao();
			boolean tag=A.addstudent(sno, password, ssex, sclass, sname);
			if(tag){
				System.out.println("添加成功");
				request.setAttribute("Student", A.StudentListShow(sclass));
				request.getRequestDispatcher("admin/studentinfo.jsp").forward(request, response);	
			}else{
				System.out.println("添加失败");	
			}
			
		}else if(action!=null&&action.equals("StudentList")){
			
			AdminDao A=new AdminDao();
			
			request.setAttribute("Student", A.StudentListShow(sclasse));
			
			request.getRequestDispatcher("admin/studentinfo.jsp").forward(request, response);	
		}else if(action.equals("stuDel")){
			String sno = request.getParameter("sno");
			System.out.println("学号:"+sno);
			AdminDao dao = new AdminDao();
			boolean tag=dao.stuDel(sno);
			if(tag){
				System.out.println("删除成功");
				request.setAttribute("Student", dao.StudentListShow(sclasse));
				request.getRequestDispatcher("admin/studentinfo.jsp").forward(request, response);	
			}else{
				 response.setContentType( "text/html;charset=utf-8 "); 
		            PrintWriter  out   = response.getWriter(); 
		            out.println("<script>alert('删除失败！原因：该学生还有简答题以及其他试卷未作答或者未处理，请联系管理员！');history.back(-1); </script>");
				
			}
		}else if(action.equals("stuSendModify")){
			AdminDao dao=new AdminDao();
			String sno = request.getParameter("sno");
		//	System.out.println("学号:"+sno);
		//	boolean tag=dao.stuDel(sno);
			request.setAttribute("Student", dao.stuSendModify(sno));
			request.setAttribute("sclass", dao.getStuClass());
			request.getRequestDispatcher("admin/studentEdit.jsp").forward(request, response);	
		}else if(action.equals("getStuClass")){
			AdminDao dao = new AdminDao();
			request.setAttribute("sclass", dao.getStuClass());
			request.getRequestDispatcher("admin/addStudent.jsp").forward(request, response);
		}else if(action.equals("stuModify")){
			String sno = request.getParameter("sno");
			String sname = request.getParameter("sname");
			String ssex = request.getParameter("ssex");
			String sclass = request.getParameter("sclass");
			String spassword = request.getParameter("spassword");
	//		System.out.println("接收到的学号："+sno);
			AdminDao dao = new AdminDao();
			boolean tag=dao.stuModify(sname, ssex, sclass, spassword, sno);
			if(tag){
				System.out.println("修改成功");
				request.setAttribute("Student", dao.StudentListShow(sclass));
				request.getRequestDispatcher("admin/studentinfo.jsp").forward(request, response);	
			}else{
				System.out.println("修改失败");	
			}
		}
		
		
		/*******************************************************************
		 * 教师管理action动作
		 * 
		 * 
		 *******************************************************************/
		if(action.equals("teacherAdd")){
			String tno=request.getParameter("tno");
			String tname=request.getParameter("tname");
			String tsex=request.getParameter("tsex");
			String tpassword=request.getParameter("tpassword");
			AdminDao dao=new AdminDao();
			boolean tag=dao.teacherAdd(tno,tname,tsex,tpassword);
			if(tag){
				System.out.println("添加成功");
				request.setAttribute("Teacher", dao.teacherList());
				request.getRequestDispatcher("admin/teacherinfo.jsp").forward(request, response);	
			}else{
				System.out.println("添加失败");	
			}
		}else if(action.equals("teacherList")){
			AdminDao dao=new AdminDao();
			request.setAttribute("Teacher", dao.teacherList());
			request.getRequestDispatcher("admin/teacherinfo.jsp").forward(request, response);	
		}else if(action.equals("tSendModify")){
			String tno = request.getParameter("tno");
			AdminDao dao = new AdminDao();
			request.setAttribute("Teacher", dao.tSendModify(tno));
			request.getRequestDispatcher("admin/teacherEdit.jsp").forward(request, response);	
		}else if(action.equals("teacherDel")){
			AdminDao dao=new AdminDao();
			String tno = request.getParameter("tno");
			System.out.println("教师号:"+tno);
			boolean tag=dao.teacherDel(tno);
			if(tag){
				System.out.println("删除成功");
				request.setAttribute("Teacher", dao.teacherList());
				request.getRequestDispatcher("admin/teacherinfo.jsp").forward(request, response);
			}else{
				 response.setContentType( "text/html;charset=utf-8 "); 
		            PrintWriter  out   = response.getWriter(); 
		            out.println("<script>alert('删除失败！原因：该老师所发布试卷还未处理，暂时无法删除，请联系老师删除所出试卷！');history.back(-1); </script>");
				
				
			}
		}else if(action.equals("teacherModify")){
			String tno = request.getParameter("tno");
			String tname = request.getParameter("tname");
			String tsex = request.getParameter("tsex");
			String tpassword = request.getParameter("tpassword");
	//		System.out.println("接收到的学号："+sno);
			AdminDao dao = new AdminDao();
			boolean tag=dao.teacherModify(tname, tsex, tpassword, tno);
			if(tag){
				System.out.println("修改成功");
				request.setAttribute("Teacher", dao.teacherList());
				request.getRequestDispatcher("admin/teacherinfo.jsp").forward(request, response);	
			}else{
				System.out.println("修改失败");
			}
		}
		
		
		/******************************************************************
		 * 题库管理action
		 * 
		 ******************************************************************/
		if (action.equals("sendAddQuestion")){
			AdminDao dao = new AdminDao();
			System.out.println("调用了题库管理");
			request.setAttribute("Course", dao.sendAddQuestion());
			request.getRequestDispatcher("admin/CreateTopic.jsp").forward(request, response);
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
				request.getRequestDispatcher("admin/TkList.jsp").forward(request, response);	
			}else{
				System.out.println("添加失败");
			}
			
		}else if (action.equals("questionList")){
			AdminDao dao = new AdminDao();
			request.setAttribute("Question", dao.questionList( courses, qnos));
			request.getRequestDispatcher("admin/TkList.jsp").forward(request, response);
		}else if (action.equals("sQuestionMod")){
			String qno = request.getParameter("qno");
			
			AdminDao dao = new AdminDao();
			request.setAttribute("Question", dao.sQuestionMod(qno));
			request.setAttribute("Course", dao.sendAddQuestion());
			request.getRequestDispatcher("admin/topicEdit.jsp").forward(request, response);
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
				request.getRequestDispatcher("admin/TkList.jsp").forward(request, response);	
				
				
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
				request.getRequestDispatcher("admin/TkList.jsp").forward(request, response);	
			}else{
				System.out.println("删除失败");
			}
		}else if(action.equals("getScourse")){			
			/**
			 * ***************************************************
			 * **************************************************
			 * 课程表操作
			 */
AdminDao a=new AdminDao();

			request.setAttribute("course", a.courseList());			
			request.getRequestDispatcher("admin/Sdept.jsp").forward(request, response);	
			
		}else if(action.equals("tc")){//授课管理
			
			AdminDao a=new AdminDao();
			request.setAttribute("tc", a.tcList());			
			request.getRequestDispatcher("admin/TC.jsp").forward(request, response);	
			
		}
		
		
		
	}else{//没有登录的情况下操作
		
	response.sendRedirect("adminlogin/login.jsp");//跳转到管理员登录页面

	}
		
	}
	

}
