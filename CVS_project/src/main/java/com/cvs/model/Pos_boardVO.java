package com.cvs.model;

public class Pos_boardVO {
	private int store_no;
	private int list_no;
	private int md_no;
	private int barcode_no;
	private int md_ea;
	private int	list_md_ea;
	private int price;
	private int total_price;	
	private String md_name;
	private String sale_date;
	private String sale_time;
	private String update_date;

	
	
	public int getList_md_ea() {
		return list_md_ea;
	}
	public void setList_md_ea(int list_md_ea) {
		this.list_md_ea = list_md_ea;
	}
	public int getMd_no() {
		return md_no;
	}
	public void setMd_no(int md_no) {
		this.md_no = md_no;
	}

	public String getMd_name() {
		return md_name;
	}
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getSale_time() {
		return sale_time;
	}
	public void setSale_time(String sale_time) {
		this.sale_time = sale_time;
	}
	public int getMd_ea() {
		return md_ea;
	}
	public void setMd_ea(int md_ea) {
		this.md_ea = md_ea;
	}
	public int getBarcode_no() {
		return barcode_no;
	}
	public void setBarcode_no(int barcode_no) {
		this.barcode_no = barcode_no;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	
	
	public String getSale_date() {
		return sale_date;
	}
	public void setSale_date(String sale_date) {
		this.sale_date = sale_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	@Override
	public String toString() {
		return "Pos_boardVO [store_no=" + store_no + ", list_no=" + list_no + ", md_no=" + md_no + ", barcode_no="
				+ barcode_no + ", md_ea=" + md_ea + ", list_md_ea=" + list_md_ea + ", price=" + price + ", total_price="
				+ total_price + ", md_name=" + md_name + ", sale_date=" + sale_date + ", sale_time=" + sale_time
				+ ", update_date=" + update_date + "]";
	}
	
	
	
}
