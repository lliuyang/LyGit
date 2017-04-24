package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.TearcherDao;

public class gradeSelect extends HttpServlet {

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
		request.setCharacterEncoding("utf-8");
		String sno=request.getParameter("sno");//获取学生学号	
	//	System.out.println(sno);
		AdminDao a=new AdminDao();		
		TearcherDao t=new TearcherDao();
		request.setAttribute("grade", t.getGradeList(sno));
		request.setAttribute("stu",a.stuSendModify(sno));
		request.getRequestDispatcher("teacher/grade.jsp").forward(request, response);	
		

	}

}
