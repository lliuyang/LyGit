package entity;
/**
 * 多选题实体类
 * @author Administrator
 *
 */
public class mchoice {

	private String mchoice;//多选题
	private int scscore;//多选题分数
	private int qno;//题号
	private String qtype;//题型
	private String qstatement;//题目
	private String qchoicea;//a选项
	private String qchoiceb;//b选项
	private String qchoicec;//c选项
	private String qchoiced;//d选项
	private String qanswer;//正确答案
	public String getMchoice() {
		return mchoice;
	}
	public void setMchoice(String mchoice) {
		this.mchoice = mchoice;
	}
	public int getScscore() {
		return scscore;
	}
	public void setScscore(int scscore) {
		this.scscore = scscore;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public String getQstatement() {
		return qstatement;
	}
	public void setQstatement(String qstatement) {
		this.qstatement = qstatement;
	}
	public String getQchoicea() {
		return qchoicea;
	}
	public void setQchoicea(String qchoicea) {
		this.qchoicea = qchoicea;
	}
	public String getQchoiceb() {
		return qchoiceb;
	}
	public void setQchoiceb(String qchoiceb) {
		this.qchoiceb = qchoiceb;
	}
	public String getQchoicec() {
		return qchoicec;
	}
	public void setQchoicec(String qchoicec) {
		this.qchoicec = qchoicec;
	}
	public String getQchoiced() {
		return qchoiced;
	}
	public void setQchoiced(String qchoiced) {
		this.qchoiced = qchoiced;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	
	
}
