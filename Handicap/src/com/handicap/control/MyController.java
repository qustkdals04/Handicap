package com.handicap.control;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.BbsCommentVO;
import com.handicap.model.beans.MessageVO;
import com.handicap.model.dao.BbsCommentDAO;
import com.handicap.model.dao.BbsDAO;
import com.handicap.model.dao.MessageDAO;
import com.handicap.model.dao.UserDAO;

@Controller
public class MyController {
	@Autowired
	UserDAO dao;
	@Autowired
	private BbsDAO bd;
	@Autowired
	private BbsCommentDAO bcd;

	// 메인페이지
	@RequestMapping("/main") // main페이지
	public String main() {
		return "main2";
	}

	// 회원가입
	 //중복체크팝업
    @RequestMapping("/idCheck")
    public String IdCheck(){
       return "member/IdCheck";
    }

	// 회원가입폼띄우기
	@RequestMapping("/registerForm")
	public String register_form() {
		return "member/registerForm";
	}

	// 로그인폼띄우기
	@RequestMapping("/loginForm")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/register") // 회원가입정보 얻어오기
	public boolean register(@RequestParam String userid, @RequestParam String passwd, @RequestParam String name,
			@RequestParam String nickname, @RequestParam int phone, @RequestParam String email,
			@RequestParam String pquestion, @RequestParam String panswer, @RequestParam int usergrade,
			@RequestParam int companyno, @RequestParam String companyaddr, @RequestParam String companytype) {
		// 유효성 검사
		return false;
	}

	@RequestMapping("/memberlogin") // 로그인 처리
	public String login(@RequestParam String userid,
			@RequestParam String passwd,
			HttpSession session,
			Model model) {
		if (dao.findPasswd(userid) != null) {
			if (dao.findPasswd(userid).equals(passwd)) {
				session.setAttribute("memberid", userid);
				return "main2"; // 로그인성공 main페이지로 이동
			} else {

				// model.addAttribute("loginresult", "alert('로그인실패')");
				model.addAttribute("status", "로그인실패");
				return "login/login"; // 로그인실패
			}
		} else {
			model.addAttribute("status", "로그인실패");
			return "login/login";
		}
	}

	@RequestMapping("/logout") // 로그아웃 했을때
	public String logout(HttpSession session) {
		session.invalidate();
		return "main2";
	}

	@RequestMapping("/idCheckAction") //중복확인 (아이디)
	   public String idcheck(@RequestParam String userid, String passwd, HttpSession session){
	      //있을땐 1 없을땐0  List 형식의 변수에 넣어서 ModelAndView 형태로 나타냄
	       if(dao.findPasswd(userid).equals(userid))
	      {
	          session.getAttribute("idcheck");
	         return "registerForm";
	      }
	      else
	      {
	         return "registerForm";
	      }
	   }

	@RequestMapping("/nickcheck") // 중복확인 (닉네임)
	public boolean nickcheck(@RequestParam String nickname) {
		// 있을땐 1 없을땐0 List 형식의 변수에 넣어서 ModelAndView 형태로 나타냄
		return false;
	}
	/*
	 * @RequestMapping("/memberdelete") //회원탈퇴 public boolean
	 * memberdelete(@RequestParam String passwd){ //비밀번호가 일치시 1 틀리면0 return
	 * false; }
	 * 
	 * @RequestMapping("/memberupdate") //회원수정 public boolean
	 * memberupdate(@RequestParam String userid,
	 * 
	 * @RequestParam String passwd,
	 * 
	 * @RequestParam String name,
	 * 
	 * @RequestParam String nickname,
	 * 
	 * @RequestParam int phone,
	 * 
	 * @RequestParam String email,
	 * 
	 * @RequestParam String pquestion,
	 * 
	 * @RequestParam String panswer,
	 * 
	 * @RequestParam int usergrade,
	 * 
	 * @RequestParam int companyno,
	 * 
	 * @RequestParam String companyaddr,
	 * 
	 * @RequestParam String companytype){ return false; }
	 * 
	 * @RequestMapping("/mypage") //마이페이지 public boolean mypage(@RequestParam
	 * String nickname){ //닉네임으로 활동내역을 가져오는데 있을시 조회 return false; }
	 * 
	 * // 회원 끝 // 공지사항 // 공지사항 글쓰기폼
	 * 
	 * @RequestMapping("/noticeinputForm") public String noticenputForm() {
	 * return "noticeinput_form"; }
	 * 
	 * // 공지사항 글쓰기
	 * 
	 * @RequestMapping("/noticeinsert") public String noticeinsert(Model m,
	 * BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "공지사항 게시글이 올라갔습니다.");
	 * return "noticeresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:noticenput"; }
	 * 
	 * // 공지사항 목록
	 * 
	 * @RequestMapping("noticelist") public String noticelist(@RequestParam int
	 * no, int boardno, Model model) {
	 * 
	 * if (boardno == 11) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("noticelist", list);
	 * 
	 * } return "noticelist"; }
	 * 
	 * // 공지사항 글수정 폼
	 * 
	 * @RequestMapping("noticeupdateform") public String
	 * noticeupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "noticeupdate"; }
	 * 
	 * // 공지사항 글수정
	 * 
	 * @RequestMapping("noticeupdate") public String noticeinsert(BbsVO bb)
	 * throws SQLException { if (bd.update(bb)) return "redirect:/noticelist";
	 * else return "noticeupdateform"; }
	 * 
	 * // 공지사항 글삭제 폼
	 * 
	 * @RequestMapping("noticedeleteform") public String
	 * noticedeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "noticedeleteform"; }
	 * 
	 * // 공지사항 글삭제
	 * 
	 * @RequestMapping("noticedelete") public String noticedelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/noticelist"; else return "noticedeleteform"; }
	 * 
	 * // 공지사항 끝
	 * 
	 * // 뉴스 // 뉴스 글쓰기 폼
	 * 
	 * @RequestMapping("/newsinputForm") public String newsinputForm() { return
	 * "newsinput_form"; }
	 * 
	 * // 뉴스 글쓰기
	 * 
	 * @RequestMapping("/newsinsert") public String newsinsert(Model m, BbsVO b)
	 * {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "뉴스 올라갔습니다."); return
	 * "newsresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:newsinput"; }
	 * 
	 * // 뉴스 글목록
	 * 
	 * @RequestMapping("newslist") public String newslist(@RequestParam int no,
	 * int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("newslist", list);
	 * 
	 * } return "newslist"; }
	 * 
	 * // 뉴스 글수정 폼
	 * 
	 * @RequestMapping("newsupdateform") public String
	 * newsupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return "newsupdate";
	 * }
	 * 
	 * // 뉴스 글수정
	 * 
	 * @RequestMapping("newsupdate") public String newsinsert(BbsVO bb) throws
	 * SQLException { if (bd.update(bb)) return "redirect:/newslist"; else
	 * return "newsupdateform"; }
	 * 
	 * // 뉴스 글삭제 폼
	 * 
	 * @RequestMapping("newsdeleteform") public String
	 * newsdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "newsdeleteform"; }
	 * 
	 * // 뉴스 글삭제
	 * 
	 * @RequestMapping("newsdelete") public String newsdelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/newslist"; else return "newsdeleteform"; }
	 * 
	 * // 뉴스 끝
	 * 
	 * // 일자리 정보 // 일자리 정보 글쓰기폼
	 * 
	 * @RequestMapping("/jobinputForm") public String jobinputForm() { return
	 * "jobinput_form"; }
	 * 
	 * // 일자리 정보 글쓰기
	 * 
	 * @RequestMapping("/jobinsert") public String jobinsert(Model m, BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "일자리 정보글 올라감"); return
	 * "jobresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:jobinput"; }
	 * 
	 * // 일자리 정보 글목록
	 * 
	 * @RequestMapping("joblist") public String joblist(@RequestParam int no,
	 * int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("joblist", list);
	 * 
	 * } return "joblist"; }
	 * 
	 * // 일자리 정보 글수정 폼
	 * 
	 * @RequestMapping("jobupdateform") public String
	 * jobupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return "jobupdate";
	 * }
	 * 
	 * // 일자리 정보 글수정
	 * 
	 * @RequestMapping("jobupdate") public String jobinsert(BbsVO bb) throws
	 * SQLException { if (bd.update(bb)) return "redirect:/joblist"; else return
	 * "jobupdateform"; }
	 * 
	 * // 일자리 정보 삭제폼
	 * 
	 * @RequestMapping("jobdeleteform") public String
	 * jobdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "jobdeleteform"; }
	 * 
	 * // 일자리 정보 삭제
	 * 
	 * @RequestMapping("jobdelete") public String jobdelete(int no, int boardno)
	 * throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/joblist"; else return "jobdeleteform"; }
	 * 
	 * // 일자리 정보 끝
	 * 
	 * // 의료-거래 // 의료-거래 글쓰기폼
	 * 
	 * @RequestMapping("/tradeinputForm") public String tradeinputForm() {
	 * return "tradeinput_form"; }
	 * 
	 * // 의료-거래 글쓰기
	 * 
	 * @RequestMapping("/tradeinsert") public String tradeinsert(Model m, BbsVO
	 * b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "의료 거래 글씀"); return
	 * "traderesult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:tradeinput"; }
	 * 
	 * // 의료-거래 글목록
	 * 
	 * @RequestMapping("tradelist") public String tradelist(@RequestParam int
	 * no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("tradelist", list);
	 * 
	 * } return "tradelist"; }
	 * 
	 * // 의료-거래 글수정폼
	 * 
	 * @RequestMapping("tradeupdateform") public String
	 * tradeupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "tradeupdate"; }
	 * 
	 * // 의료-거래 글수정
	 * 
	 * @RequestMapping("tradeupdate") public String tradeinsert(BbsVO bb) throws
	 * SQLException { if (bd.update(bb)) return "redirect:/tradelist"; else
	 * return "tradeupdateform"; }
	 * 
	 * // 의료-거래 글삭제폼
	 * 
	 * @RequestMapping("tradedeleteform") public String
	 * tradedeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "tradedeleteform"; }
	 * 
	 * // 의료-거래 글삭제
	 * 
	 * @RequestMapping("tradedelete") public String tradedelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/tradelist"; else return "tradedeleteform"; }
	 * 
	 * // 의료-거래 끝
	 * 
	 * // 의료-질문 // 의료-질문 글쓰기 포
	 * 
	 * @RequestMapping("/questioninputForm") public String questioninputForm() {
	 * return "questioninput_form"; }
	 * 
	 * // 의료-질문 글쓰기
	 * 
	 * @RequestMapping("/questioninsert") public String questioninsert(Model m,
	 * BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "의료질문글올라감"); return
	 * "questionresult"; } } catch (SQLException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } return "redirect:questioninput"; }
	 * 
	 * // 의료-질문 글목록
	 * 
	 * @RequestMapping("questionlist") public String questionlist(@RequestParam
	 * int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("questionlist", list);
	 * 
	 * } return "questionlist"; }
	 * 
	 * // 의료-질문 글수정폼
	 * 
	 * @RequestMapping("questionupdateform") public String
	 * questionupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "questionupdate"; }
	 * 
	 * // 의료-질문 글수정
	 * 
	 * @RequestMapping("questionupdate") public String questioninsert(BbsVO bb)
	 * throws SQLException { if (bd.update(bb)) return "redirect:/questionlist";
	 * else return "questionupdateform"; }
	 * 
	 * // 의료-질문 글삭제폼
	 * 
	 * @RequestMapping("questiondeleteform") public String
	 * questiondeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "questiondeleteform"; }
	 * 
	 * // 의료-질문 글삭제
	 * 
	 * @RequestMapping("questiondelete") public String questiondelete(int no,
	 * int boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/questionlist"; else return "questiondeleteform"; }
	 * 
	 * // 의료-질문 끝
	 * 
	 * // 의료-후기 // 의료-후기 글쓰기폼
	 * 
	 * @RequestMapping("/reviewinputForm") public String reviewinputForm() {
	 * return "reviewinput_form"; }
	 * 
	 * // 의료-후기 글쓰기
	 * 
	 * @RequestMapping("/reviewinsert") public String reviewinsert(Model m,
	 * BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "의료-후기 글씀"); return
	 * "reviewresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:reviewinput"; }
	 * 
	 * // 의료-후기 글목록
	 * 
	 * @RequestMapping("reviewlist") public String reviewlist(@RequestParam int
	 * no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("reviewlist", list);
	 * 
	 * } return "reviewlist"; }
	 * 
	 * // 의료-후기 글수정폼
	 * 
	 * @RequestMapping("reviewupdateform") public String
	 * reviewupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "reviewupdate"; }
	 * 
	 * // 의료-후기 글수정
	 * 
	 * @RequestMapping("reviewupdate") public String reviewinsert(BbsVO bb)
	 * throws SQLException { if (bd.update(bb)) return "redirect:/reviewlist";
	 * else return "reviewupdateform"; }
	 * 
	 * // 의료-후기 삭제폼
	 * 
	 * @RequestMapping("reviewdeleteform") public String
	 * reviewdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "reviewdeleteform"; }
	 * 
	 * // 의료-후기 삭제
	 * 
	 * @RequestMapping("reviewdelete") public String reviewdelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/reviewlist"; else return "reviewdeleteform"; }
	 * 
	 * // 의료-후기 끝
	 * 
	 * // 게시판-신체장애 // 게시판-신체장애 글쓰기폼
	 * 
	 * @RequestMapping("/bodyinputForm") public String bodyinputForm() { return
	 * "bodyinput_form"; }
	 * 
	 * // 게시판-신체장애 글쓰기
	 * 
	 * @RequestMapping("/bodyinsert") public String bodyinsert(Model m, BbsVO b)
	 * {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "게시판-신체장애 글씀"); return
	 * "bodyresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:bodyinput"; }
	 * 
	 * // 게시판-신체장애 글목록
	 * 
	 * @RequestMapping("bodylist") public String bodylist(@RequestParam int no,
	 * int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("bodylist", list);
	 * 
	 * } return "bodylist"; }
	 * 
	 * // 게시판-신체장애 글수정폼
	 * 
	 * @RequestMapping("bodyupdateform") public String
	 * bodyupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return "bodyupdate";
	 * }
	 * 
	 * // 게시판-신체장애 글수정
	 * 
	 * @RequestMapping("bodyupdate") public String bodyinsert(BbsVO bb) throws
	 * SQLException { if (bd.update(bb)) return "redirect:/bodylist"; else
	 * return "bodyupdateform"; }
	 * 
	 * // 게시판-신체장애 글삭제폼
	 * 
	 * @RequestMapping("bodydeleteform") public String
	 * bodydeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "bodydeleteform"; }
	 * 
	 * // 게시판-신체장애 글삭제
	 * 
	 * @RequestMapping("bodydelete") public String bodydelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/bodylist"; else return "bodydeleteform"; }
	 * 
	 * // 게시판-신체장애 끝
	 * 
	 * // 게시판-정신장애 // 게시판-정신장애 글쓰기 폼
	 * 
	 * @RequestMapping("/mentalinputForm") public String mentalinputForm() {
	 * return "mentalinput_form"; }
	 * 
	 * // 게시판-정신장애 글쓰기
	 * 
	 * @RequestMapping("/mentalinsert") public String mentalinsert(Model m,
	 * BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "게시판-정신장애 글씀"); return
	 * "mentalresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:mentalinput"; }
	 * 
	 * // 게시판-정신장애 글목록
	 * 
	 * @RequestMapping("mentallist") public String mentallist(@RequestParam int
	 * no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("mentallist", list);
	 * 
	 * } return "mentallist"; }
	 * 
	 * // 게시판-정신장애 글수정폼
	 * 
	 * @RequestMapping("mentalupdateform") public String
	 * mentalupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "mentalupdate"; }
	 * 
	 * // 게시판-정신장애 글수정
	 * 
	 * @RequestMapping("mentalupdate") public String mentalinsert(BbsVO bb)
	 * throws SQLException { if (bd.update(bb)) return "redirect:/mentallist";
	 * else return "mentalupdateform"; }
	 * 
	 * // 게시판-정신장애 글삭제폼
	 * 
	 * @RequestMapping("mentaldeleteform") public String
	 * mentaldeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "mentaldeleteform"; }
	 * 
	 * // 게시판-정신장애 글삭제
	 * 
	 * @RequestMapping("mentaldelete") public String mentaldelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/mentallist"; else return "mentaldeleteform"; }
	 * 
	 * // 게시판-정신장애 끝
	 * 
	 * // 게시판-동호회 // 게시판-동호회 글쓰기폼
	 * 
	 * @RequestMapping("/clubinputForm") public String clubinputForm() { return
	 * "clubinput_form"; }
	 * 
	 * // 게시판-동호회 글쓰기
	 * 
	 * @RequestMapping("/clubinsert") public String clubinsert(Model m, BbsVO b)
	 * {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "게시판-동호회 글슴"); return
	 * "clubresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:clubinput"; }
	 * 
	 * // 게시판-동호회 글목록
	 * 
	 * @RequestMapping("clublist") public String clublist(@RequestParam int no,
	 * int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("clublist", list);
	 * 
	 * } return "clublist"; }
	 * 
	 * // 게시판-동호회 글수정폼
	 * 
	 * @RequestMapping("clubupdateform") public String
	 * clubupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return "clubupdate";
	 * }
	 * 
	 * // 게시판-동호회 글수정
	 * 
	 * @RequestMapping("clubupdate") public String clubinsert(BbsVO bb) throws
	 * SQLException { if (bd.update(bb)) return "redirect:/clublist"; else
	 * return "clubupdateform"; }
	 * 
	 * // 게시판-동호회 글삭제폼
	 * 
	 * @RequestMapping("clubdeleteform") public String
	 * clubdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "clubdeleteform"; }
	 * 
	 * // 게시판-동호회 글삭제
	 * 
	 * @RequestMapping("clubdelete") public String clubdelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/clublist"; else return "clubdeleteform"; }
	 * 
	 * // 게시판-동호회 끝
	 * 
	 * // 게시판-여행 // 게시판-여행 글쓰기폼
	 * 
	 * @RequestMapping("/travelinputForm") public String travelinputForm() {
	 * return "travelinput_form"; }
	 * 
	 * // 게시판-여행 글쓰기
	 * 
	 * @RequestMapping("/travelinsert") public String travelinsert(Model m,
	 * BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "게시판-여행 글씀"); return
	 * "travelresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:travelinput"; }
	 * 
	 * // 게시판-여행 글목록
	 * 
	 * @RequestMapping("travellist") public String travellist(@RequestParam int
	 * no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("travellist", list);
	 * 
	 * } return "travellist"; }
	 * 
	 * // 게시판-여행 글수정폼
	 * 
	 * @RequestMapping("travelupdateform") public String
	 * travelupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "travelupdate"; }
	 * 
	 * // 게시판-여행 글수정
	 * 
	 * @RequestMapping("travelupdate") public String travelinsert(BbsVO bb)
	 * throws SQLException { if (bd.update(bb)) return "redirect:/travellist";
	 * else return "travelupdateform"; }
	 * 
	 * // 게시판-여행 글삭제폼
	 * 
	 * @RequestMapping("traveldeleteform") public String
	 * traveldeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "traveldeleteform"; }
	 * 
	 * // 게시판-여행 글삭제
	 * 
	 * @RequestMapping("traveldelete") public String traveldelete(int no, int
	 * boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/travellist"; else return "traveldeleteform"; }
	 * 
	 * // 게시판-여행 끝
	 * 
	 * // 고객센터-Q&A // 고객센터-Q&A 글쓰기폼
	 * 
	 * @RequestMapping("/qnainputForm") public String qnainputForm() { return
	 * "qnainput_form"; }
	 * 
	 * // 고객센터-Q&A 글쓰기
	 * 
	 * @RequestMapping("/qnainsert") public String qnainsert(Model m, BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "고객센터-Q&A 글씀"); return
	 * "qnaresult"; } } catch (SQLException e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return "redirect:qnainput"; }
	 * 
	 * // 고객센터-Q&A 글목록
	 * 
	 * @RequestMapping("qnalist") public String qnalist(@RequestParam int no,
	 * int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("qnalist", list);
	 * 
	 * } return "qnalist"; }
	 * 
	 * // 고객센터-Q&A 수정폼
	 * 
	 * @RequestMapping("qnaupdateform") public String
	 * qnaupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return "qnaupdate";
	 * }
	 * 
	 * // 고객센터-Q&A 수정
	 * 
	 * @RequestMapping("qnaupdate") public String qnainsert(BbsVO bb) throws
	 * SQLException { if (bd.update(bb)) return "redirect:/qnalist"; else return
	 * "qnaupdateform"; }
	 * 
	 * // 고객센터-Q&A 삭제폼
	 * 
	 * @RequestMapping("qnadeleteform") public String
	 * qnadeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "qnadeleteform"; }
	 * 
	 * // 고객센터-Q&A 삭제
	 * 
	 * @RequestMapping("qnadelete") public String qnadelete(int no, int boardno)
	 * throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/qnalist"; else return "qnadeleteform"; }
	 * 
	 * // 고객센터-Q&A 끝
	 * 
	 * // 고객센터-게시판 요청 // 고객센터-게시판 요청 글쓰기폼
	 * 
	 * @RequestMapping("/bbsrequestinputForm") public String
	 * bbsrequestinputForm() { return "bbsrequestinput_form"; }
	 * 
	 * // 고객센터-게시판 요청 글쓰기
	 * 
	 * @RequestMapping("/bbsrequestinsert") public String bbsrequestinsert(Model
	 * m, BbsVO b) {
	 * 
	 * try { if (bd.insert(b)) { m.addAttribute("msg", "고객센터-게시판 요청 글씀"); return
	 * "bbsrequestresult"; } } catch (SQLException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } return "redirect:bbsrequestinput"; }
	 * 
	 * // 고객센터-게시판 요청 글목록
	 * 
	 * @RequestMapping("bbsrequestlist") public String
	 * bbsrequestlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsVO> list = bd.selectAll();
	 * model.addAttribute("bbsrequestlist", list);
	 * 
	 * } return "bbsrequestlist"; }
	 * 
	 * // 고객센터-게시판 요청 글수정폼
	 * 
	 * @RequestMapping("bbsrequestupdateform") public String
	 * bbsrequestupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "bbsrequestupdate"; }
	 * 
	 * // 고객센터-게시판 요청 글수정
	 * 
	 * @RequestMapping("bbsrequestupdate") public String bbsrequestinsert(BbsVO
	 * bb) throws SQLException { if (bd.update(bb)) return
	 * "redirect:/bbsrequestlist"; else return "bbsrequestupdateform"; }
	 * 
	 * // 고객센터-게시판 요청 삭제폼
	 * 
	 * @RequestMapping("bbsrequestdeleteform") public String
	 * bbsrequestdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("BbsVO", bd.select(no, boardno)); return
	 * "bbsrequestdeleteform"; }
	 * 
	 * // 고객센터-게시판 요청 삭제
	 * 
	 * @RequestMapping("bbsrequestdelete") public String bbsrequestdelete(int
	 * no, int boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/bbsrequestlist"; else return "bbsrequestdeleteform"; }
	 * 
	 * // 고객센터-게시판 요청 끝
	 * 
	 * // ------------------bbs end
	 * ------------------------------------------------
	 * 
	 * // ---------------------------------- comment
	 * -------------------------------
	 * 
	 * // 공지사항 리플 // 공지사항 리플 글쓰기폼
	 * 
	 * @RequestMapping("/noticecommentinputForm") public String
	 * noticecommentnputForm() { return "noticecommentinput_form"; }
	 * 
	 * // 공지사항 리플 글쓰기
	 * 
	 * @RequestMapping("/noticecommentinsert") public String
	 * noticecommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "공지사항 리플 달았어"); return
	 * "noticecommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:noticecommentnput"; }
	 * 
	 * // 공지사항 리플 글목록
	 * 
	 * @RequestMapping("noticecommentlist") public String
	 * noticecommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 11) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("noticecommentlist", list);
	 * 
	 * } return "noticecommentlist"; }
	 * 
	 * // 공지사항 리플 글수정폼
	 * 
	 * @RequestMapping("noticecommentupdateform") public String
	 * noticecommentupdateForm(@RequestParam int no, int commentno, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * boardno, no)); return "noticecommentupdate"; }
	 * 
	 * // 공지사항 리플 글수정
	 * 
	 * @RequestMapping("noticecommentupdate") public String
	 * noticecommentinsert(BbsCommentVO bbs) throws SQLException {
	 * 
	 * if (bcd.update(bbs)) return "redirect:/noticecommentlist"; else return
	 * "noticecommentupdateform"; }
	 * 
	 * // 공지사항 리플 삭제폼
	 * 
	 * @RequestMapping("noticecommentdeleteform") public String
	 * noticecommentdeleteForm(@RequestParam int commentno,int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * boardno, no)); return "noticecommentdeleteform"; }
	 * 
	 * // 공지사항 리플 삭제
	 * 
	 * @RequestMapping("noticecommentdelete") public String
	 * noticecommentdelete(int commentno, int no, int boardno) throws
	 * SQLException { if (bcd.delete(commentno, boardno, no)) return
	 * "redirect:/noticecommentlist"; else return "noticecommentdeleteform"; }
	 * 
	 * // 공지사항 리플 끝
	 * 
	 * // 뉴스 리플 // 뉴스 리플 글쓰기폼
	 * 
	 * @RequestMapping("/newscommentinputForm") public String
	 * newscommentinputForm() { return "newscommentinput_form"; }
	 * 
	 * // 뉴스 리플 글쓰기
	 * 
	 * @RequestMapping("/newscommentinsert") public String
	 * newscommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "뉴스 리플 글씀"); return
	 * "newscommentresult"; } } catch (SQLException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } return "redirect:newscommentinput"; }
	 * 
	 * // 뉴스 리플 글목록
	 * 
	 * @RequestMapping("newscommentlist") public String
	 * newscommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("newscommentlist", list);
	 * 
	 * } return "newscommentlist"; }
	 * 
	 * // 뉴스 리플 글수정폼
	 * 
	 * @RequestMapping("newscommentupdateform") public String
	 * newscommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "newscommentupdate"; }
	 * 
	 * // 뉴스 리플 글수정
	 * 
	 * @RequestMapping("newscommentupdate") public String
	 * newscommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/newscommentlist"; else return
	 * "newscommentupdateform"; }
	 * 
	 * // 뉴스 리플 글삭제폼
	 * 
	 * @RequestMapping("newscommentdeleteform") public String
	 * newscommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * boardno, no)); return "newscommentdeleteform"; }
	 * 
	 * // 뉴스 리플 글삭제
	 * 
	 * @RequestMapping("newscommentdelete") public String newscommentdelete(int
	 * no, int boardno, int commentno) throws SQLException { if
	 * (bcd.delete(commentno, boardno, no)) return "redirect:/newscommentlist";
	 * else return "newscommentdeleteform"; }
	 * 
	 * // 뉴스 리플 글삭제 끝
	 * 
	 * // 일자리 정보 리플 // 일자리 정보 리플 글쓰기폼
	 * 
	 * @RequestMapping("/jobcommentinputForm") public String
	 * jobcommentinputForm() { return "jobcommentinput_form"; }
	 * 
	 * // 일자리 정보 리플 글쓰기
	 * 
	 * @RequestMapping("/jobcommentinsert") public String jobcommentinsert(Model
	 * m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "일자리 정보 리플 글씀"); return
	 * "jobcommentresult"; } } catch (SQLException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } return "redirect:jobcommentinput"; }
	 * 
	 * // 일자리 정보 리플 글목록
	 * 
	 * @RequestMapping("jobcommentlist") public String
	 * jobcommentlist(@RequestParam int commnetno, int no, int boardno, Model
	 * model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("jobcommentlist", list);
	 * 
	 * } return "jobcommentlist"; }
	 * 
	 * // 일자리 정보 리플 글수정폼
	 * 
	 * @RequestMapping("jobcommentupdateform") public String
	 * jobcommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * boardno, no)); return "jobcommentupdate"; }
	 * 
	 * // 일자리 정보 리플 글수정
	 * 
	 * @RequestMapping("jobcommentupdate") public String
	 * jobcommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/jobcommentlist"; else return
	 * "jobcommentupdateform"; }
	 * 
	 * // 일자리 정보 리플 글삭제폼
	 * 
	 * @RequestMapping("jobcommentdeleteform") public String
	 * jobcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("bbsBean", bd.select(no, boardno)); return
	 * "jobcommentdeleteform"; }
	 * 
	 * // 일자리 정보 리플 글삭제
	 * 
	 * @RequestMapping("jobcommentdelete") public String jobcommentdelete(int
	 * no, int boardno) throws SQLException { if (bd.delete(no, boardno)) return
	 * "redirect:/jobcommentlist"; else return "jobcommentdeleteform"; }
	 * 
	 * // 일자리 정보 리플 끝
	 * 
	 * // 의료-거래 리플 // 의료-거래 리플 글쓰기폼
	 * 
	 * @RequestMapping("/tradecommentinputForm") public String
	 * tradecommentinputForm() { return "tradecommentinput_form"; }
	 * 
	 * // 의료-거래 리플 글쓰기
	 * 
	 * @RequestMapping("/tradecommentinsert") public String
	 * tradecommentinsert(Model m, BbsCommentVO bcv) {
	 * 
	 * try { if (bcd.insert(bcv)) { m.addAttribute("msg", "의료 - 거래 리플 글씀");
	 * return "tradecommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:tradecommentinput"; }
	 * 
	 * // 의료-거래 리플 글목록
	 * 
	 * @RequestMapping("tradecommentlist") public String
	 * tradecommentlist(@RequestParam int boardno, int no, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("tradecommentlist", list);
	 * 
	 * } return "tradecommentlist"; }
	 * 
	 * // 의료-거래 리플 글수정폼
	 * 
	 * @RequestMapping("tradecommentupdateform") public String
	 * tradecommentupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("bbsBean", bd.select(no, boardno)); return
	 * "tradecommentupdate"; }
	 * 
	 * // 의료-거래 리플 글수정
	 * 
	 * @RequestMapping("tradecommentupdate") public String
	 * tradecommentinsert(BbsCommentVO bvo) throws SQLException { if
	 * (bcd.update(bvo)) return "redirect:/tradecommentlist"; else return
	 * "tradecommentupdateform"; }
	 * 
	 * // 의료-거래 리플 글삭제폼
	 * 
	 * @RequestMapping("tradecommentdeleteform") public String
	 * tradecommentdeleteForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("bbsBean", bd.select(no, boardno)); return
	 * "tradecommentdeleteform"; }
	 * 
	 * // 의료-거래 리플 글삭제
	 * 
	 * @RequestMapping("tradecommentdelete") public String
	 * tradecommentdelete(int no, int boardno) throws SQLException { if
	 * (bd.delete(no, boardno)) return "redirect:/tradecommentlist"; else return
	 * "tradecommentdeleteform"; }
	 * 
	 * // 의료-거래 리플 끝
	 * 
	 * // 의료-질문리플 // 의료-질문리플 글쓰기폼
	 * 
	 * @RequestMapping("/questioncommentinputForm") public String
	 * questioncommentinputForm() { return "questioncommentinput_form"; }
	 * 
	 * // 의료-질문리플 글쓰기
	 * 
	 * @RequestMapping("/questioncommentinsert") public String
	 * questioncommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "의료-질문리플 글씀"); return
	 * "questioncommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:questioncommentinput"; }
	 * 
	 * // 의료-질문리플 글목록
	 * 
	 * @RequestMapping("questioncommentlist") public String
	 * questioncommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("questioncommentlist", list);
	 * 
	 * } return "questioncommentlist"; }
	 * 
	 * // 의료-질문리플 글수정폼
	 * 
	 * @RequestMapping("questioncommentupdateform") public String
	 * questioncommentupdateForm(@RequestParam int commentno, int no, int
	 * boardno, Model model) { model.addAttribute("BbsCommentVO",
	 * bcd.select(commentno, no, boardno)); return "questioncommentupdate"; }
	 * 
	 * // 의료-질문리플 글수정
	 * 
	 * @RequestMapping("questioncommentupdate") public String
	 * questioncommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/questioncommentlist"; else return
	 * "questioncommentupdateform"; }
	 * 
	 * // 의료-질문리플 글삭제폼
	 * 
	 * @RequestMapping("questioncommentdeleteform") public String
	 * questioncommentdeleteForm(@RequestParam int commentno, int no, int
	 * boardno, Model model) { model.addAttribute("BbsCommentVO",
	 * bcd.select(commentno, boardno, no)); return "questioncommentdeleteform";
	 * }
	 * 
	 * // 의료-질문리플 글삭제
	 * 
	 * @RequestMapping("questioncommentdelete") public String
	 * questioncommentdelete(int commentno, int no, int boardno) throws
	 * SQLException { if (bcd.delete(commentno, boardno, no)) return
	 * "redirect:/questioncommentlist"; else return "questioncommentdeleteform";
	 * }
	 * 
	 * // 의료-질문리플 끝
	 * 
	 * // 의료-후기 리플 // 의료-후기 리플 글쓰기폼
	 * 
	 * @RequestMapping("/reviewcommentinputForm") public String
	 * reviewcommentinputForm() { return "reviewcommentinput_form"; }
	 * 
	 * // 의료-후기 리플 글쓰기
	 * 
	 * @RequestMapping("/reviewcommentinsert") public String
	 * reviewcommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "의료-후기 리플 글씀"); return
	 * "reviewcommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:reviewcommentinput"; }
	 * 
	 * // 의료-후기 리플 글목록
	 * 
	 * @RequestMapping("reviewcommentlist") public String
	 * reviewcommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("reviewcommentlist", list);
	 * 
	 * } return "reviewcommentlist"; }
	 * 
	 * // 의료-후기 리플 글수정폼
	 * 
	 * @RequestMapping("reviewcommentupdateform") public String
	 * reviewcommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "reviewcommentupdate"; }
	 * 
	 * // 의료-후기 리플 글수정
	 * 
	 * @RequestMapping("reviewcommentupdate") public String
	 * reviewcommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/reviewcommentlist"; else return
	 * "reviewcommentupdateform"; }
	 * 
	 * // 의료-후기 리플 글삭제폼
	 * 
	 * @RequestMapping("reviewcommentdeleteform") public String
	 * reviewcommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO",
	 * bcd.select(commentno,no, boardno)); return "reviewcommentdeleteform"; }
	 * 
	 * // 의료-후기 리플 글삭제
	 * 
	 * @RequestMapping("reviewcommentdelete") public String
	 * reviewcommentdelete(int commentno, int no, int boardno) throws
	 * SQLException { if (bcd.delete(commentno, no, boardno)) return
	 * "redirect:/reviewcommentlist"; else return "reviewcommentdeleteform"; }
	 * 
	 * // 의료-후기 리플 끝
	 * 
	 * // 게시판-신체장애 리플 // 게시판-신체장애 리플 글쓰기폼
	 * 
	 * @RequestMapping("/bodycommentinputForm") public String
	 * bodycommentinputForm() { return "bodycommentinput_form"; }
	 * 
	 * // 게시판-신체장애 리플 글씀
	 * 
	 * @RequestMapping("/bodycommentinsert") public String
	 * bodycommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "게시판-신체장애 리플 글씀");
	 * return "bodycommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:bodycommentinput"; }
	 * 
	 * // 게시판-신체장애 리플 글목록
	 * 
	 * @RequestMapping("bodycommentlist") public String
	 * bodycommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("bodycommentlist", list);
	 * 
	 * } return "bodycommentlist"; }
	 * 
	 * // 게시판-신체장애 리플 글수정폼
	 * 
	 * @RequestMapping("bodycommentupdateform") public String
	 * bodycommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "bodycommentupdate"; }
	 * 
	 * // 게시판-신체장애 리플 글수정
	 * 
	 * @RequestMapping("bodycommentupdate") public String
	 * bodycommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/bodycommentlist"; else return
	 * "bodycommentupdateform"; }
	 * 
	 * // 게시판-신체장애 리플 삭제폼
	 * 
	 * @RequestMapping("bodycommentdeleteform") public String
	 * bodycommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO",
	 * bcd.select(commentno,no, boardno)); return "bodycommentdeleteform"; }
	 * 
	 * // 게시판-신체장애 리플 삭제
	 * 
	 * @RequestMapping("bodycommentdelete") public String bodycommentdelete(int
	 * commentno, int no, int boardno) throws SQLException { if
	 * (bcd.delete(commentno,no, boardno)) return "redirect:/bodycommentlist";
	 * else return "bodycommentdeleteform"; }
	 * 
	 * // 게시판-신체장애 리플 끝
	 * 
	 * // 게시판-정신장애 // 게시판-정신장애 글쓰기폼
	 * 
	 * @RequestMapping("/headinputForm") public String headinputForm() { return
	 * "headinput_form"; }
	 * 
	 * // 게시판-정신장애 글쓰기
	 * 
	 * @RequestMapping("/mentalcommentinsert") public String
	 * mentalcommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "게시판-정신장애 글씀"); return
	 * "mentalcommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:mentalcommentinput"; }
	 * 
	 * // 게시판-정신장애 글목록
	 * 
	 * @RequestMapping("mentalcommentlist") public String
	 * mentalcommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("mentalcommentlist", list);
	 * 
	 * } return "mentalcommentlist"; }
	 * 
	 * // 게시판-정신장애 글수정폼
	 * 
	 * @RequestMapping("mentalcommentupdateform") public String
	 * mentalcommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "mentalcommentupdate"; }
	 * 
	 * // 게시판-정신장애 글수정
	 * 
	 * @RequestMapping("mentalcommentupdate") public String
	 * mentalcommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/mentalcommentlist"; else return
	 * "mentalcommentupdateform"; }
	 * 
	 * // 게시판-정신장애 삭제폼
	 * 
	 * @RequestMapping("mentalcommentdeleteform") public String
	 * mentalcommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "mentalcommentdeleteform"; }
	 * 
	 * // 게시판-정신장애 삭제
	 * 
	 * @RequestMapping("mentalcommentdelete") public String
	 * mentalcommentdelete(int commentno, int no, int boardno) throws
	 * SQLException { if (bcd.delete(commentno, no, boardno)) return
	 * "redirect:/mentalcommentlist"; else return "mentalcommentdeleteform"; }
	 * 
	 * // 게시판-정신장애 끝
	 * 
	 * // 게시판-동호회 // 게시판-동호회 글쓰기폼
	 * 
	 * @RequestMapping("/clubcommentinputForm") public String
	 * clubcommentinputForm() { return "clubcommentinput_form"; }
	 * 
	 * // 게시판-동호회 글쓰기
	 * 
	 * @RequestMapping("/clubcommentinsert") public String
	 * clubcommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "게시판 - 동호회 글씀"); return
	 * "clubcommentresult"; } } catch (SQLException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } return "redirect:clubcommentinput"; }
	 * 
	 * // 게시판-동호회 글목록
	 * 
	 * @RequestMapping("clubcommentlist") public String
	 * clubcommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("clubcommentlist", list);
	 * 
	 * } return "clubcommentlist"; }
	 * 
	 * // 게시판-동호회 글수정폼
	 * 
	 * @RequestMapping("clubcommentupdateform") public String
	 * clubcommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "clubcommentupdate"; }
	 * 
	 * // 게시판-동호회 글수정
	 * 
	 * @RequestMapping("clubcommentupdate") public String
	 * clubcommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/clubcommentlist"; else return
	 * "clubcommentupdateform"; }
	 * 
	 * // 게시판-동호회 글삭제폼
	 * 
	 * @RequestMapping("clubcommentdeleteform") public String
	 * clubcommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "clubcommentdeleteform"; }
	 * 
	 * // 게시판-동호회 글삭제
	 * 
	 * @RequestMapping("clubcommentdelete") public String clubcommentdelete(int
	 * commentno, int no, int boardno) throws SQLException { if
	 * (bcd.delete(commentno, no, boardno)) return "redirect:/clubcommentlist";
	 * else return "clubcommentdeleteform"; }
	 * 
	 * // 게시판-동호회 끝
	 * 
	 * // 게시판-여행 // 게시판-여행 글쓰기폼
	 * 
	 * @RequestMapping("/travelcommentinputForm") public String
	 * travelcommentinputForm() { return "travelcommentinput_form"; }
	 * 
	 * // 게시판-여행 글쓰기
	 * 
	 * @RequestMapping("/travelcommentinsert") public String
	 * travelcommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "게시판-여행 글씀"); return
	 * "travelcommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:travelcommentinput"; }
	 * 
	 * // 게시판-여행 글목록
	 * 
	 * @RequestMapping("travelcommentlist") public String
	 * travelcommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("travelcommentlist", list);
	 * 
	 * } return "travelcommentlist"; }
	 * 
	 * // 게시판-여행 글수정폼
	 * 
	 * @RequestMapping("travelcommentupdateform") public String
	 * travelcommentupdateForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "travelcommentupdate"; }
	 * 
	 * // 게시판-여행 글수정
	 * 
	 * @RequestMapping("travelcommentupdate") public String
	 * travelcommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/travelcommentlist"; else return
	 * "travelcommentupdateform"; }
	 * 
	 * // 게시판-여행 글삭제폼
	 * 
	 * @RequestMapping("travelcommentdeleteform") public String
	 * travelcommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "travelcommentdeleteform"; }
	 * 
	 * // 게시판-여행 글삭제
	 * 
	 * @RequestMapping("travelcommentdelete") public String
	 * travelcommentdelete(int commentno, int no, int boardno) throws
	 * SQLException { if (bcd.delete(commentno, no, boardno)) return
	 * "redirect:/travelcommentlist"; else return "travelcommentdeleteform"; }
	 * 
	 * // 게시판-여행 끝
	 * 
	 * // 고객센터-Q&A // 고객센터-Q&A 글쓰기폼
	 * 
	 * @RequestMapping("/qnacommentinputForm") public String
	 * qnacommentinputForm() { return "qnacommentinput_form"; }
	 * 
	 * // 고객센터-Q&A 글쓰기
	 * 
	 * @RequestMapping("/qnacommentinsert") public String qnacommentinsert(Model
	 * m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "고객센터-Q&A 글씀"); return
	 * "qnacommentresult"; } } catch (SQLException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } return "redirect:qnacommentinput"; }
	 * 
	 * // 고객센터-Q&A 글목록
	 * 
	 * @RequestMapping("qnacommentlist") public String
	 * qnacommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("qnacommentlist", list);
	 * 
	 * } return "qnacommentlist"; }
	 * 
	 * // 고객센터-Q&A 글수정폼
	 * 
	 * @RequestMapping("qnacommentupdateform") public String
	 * qnacommentupdateForm(@RequestParam int no, int boardno, Model model) {
	 * model.addAttribute("bbsBean", bd.select(no, boardno)); return
	 * "qnacommentupdate"; }
	 * 
	 * // 고객센터-Q&A 글수정
	 * 
	 * @RequestMapping("qnacommentupdate") public String
	 * qnacommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/qnacommentlist"; else return
	 * "qnacommentupdateform"; }
	 * 
	 * // 고객센터-Q&A 삭제폼
	 * 
	 * @RequestMapping("qnacommentdeleteform") public String
	 * qnacommentdeleteForm(@RequestParam int commentno, int no, int boardno,
	 * Model model) { model.addAttribute("BbsCommentVO", bcd.select(commentno,
	 * no, boardno)); return "qnacommentdeleteform"; }
	 * 
	 * // 고객센터-Q&A 삭제
	 * 
	 * @RequestMapping("qnacommentdelete") public String qnacommentdelete(int
	 * commentno, int no, int boardno) throws SQLException { if
	 * (bcd.delete(commentno, no, boardno)) return "redirect:/qnacommentlist";
	 * else return "qnacommentdeleteform"; }
	 * 
	 * // 고객센터-Q&A 끝
	 * 
	 * // 고객센터-게시판 요청 // 고객센터-게시판 요청 글쓰기폼
	 * 
	 * @RequestMapping("/bbsrequestcommentinputForm") public String
	 * bbsrequestcommentinputForm() { return "bbsrequestcommentinput_form"; }
	 * 
	 * // 고객센터-게시판 요청 글쓰기
	 * 
	 * @RequestMapping("/bbsrequestcommentinsert") public String
	 * bbsrequestcommentinsert(Model m, BbsCommentVO b) {
	 * 
	 * try { if (bcd.insert(b)) { m.addAttribute("msg", "고객센터-게시판 요청 글씀");
	 * return "bbsrequestcommentresult"; } } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return
	 * "redirect:bbsrequestcommentinput"; }
	 * 
	 * // 고객센터-게시판 요청 글목록
	 * 
	 * @RequestMapping("bbsrequestcommentlist") public String
	 * bbsrequestcommentlist(@RequestParam int no, int boardno, Model model) {
	 * 
	 * if (boardno == 12) { List<BbsCommentVO> list = bcd.selectAll();
	 * model.addAttribute("bbsrequestcommentlist", list);
	 * 
	 * } return "bbsrequestcommentlist"; }
	 * 
	 * // 고객센터-게시판 요청 글수정폼
	 * 
	 * @RequestMapping("bbsrequestcommentupdateform") public String
	 * bbsrequestcommentupdateForm(@RequestParam int commentno, int no, int
	 * boardno, Model model) { model.addAttribute("BbsCommentVO",
	 * bcd.select(commentno,no, boardno)); return "bbsrequestcommentupdate"; }
	 * 
	 * // 고객센터-게시판 요청 글수정
	 * 
	 * @RequestMapping("bbsrequestcommentupdate") public String
	 * bbsrequestcommentinsert(BbsCommentVO bb) throws SQLException { if
	 * (bcd.update(bb)) return "redirect:/bbsrequestcommentlist"; else return
	 * "bbsrequestcommentupdateform"; }
	 * 
	 * // 고객센터-게시판 요청 글삭제폼
	 * 
	 * @RequestMapping("bbsrequestcommentdeleteform") public String
	 * bbsrequestcommentdeleteForm(@RequestParam int commentno, int no, int
	 * boardno, Model model) { model.addAttribute("BbsCommentVO",
	 * bcd.select(commentno, no, boardno)); return
	 * "bbsrequestcommentdeleteform"; }
	 * 
	 * // 고객센터-게시판 요청 글삭제
	 * 
	 * @RequestMapping("bbsrequestcommentdelete") public String
	 * bbsrequestcommentdelete(int commentno,int no, int boardno) throws
	 * SQLException { if (bcd.delete(commentno, no, boardno)) return
	 * "redirect:/bbsrequestcommentlist"; else return
	 * "bbsrequestcommentdeleteform"; }
	 * 
	 * 
	 * // 고객센터-게시판 요청 끝
	 */

	// -------------------------리플끝----------------------------------//

	// -------------------------메시지---------------------------------//
	private MessageDAO mv;

	// 메시지 글쓰기폼

	@RequestMapping("/messageWrite")
	public String messageInputForm() {
		return "message/messageWrite";
	}

	// 메시지 글쓰기
	@RequestMapping("/messageWriteAction")
	public String messageinsert(Model m, MessageVO mvo) {

		try {
			if (mv.insert(mvo)) {
				m.addAttribute("msg", "메시지 전송 완료!!");
				return "messagelist";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "message/messagelist";
	}

	// 메시지 리스트
	@RequestMapping("/messagelist")
	public String messagelist(@RequestParam String recipient, Model model) {

		/*
		 * List<MessageVO> list = mv.selectAll(recipient);
		 * model.addAttribute("messagelist", list);
		 */

		return "message/messageList";
	}

	// 메시지 삭제폼
	@RequestMapping("messagedeleteform")
	public String messagedeleteForm(@RequestParam int messageno, Model model) {
		model.addAttribute("messageVO", mv.select(messageno));
		return "messagedeleteform";
	}

	// 메시지 삭제
	@RequestMapping("messagedelete")
	public String messagedeleteForm(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/messagelist";
		else
			return "messagedeleteform";
	}
}