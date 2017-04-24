package dao;



import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DBcon;

import entity.AnswerList;
import entity.SJxqpiyue;



/**
 *试卷批阅逻辑处理类
 * @author pantiemin
 *
 */
public class ReadPaperDao {
	/**
	 * 班级列表显示公共类
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public List<SJxqpiyue> Paperdtile(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		
		List<SJxqpiyue> list=new ArrayList<SJxqpiyue>();
		
		String pname="";//试卷名称
		String qname="";//简答题题目
		
		
		String sno=request.getParameter("sno");//学生学号
		 qname=new String(request.getParameter("qname").getBytes("ISO-8859-1"),"utf-8");//简答题题目
		try {
			pname = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		SJxqpiyue s= new SJxqpiyue();
		
		String sql="SELECT  answerpaper.*, paper.pname,paper.`SAscore`,paper.`PTotalscore`,paper.petime,paper.pstime,course.cname, student.sname,sclass.scname ,qbank.Qstatement FROM answerpaper,paper,course,student,sclass,qbank WHERE answerpaper.`Cno`=course.cno AND answerpaper.`pnums`=paper.pnum AND answerpaper.`Qno`=qbank.qno  AND  student.sno=answerpaper.`Sno` AND student.sclass=sclass.scno  AND paper.`Pname` = ?  AND answerpaper.`Sno`=? AND qbank.Qstatement =?";
	//	System.out.println(sql);
		DBcon dbc=new DBcon();
		ResultSet rs=dbc.doQuery(sql, new Object[]{pname,sno,qname});
		try {
			while(rs.next()){
				s= new SJxqpiyue();
				s.setPnums(rs.getString("pnums"));//获取试卷编号
				s.setCno(rs.getString("cno"));//获取考试科目的课程号
				s.setPname(rs.getString("pname"));//试卷名称
			s.setPtotalscore(rs.getInt("ptotalscore"));//试卷总分
				s.setSname(rs.getString("sname"));//学生姓名
				s.setSno(rs.getString("sno"));//学生学号
				s.setD01(rs.getInt("scscore"));//单选题总分
				s.setD02(rs.getInt("mcscore"));//多选题总分
				s.setD03(rs.getInt("jscore"));//判断题总分
				s.setPstime(rs.getTimestamp("pstime"));//开始时间
				s.setPetime(rs.getTimestamp("petime"));//结束时间						
				s.setApstate(rs.getString("APstate"));//试卷状态						
				list.add(s);
			}
		} catch (SQLException e) {
		
		}finally{
			dbc.close();
		}
		return list;
		
		
		
		
		
		
	}
	

	/**
	 * 
	 * 简答题处理类
	 */
	

	
public List<AnswerList> answerList(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		
		List<AnswerList> list=new ArrayList<AnswerList>();
		
		String pname="";//试卷名称
		try {
			pname = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		}
		
		 String qnos="";	 		
		int anscore=0;
		String sno=request.getParameter("sno");//学生学号
		String d03=request.getParameter("d03");//判断题分数
		String[] arrayqnos = null;
		String[] arrayvalues=null;
		int d033= Integer.parseInt(d03);
	
		AnswerList a= new AnswerList();
		
		String sql="SELECT  answerpaper.qno,answerpaper.`APanswer` ,paper.`SAscore` FROM answerpaper,paper,course,student,sclass,qbank WHERE answerpaper.`Cno`=course.cno AND answerpaper.`pnums`=paper.pnum AND answerpaper.`Qno`=qbank.qno  AND  student.sno=answerpaper.`Sno` AND student.sclass=sclass.scno  AND paper.`Pname` = ? AND answerpaper.`Sno`=? AND answerpaper.`jscore` =? ";
	
		DBcon dbc=new DBcon();
		ResultSet rs=dbc.doQuery(sql, new Object[]{pname,sno,d033});
		try {
			while (rs.next()) {
				qnos = rs.getString("qno");
			    arrayqnos = qnos.split("/");
				arrayvalues = rs.getString("APanswer").split("@");
				anscore=rs.getInt("SAscore");
			}
		} catch (SQLException e) {

		} finally {
			dbc.close();
		}
	
		for(int i=0;i<arrayqnos.length;i++){
				
			
			 sql="SELECT qbank.Qstatement FROM qbank WHERE qno=?";
			 rs=dbc.doQuery(sql, new Object[]{arrayqnos[i]});		
			 try {
				while(rs.next()){
					 a=new AnswerList();					 
					 a.setTitle(rs.getString("Qstatement"));
					 a.setSascore(anscore);
					 a.setAnswer(arrayvalues[i]);
					 a.setAnscoretip(anscore);
					 list.add(a);				
				 }
			} catch (SQLException e) {
			
				e.printStackTrace();
			}finally{
				dbc.close();
			}
			
			
		}
		
		return list;
		
		
		
		
		
		
	}
	

	
	
	
	
	

}
