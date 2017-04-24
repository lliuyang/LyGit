package entity;
/**
 * 简答题实体类
 * @author Administrator
 *
 */
public class sanswer {
	private String sanswer;//简答题
	private int SAscore;//简答分数
	private int qno;//题号
	private String qtype;//题型
	private String qstatement;//题目
	
	
	public String getSanswer() {
		return sanswer;
	}
	public void setSanswer(String sanswer) {
		this.sanswer = sanswer;
	}
	public int getSAscore() {
		return SAscore;
	}
	public void setSAscore(int sAscore) {
		SAscore = sAscore;
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
	
	
}
