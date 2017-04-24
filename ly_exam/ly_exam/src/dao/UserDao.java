package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.DBcon;
import entity.AnswerPaper;
import entity.Student;
import entity.judge;
import entity.mchoice;
import entity.paper_info;
import entity.sanswer;
import entity.schoice;
import entity.Student;

/**
 * 学生用户所有操作
 * @author ly
 *
 */
public class UserDao {
	

	/**
	 * 学生登录验证
	 */
	//账号验证
	public boolean loginCheck(String sname,String password){
		
		 DBcon db= new DBcon();
		 String sql = "select * from student where Sno=?";
		 ResultSet rs = db.doQuery(sql, new  Object[]{sname});
		 
		 try {
			if(rs!=null && rs.next()){
				
				boolean flag=true;//用户名正确
				System.out.println("用户名正确");
				boolean checkm = loginCheckm(sname,password);
				
				if(!checkm){
					System.out.println("密码错误");
					flag=false;//密码错误
				}else
					return true;	
			 }
			else{
				System.out.println("用户名不存在");
				return false;
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		
		return false;
	}
	//密码验证
	public boolean loginCheckm(String sname,String password){
		DBcon db= new DBcon();
		 String sql = "select * from student where Sno=? and Spassword=? ";
		 ResultSet rs = db.doQuery(sql, new  Object[]{sname,password});
		 try {
			if(rs!=null && rs.next()){
				 System.out.println("密码正确");
				 return true;
			 }else
				 return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		 return false;
	}
	
	/**
	 * 学生信息
	 */
	public List<Student> stuinfo(String sno){
		
		 DBcon db= new DBcon();
		 String sql = "select * from student where sno=?";
		
		 ResultSet rs = db.doQuery(sql, new  Object[]{sno});
	 
		 List<Student> list = new ArrayList<Student>();
		 Student stu;
		 
		 try {
			while(rs!=null && rs.next()){
				
				 sql = "select * from sclass where scno=?";
				 ResultSet rs1 = db.doQuery(sql, new  Object[]{rs.getString("Sclass")});
				 
				while(rs1.next()){		
					 stu = new  Student();
					 stu.setSno(rs.getString("Sno"));
					 stu.setSname(rs.getString("Sname"));
					 stu.setSsex(rs.getString("Ssex"));
					 stu.setSpassword(rs.getString("Spassword"));				 
					 stu.setSclass(rs1.getString("scname")) ; 
					 list.add(stu);
				}
				
			 }
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally{
			db.close();
		}
		 return list;	
	}
	
	/**
	 * 当前最近考试试卷信息
	 */
	
	public List<paper_info> paperinfo(String sno){
		
		 List<paper_info> list = new ArrayList<paper_info>();
		 String sclass="";
		 paper_info paper_info;
		 DBcon db= new DBcon();
		
		 String sql = "select sclass from student where sno=?";	
		 ResultSet rs = db.doQuery(sql, new  Object[]{sno}); 
		 
		 try {
			while(rs!=null && rs.next()){
				 try {
					 sclass=rs.getString("sclass");
					 String sql1 = "select * from paper where pclass like '%"+sclass+"%' and PStime < (SELECT NOW() AS  CurrentDateTime) AND PEtime > (SELECT NOW() AS  CurrentDateTime) ";
					 ResultSet rs1 = db.doQuery(sql1, new  Object[]{});
					 if(rs1.next()){
						 paper_info = new paper_info();	
						int antime = (int) ((rs1.getTimestamp("petime").getTime()-rs1.getTimestamp("pstime").getTime())/1000/60);
						paper_info.setPname(rs1.getString("pname"));
						paper_info.setPtotalscore(rs1.getInt("ptotalscore"));						
						paper_info.setPnum(rs1.getInt("pnum"));
						paper_info.setPstime(rs1.getTimestamp("pstime"));
						paper_info.setPetime(rs1.getTimestamp("petime"));
						paper_info.setAntime(antime);
						list.add(paper_info);
					}
					 else{
						 System.out.println("当前没有考试");
						
					 }
					 
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			 }
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally{
			db.close();
		} 
		 return list;			
	}
	
	/**
	 * 试卷具体信息
	 */
	
	public List<paper_info> paper(int po,int ti,String sno){
		
		List<paper_info> list = new ArrayList<paper_info>();
		paper_info paper;
		DBcon db= new DBcon();
		
		String sql = "select * from paper where pnum=?";	
		ResultSet rs = db.doQuery(sql, new  Object[]{po}); 
		 try {
			while(rs!=null&&rs.next()){
				paper = new paper_info();	
				paper.setPnum(po);//试卷号
				paper.setPname(rs.getString("pname"));//试卷名
				paper.setAntime(ti);//答题时间
				paper.setSno(sno);//答题学生学号
				paper.setPtotalscore(rs.getInt("ptotalscore"));//试卷总分
				
				paper.setJscore(rs.getInt("jscore"));//判断题分数
				paper.setScscore(rs.getInt("scscore"));//单选题分数
				paper.setMcscore(rs.getInt("mcscore"));	//多选题分数
				paper.setSascore(rs.getInt("sascore"));//简答题分数
				
				list.add(paper);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("The paper is error");
		}finally{
			db.close();
		}
		 return list;
		
	}
	/**
	 *判断题显示
	 *param 试卷号
	 */
	 public List<judge> paper_judge(int po){
		 
		List<judge> jud_list = new ArrayList<judge>();
		judge judges;
		DBcon db= new DBcon();
		
		String sql = "select * from paper where pnum=?";	
		ResultSet rs = db.doQuery(sql, new  Object[]{po});
		try {
			while(rs!=null&&rs.next()){

				String judge=rs.getString("judge");
				String sqlstr = "SELECT * FROM QBank WHERE locate(Qno,?)";				
				ResultSet rs1 = db.doQuery(sqlstr, new  Object[]{judge});
				try {
					while(rs1!=null&&rs1.next()){
						judges = new judge();
						judges.setQno(rs1.getInt("qno"));//题号
						judges.setQstatement(rs1.getString("qstatement"));//题目
						judges.setQchoicea(rs1.getString("qchoicea"));//A选项 
						judges.setQchoiceb(rs1.getString("qchoiceb"));//B选项
						jud_list.add(judges);
					} 
				}catch (SQLException e) {
					e.printStackTrace();
				}
	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		 return jud_list;	 
	 }
	 /**
	  * 单选题显示
	  * param 试卷号
	  */
	 public List<schoice> paper_schoice(int po){
		 
			List<schoice> sch_list = new ArrayList<schoice>();
			schoice schoices;
			DBcon db= new DBcon();
			
			String sql = "select * from paper where pnum=?";	
			ResultSet rs = db.doQuery(sql, new  Object[]{po});
			try {
				while(rs!=null&&rs.next()){


					String schoice=rs.getString("schoice");
					String sqlstr = "SELECT * FROM QBank WHERE locate(Qno,?)";				
					ResultSet rs1 = db.doQuery(sqlstr, new  Object[]{schoice});
					try {
						while(rs1!=null&&rs1.next()){
							schoices = new schoice();
							schoices.setQno(rs1.getInt("qno"));//题号
							schoices.setQstatement(rs1.getString("qstatement"));//题目
							schoices.setQchoicea(rs1.getString("qchoicea"));//A选项 
							schoices.setQchoiceb(rs1.getString("qchoiceb"));//B选项
							schoices.setQchoicec(rs1.getString("qchoicec"));//C选项
							schoices.setQchoiced(rs1.getString("qchoiced"));//D选项
							sch_list.add(schoices);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}
		
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				db.close();
			}
			 return sch_list;	 
		 }
	 
	 /**
	  * 多选题
	  * param 试卷号
	  */
	 public List<mchoice> paper_mchoice(int po){
		 
			List<mchoice> mch_list = new ArrayList<mchoice>();
			mchoice mchoices;
			DBcon db= new DBcon();
			
			String sql = "select * from paper where pnum=?";	
			ResultSet rs = db.doQuery(sql, new  Object[]{po});
			try {
				while(rs!=null&&rs.next()){


					String mchoice=rs.getString("mchoice");
					String sqlstr = "SELECT * FROM QBank WHERE locate(Qno,?)";				
					ResultSet rs1 = db.doQuery(sqlstr, new  Object[]{mchoice});
					try {
						while(rs1!=null&&rs1.next()){
							mchoices = new mchoice();
							mchoices.setQno(rs1.getInt("qno"));//题号
							mchoices.setQstatement(rs1.getString("qstatement"));//题目
							mchoices.setQchoicea(rs1.getString("qchoicea"));//A选项 
							mchoices.setQchoiceb(rs1.getString("qchoiceb"));//B选项
							mchoices.setQchoicec(rs1.getString("qchoicec"));//C选项
							mchoices.setQchoiced(rs1.getString("qchoiced"));//D选项
							mch_list.add(mchoices);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}
		
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				db.close();
			}
			 return mch_list;	 
		 }
	 /**
	  * 简答题
	  * param 试卷号
	  */
	 public List<sanswer> paper_sanswer(int po){
		 
			List<sanswer> san_list = new ArrayList<sanswer>();
			sanswer sanswers;
			DBcon db= new DBcon();
			
			String sql = "select * from paper where pnum=?";	
			ResultSet rs = db.doQuery(sql, new  Object[]{po});
			try {
				while(rs!=null&&rs.next()){

					String sanswer=rs.getString("sanswer");
					String sqlstr = "SELECT * FROM QBank WHERE locate(Qno,?)";				
					ResultSet rs1 = db.doQuery(sqlstr, new  Object[]{sanswer});
					try {
						while(rs1!=null&&rs1.next()){
							sanswers = new sanswer();
							sanswers.setQno(rs1.getInt("qno"));//题号
							sanswers.setQstatement(rs1.getString("qstatement"));//题目
							san_list.add(sanswers);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}
		
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				db.close();
			}
			 return san_list;	 
		 }
	
	 /**
	  * 存题
	  */
	 public boolean savepro(int pnum,String sno){
		 
		  DBcon db= new DBcon();
		  String sql="";
		  sql="SELECT pname,cno,sanswer FROM paper WHERE pnum=?";//pname,cno,sanswer
		  
		  ResultSet rs=db.doQuery(sql, new Object[]{pnum});
		  
		  String pname = null;//试卷名
		  int cno = 0;//课程号
		  String  apanswer = null;//简答题题号
		  try {
			if(rs!=null&&rs.next()){
				pname=rs.getString("pname");
				cno=rs.getInt("cno");
				apanswer=rs.getString("sanswer");
			  }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  
		 sql="INSERT INTO answerpaper VALUES(?,?,?,?,' ',0,'待批阅',0,0,0,?) ";
		 int res=db.doUpdate(sql,new Object[]{pnum,sno,cno,apanswer,pname});
		 db.close();
			if(res==1){
				return true;
			}else
				return false; 
	 }
	 
	 /**
	  *答卷打分 
	  *param 答案 学号
	  */
	 
	  public int answer(String answer,String sno) throws SQLException{
		  
		  int scscore=0,mcscore=0,jscore=0;  
		  int score=0;
		  
		  String[] code=answer.split("@");//0为试卷号，1为题号,2为回答 
		  DBcon db= new DBcon();
		  
		  String sql="SELECT qbank.*,paper.* FROM qbank ,paper WHERE  paper.`Pnum`=? AND qbank.qno=? ";
		  
		  ResultSet rs=db.doQuery(sql, new Object[]{code[0],code[1]});
		  
		  try {
			while(rs.next()){
				
					scscore=rs.getInt("SCscore");
					mcscore=rs.getInt("MCscore");
					jscore=rs.getInt("Jscore"); 
					
					if(rs.getString("Qtype").equals("判断题")){
						
						if(rs.getString("qanswer").equals(code[2])){
							
							//System.out.println("判断题答案正确");
							add_score("jscore",jscore,Integer.parseInt(code[0]),sno);
							return jscore;
							
						}else{
							//System.out.println("判断题答案错误");
						}
					}else if(rs.getString("Qtype").equals("选择题")){

						if(rs.getString("qanswer").equals(code[2])){
							//System.out.println("选择题答案正确");
							add_score("scscore", scscore,Integer.parseInt(code[0]),sno);
							return scscore;
						}else{
							//System.out.println("选择题答案错误");
							}
						
					}else if(rs.getString("Qtype").equals("多选题")){
						
						if(rs.getString("qanswer").equals(code[2].toString())){
							//System.out.println("多选题答案正确");
							add_score("mcscore",mcscore,Integer.parseInt(code[0]),sno);
							return mcscore;
						}else{
							//System.out.println("多选题答案错误");
						}
						
					}else if(rs.getString("Qtype").equals("简答题")){
						System.out.println("该题为简答题");
					}
				  	
				  
			  }
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}finally{
			
			db.close();
		}
		  return score; 
		  
	  }
	  /**
	   * 简答题保存
	   * param 答案 试卷号
	   */
	  public void short_answer(String answer,int pnum) throws SQLException{
		  
		  DBcon db= new DBcon();
		  String sql=" UPDATE answerpaper SET APanswer = ? WHERE pnums=? ";
		  db.doUpdate(sql, new Object[]{answer+'@',pnum});
	  }

	  /**
	   * 存分
	   * param 题型 分数 试卷号
	   */
	  public void add_score(String type,int score,int pnum,String sno){
		  
		  	DBcon db= new DBcon();
		  	String sql="";
		  	
			if(type.equals("jscore")){
				sql=" UPDATE answerpaper SET jscore=jscore+? WHERE sno= ? and pnums = ?";  
				 }else if(type.equals("scscore")){
					sql=" UPDATE answerpaper SET scscore=scscore+? WHERE sno= ? and pnums= ?";  
				 }else if(type.equals("mcscore")){
					sql=" UPDATE answerpaper SET mcscore=mcscore+? WHERE sno= ? and pnums= ?";  
				 }

				db.doUpdate(sql, new Object[]{score,sno,pnum});
	
	  }
	
	  /**
	   * 考试分数查询及考试结果
	   * param 试卷号 学号 总分（除简答题）
	   */
	  public List<AnswerPaper> Query_results(int pnum,String sno,int score){
		  
		  List<AnswerPaper> answer_list = new ArrayList<AnswerPaper>();
		  AnswerPaper answerpaper;
		  ResultSet rs;
		  DBcon db = new DBcon();
		  String sql = "select * from answerpaper where sno=? ";
		  if(!(pnum==0&&score==0)){
			   sql="select * from answerpaper where sno=? and pnums=?";
			   rs = db.doQuery(sql, new Object[] {sno,pnum});
		  }else{
			   rs = db.doQuery(sql, new Object[] {sno});
			   }
		  
		  try {
			while(rs!=null&&rs.next()){
				  answerpaper=new AnswerPaper();
				  answerpaper.setSno(sno);
				  answerpaper.setCno(rs.getString("cno"));
				  answerpaper.setScscore(rs.getInt("scscore"));
				  answerpaper.setMcscore(rs.getInt("mcscore"));
				  answerpaper.setJscore(rs.getInt("jscore"));
				  answerpaper.setApscore(rs.getInt("apscore"));
				  answerpaper.setApstate(rs.getString("apstate"));
				  answerpaper.setPname(rs.getString("pname"));
				 // answerpaper.setPtotalscore(rs.getInt("ptotalscore"));
				  answerpaper.setScore(score);
				  answer_list.add(answerpaper);
			  }
		  } catch (SQLException e) {

			e.printStackTrace();
		  }
		  return answer_list;
	  }
	  
	  
	
}
