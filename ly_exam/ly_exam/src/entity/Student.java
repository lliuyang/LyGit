package entity;

/*
 * 学生信息实体类
 */
public class Student {

	private String sno;//学号
	private String sname;//姓名
	private String ssex;//性别
	private String sclass;//班级
	private String spassword;//密码
	private String sclassname;//班级中文名称
	public String getSclassname() {
		return sclassname;
	}
	public void setSclassname(String sclassname) {
		this.sclassname = sclassname;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

	
	
	
	
}
