package entity;

import java.sql.Timestamp;

public class Paper {
	
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
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
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
	public String getSchoice() {
		return schoice;
	}
	public void setSchoice(String schoice) {
		this.schoice = schoice;
	}
	public int getScscore() {
		return scscore;
	}
	public void setScscore(int scscore) {
		this.scscore = scscore;
	}
	public String getMchoice() {
		return mchoice;
	}
	public void setMchoice(String mchoice) {
		this.mchoice = mchoice;
	}
	public int getMcscore() {
		return mcscore;
	}
	public void setMcscore(int mcscore) {
		this.mcscore = mcscore;
	}
	public String getJudge() {
		return judge;
	}
	public void setJudge(String judge) {
		this.judge = judge;
	}
	public int getJscore() {
		return jscore;
	}
	public void setJscore(int jscore) {
		this.jscore = jscore;
	}
	public String getSanswer() {
		return sanswer;
	}
	public void setSanswer(String sanswer) {
		this.sanswer = sanswer;
	}
	public int getSascore() {
		return sascore;
	}
	public void setSascore(int sascore) {
		this.sascore = sascore;
	}
	public int getPtotalscore() {
		return ptotalscore;
	}
	public void setPtotalscore(int ptotalscore) {
		this.ptotalscore = ptotalscore;
	}
	private int pnum;//试卷号自增
	private String pname;//试卷名
	private String cno;//课程号
	private String tno;	//教师号
	private Timestamp pstime;//开考时间
	private Timestamp petime;//结束时间
	private String schoice;//选择题
	private int scscore;//选择题分数
	private String  mchoice;//多选题
	private int mcscore;//多选题分数
	private String  judge;//判断题
	private int  jscore;//判断题分数
	private String  sanswer;//简答题
	private int  sascore;//简答题分数
	private int  ptotalscore;//试卷总分
	
	private int  Pclass;//试卷总分

	public int getPclass() {
		return Pclass;
	}
	public void setPclass(int pclass) {
		Pclass = pclass;
	}

	
	

}
