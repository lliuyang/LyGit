package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBcon;

import entity.Course;
import entity.QBank;
import entity.SClass;
import entity.Student;
import entity.Tc;
import entity.Teacher;




/**
 * 管理员后台方法实现dao
 * @author Administrator
 *
 */



public class AdminDao {
	
	public List<Course> courseList() {  //获取所有课程
		List<Course> list = new ArrayList<Course>();
		// 获取数据库连接
		DBcon dbc = new DBcon();
		String sql = "SELECT  * FROM course";
		ResultSet rs = dbc.doQuery(sql, new Object[] {}); // 获取查询记录集
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
	 * 
	 * 授课表管理
	 * @return
	 */
	
	public List<Tc> tcList() {
		
		List<Tc> list = new ArrayList<Tc>();
		// 获取数据库连接
		DBcon dbc = new DBcon();
		String sql = "SELECT  teacher.tname,course.cname,sclass.scname ,teaching.tsdept FROM teaching,sclass,teacher,course WHERE teaching.tno=teacher.tno AND teaching.cno=course.cno AND teaching.tclass=sclass.scno";
		ResultSet rs = dbc.doQuery(sql, new Object[] {}); // 获取查询记录集
		Tc c = new Tc();
		try {
			while (rs.next()) {
				// 封装实体类
				c = new Tc();
			c.setCno(rs.getString("cname"));
			c.setTsdept(rs.getString("tsdept"));
			c.setTno(rs.getString("tname"));
			c.setTclass(rs.getString("scname"));
				list.add(c);
			}
			dbc.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		return list;}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public boolean addstudent(String sno,String password,String ssex,String sclass,String sname){
	
	/**
	 * 添加学生信息
	 */
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="insert into student values(?,?,?,?,?)";
		int res=dbc.doUpdate(sql, new Object[]{sno,sname,ssex,sclass,password});
		dbc.close();
		if(res==1){
			tag=true;
		}
	
		return tag;
	}
	

	public List<Student> StudentListShow(String sclass){

	/**
	 * 学生列表显示
	 */
		DBcon dbc= new DBcon();
		String sql = "SELECT student.*,sclass.scname FROM student,sclass WHERE sclass.scno=student.sclass AND sclass.scno=?";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{sclass});		
		List<Student> list=new ArrayList<Student>();
		Student student=null;
		try {
			while(rs.next()){
				student=new Student();
				
				student.setSclass(rs.getString("scname"));
				student.setSname(rs.getString("sname"));
				student.setSno(rs.getString("sno"));
				student.setSpassword(rs.getString("spassword"));
				student.setSsex(rs.getString("ssex"));
				list.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();
			
		}
		return list;

	}
	
	/**
	 * 删除学生信息
	 */
	public boolean stuDel(String sno){
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="delete from Student where Sno=?";
		int res=dbc.doUpdate(sql, new Object[]{sno});
		dbc.close();
		if(res==1){
			tag=true;
		}
		return tag;
	}
	
	/**
	 * 修改学生信息前，发送学生信息
	 */
	public List<Student> stuSendModify(String sno){
		DBcon dbc= new DBcon();
		String sql = "SELECT student.*,sclass.scname FROM student,sclass WHERE sclass.scno=student.sclass AND student.sno=?";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{sno});		
		List<Student> list=new ArrayList<Student>();
		Student student=null;
		try {
			while(rs.next()){
				student=new Student();
				student.setSclassname(rs.getString("scname"));
				student.setSclass(rs.getString("sclass"));
				student.setSname(rs.getString("sname"));
				student.setSno(rs.getString("sno"));
				student.setSpassword(rs.getString("spassword"));
				student.setSsex(rs.getString("ssex"));
				list.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();
			
		}
		return list;
	}
	
	/**
	 * 返回班级记录集
	 */
	public List<SClass> getStuClass(){
		DBcon dbc= new DBcon();
		String sql = "select * from SClass";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{});		
		List<SClass> list=new ArrayList<SClass>();
		SClass sclass=null;
		try {
			while(rs.next()){
				sclass=new SClass();
				sclass.setScno(rs.getString("SCno"));
			sclass.setScname(rs.getString("SCname"));
		//		System.out.println(sclass);
				list.add(sclass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return list;
	}
	
	/**
	 * 学生信息修改
	 */
	public boolean stuModify(String sname, String ssex, String sclass, String spassword, String sno){
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="update Student set Sname=?, Ssex=?, Sclass=?, Spassword=? where Sno=?";
		System.out.println(sname+ssex+sclass+spassword+sno);
		int res=dbc.doUpdate(sql, new Object[]{sname,ssex,sclass,spassword,sno});
		System.out.println(sql);
		dbc.close();
		if(res==1){
			tag=true;
		}
	
		return tag;
	}
	
	
	/***********************************************************************
	 * 教师管理action动作的  Dao
	 * @param tno
	 * @param tname
	 * @param tsex
	 * @param tpassword
	 * @return
	 ***********************************************************************/
	
	
	/**
	 * 添加教师信息
	 */
	public boolean teacherAdd(String tno, String tname, String tsex, String tpassword){
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="insert into Teacher values(?,?,?,?)";
		int res=dbc.doUpdate(sql, new Object[]{tno,tname,tsex,tpassword});
		dbc.close();
		if(res==1){
			tag=true;
		}
		return tag;
	}
	
	/**
	 * 教师信息列表的显示
	 */
	public List<Teacher> teacherList(){
		DBcon dbc= new DBcon();
		String sql = "select * from Teacher";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{});		
		List<Teacher> list=new ArrayList<Teacher>();
		Teacher teacher=null;
		try {
			while(rs.next()){
				teacher=new Teacher();
				teacher.setTno(rs.getString("Tno"));
				teacher.setTname(rs.getString("Tname"));
				teacher.setTsex(rs.getString("Tsex"));
				teacher.setTpassword(rs.getString("Tpassword"));
				list.add(teacher);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();	
		}
		return list;
	}
	
	/**
	 * 教师信息删除
	 */
	public boolean teacherDel(String tno){
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="delete from Teacher where Tno=?";
		int res=dbc.doUpdate(sql, new Object[]{tno});
		dbc.close();
		if(res==1){
			tag=true;
		}
		return tag;
	}
	

	/**
	 * 修改教师信息前，发送教师信息
	 */
	public List<Teacher> tSendModify(String tno){
		DBcon dbc= new DBcon();
		String sql = "select * from Teacher where tno=?";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{tno});		
		List<Teacher> list=new ArrayList<Teacher>();
		Teacher teacher=null;
		try {
			while(rs.next()){
				teacher=new Teacher();
				
				teacher.setTno(rs.getString("Tno"));
				teacher.setTname(rs.getString("Tname"));
				teacher.setTsex(rs.getString("Tsex"));
				teacher.setTpassword(rs.getString("Tpassword"));
				list.add(teacher);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();
			
		}
		return list;
	}
	
	/**
	 * 教师信息修改
	 */
	public boolean teacherModify(String tname, String tsex, String tpassword, String tno){
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="update Teacher set Tname=?, Tsex=?, Tpassword=? where Tno=?";
		int res=dbc.doUpdate(sql, new Object[]{tname,tsex,tpassword,tno});
		dbc.close();
		if(res==1){
			tag=true;
		}
	
		return tag;
	}
	
	
	/********************************************************************
	 * 题库管理action动作     D
	 *
	 *********************************************************************/
	
	/**
	 * 添加题目前，获取课程号信息
	 */
	public List<Course> sendAddQuestion(){
		DBcon dbc= new DBcon();
		String sql = "SELECT * FROM Course";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{});		
		List<Course> list=new ArrayList<Course>();
		Course course=null;
		try {
			while(rs.next()){
				course=new Course();
				course.setCno(rs.getString("cno"));
			course.setCname(rs.getString("cname"));
				list.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return list;
	}
	
	/**
	 * 添加题目信息
	 */
	public boolean questionAdd(String cno, String qtype, String qstatement, String qchoicea, String qchoiceb,
			String qchoicec, String qchoiced, String answer){
			boolean tag=false;
			DBcon dbc=new DBcon();
			String sql="insert into QBank(Cno,Qtype,Qstatement,Qchoicea,Qchoiceb,Qchoicec,Qchoiced,Qanswer) values(?,?,?,?,?,?,?,?)";
			int res=dbc.doUpdate(sql, new Object[]{cno, qtype,qstatement,qchoicea,qchoiceb,qchoicec,qchoiced,answer});
			dbc.close();
			if(res==1){
				tag=true;
			}
		
			return tag;
		}
	
	/**
	 * 显示题库列表
	 */
	public List<QBank> questionList(String courses,String qnos){
		DBcon dbc= new DBcon();
		String sql = "SELECT qbank.*,course.cname FROM QBank ,course WHERE qbank.cno=course.cno AND qbank.cno like ? AND qbank.qno like ?";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{courses,qnos});		
		List<QBank> list=new ArrayList<QBank>();
		QBank bank=null;
		try {
			while(rs.next()){
				bank=new QBank();
				bank.setQno(rs.getInt("Qno"));
				bank.setCno(rs.getString("cname"));
				bank.setQstatement(rs.getString("Qstatement"));
				bank.setQtype(rs.getString("Qtype"));
				bank.setQchoicea(rs.getString("Qchoicea"));
				bank.setQchoiceb(rs.getString("Qchoiceb"));
				bank.setQchoicec(rs.getString("Qchoicec"));
				bank.setQchoiced(rs.getString("Qchoiced"));
				bank.setQanswer(rs.getString("Qanswer"));
				list.add(bank);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();	
		}
		return list;
	}
	
	/**
	 * 修改题目之前，先转发题目信息
	 */
	public List<QBank> sQuestionMod(String qno){
		DBcon dbc= new DBcon();
		String sql = "select * from QBank where Qno=?";
		ResultSet rs = dbc.doQuery(sql, new  Object[]{qno});		
		List<QBank> list=new ArrayList<QBank>();
		QBank bank=null;
		try {
			while(rs.next()){
				bank=new QBank();
				bank.setQno(rs.getInt("Qno"));
				bank.setCno(rs.getString("Cno"));
				bank.setQstatement(rs.getString("Qstatement"));
				bank.setQtype(rs.getString("Qtype"));
				bank.setQchoicea(rs.getString("Qchoicea"));
				bank.setQchoiceb(rs.getString("Qchoiceb"));
				bank.setQchoicec(rs.getString("Qchoicec"));
				bank.setQchoiced(rs.getString("Qchoiced"));
				bank.setQanswer(rs.getString("Qanswer"));
			System.out.println(bank.getCno());
				list.add(bank);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return list;
	}
	
	/**
	 * 修改题目信息
	 */
	public boolean questionMod(String cno, String qstatement, String qtype, String qchoicea, String qchoiceb,
			String qchoicec, String qchoiced, String qanswer, String qno){
			boolean tag=false;
			DBcon dbc=new DBcon();
			String sql="update QBank set Cno=?,Qstatement=?,Qtype=?," +
					"Qchoicea=?,Qchoiceb=?,Qchoicec=?,Qchoiced=?,Qanswer=? where Qno=?";
			int res=dbc.doUpdate(sql, new Object[]{cno,qstatement,qtype,qchoicea,qchoiceb,qchoicec,qchoiced,qanswer,qno});
			dbc.close();
			if(res==1){
				tag=true;
			}
		
			return tag;
		}
	
	/**
	 * 删除题目信息
	 */
	public boolean questionDel(String qno){
		boolean tag=false;
		DBcon dbc=new DBcon();
		String sql="delete from QBank where qno=?";
		int res=dbc.doUpdate(sql, new Object[]{qno});
		dbc.close();
		if(res==1){
			tag=true;
		}
		return tag;
	}
	
	/**
	 * ***************************************************
	 * **************************************************
	 * 课程表操作
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
