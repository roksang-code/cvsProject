package com.cvs.model;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int no;
	private String subject;
	private String content;
	private String writer;
 	private String write_date;
 	private int cnt;
 	private int page;
 	private String[] files;
 	

	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", subject=" + subject + ", content=" + content + ", writer=" + writer
				+ ", write_date=" + write_date + ", cnt=" + cnt + ", page=" + page + ", files=" + Arrays.toString(files)
				+ "]";
	}
	
}
