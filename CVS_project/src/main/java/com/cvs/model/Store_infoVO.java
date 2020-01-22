package com.cvs.model;

public class Store_infoVO {

	private int member_no;
	private int store_no;
	private int emp_no;
	private String emp_name;
	private String grade;
	private String enter_emp_date;
	private String out_emp_date;

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEnter_emp_date() {
		return enter_emp_date;
	}

	public void setEnter_emp_date(String enter_emp_date) {
		this.enter_emp_date = enter_emp_date;
	}

	public String getOut_emp_date() {
		return out_emp_date;
	}

	public void setOut_emp_date(String out_emp_date) {
		this.out_emp_date = out_emp_date;
	}

}
