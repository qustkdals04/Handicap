package com.handicap.model.beans;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {

	/*
	 파일 – fileid - number
	파일명 – filename - varchar2(20)
	파일사이즈 – filesize - number

	 */
	private int no;
	private int boardno;
	private int fileid;
	private String filename;
	private List<MultipartFile> files;
	private String fileoriginal;
	
	
	
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
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getFileoriginal() {
		return fileoriginal;
	}
	public void setFileoriginal(String fileoriginal) {
		this.fileoriginal = fileoriginal;
	}
	
	
}
