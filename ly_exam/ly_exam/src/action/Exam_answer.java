package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
/**
 * 试卷打分
 * @author ly
 *
 */
public class Exam_answer extends HttpServlet {


	public Exam_answer() {
		super();
	}


	public void destroy() {
		super.destroy();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
			request.setCharacterEncoding("gb2312");
			Enumeration parameters = request.getParameterNames();  
			
			int score=0;//除简答题外得分
			HttpSession session=request.getSession();
			int pnum= (Integer) session.getAttribute("po");//试卷号
			String sno=(String)session.getAttribute("sno");//学号
			UserDao userdao = new UserDao();
			List<String> strings=new ArrayList<String>();
			
			while (parameters.hasMoreElements()) { 
				
				//System.out.println("---->第"+j+++"次");
			    String qvalue = (String) parameters.nextElement();  
			    String qValues[] = request.getParameterValues(qvalue);
			    

			    for(int i=0;i<qValues.length;i++){
			    	
			    	if(qValues[i].endsWith("/")){
			    		//System.out.println("多选题值:"+qValues[i].substring(0,qValues[i].length()-1));
			    		strings.add(qValues[i].substring(0,qValues[i].length()-1));
			    	}
			    	else if(qValues[i].endsWith("#")){
			    		//System.out.println("单选或者判断:"+qValues[i].substring(0,qValues[i].length()-1));
			    		strings.add(qValues[i].substring(0,qValues[i].length()-1));
			    	}else{
			    		//System.out.println("简答题:"+qValues[i]);
			    		try {
							userdao.short_answer(qValues[i],pnum);
						} catch (SQLException e) {
							e.printStackTrace();
						}
			    	}
			    	
			    	
			    }
     
			    
			}
			
			
			 Map<String,String> stringMap=new HashMap<String, String>();
			 for(String s:strings)
		        {
		            String str[]=s.split("@");
		            if( stringMap.get(str[1])==null||stringMap.get(str[1]).equals(""))
		            {
		                stringMap.put(str[1],s);
		            }else{
		               stringMap.put(str[1],stringMap.get(str[1])+str[2]);
		            }
		        }
			 
			 for (String s:stringMap.keySet())
		        {
		            //System.out.println(stringMap.get(s));
		            try {
						score+=userdao.answer(stringMap.get(s).toString(),sno);
					} catch (SQLException e) {
						e.printStackTrace();
					}
		        }
				
			 
			 System.out.println("我得分:"+score);
			 request.setAttribute("paper", userdao.Query_results(pnum, sno, score));
			 request.getRequestDispatcher("exam-results.jsp").forward(request, response);
		
			

}


	public void init() throws ServletException {
		// Put your code here
	}

}
