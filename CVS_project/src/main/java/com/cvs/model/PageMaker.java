package com.cvs.model;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private Criteria cri;
	
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}


	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	private int displayPageNum = 10;
	

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
	}

	





		
	public PageMaker(Criteria cri, int totalCount) {

		this.totalCount = totalCount;
		this.cri = cri;
		 
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		this.startPage = this.endPage -9;
	
		
				
		
		int tempEndPage = (int)(Math.ceil(totalCount*1.0/cri.getAmount()));
		
		if(this.endPage>tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = this.startPage >1;
		
		this.next = this.endPage <  tempEndPage;
	
	
		
	}



	
}
