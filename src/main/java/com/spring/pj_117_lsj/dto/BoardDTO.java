package com.spring.pj_117_lsj.dto;

import java.sql.Date;


//게시판 DTO

public class BoardDTO {
	
	private int num;
	private String title;
	private String content;
	private String writer;
	private String password;
	private int readCnt;
	private Date regDate;
	private int comment_count; //댓글갯수
	
	public BoardDTO() {}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "boardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", password=" + password + ", readCnt=" + readCnt + ", regDate=" + regDate + "]";
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
}
