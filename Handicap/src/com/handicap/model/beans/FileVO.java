package com.handicap.model.beans;

public class FileVO {

	/*
	 파일 – fileid - number
	파일명 – filename - varchar2(20)
	파일사이즈 – filesize - number

	 */
	private int fileid;
	private String filename;
	private int filesize;
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
}
