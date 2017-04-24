package entity;
/**
 * 简答题批改时的答案选择
 * @author pantiemin
 *
 */

public class AnswerList {

	public int getSascore() {
		return sascore;
	}
	public void setSascore(int sascore) {
		this.sascore = sascore;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	private int sascore;//简答题分数
	private String  title;//简答题题目
	private String  answer;//简答题答案
	
	public int getAnscoretip() {
		return anscoretip;
	}
	public void setAnscoretip(int anscoretip) {
		this.anscoretip = anscoretip;
	}
	private int anscoretip;//简答题总分数
}
