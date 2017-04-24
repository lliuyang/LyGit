package entity;

import java.sql.Timestamp;

/**
 * 学生答题试卷答案实体类
 * @author pantiemin
 *
 */
public class AnswerPaper {
	
	
	private String sclass;//考试班级
	
	
	private String qstatement;//简答题题目
	private String qnums;//试卷编号
	private String sno;//学号
	private String cno;//课程号
	private String sname;//学生姓名
	private int qno;//简答题题号	
	private String   apanswer;//学生答案
	private int apscore;//简答题总分
	private int scscore;//单选题总分数
	private int mcscore;//多选题总分数
	private int jscore;//判断题总分数

	private String apstate;//批改状态
	private int  ptotalscore;//试卷总分
	private String pname;//试卷名
	private int score;//除简答题外分数
	private Timestamp pstime;//开考时间
	private Timestamp petime;//结束时间

	//private int  sascore;//简答题每题分数
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	public Timestamp getPstime() {
		return pstime;
	}
	public void setPstime(Timestamp pstime) {
		this.pstime = pstime;
	}
	public Timestamp getPetime() {
		return petime;
	}
	public void setPetime(Timestamp petime) {
		this.petime = petime;
	}
	
	public String getQstatement() {
		return qstatement;
	}
	public void setQstatement(String qstatement) {
		this.qstatement = qstatement;
	}

	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getApanswer() {
		return apanswer;
	}
	public void setApanswer(String apanswer) {
		this.apanswer = apanswer;
	}
	public int getApscore() {
		return apscore;
	}
	public void setApscore(int apscore) {
		this.apscore = apscore;
	}
	public int getScscore() {
		return scscore;
	}
	public void setScscore(int scscore) {
		this.scscore = scscore;
	}
	public int getMcscore() {
		return mcscore;
	}
	public void setMcscore(int mcscore) {
		this.mcscore = mcscore;
	}
	public int getJscore() {
		return jscore;
	}
	public void setJscore(int jscore) {
		this.jscore = jscore;
	}
	public String getApstate() {
		return apstate;
	}
	public void setApstate(String apstate) {
		this.apstate = apstate;
	}

	public String getQnums() {
		return qnums;
	}
	public void setQnums(String qnums) {
		this.qnums = qnums;
	}
	public int getPtotalscore() {
		return ptotalscore;
	}
	public void setPtotalscore(int ptotalscore) {
		this.ptotalscore = ptotalscore;
	}

	

}
