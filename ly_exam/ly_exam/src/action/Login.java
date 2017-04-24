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
/*
 * 登录验证
 */
public class Login extends HttpServlet {

	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		 UserDao userdao = new UserDao();
		 boolean vilidate = userdao.loginCheck(username,password);
		 
		 if(vilidate){
			 System.out.println("---->登录成功");
			 request.setAttribute("user", userdao.stuinfo(username));
			 request.getRequestDispatcher("exam-center.jsp").forward(request, response);
		 }else{
			 System.out.println("---->登录失败");
			 response.setContentType("text/html;charset=utf-8 ");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('对不起，登陆失败，请检查输入是否有误！');history.back(-1); </script>");
			 
		 }
		 
	}

}
