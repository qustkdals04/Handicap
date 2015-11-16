package com.handicap.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.BbsCommentVO;
import com.handicap.model.beans.MessageVO;
import com.handicap.model.beans.RowNumVO;
import com.handicap.model.beans.UserVO;
import com.handicap.model.beans.ZipcodeVO;
import com.handicap.model.dao.BbsCommentDAO;
import com.handicap.model.dao.BbsDAO;
import com.handicap.model.dao.MessageDAO;
import com.handicap.model.dao.SearchDAO;
import com.handicap.model.dao.UserDAO;
import com.handicap.model.dao.ZipcodeDAO;

@Controller
public class MyController {
	@Autowired
	private UserDAO dao;
	@Autowired
	private BbsDAO bd;
	@Autowired
	private BbsCommentDAO bcd;	
	@Autowired
	private MessageDAO md;
	@Autowired
	private ZipcodeDAO zd;
	@Autowired
	private SearchDAO sd;

	
	//옛날메인
	@RequestMapping("/oldmain")
	public String main2(){
		return "main2";
	}
	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET) // 두번째main페이지
	public String main() {
		return "viewmain";
	}
	
	//검색
	@RequestMapping("/search")
	public String search(@RequestParam String category, @RequestParam String keyword, Model model){
		List<BbsVO> list = null;
		if(category.equals("제목")){
			System.out.println(category);			
			list = sd.searchTitle(keyword);				
		} else if(category.equals("내용")){
			System.out.println(category);
			list = sd.searchContents(keyword);
			
		} else if(category.equals("작성자")){
			String keyword2 = dao.findId(keyword);
			list = sd.searchAuthor(keyword2);
		} else { //제목+내용
			System.out.println(category);
			list = sd.searchTotal(keyword);
		}
		model.addAttribute("searchResult", keyword);
		model.addAttribute("list", list);
		return "search";
	}
	
//소식 - 뉴스
@RequestMapping("/News") 
public String News() {
	return "new/NewForm";
}
//소식 - 사이트소개
@RequestMapping("/Introduce") 
public String Introduce() {
	return "new/IntroduceForm";
}
//일자리 정보
@RequestMapping("/JOB") 
public String JOB() {
	return "job/JobForm";
}

//장애인복지법
@RequestMapping("/handicaplaw") 
public String handicaplaw(){
	return "Law/HandicapForm";
}

//장애인복지법
@RequestMapping("/handicaplaw2") 
public String handicaplaw2(){
	return "handicaplaw";
}

//의료장비
@RequestMapping("/trade") 
public String trade(){
	return "equipmen/BuySellForm";
}

//질문답변
@RequestMapping("/question") 
public String question(){
	return "equipmen/QuestionForm";
}

//사용후기
@RequestMapping("/review") 
public String review(){
	return "equipmen/ReviewForm";
}

//게시판 - 신체장애
@RequestMapping("/body") 
public String body(){
	return "bbs/BodyForm";
}


//게시판 - 정신적장애
@RequestMapping("/Mental") 
public String Mental(){
	return "bbs/MentalForm";
}

//게시판 - 동호회
@RequestMapping("/Club") 
public String Club(){
	return "bbs/ClubForm";
}

//게시판 - 여행
@RequestMapping("/travel") 
public String travel(){
	return "bbs/TravelForm";
}

//고객센터 - Q&A
@RequestMapping("/QnA") 
public String QnA(){
	return "service/QuestionForm2";
}

//고객센터 - 게시판요청
@RequestMapping("/request") 
public String request(){
	return "service/RequestForm";
}

//회원가입 - 종류
@RequestMapping("/retype") 
public String retype(){
	return "member/registerFormSelect";
}
//소식 - 사이트소개	
@RequestMapping("/about") 
public String about(){
	return "bbs/About";
}
}