package dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import utils.DBcon;

import entity.AnswerPaper;
import entity.Course;
import entity.GradeStu;
import entity.Paper;



/*
 * 教师后台所有代码实现类
 */

public class TearcherDao {

	
	
	/**
	 * 试卷列表实现方法
	 * @return
	 */
	public List<Paper> paperList(String tno){
	

		List<Paper> list = new ArrayList<Paper>();
		// 获取数据库连接
		DBcon dbc = new DBcon();
		//System.out.println("tno= "+tno);
		String sql = "SELECT paper.*,teacher.`Tname`,course.`Cname` FROM paper,teacher,course WHERE paper.`Cno`=course.`Cno`AND paper.`Tno`=teacher.`Tno` AND teacher.`Tno`=?;";
		ResultSet rs = dbc.doQuery(sql, new Object[] {tno}); // 获取查询记录集	
		Paper papers = new Paper();
		try {
			while (rs != null && rs.next()) {				
						papers = new Paper();// 实例化一个对象
						// 进行赋值
						Timestamp t=rs.getTimestamp("pstime");
						papers.setPstime(t);
						t=rs.getTimestamp("petime");
						papers.setPetime(t);
						papers.setPnum(rs.getInt("pnum"));// 试卷编号
						papers.setCno(rs.getString("cname"));// 考试科目
						papers.setTno(rs.getString("tname"));// 出题老师
						papers.setPname(rs.getString("pname"));// 试卷名称
						papers.setSchoice(rs.getString("schoice"));// 选择题
						papers.setMchoice(rs.getString("mchoice"));// 多选题
						papers.setJudge(rs.getString("judge"));// 判断题
						papers.setSanswer(rs.getString("sanswer"));// 简答题		
						papers.setPtotalscore(rs.getInt("PTotalscore"));//总分
						list.add(papers);						
					}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		return list;
	}
	
	
	
	/**
	 * 
	 * 试卷删除方法
	 */

	public boolean deldelePapers(String pnum){
		boolean tag=false;
		String sql="DELETE  FROM paper  where pnum=?";//设置sql删除语句
		DBcon dbc=new DBcon();
		int res=dbc.doUpdate(sql, new Object[]{pnum});
		try {
			if(res==1){
				tag=true;				
			}
			else{
				tag=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		
		return tag;
	}
	
	
	
	
	
	
	/**
	 * 教师个人授课课程列表显示公共类
	 * @return
	 */
	public List<Course> courseList(String tno) {
		List<Course> list = new ArrayList<Course>();
		// 获取数据库连接
		DBcon dbc = new DBcon();
		String sql = "SELECT  course.* FROM course,teaching WHERE teaching.`Cno`=course.`Cno` AND teaching.`Tno`=?";
		ResultSet rs = dbc.doQuery(sql, new Object[] {tno}); // 获取查询记录集
		Course course = new Course();
		try {
			while (rs.next()) {
				// 封装实体类
				course = new Course();
				course.setCno(rs.getString("cno"));
				course.setCname(rs.getString("cname"));
				list.add(course);
			}
			dbc.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		return list;
	}
	
	
	
	/**
	 * 班级列表显示公共类
	 * @return
	 */
	public List<Sclass> sclassList(){
		
		List<Sclass> list=new ArrayList<Sclass>();
		// 获取数据库连接
		DBcon dbc = new DBcon();
		String sql = "select  *  from sclass  ";
		ResultSet rs = dbc.doQuery(sql, new Object[] {}); // 获取查询记录集
		Sclass sclass = new Sclass();
		try {
			while(rs.next()){
				//封装实体类
				sclass=new Sclass();
				sclass.setScno(rs.getString(1));
				sclass.setScname(rs.getString(2));
				list.add(sclass);
			}
			dbc.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			dbc.close();
		}	
		return list;
			
	}
	
	
	
	
	/**
	 * 添加试卷实现方法
	 * 
	 * 
	 */

	public boolean addPapers(String pname, String cno, String tno,
			String pstime, String petime, String schoice, String scscore,
			String mchoice, String mcscore, String judge, String jscore,
			String sanswer, String sascore, String sclasss) {

		boolean tag = false;
		String d01 = "";// 单选题字段内容
		String d02 = "";// 多选题内容
		String d03 = "";// 判断题题内容
		String d04 = "";// 简答题内容
		System.out.println("cno= "+cno);
		DBcon dbc = new DBcon();
		// 选取单选题题号存入试卷列表
		String qtype = "单选题";
		String sql = "SELECT * FROM qbank WHERE qtype=? and cno=?  ORDER BY RAND() LIMIT ?";
		ResultSet rs = dbc.doQuery(sql,
				new Object[] { qtype, cno, Integer.parseInt(schoice) });
		try {
			while (rs.next()) {
				d01 = d01 + rs.getInt("qno") + "/";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}

		// 选取多选题题号存入试卷列表
		qtype = "多选题";
		sql = "SELECT * FROM qbank WHERE qtype=? and cno=? ORDER BY RAND() LIMIT ?";
		rs = dbc.doQuery(sql, new Object[] { qtype, cno,Integer.parseInt(mchoice) });
		try {
			while (rs.next()) {			
				d02 = d02 + rs.getInt("qno") + "/";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}

		// 选取判断题题号存入试卷列表
		qtype = "判断题";
		sql = "SELECT * FROM qbank WHERE qtype=? and cno=? ORDER BY RAND() LIMIT ?";
		rs = dbc.doQuery(sql, new Object[] { qtype, cno,Integer.parseInt(judge) });
		try {
			while (rs.next()) {
				d03 = d03 + rs.getInt("qno") + "/";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}

		// 选取简答题题号存入试卷列表
		qtype = "简答题";
		sql = "SELECT * FROM qbank WHERE qtype=? and cno=? ORDER BY RAND() LIMIT ?";
		rs = dbc.doQuery(sql, new Object[] { qtype,cno, Integer.parseInt(sanswer) });
		try {
			while (rs.next()) {
				d04 = d04 + rs.getInt("qno") + "/";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}

		int PTotalscore = 0;// 设置试卷初始化总分数为零
		int dxtf = Integer.parseInt(scscore);// 单选题分数
		int duxtf = Integer.parseInt(mcscore);// 多选题分数
		int pdt = Integer.parseInt(jscore);// 判断题分数
		int jdt = Integer.parseInt(sascore);// 简答题分数
		dxtf = dxtf * Integer.parseInt(schoice);
		duxtf = duxtf * Integer.parseInt(mchoice);
		pdt = pdt * Integer.parseInt(judge);
		jdt = jdt * Integer.parseInt(sanswer);
		PTotalscore = dxtf + duxtf + pdt + jdt;
		// 时间格式转换
		String pstimes = pstime.replace("/", "-");
		String petimes = petime.replace("/", "-");

		sql = "INSERT INTO paper (`Pname`, `Cno`, `Tno`, `PStime`, `PEtime`, `SChoice`, `SCscore`, `MChoice`, `MCscore`, `Judge`, `Jscore`, `SAnswer`,`SAscore`,`PTotalscore`,`Pclass`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";

		int res = dbc.doUpdate(
				sql,
				new Object[] { pname, cno, tno, pstimes, petimes, d01,
						Integer.parseInt(scscore), d02,
						Integer.parseInt(mcscore), d03,
						Integer.parseInt(jscore), d04,
						Integer.parseInt(sascore), PTotalscore, sclasss });
		if (res == 1) {
			tag = true;
		} else {
			tag = false;

		}
		dbc.close();
		return tag;
	}
	
	
	
	
	/**
	 * 
	 * 学生答卷列表
	 */
	public List<AnswerPaper> answerPaperList(String tno){
		List<AnswerPaper> list=new ArrayList<AnswerPaper>();
		
		DBcon dbc = new DBcon();
		String		sql="SELECT  answerpaper.*, paper.pname,paper.`SAscore`,paper.`PTotalscore`,paper.petime,paper.pstime,course.cname, student.sname,sclass.scname ,qbank.Qstatement ,teaching.`Tsdept` FROM answerpaper,paper,course,student,sclass,qbank ,teaching WHERE answerpaper.`Cno`=course.cno AND answerpaper.`pnums`=paper.pnum AND answerpaper.`Qno`=qbank.qno  AND  student.sno=answerpaper.`Sno` AND student.sclass=sclass.scno AND teaching.`Cno`=answerpaper.`Cno`  AND answerpaper.`APstate`='待批阅' AND teaching.`Tno`=?";
	
		ResultSet rs = dbc.doQuery(sql, new Object[] {tno}); // 获取查询记录集
		AnswerPaper answerpaper=new AnswerPaper();
		try {
			while(rs.next()){
				
				//封装实体类
				answerpaper =new AnswerPaper();
				answerpaper.setCno(rs.getString("cname"));//考试科目
				answerpaper.setQnums(rs.getString("pname"));//试卷名称
				answerpaper.setSno(rs.getString("sno"));//学生学号
				answerpaper.setSclass(rs.getString("scname"));//班级名称
				answerpaper.setJscore(rs.getInt("jscore"));//判断题总分
				answerpaper.setMcscore(rs.getInt("mcscore"));//多选题总分
				answerpaper.setScscore(rs.getInt("scscore"));//单选题分数
				answerpaper.setPtotalscore(rs.getInt("ptotalscore"));//试卷总分
				answerpaper.setSname(rs.getString("sname"));//学生姓名
				answerpaper.setPstime(rs.getTimestamp("pstime"));//开始考试时间
				answerpaper.setPetime(rs.getTimestamp("petime"));//结束考试时间
				answerpaper.setApstate(rs.getString("apstate"));//试卷状态
				answerpaper.setQno(rs.getInt("qno"));//简答题题号
				answerpaper.setApanswer(rs.getString("apanswer"));//简答题答案
				answerpaper.setApscore(rs.getInt("sascore"));//简答题每题分数
				answerpaper.setQstatement(rs.getString("qstatement"));//简答题题目				
				list.add(answerpaper);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		
		return list;
		
	}
	
	/**
	 * 
	 * 批阅试卷完成，录入学生成绩
	 */
	
	
	public boolean StudentAddScore(String sno,String cno,String pnums,int Sscore){
		
		int sscore=Sscore;//简答题成绩
		
		boolean tag=false;//设置成功标记；			
		DBcon dbc=new DBcon();
		String sclass="";//获取学生班级
		int d01=0;
		int d02=0;
		int d03=0;
		String sql="select student.sclass from student where sno=?";
		ResultSet rs=dbc.doQuery(sql, new Object[]{sno});
		try {
			while(rs.next()){
				
				sclass=rs.getString("sclass");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		sql="SELECT answerpaper.scscore,answerpaper.`mcscore`,answerpaper.`jscore`  FROM answerpaper WHERE   sno=? AND cno=? AND pnums=?";
		rs=dbc.doQuery(sql, new Object[]{sno,cno,pnums});
		try {
			while(rs.next()){
				d01 = rs.getInt(1);
				d02 = rs.getInt(2);
				d03 = rs.getInt(3);
				Sscore = d01 + d02 + d03;
							
			}
		} catch (SQLException e1) {
		
			e1.printStackTrace();
		}
		
		sql="update  answerpaper set  APstate='已批阅' ,APscore=?  where sno=? AND cno=? AND pnums=?";//更新答题试卷状态
	int	res=dbc.doUpdate(sql, new Object[]{sscore,sno,cno,pnums});
		try {
			if(res==1){
				
				tag=true;
			}
			else{
				tag=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(tag){

			sql="INSERT INTO grade VALUES(?,?,?,?,?)";
			 res=dbc.doUpdate(sql, new Object[]{sno,cno,sclass,Sscore,67});
			try {
				if(res==1){
					
					tag=true;
				}else{
					tag=false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dbc.close();
			}
			
		}
		
		
		
		return tag;	
		
		
	}
	
	
	
	
	/**********************************************************************
	 /*****************************************************************
	 */
	/**
	 * 
	 * 学生成绩查询处理类
	 */
	public List<GradeStu> getGradeList(String sno){
		
		String sql="SELECT grade.`Sscore`,student.sname,paper.pname,sclass.scname,course.cname FROM grade,student,sclass,course ,paper WHERE paper.pnum=grade.pname AND grade.`Sno`=student.sno AND grade.`Sclass`=sclass.scno AND grade.`Cno`=course.cno AND grade.sno=?";
		DBcon dbc=new DBcon();
		List<GradeStu> list= new ArrayList<GradeStu>();
		GradeStu g=new GradeStu();
		ResultSet rs=dbc.doQuery(sql, new Object[]{sno});
		try {
			while(rs.next()){
				g=new GradeStu();
				g.setSscore(rs.getInt("sscore"));//试卷总分
				g.setCname(rs.getString("cname"));//考试科目
				g.setSclass(rs.getString("scname"));//考试班级		
				g.setPname(rs.getString("pname"));//考试试卷标题
				list.add(g);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return list;
	}
	
	/**
	 * 
	 * 考试学生信息查询
	 * 
	 */
	

	
}
