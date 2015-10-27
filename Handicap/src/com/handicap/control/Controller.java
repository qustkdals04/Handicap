package com.handicap.control;

import java.sql.SQLException;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.MessageVO;
import com.handicap.model.dao.BbsDAO;
import com.handicap.model.dao.MessageDAO;
import com.handicap.model.dao.UserDAO;

public class Controller {
	UserDAO dao;
	//공지사항
	private BbsDAO bd;	
	
	//회원관련
	
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
	
	//게시판관련	
	// 공지사항	
	// 공지사항 Input_Form
	@RequestMapping("/noticeinputForm")
	public String noticenputForm() {
		return "noticeinput_form";
	}

	// 공지사항 insert
	@RequestMapping("/noticeinsert")
	public String noticeinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", "공지사항 게시글이 올라갔습니다.");
				return "noticeresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:noticenput";
	}

	// List
	@RequestMapping("noticelist")
	public String noticelist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 11) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("noticelist", list);

		}
		return "noticelist";
	}

	// 수정 폼
	@RequestMapping("noticeupdateform")
	public String noticeupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "noticeupdate";
	}

	// 수정
	@RequestMapping("noticeupdate")
	public String noticeinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/noticelist";
		else
			return "noticeupdateform";
	}
	// 삭제

	@RequestMapping("noticedeleteform")
	public String noticedeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "noticedeleteform";
	}

	@RequestMapping("noticedelete")
	public String noticedelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/noticelist";
		else
			return "noticedeleteform";
	}

	// 공지사항 끝

	// 뉴스

	// 뉴스 Input_Form

	@RequestMapping("/newsinputForm")
	public String newsinputForm() {
		return "newsinput_form";
	}

	// 뉴스 insert
	@RequestMapping("/newsinsert")
	public String newsinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "newsresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:newsinput";
	}

	// 뉴스 List
	@RequestMapping("newslist")
	public String newslist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("newslist", list);

		}
		return "newslist";
	}

	// 뉴스 수정 폼
	@RequestMapping("newsupdateform")
	public String newsupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "newsupdate";
	}

	// 수정
	@RequestMapping("newsupdate")
	public String newsinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/newslist";
		else
			return "newsupdateform";
	}
	// 삭제

	@RequestMapping("newsdeleteform")
	public String newsdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "newsdeleteform";
	}

	@RequestMapping("newsdelete")
	public String newsdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/newslist";
		else
			return "newsdeleteform";
	}

	// 뉴스 끝

	// 일자리 정보
	// Input_Form

	@RequestMapping("/jobinputForm")
	public String jobinputForm() {
		return "jobinput_form";
	}

	// 일자리정보 insert
	@RequestMapping("/jobinsert")
	public String jobinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "jobresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jobinput";
	}

	// 일자리정보 List
	@RequestMapping("joblist")
	public String joblist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("joblist", list);

		}
		return "joblist";
	}

	// 뉴스 수정 폼
	@RequestMapping("jobupdateform")
	public String jobupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "jobupdate";
	}

	// 수정
	@RequestMapping("jobupdate")
	public String jobinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/joblist";
		else
			return "jobupdateform";
	}
	// 삭제

	@RequestMapping("jobdeleteform")
	public String jobdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "jobdeleteform";
	}

	@RequestMapping("jobdelete")
	public String jobdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/joblist";
		else
			return "jobdeleteform";
	}

	// 일자리정보 끝

	// 의료-거래
	// Input_Form

	@RequestMapping("/tradeinputForm")
	public String tradeinputForm() {
		return "tradeinput_form";
	}

	// 의료-거래 insert
	@RequestMapping("/tradeinsert")
	public String tradeinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "traderesult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:tradeinput";
	}

	// 의료-거래 List
	@RequestMapping("tradelist")
	public String tradelist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("tradelist", list);

		}
		return "tradelist";
	}

	// 의료-거래 수정 폼
	@RequestMapping("tradeupdateform")
	public String tradeupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "tradeupdate";
	}

	// 수정
	@RequestMapping("tradeupdate")
	public String tradeinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/tradelist";
		else
			return "tradeupdateform";
	}
	// 삭제

	@RequestMapping("tradedeleteform")
	public String tradedeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "tradedeleteform";
	}

	@RequestMapping("tradedelete")
	public String tradedelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/tradelist";
		else
			return "tradedeleteform";
	}

	// 의료-거래 끝

	// 의료-질문
	// Input_Form

	@RequestMapping("/questioninputForm")
	public String questioninputForm() {
		return "questioninput_form";
	}

	// 의료-질문 insert
	@RequestMapping("/questioninsert")
	public String questioninsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "questionresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:questioninput";
	}

	// 의료-질문 List
	@RequestMapping("questionlist")
	public String questionlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("questionlist", list);

		}
		return "questionlist";
	}

	// 의료-질문 수정 폼
	@RequestMapping("questionupdateform")
	public String questionupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "questionupdate";
	}

	// 수정
	@RequestMapping("questionupdate")
	public String questioninsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/questionlist";
		else
			return "questionupdateform";
	}
	// 삭제

	@RequestMapping("questiondeleteform")
	public String questiondeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "questiondeleteform";
	}

	@RequestMapping("questiondelete")
	public String questiondelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/questionlist";
		else
			return "questiondeleteform";
	}

	// 의료-질문 끝

	// 의료-후기
	// Input_Form

	@RequestMapping("/reviewinputForm")
	public String reviewinputForm() {
		return "reviewinput_form";
	}

	// 의료-거래 insert
	@RequestMapping("/reviewinsert")
	public String reviewinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "reviewresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:reviewinput";
	}

	// 의료-후기 List
	@RequestMapping("reviewlist")
	public String reviewlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("reviewlist", list);

		}
		return "reviewlist";
	}

	// 의료-후기 수정 폼
	@RequestMapping("reviewupdateform")
	public String reviewupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "reviewupdate";
	}

	// 수정
	@RequestMapping("reviewupdate")
	public String reviewinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/reviewlist";
		else
			return "reviewupdateform";
	}
	// 삭제

	@RequestMapping("reviewdeleteform")
	public String reviewdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "reviewdeleteform";
	}

	@RequestMapping("reviewdelete")
	public String reviewdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/reviewlist";
		else
			return "reviewdeleteform";
	}

	// 의료-후기 끝

	// 게시판-신체장애
	// Input_Form

	@RequestMapping("/bodyinputForm")
	public String bodyinputForm() {
		return "bodyinput_form";
	}

	// 게시판-신체장애 insert
	@RequestMapping("/bodyinsert")
	public String bodyinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "bodyresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bodyinput";
	}

	// 게시판-신체장애 List
	@RequestMapping("bodylist")
	public String bodylist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bodylist", list);

		}
		return "bodylist";
	}

	// 게시판-신체장애 수정 폼
	@RequestMapping("bodyupdateform")
	public String bodyupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bodyupdate";
	}

	// 수정
	@RequestMapping("bodyupdate")
	public String bodyinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bodylist";
		else
			return "bodyupdateform";
	}
	// 삭제

	@RequestMapping("bodydeleteform")
	public String bodydeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bodydeleteform";
	}

	@RequestMapping("bodydelete")
	public String bodydelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bodylist";
		else
			return "bodydeleteform";
	}

	// 게시판-신체장애 끝

	// 게시판-정신장애
	// Input_Form

	@RequestMapping("/mentalinputForm")
	public String mentalinputForm() {
		return "mentalinput_form";
	}

	// 게시판-정신장애 insert
	@RequestMapping("/mentalinsert")
	public String mentalinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "mentalresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:mentalinput";
	}

	// 게시판-정신장애 List
	@RequestMapping("mentallist")
	public String mentallist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("mentallist", list);

		}
		return "mentallist";
	}

	// 게시판-정신장애 수정 폼
	@RequestMapping("mentalupdateform")
	public String mentalupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "mentalupdate";
	}

	// 수정
	@RequestMapping("mentalupdate")
	public String mentalinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/mentallist";
		else
			return "mentalupdateform";
	}
	// 삭제

	@RequestMapping("mentaldeleteform")
	public String mentaldeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "mentaldeleteform";
	}

	@RequestMapping("mentaldelete")
	public String mentaldelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/mentallist";
		else
			return "mentaldeleteform";
	}

	// 게시판-정신장애 끝

	// 게시판-동호회
	// Input_Form

	@RequestMapping("/clubinputForm")
	public String clubinputForm() {
		return "clubinput_form";
	}

	// 게시판-동호회 insert
	@RequestMapping("/clubinsert")
	public String clubinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "clubresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:clubinput";
	}

	// 게시판-동호회 List
	@RequestMapping("clublist")
	public String clublist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("clublist", list);

		}
		return "clublist";
	}

	// 게시판-동호회 수정 폼
	@RequestMapping("clubupdateform")
	public String clubupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "clubupdate";
	}

	// 수정
	@RequestMapping("clubupdate")
	public String clubinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/clublist";
		else
			return "clubupdateform";
	}
	// 삭제

	@RequestMapping("clubdeleteform")
	public String clubdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "clubdeleteform";
	}

	@RequestMapping("clubdelete")
	public String clubdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/clublist";
		else
			return "clubdeleteform";
	}

	// 게시판-동호회 끝

	// 게시판-여행
	// Input_Form

	@RequestMapping("/travelinputForm")
	public String travelinputForm() {
		return "travelinput_form";
	}

	// 게시판-여행 insert
	@RequestMapping("/travelinsert")
	public String travelinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "travelresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:travelinput";
	}

	// 게시판-여행 List
	@RequestMapping("travellist")
	public String travellist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("travellist", list);

		}
		return "travellist";
	}

	// 게시판-여행 수정 폼
	@RequestMapping("travelupdateform")
	public String travelupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "travelupdate";
	}

	// 수정
	@RequestMapping("travelupdate")
	public String travelinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/travellist";
		else
			return "travelupdateform";
	}
	// 삭제

	@RequestMapping("traveldeleteform")
	public String traveldeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "traveldeleteform";
	}

	@RequestMapping("traveldelete")
	public String traveldelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/travellist";
		else
			return "traveldeleteform";
	}

	// 게시판-여행 끝

	// 고객센터-Q&A
	// Input_Form

	@RequestMapping("/qnainputForm")
	public String qnainputForm() {
		return "qnainput_form";
	}

	// 고객센터-Q&A insert
	@RequestMapping("/qnainsert")
	public String qnainsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "qnaresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:qnainput";
	}

	// 고객센터-Q&A List
	@RequestMapping("qnalist")
	public String qnalist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("qnalist", list);

		}
		return "qnalist";
	}

	// 고객센터-Q&A 수정 폼
	@RequestMapping("qnaupdateform")
	public String qnaupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "qnaupdate";
	}

	// 수정
	@RequestMapping("qnaupdate")
	public String qnainsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/qnalist";
		else
			return "qnaupdateform";
	}
	// 삭제

	@RequestMapping("qnadeleteform")
	public String qnadeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "qnadeleteform";
	}

	@RequestMapping("qnadelete")
	public String qnadelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/qnalist";
		else
			return "qnadeleteform";
	}

	// 고객센터-Q&A 끝

	// 고객센터-게시판 요청
	// Input_Form

	@RequestMapping("/bbsrequestinputForm")
	public String bbsrequestinputForm() {
		return "bbsrequestinput_form";
	}

	// 고객센터-게시판 요청 insert
	@RequestMapping("/bbsrequestinsert")
	public String bbsrequestinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "bbsrequestresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bbsrequestinput";
	}

	// 고객센터-게시판 요청 List
	@RequestMapping("bbsrequestlist")
	public String bbsrequestlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bbsrequestlist", list);

		}
		return "bbsrequestlist";
	}

	// 고객센터-게시판 요청 수정 폼
	@RequestMapping("bbsrequestupdateform")
	public String bbsrequestupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bbsrequestupdate";
	}

	// 수정
	@RequestMapping("bbsrequestupdate")
	public String bbsrequestinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bbsrequestlist";
		else
			return "bbsrequestupdateform";
	}
	// 삭제

	@RequestMapping("bbsrequestdeleteform")
	public String bbsrequestdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bbsrequestdeleteform";
	}

	@RequestMapping("bbsrequestdelete")
	public String bbsrequestdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bbsrequestlist";
		else
			return "bbsrequestdeleteform";
	}

	// 고객센터-게시판 요청 끝

	// 공지사항 리플

	// 공지사항 리플 Input_Form

	@RequestMapping("/noticecommentinputForm")
	public String noticecommentnputForm() {
		return "noticecommentinput_form";
	}

	// 공지사항 리플 insert
	@RequestMapping("/noticecommentinsert")
	public String noticecommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", "공지사항 리플 게시글이 올라갔습니다.");
				return "noticecommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:noticecommentnput";
	}

	// List
	@RequestMapping("noticecommentlist")
	public String noticecommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 11) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("noticecommentlist", list);

		}
		return "noticecommentlist";
	}

	// 수정 폼
	@RequestMapping("noticecommentupdateform")
	public String noticecommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "noticecommentupdate";
	}

	// 수정
	@RequestMapping("noticecommentupdate")
	public String noticecommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/noticecommentlist";
		else
			return "noticecommentupdateform";
	}
	// 삭제

	@RequestMapping("noticecommentdeleteform")
	public String noticecommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "noticecommentdeleteform";
	}

	@RequestMapping("noticecommentdelete")
	public String noticecommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/noticecommentlist";
		else
			return "noticecommentdeleteform";
	}

	// 공지사항 리플 끝

	// 뉴스 리플

	// 뉴스 리플 Input_Form

	@RequestMapping("/newscommentinputForm")
	public String newscommentinputForm() {
		return "newscommentinput_form";
	}

	// 뉴스 리플 insert
	@RequestMapping("/newscommentinsert")
	public String newscommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 리플 올라갔습니다.");
				return "newscommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:newscommentinput";
	}

	// 뉴스 리플 List
	@RequestMapping("newscommentlist")
	public String newscommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("newscommentlist", list);

		}
		return "newscommentlist";
	}

	// 뉴스 리플 수정 폼
	@RequestMapping("newscommentupdateform")
	public String newscommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "newscommentupdate";
	}

	// 수정
	@RequestMapping("newscommentupdate")
	public String newscommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/newscommentlist";
		else
			return "newscommentupdateform";
	}
	// 삭제

	@RequestMapping("newscommentdeleteform")
	public String newscommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "newscommentdeleteform";
	}

	@RequestMapping("newscommentdelete")
	public String newscommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/newscommentlist";
		else
			return "newscommentdeleteform";
	}

	// 뉴스 리플 끝

	// 일자리 정보 리플
	// Input_Form

	@RequestMapping("/jobcommentinputForm")
	public String jobcommentinputForm() {
		return "jobcommentinput_form";
	}

	// 일자리정보 insert
	@RequestMapping("/jobcommentinsert")
	public String jobcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "jobcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jobcommentinput";
	}

	// 일자리정보 List
	@RequestMapping("jobcommentlist")
	public String jobcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("jobcommentlist", list);

		}
		return "jobcommentlist";
	}

	// 일자리정보 수정 폼
	@RequestMapping("jobcommentupdateform")
	public String jobcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "jobcommentupdate";
	}

	// 수정
	@RequestMapping("jobcommentupdate")
	public String jobcommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/jobcommentlist";
		else
			return "jobcommentupdateform";
	}
	// 삭제

	@RequestMapping("jobcommentdeleteform")
	public String jobcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "jobcommentdeleteform";
	}

	@RequestMapping("jobcommentdelete")
	public String jobcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/jobcommentlist";
		else
			return "jobcommentdeleteform";
	}

	// 일자리정보 끝

	// 의료-거래 리플
	// Input_Form

	@RequestMapping("/tradecommentinputForm")
	public String tradecommentinputForm() {
		return "tradecommentinput_form";
	}

	// 의료-거래 리플 insert
	@RequestMapping("/tradecommentinsert")
	public String tradecommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "tradecommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:tradecommentinput";
	}

	// 의료-거래 리플 List
	@RequestMapping("tradecommentlist")
	public String tradecommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("tradecommentlist", list);

		}
		return "tradecommentlist";
	}

	// 의료-거래 리플 수정 폼
	@RequestMapping("tradecommentupdateform")
	public String tradecommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "tradecommentupdate";
	}

	// 수정
	@RequestMapping("tradecommentupdate")
	public String tradecommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/tradecommentlist";
		else
			return "tradecommentupdateform";
	}
	// 삭제

	@RequestMapping("tradecommentdeleteform")
	public String tradecommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "tradecommentdeleteform";
	}

	@RequestMapping("tradecommentdelete")
	public String tradecommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/tradecommentlist";
		else
			return "tradecommentdeleteform";
	}

	// 의료-거래 리플 끝

	// 의료-질문리플
	// Input_Form

	@RequestMapping("/questioncommentinputForm")
	public String questioncommentinputForm() {
		return "questioncommentinput_form";
	}

	// 의료-질문리플 insert
	@RequestMapping("/questioncommentinsert")
	public String questioncommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "questioncommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:questioncommentinput";
	}

	// 의료-질문리플 List
	@RequestMapping("questioncommentlist")
	public String questioncommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("questioncommentlist", list);

		}
		return "questioncommentlist";
	}

	// 의료-질문리플 수정 폼
	@RequestMapping("questioncommentupdateform")
	public String questioncommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "questioncommentupdate";
	}

	// 수정
	@RequestMapping("questioncommentupdate")
	public String questioncommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/questioncommentlist";
		else
			return "questioncommentupdateform";
	}
	// 삭제

	@RequestMapping("questioncommentdeleteform")
	public String questioncommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "questioncommentdeleteform";
	}

	@RequestMapping("questioncommentdelete")
	public String questioncommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/questioncommentlist";
		else
			return "questioncommentdeleteform";
	}

	// 의료-질문리플 끝

	// 의료-후기 리플
	// Input_Form

	@RequestMapping("/reviewcommentinputForm")
	public String reviewcommentinputForm() {
		return "reviewcommentinput_form";
	}

	// 의료-거래 insert
	@RequestMapping("/reviewcommentinsert")
	public String reviewcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "reviewcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:reviewcommentinput";
	}

	// 의료-후기 리플 List
	@RequestMapping("reviewcommentlist")
	public String reviewcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("reviewcommentlist", list);

		}
		return "reviewcommentlist";
	}

	// 의료-후기 리플 수정 폼
	@RequestMapping("reviewcommentupdateform")
	public String reviewcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "reviewcommentupdate";
	}

	// 수정
	@RequestMapping("reviewcommentupdate")
	public String reviewcommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/reviewcommentlist";
		else
			return "reviewcommentupdateform";
	}
	// 삭제

	@RequestMapping("reviewcommentdeleteform")
	public String reviewcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "reviewcommentdeleteform";
	}

	@RequestMapping("reviewcommentdelete")
	public String reviewcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/reviewcommentlist";
		else
			return "reviewcommentdeleteform";
	}

	// 의료-후기 리플 끝

	// 게시판-신체장애 리플
	// Input_Form

	@RequestMapping("/bodycommentinputForm")
	public String bodycommentinputForm() {
		return "bodycommentinput_form";
	}

	// 게시판-신체장애 리플 insert
	@RequestMapping("/bodycommentinsert")
	public String bodycommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "bodycommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bodycommentinput";
	}

	// 게시판-신체장애 리플 List
	@RequestMapping("bodycommentlist")
	public String bodycommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bodycommentlist", list);

		}
		return "bodycommentlist";
	}

	// 게시판-신체장애 리플 수정 폼
	@RequestMapping("bodycommentupdateform")
	public String bodycommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bodycommentupdate";
	}

	// 수정
	@RequestMapping("bodycommentupdate")
	public String bodycommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bodycommentlist";
		else
			return "bodycommentupdateform";
	}
	// 삭제

	@RequestMapping("bodycommentdeleteform")
	public String bodycommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bodycommentdeleteform";
	}

	@RequestMapping("bodycommentdelete")
	public String bodycommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bodycommentlist";
		else
			return "bodycommentdeleteform";
	}

	// 게시판-신체장애 리플 끝

	// 게시판-정신장애 리플
	// Input_Form

	@RequestMapping("/headinputForm")
	public String headinputForm() {
		return "headinput_form";
	}

	// 게시판-정신장애 리플 insert
	@RequestMapping("/mentalcommentinsert")
	public String mentalcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "mentalcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:mentalcommentinput";
	}

	// 게시판-정신장애 리플 List
	@RequestMapping("mentalcommentlist")
	public String mentalcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("mentalcommentlist", list);

		}
		return "mentalcommentlist";
	}

	// 게시판-정신장애 리플 수정 폼
	@RequestMapping("mentalcommentupdateform")
	public String mentalcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "mentalcommentupdate";
	}

	// 수정
	@RequestMapping("mentalcommentupdate")
	public String mentalcommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/mentalcommentlist";
		else
			return "mentalcommentupdateform";
	}
	// 삭제

	@RequestMapping("mentalcommentdeleteform")
	public String mentalcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "mentalcommentdeleteform";
	}

	@RequestMapping("mentalcommentdelete")
	public String mentalcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/mentalcommentlist";
		else
			return "mentalcommentdeleteform";
	}

	// 게시판-정신장애 리플 끝

	// 게시판-동호회 리플
	// Input_Form

	@RequestMapping("/clubcommentinputForm")
	public String clubcommentinputForm() {
		return "clubcommentinput_form";
	}

	// 게시판-동호회 리플 insert
	@RequestMapping("/clubcommentinsert")
	public String clubcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "clubcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:clubcommentinput";
	}

	// 게시판-동호회 리플 List
	@RequestMapping("clubcommentlist")
	public String clubcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("clubcommentlist", list);

		}
		return "clubcommentlist";
	}

	// 게시판-동호회 리플 수정 폼
	@RequestMapping("clubcommentupdateform")
	public String clubcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "clubcommentupdate";
	}

	// 수정
	@RequestMapping("clubcommentupdate")
	public String clubcommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/clubcommentlist";
		else
			return "clubcommentupdateform";
	}
	// 삭제

	@RequestMapping("clubcommentdeleteform")
	public String clubcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "clubcommentdeleteform";
	}

	@RequestMapping("clubcommentdelete")
	public String clubcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/clubcommentlist";
		else
			return "clubcommentdeleteform";
	}

	// 게시판-동호회 리플 끝

	// 게시판-여행 리플
	// Input_Form

	@RequestMapping("/travelcommentinputForm")
	public String travelcommentinputForm() {
		return "travelcommentinput_form";
	}

	// 게시판-여행 리플 insert
	@RequestMapping("/travelcommentinsert")
	public String travelcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "travelcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:travelcommentinput";
	}

	// 게시판-여행 리플 List
	@RequestMapping("travelcommentlist")
	public String travelcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("travelcommentlist", list);

		}
		return "travelcommentlist";
	}

	// 게시판-여행 리플 수정 폼
	@RequestMapping("travelcommentupdateform")
	public String travelcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "travelcommentupdate";
	}

	// 수정
	@RequestMapping("travelcommentupdate")
	public String travelcommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/travelcommentlist";
		else
			return "travelcommentupdateform";
	}
	// 삭제

	@RequestMapping("travelcommentdeleteform")
	public String travelcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "travelcommentdeleteform";
	}

	@RequestMapping("travelcommentdelete")
	public String travelcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/travelcommentlist";
		else
			return "travelcommentdeleteform";
	}

	// 게시판-여행 리플 끝

	// 고객센터-Q&A리플
	// Input_Form

	@RequestMapping("/qnacommentinputForm")
	public String qnacommentinputForm() {
		return "qnacommentinput_form";
	}

	// 고객센터-Q&A리플 insert
	@RequestMapping("/qnacommentinsert")
	public String qnacommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "qnacommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:qnacommentinput";
	}

	// 고객센터-Q&A리플 List
	@RequestMapping("qnacommentlist")
	public String qnacommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("qnacommentlist", list);

		}
		return "qnacommentlist";
	}

	// 고객센터-Q&A리플 수정 폼
	@RequestMapping("qnacommentupdateform")
	public String qnacommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "qnacommentupdate";
	}

	// 수정
	@RequestMapping("qnacommentupdate")
	public String qnacommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/qnacommentlist";
		else
			return "qnacommentupdateform";
	}
	// 삭제

	@RequestMapping("qnacommentdeleteform")
	public String qnacommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "qnacommentdeleteform";
	}

	@RequestMapping("qnacommentdelete")
	public String qnacommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/qnacommentlist";
		else
			return "qnacommentdeleteform";
	}

	// 고객센터-Q&A리플 끝

	// 고객센터-게시판 요청 리플
	// Input_Form

	@RequestMapping("/bbsrequestcommentinputForm")
	public String bbsrequestcommentinputForm() {
		return "bbsrequestcommentinput_form";
	}

	// 고객센터-게시판 요청 리플 insert
	@RequestMapping("/bbsrequestcommentinsert")
	public String bbsrequestcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " 뉴스 올라갔습니다.");
				return "bbsrequestcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bbsrequestcommentinput";
	}

	// 고객센터-게시판 요청 리플 List
	@RequestMapping("bbsrequestcommentlist")
	public String bbsrequestcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bbsrequestcommentlist", list);

		}
		return "bbsrequestcommentlist";
	}

	// 고객센터-게시판 요청 리플 수정 폼
	@RequestMapping("bbsrequestcommentupdateform")
	public String bbsrequestcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bbsrequestcommentupdate";
	}

	// 수정
	@RequestMapping("bbsrequestcommentupdate")
	public String bbsrequestcommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bbsrequestcommentlist";
		else
			return "bbsrequestcommentupdateform";
	}
	// 삭제

	@RequestMapping("bbsrequestcommentdeleteform")
	public String bbsrequestcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("BbsVO", bd.select(no, boardno));
		return "bbsrequestcommentdeleteform";
	}

	@RequestMapping("bbsrequestcommentdelete")
	public String bbsrequestcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bbsrequestcommentlist";
		else
			return "bbsrequestcommentdeleteform";
	}
  
	
	// 고객센터-게시판 요청 리플 끝
	
	private MessageDAO mv;
	// 메신저
	
	//메신저 작성
	
	// Input_Form

		@RequestMapping("messageinputForm")
		public String messageInputForm()  {
			return "messageinput_form";
		}

	// Insert
		@RequestMapping("/messageinsert")
		public String messageinsert(Model m, MessageVO mvo) {

			try {
				if (mv.insert(mvo)) {
					m.addAttribute("msg", " 전송 성공.");
					return "messageresult";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:messagetinput";
		}
		
	// 목록
		
		@RequestMapping("messagelist")
		public String messagelist(@RequestParam  String recipient, Model model) {

				
				List<MessageVO> list = mv.selectAll(recipient);
				model.addAttribute("messagelist", list);
				
			
			return "messagelist";
		}
	// 삭제
		
		@RequestMapping("messagedeleteform")
		public String messagedeleteForm(@RequestParam int messageno, Model model) {
			model.addAttribute("messageVO", mv.select(messageno));
			return "messagedeleteform";
		}
		

	//Message 끝
		

}