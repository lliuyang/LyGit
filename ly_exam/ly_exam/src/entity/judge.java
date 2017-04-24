package entity;
/**
 * 判断题实体类
 * @author Administrator
 *
 */
public class judge {

	private String judge;//判断题
	private int jscore;//判断题分数
	private int qno;//题号
	private String qtype;//题型
	private String qstatement;//题目
	private String qchoicea;//a选项
	private String qchoiceb;//b选项
	private String qanswer;//正确答案
	
	
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
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	
	
}
