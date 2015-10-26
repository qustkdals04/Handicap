package com.handicap.model.handicap;

public class BbsJobBean {

	/*
	 글번호 – no - number
	카테고리 – category - varchar2(10)
	글제목 – title – varchar2(50)
	글쓴날짜 – date - date
	글쓴이 – author - varchar2(20)
	글내용 – content - varchar2(2000)
	조회수 – hits - number
	추천수 - good - number
	신고수 - bad - number
	파일 – fileid  - number
	지역 - region - varchar2(10)
	 */
	
	private int no;
	private String category;
	private String title;
	private String date;
	private String author;
	private String content;
	private int hits;
	private int good;
	private int bad;
	private int fileid;
	private String region;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	
	
}
