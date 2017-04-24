package entity;
/**
 * 
 * 学生成绩实体类
 * @author pantiemin
 *
 */
public class GradeStu {

	
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
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getSscore() {
		return sscore;
	}
	public void setSscore(int sscore) {
		this.sscore = sscore;
	}
private  String pname;//学生姓名
  private String sclass;//学生班级
  private String cname;//学生考试科目
  private int sscore;//学生成绩

}
