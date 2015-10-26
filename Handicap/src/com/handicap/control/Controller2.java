package com.handicap.control;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.handicap.model.dao.UserDAO;



public class Controller2  {
	UserDAO dao;
		
	@RequestMapping("/register") //회원가입정보 얻어오기
	public boolean register(@RequestParam String userid,
													 	@RequestParam String passwd,
													 	@RequestParam String name,
													 	@RequestParam String nickname,
														@RequestParam int phone,
														@RequestParam String email,
														@RequestParam String pquestion,
														@RequestParam String panswer,
														@RequestParam int usergrade,
														@RequestParam int companyno,
														@RequestParam String companyaddr,
														@RequestParam String companytype){
		//유효성 검사
		return false;
	}
	@RequestMapping("/login") //로그인 처리
	public boolean login(@RequestParam String userid,
												 @RequestParam String passwd
												){
		
		return false;
	}
	@RequestMapping("/logout") //로그아웃 했을때
	public boolean logout(){
		return false;
	}
	
	@RequestMapping("/idcheck") //중복확인 (아이디)
	public boolean idcheck(@RequestParam String userid){
		//있을땐 1 없을땐0  List 형식의 변수에 넣어서 ModelAndView 형태로 나타냄
		return false;
	}
	@RequestMapping("/nickcheck") //중복확인 (닉네임)
	public boolean nickcheck(@RequestParam String nickname){
		//있을땐 1 없을땐0  List 형식의 변수에 넣어서 ModelAndView 형태로 나타냄
		return false;
	}
	
	@RequestMapping("/memberdelete") //회원탈퇴
	public boolean memberdelete(@RequestParam String passwd){
		//비밀번호가 일치시 1 틀리면0  
		return false;
	}
	
	@RequestMapping("/memberupdate") //회원수정
	public boolean memberupdate(@RequestParam String userid,
												 	@RequestParam String passwd,
												 	@RequestParam String name,
												 	@RequestParam String nickname,
													@RequestParam int phone,
													@RequestParam String email,
													@RequestParam String pquestion,
													@RequestParam String panswer,
													@RequestParam int usergrade,
													@RequestParam int companyno,
													@RequestParam String companyaddr,
													@RequestParam String companytype){
		return false;
	}
	
	@RequestMapping("/mypage") //마이페이지
	public boolean mypage(@RequestParam String nickname){
		//닉네임으로 활동내역을 가져오는데 있을시 조회
		return false;
	}
}