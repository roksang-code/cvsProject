package com.cvs.model;

public class Buttonpage {
	private int pageNum;


	public Buttonpage() {
		this(1);
	}

	public Buttonpage(int pageNum) {

		this.pageNum = pageNum;
	}
	
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

}
