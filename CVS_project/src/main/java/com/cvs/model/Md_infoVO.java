package com.cvs.model;

public class Md_infoVO {
	private int md_no;
	private int barcode_no;
	private int shelf_life;
	private String type;
	private String detail_type;
	private String company;
 	private String md_name;
 	private String pack_date;
	private int cost;
	private int price;
 	
 	
	public int getMd_no() {
		return md_no;
	}
	public void setMd_no(int md_no) {
		this.md_no = md_no;
	}
	public int getBarcode_no() {
		return barcode_no;
	}
	public void setBarcode_no(int barcode_no) {
		this.barcode_no = barcode_no;
	}
	public int getShelf_life() {
		return shelf_life;
	}
	public void setShelf_life(int shelf_life) {
		this.shelf_life = shelf_life;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDetail_type() {
		return detail_type;
	}
	public void setDetail_type(String detail_type) {
		this.detail_type = detail_type;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMd_name() {
		return md_name;
	}
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	public String getPack_date() {
		return pack_date;
	}
	public void setPack_date(String pack_date) {
		this.pack_date = pack_date;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Md_infoVO [md_no=" + md_no + ", barcode_no=" + barcode_no + ", shelf_life=" + shelf_life + ", type="
				+ type + ", detail_type=" + detail_type + ", company=" + company + ", md_name=" + md_name
				+ ", pack_date=" + pack_date + ", cost=" + cost + ", price=" + price + "]";
	}
 	
 	
 	

}