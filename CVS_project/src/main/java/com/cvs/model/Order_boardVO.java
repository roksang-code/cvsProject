package com.cvs.model;


public class Order_boardVO {
	
	private int member_no;
	private int barcode_no;
	private int order_ea;
	private int approval_ea;
	private int count;


	public int getBarcode_no() {
		return barcode_no;
	}
	public void setBarcode_no(int barcode_no) {
		this.barcode_no = barcode_no;
	}
	public int getOrder_ea() {
		return order_ea;
	}
	public void setOrder_ea(int order_ea) {
		this.order_ea = order_ea;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getApproval_ea() {
		return approval_ea;
	}
	public void setApproval_ea(int approval_ea) {
		this.approval_ea = approval_ea;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Order_boardVO [member_no=" + member_no + ", barcode_no=" + barcode_no + ", order_ea=" + order_ea
				+ ", approval_ea=" + approval_ea + ", count=" + count + "]";
	}

	
	
}
