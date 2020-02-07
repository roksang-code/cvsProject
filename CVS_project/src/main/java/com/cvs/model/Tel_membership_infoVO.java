package com.cvs.model;

public class Tel_membership_infoVO {
	private String tel_company;
	private String phone_no;
	private String tel_grade;
	private String tel_point;
	public String getTel_company() {
		return tel_company;
	}
	public void setTel_company(String tel_company) {
		this.tel_company = tel_company;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getTel_grade() {
		return tel_grade;
	}
	public void setTel_grade(String tel_grade) {
		this.tel_grade = tel_grade;
	}
	public String getTel_point() {
		return tel_point;
	}
	public void setTel_point(String tel_point) {
		this.tel_point = tel_point;
	}
	@Override
	public String toString() {
		return "Tel_membership_infoVO [tel_company=" + tel_company + ", phone_no=" + phone_no + ", tel_grade="
				+ tel_grade + ", tel_point=" + tel_point + "]";
	}

	
	
}
