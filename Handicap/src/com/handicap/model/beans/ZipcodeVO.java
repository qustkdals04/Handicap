package com.handicap.model.beans;

public class ZipcodeVO {
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;
	private int seq;
	
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}	
}

/*맞다 깜빡한거 너 zipcode 테이블 바꿔야됨 일단 주소 데이터들 싸그리 지워버리고
seq 칼럼을 varchar(2) -> number, primary key, 시퀀스 설정 한다음에
그 엑셀파일에서 처음에 경두가 말한것처럼 seq칼럼 지워버린다음에 import 하면 됨
그럼 알아서 seq에 숫자 들어간다 순서대로*/