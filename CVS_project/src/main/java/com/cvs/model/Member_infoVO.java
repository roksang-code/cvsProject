package com.cvs.model;

public class Member_infoVO {
	private int member_no;
	private String member_name;
	private String id;
	private String pw;
 	private String email;
 	private String gender;
 	private String age;
 	private String join_date;
 	
 	
 	
 	

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
 	
 	
	@Override
	public String toString() {
		return "Member_infoVO [member_no=" + member_no + ", member_name=" + member_name + ", id=" + id + ", pw=" + pw
				+ ", email=" + email + ", gender=" + gender + ", age=" + age + ", join_date=" + join_date + "]";
	}
}
