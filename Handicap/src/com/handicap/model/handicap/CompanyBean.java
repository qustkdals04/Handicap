package com.handicap.model.handicap;

public class CompanyBean {

	/*
	 아이디-userid-varchar2(13)
	패스워드-passwd-varchar2(20)
	사업자등록번호-companyno-number(10)
	회사명-companyname-varchar2(50)
	대표자명-companyceoname-varchar2(10)
	주소-companyaddr-varchar2(50)
	업종-companytype-varchar2(10)
	담당자-staff-varchar2(10)
	담당자핸드폰번호-staffphone-number(11)
	이메일-email-varchar2(30)

	 */
	
	private String userid;
	private String passwd;
	private int companyno;
	private String companyname;
	private String companyceoname;
	private String companyaddr;
	private String companytype;
	private String staff;
	private int staffphone;
	private String email;
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
	public int getCompanyno() {
		return companyno;
	}
	public void setCompanyno(int companyno) {
		this.companyno = companyno;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCompanyceoname() {
		return companyceoname;
	}
	public void setCompanyceoname(String companyceoname) {
		this.companyceoname = companyceoname;
	}
	public String getCompanyaddr() {
		return companyaddr;
	}
	public void setCompanyaddr(String companyaddr) {
		this.companyaddr = companyaddr;
	}
	public String getCompanytype() {
		return companytype;
	}
	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public int getStaffphone() {
		return staffphone;
	}
	public void setStaffphone(int staffphone) {
		this.staffphone = staffphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
