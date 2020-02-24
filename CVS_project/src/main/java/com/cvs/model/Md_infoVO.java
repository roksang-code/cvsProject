package com.cvs.model;

import org.springframework.web.multipart.MultipartFile;

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
	private int promotion_no;
	private int pr_ea;
	private int pr_price;
	private String pr_type;
	private String pr_subject;
	private String pr_content;
	private String pr_family;
	private int order_ea;
	private int approval_ea;
	private int member_no;
	private int count;
	private int total_order_ea;	
	private int total_cost;	
	private int total_price;	
 	private MultipartFile md_img;

 	
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
	public String getPr_subject() {
		return pr_subject;
	}
	public void setPr_subject(String pr_subject) {
		this.pr_subject = pr_subject;
	}
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public String getPr_type() {
		return pr_type;
	}
	public void setPr_type(String pr_type) {
		this.pr_type = pr_type;
	}
	public int getPromotion_no() {
		return promotion_no;
	}
	public void setPromotion_no(int promotion_no) {
		this.promotion_no = promotion_no;
	}
	public int getPr_ea() {
		return pr_ea;
	}
	public void setPr_ea(int pr_ea) {
		this.pr_ea = pr_ea;
	}
	public int getPr_price() {
		return pr_price;
	}
	public void setPr_price(int pr_price) {
		this.pr_price = pr_price;
	}
	public String getPr_family() {
		return pr_family;
	}
	public void setPr_family(String pr_family) {
		this.pr_family = pr_family;
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
	public int getTotal_order_ea() {
		return total_order_ea;
	}
	public void setTotal_order_ea(int total_order_ea) {
		this.total_order_ea = total_order_ea;
	}
	public int getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
	public MultipartFile getMd_img() {
		return md_img;
	}
	public void setMd_img(MultipartFile md_img) {
		this.md_img = md_img;
	}
	@Override
	public String toString() {
		return "Md_infoVO [md_no=" + md_no + ", barcode_no=" + barcode_no + ", shelf_life=" + shelf_life + ", type="
				+ type + ", detail_type=" + detail_type + ", company=" + company + ", md_name=" + md_name
				+ ", pack_date=" + pack_date + ", cost=" + cost + ", price=" + price + ", promotion_no=" + promotion_no
				+ ", pr_ea=" + pr_ea + ", pr_price=" + pr_price + ", pr_type=" + pr_type + ", pr_subject=" + pr_subject
				+ ", pr_content=" + pr_content + ", pr_family=" + pr_family + ", order_ea=" + order_ea
				+ ", approval_ea=" + approval_ea + ", member_no=" + member_no + ", count=" + count + ", total_order_ea="
				+ total_order_ea + ", total_cost=" + total_cost + ", total_price=" + total_price + ", md_img=" + md_img
				+ "]";
	}
	

	
	
	
	
	
	
	
	
 	
 	

}