package com.cvs.model;

public class Functionkey_infoVO {

	private String key_no;
	private int barcode_no;
 	private String md_name;
	
 	
 	
 	
 	public String getKey_no() {
		return key_no;
	}
	public void setKey_no(String key_no) {
		this.key_no = key_no;
	}
	public int getBarcode_no() {
		return barcode_no;
	}
	public void setBarcode_no(int barcode_no) {
		this.barcode_no = barcode_no;
	}
	public String getMd_name() {
		return md_name;
	}
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	@Override
	public String toString() {
		return "Functionkey_infoVO [key_no=" + key_no + ", barcode_no=" + barcode_no + ", md_name=" + md_name + "]";
	}

 	
 	
 	
 	
}
