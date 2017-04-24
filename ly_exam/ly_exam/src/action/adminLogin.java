package action;

/**
 * 
 * 管理员登录处理类
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.DBcon;

import dao.AdminDao;

public class adminLogin extends HttpServlet {

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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String AT = request.getParameter("if");
		DBcon dbc = new DBcon();
		if (AT.equals("A")) {

			String sql = "select *  from  admintable where username=? and password=?";
			ResultSet rs = dbc
					.doQuery(sql, new Object[] { username, password });
			try {
				if (rs.next()) {
					// 设置登录session
					HttpSession session = request.getSession();
					session.setAttribute("adminID", rs.getString("uid"));
					session.setMaxInactiveInterval(1000);

					AdminDao A = new AdminDao();
					request.setAttribute("course", A.sendAddQuestion());
					request.setAttribute("sclass", A.getStuClass());
					request.getRequestDispatcher("admin/index.jsp").forward(
							request, response);
				} else {

					response.setContentType("text/html;charset=utf-8 ");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('对不起，登陆失败，请检查输入是否有误！');history.back(-1); </script>");

				}
			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				dbc.close();
			}

		} else if (AT.equals("T")) {

			String sql = "select *  from  teacher where tno=? and tpassword=?";
			ResultSet rs = dbc
					.doQuery(sql, new Object[] { username, password });
			try {
				if (rs.next()) {
					// 设置登录session
					HttpSession session = request.getSession();
					session.setAttribute("teacherID", rs.getString("tno"));
					session.setMaxInactiveInterval(1000);

					AdminDao A = new AdminDao();
					request.setAttribute("course", A.sendAddQuestion());
					request.setAttribute("sclass", A.getStuClass());
					request.getRequestDispatcher("teacher/index.jsp").forward(
							request, response);
				} else {

					response.setContentType("text/html;charset=utf-8 ");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('对不起，登陆失败，请检查输入是否有误！');history.back(-1); </script>");

				}
			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				dbc.close();
			}

		}

	}

}
