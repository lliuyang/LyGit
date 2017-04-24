package entity;

import java.sql.Timestamp;
/**
 * 试卷信息实体类
 * @author Administrator
 *
 */
public class paper_info {
	
	private int pnum;//试卷号 
	private String pname;//试卷名
	private Timestamp pstime;//开始时间
	private Timestamp petime;//结束时间
	private int ptotalscore;//试卷总分
	private int antime;//答题时间
	private String sno;//考试学生学号
	private int qno;//题号
	
	private int jscore;//判断题分数
	private int scscore;//单选题分数
	private int mcscore;//多选题分数
	private int sascore;//简答题分数
	
	
	
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public int getPtotalscore() {
		return ptotalscore;
	}
	public void setPtotalscore(int ptotalscore) {
		this.ptotalscore = ptotalscore;
	}
	public int getAntime() {
		return antime;
	}
	public void setAntime(int antime) {
		this.antime = antime;
	}
	

	
	public int getMcscore() {
		return mcscore;
	}
	public void setMcscore(int mcscore) {
		this.mcscore = mcscore;
	}
	public int getSascore() {
		return sascore;
	}
	public void setSascore(int sascore) {
		this.sascore = sascore;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}

	public int getJscore() {
		return jscore;
	}
	public void setJscore(int jscore) {
		this.jscore = jscore;
	}
	public int getScscore() {
		return scscore;
	}
	public void setScscore(int scscore) {
		this.scscore = scscore;
	}
	
}
