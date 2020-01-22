package com.cvs.model;

public class Store_boardVO {

	private int member_no;
	private int store_no;
	private int md_ea;
	private String enter_md_date;
	private String out_md_date;

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

	public int getMd_ea() {
		return md_ea;
	}

	public void setMd_ea(int md_ea) {
		this.md_ea = md_ea;
	}

	public String getEnter_md_date() {
		return enter_md_date;
	}

	public void setEnter_md_date(String enter_md_date) {
		this.enter_md_date = enter_md_date;
	}

	public String getOut_md_date() {
		return out_md_date;
	}

	public void setOut_md_date(String out_md_date) {
		this.out_md_date = out_md_date;
	}

}
