package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import entity.Student;
import entity.Student;

public class Exam_start extends HttpServlet {

	
	private List<Student> user;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String sno = request.getParameter("sno");
		UserDao userdao = new UserDao();

		request.setAttribute("user", userdao.stuinfo(sno));
		request.setAttribute("paper_info",userdao.paperinfo(sno));
		
		request.getRequestDispatcher("exam-start.jsp").forward(request, response);
		
	}

}
