package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class Exam_Query extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			request.setCharacterEncoding("utf-8");
			HttpSession session=request.getSession();
			String sno=(String)session.getAttribute("sno");//学号
			UserDao userdao = new UserDao();
			request.setAttribute("paper",userdao.Query_results(0, sno, 0) );
			request.getRequestDispatcher("exam-results.jsp").forward(request, response);
	}

}
