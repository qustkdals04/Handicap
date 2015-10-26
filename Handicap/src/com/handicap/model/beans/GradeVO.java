package com.handicap.model.beans;

public class GradeVO {

	/*
	 회원등급 – usergrade - number
	등급종류 – gradeinfo – varchar2(10)
	 */
	private int usergrade;
	private String gradeinfo;
	
	public int getUsergrade() {
		return usergrade;
	}
	public void setUsergrade(int usergrade) {
		this.usergrade = usergrade;
	}
	public String getGradeinfo() {
		return gradeinfo;
	}
	public void setGradeinfo(String gradeinfo) {
		this.gradeinfo = gradeinfo;
	}
}
