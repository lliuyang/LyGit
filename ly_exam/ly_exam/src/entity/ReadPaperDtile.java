package entity;



/**
 * 试卷详情页实体类
 * @author pantiemin
 *
 */
public class ReadPaperDtile {


public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPtotalscore() {
		return ptotalscore;
	}
	public void setPtotalscore(String ptotalscore) {
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
	public String getD01() {
		return d01;
	}
	public void setD01(String d01) {
		this.d01 = d01;
	}
	public String getD02() {
		return d02;
	}
	public void setD02(String d02) {
		this.d02 = d02;
	}
	public String getD03() {
		return d03;
	}
	public void setD03(String d03) {
		this.d03 = d03;
	}
	public String getPstime() {
		return pstime;
	}
	public void setPstime(String pstime) {
		this.pstime = pstime;
	}
	public String getPetime() {
		return petime;
	}
	public void setPetime(String petime) {
		this.petime = petime;
	}
	public String getQstatement() {
		return qstatement;
	}
	public void setQstatement(String qstatement) {
		this.qstatement = qstatement;
	}
	public String getApscore() {
		return apscore;
	}
	public void setApscore(String apscore) {
		this.apscore = apscore;
	}
	public String getApanswer() {
		return apanswer;
	}
	public void setApanswer(String apanswer) {
		this.apanswer = apanswer;
	}
private String pname;//试卷标题
private String ptotalscore;//试卷总分
private String apstate;//批改状态
private String sname;//学生姓名
private String sno;//学号
private String d01;//单选题总分数
private String d02;//多选题总分数
private String d03;//判断题总分数
private String pstime;//开考时间
private String petime;//结束时间
private String qstatement;//简答题题目
private String apscore;//简答题总分
private String   apanswer;//简答题答案

	
}
