package com.handicap.control;



import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.handicap.model.beans.UserBean;
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
												 @RequestParam String passwd){
		  /*if(userid !=equals(userid) &&  passwd != equals(passwd){ // DB안에 아이디가 없을시
		       alert("회원정보가 없거나 일치하지 않습니다.");
		       return false
		  }
		  return true; // 맞을시 트루 반환
		 */
		
		return false;
	}
	@RequestMapping("/logout") //로그아웃 했을때
	public boolean logout(){
		//버튼이 클릭시 로그아웃 실행
		//메인홈페이지로 이동
		return false; 
	}
	
	@RequestMapping("/idcheck" ) //중복확인 (아이디)
	public boolean idcheck(@RequestParam String userid ){	
		/*if(받은 아이디를 비교)){
			return true; //  DB안에 동일한 아이디가 없으면 true
		}*/
        return false; // 틀리면 false

		}

	
	@RequestMapping("/nickcheck") //중복확인 (닉네임)
	public boolean nickcheck(@RequestParam String nickname){
		/*if(받은닉네임를 비교)){
		return true; // DB안에 동일한 닉네임이 없으면 true
	}*/
    return false; // 있으면 false

		
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