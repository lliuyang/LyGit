package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class Exam_begin extends HttpServlet {

	private static final Object judges = null;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int po = Integer.parseInt( request.getParameter("po"));//试卷号
		int ti =  Integer.parseInt (request.getParameter("ti"));//答题时间
		String sno = request.getParameter("sno");//学号
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(600);
		
		session.setAttribute("sno", sno);
		session.setAttribute("po", po);
		boolean tag=true;
		System.out.println("试卷号:"+po);
		UserDao userdao = new UserDao();
		tag=userdao.savepro(po, sno);
		if(!tag){
			System.out.println(sno+"已经考过该门课程,正在进行重复考试");
			response.setContentType("text/html;charset=utf-8 ");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('对不起，您已经考过该科目了！请勿重复考试，如有问题请联系管理员');history.back(-1); </script>");
			
		}else{
		
			request.setAttribute("paper", userdao.paper(po,ti,sno));
			request.setAttribute("jude", userdao.paper_judge(po));
			request.setAttribute("schoice", userdao.paper_schoice(po));
			request.setAttribute("mchoice", userdao.paper_mchoice(po));
			request.setAttribute("sanswer", userdao.paper_sanswer(po));
			
			request.getRequestDispatcher("exam-paper.jsp").forward(request, response);
		}
	}

}
