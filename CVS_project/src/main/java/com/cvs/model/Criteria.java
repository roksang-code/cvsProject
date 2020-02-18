package com.cvs.model;

public class Criteria {
	private int pageNum;
	private int amount;

	private String keyword;
	
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {

		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
