package entity;

import java.sql.Timestamp;

public class SJxqpiyue {
	private String pname;//试卷标题
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPtotalscore() {
		return ptotalscore;
	}
	public void setPtotalscore(int ptotalscore) {
		this.ptotalscore = ptotalscore;
	}
	public String getApstate() {
		return apstate;
	}
	public void setApstate(String apstate) {
		this.apstate = apstate;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public int getD01() {
		return d01;
	}
	public void setD01(int d01) {
		this.d01 = d01;
	}
	public int getD02() {
		return d02;
	}
	public void setD02(int d02) {
		this.d02 = d02;
	}
	public int getD03() {
		return d03;
	}
	public void setD03(int d03) {
		this.d03 = d03;
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
	public int getApscore() {
		return apscore;
	}
	public void setApscore(int apscore) {
		this.apscore = apscore;
	}
	public String getApanswer() {
		return apanswer;
	}
	public void setApanswer(String apanswer) {
		this.apanswer = apanswer;
	}
	private int ptotalscore;//试卷总分
	private String apstate;//批改状态
	private String sname;//学生姓名
	private String sno;//学号
	private int d01;//单选题总分数
	private int d02;//多选题总分数
	private int d03;//判断题总分数
	private Timestamp pstime;//开考时间
	private Timestamp petime;//结束时间
	private String qstatement;//简答题题目
	private int apscore;//简答题总分
	private String   apanswer;//简答题答案
	private String Cno; //考试的课程号
	private String pnums;//试卷编号
	
	public String getPnums() {
		return pnums;
	}
	public void setPnums(String pnums) {
		this.pnums = pnums;
	}
	public String getCno() {
		return Cno;
	}
	public void setCno(String cno) {
		Cno = cno;
	}
	

}
