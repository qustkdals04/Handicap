package com.handicap.model.handicap;

public class MemberBean {

	/*
	 아이디-userid-varchar2(13)
	패스워드-passwd-varchar2(20)
	이름-username-varchar2(10)
	닉네임-nickname-varchar2(20)
	핸드폰-phonenumber-number(11)
	이메일-email-varchar2(30)
	비밀번호 찾기 질문/답
	pquestion varchar2(20)/panswer varchar2(20)
	회원등급-usergrade-number(1)
	 */
	
	
	private String userid;
	private String passwd;
	private String username;
	private String nickname;
	private int phonenumber;
	private String email;
	private String pquestion;
	private String panswer;
	private int usergrade;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(int phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPquestion() {
		return pquestion;
	}
	public void setPquestion(String pquestion) {
		this.pquestion = pquestion;
	}
	public String getPanswer() {
		return panswer;
	}
	public void setPanswer(String panswer) {
		this.panswer = panswer;
	}
	public int getUsergrade() {
		return usergrade;
	}
	public void setUsergrade(int usergrade) {
		this.usergrade = usergrade;
	}
	
	
	
}
