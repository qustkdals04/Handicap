package com.handicap.model.handicap;

public class BbsQnaBean {
	/*
	게시판번호 – boardno - number
	글번호 – no - number
	글제목 – title – varchar2(50)
	글쓴날짜 – date - date
	글쓴이 – author - varchar2(20)
	글내용 – content - varchar2(2000)
	처리상태 – status – varchar2(10)
	파일 – fileid - number

	 */
	private int no;
	private String title;
	private String date;
	private String author;
	private String content;
	private String status;
	private int fileid;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	
	
	
}
