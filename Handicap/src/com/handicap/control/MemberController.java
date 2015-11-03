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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.handicap.model.beans.MessageVO;
import com.handicap.model.beans.RowNumVO;
import com.handicap.model.beans.UserVO;
import com.handicap.model.beans.ZipcodeVO;
import com.handicap.model.dao.MessageDAO;
import com.handicap.model.dao.UserDAO;
import com.handicap.model.dao.ZipcodeDAO;

@Controller
public class MemberController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private MessageDAO md;
	@Autowired
	private ZipcodeDAO zd;

	// ==================== 회원가입 =========================
	@RequestMapping("/idcheck") // 아이디중복체크
	public String idcheck(@RequestParam String userid, Model model) {
		List<UserVO> list = dao.selectAllId();// 모든회원의 아이디를 리스트에 담음
		String id = null; // db에서 꺼내온 id를 담을 변수 선언
		for (int i = 0; i < list.size(); i++) {// 모든회원이 id가 담긴 리스트를 for문으로 돌림
			id = list.get(i).getUserid(); // id변수 에 한개씩 담음
			if (id.equals(userid)) { // 회원가입폼에서 가져온 userid와 일치하는것이 있는지 확인
				model.addAttribute("checkId", id); // 일치하는것이 있다면 request영역에
													// "checkId"키값으로 id저장
				break;
			} else {
				model.addAttribute("checkId", "");// 없다면 request영역에
													// "checkId"키값으로 ""저장
			}
		}

		return "member/idCheck"; // ajax로 불렀기때문에 데이터를 넣어줄 페이지를 호출하고 페이지에 el태그를
									// 사용해서 결과를 뿌림
	}

	@RequestMapping("/nickcheck") // 중복확인 (닉네임)
	public String nickcheck(@RequestParam String nickname, Model model) {
		List<UserVO> list = dao.selectAllNick();// 모든회원의 닉네임을 리스트에 담음
		String nick = null; // db에서 꺼내온 nickname을 담을 변수선언
		for (int i = 0; i < list.size(); i++) {// 모든회원의 nickname이 담긴 리스트를 for문으로
												// 돌림
			nick = list.get(i).getNickname(); // nick변수에 한개씩 담음
			if (nick.equals(nickname)) { // 회원가입폼에서 가져온 nickname과 일치하는것이 있는 지확인
				model.addAttribute("checkNick", nick);// 일치한다면 request영역에
														// "checkNick"키값으로
														// nickname저장
				break;
			} else {
				model.addAttribute("checkNick", "");// 일치하지않는다면 request영역에
													// "checkNick"키값으로 ""저장
			}
		}
		return "member/nickCheck";// ajax로 불렀기때문에 데이터를 넣어줄 페이지를 호출하고 페이지에 el태그를
									// 사용해서 결과를 뿌림
	}

	// 주소가저오기
	@RequestMapping("/addressList")
	public String addressList(Model model, @RequestParam String dong) {
		List<ZipcodeVO> list = zd.findAddress(dong);
		model.addAttribute("addressList", list);

		return "member/addressForm3";
	}

	// 일반회원가입폼띄우기
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "member/registerForm";
	}

	// 기업회원가입폼띄우기
	@RequestMapping("/registerForm_C")
	public String registerForm_C() {
		return "member/registerForm_C";
	}

	// 주소검색폼띄우기
	@RequestMapping("/addressForm")
	public String addressForm() {
		return "member/addressForm";
	}

	@RequestMapping("/register") // 회원가입처리
	public String register(@RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3,
			@RequestParam String flag, UserVO uv) {
		if (flag.equals("member")) {// 넘어온 flag값이 "member"이면 일반회원가입처리
			try {
				uv.setPhone(phone1 + phone2 + phone3);// 3개로 나뉘어진 연락처를 1개로 통합해서
														// set
				if (dao.insert(uv)) {// UserDao에 있는 insert(UserVO)를 통해서 db에
										// insert
					return "redirect:login";// 회원가입성공시 로그인페이지로 이동
				} else {
					return "redirect:registerForm";// 회원가입실패시 회원가입폼으로 이동
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {// flag값이 "member"가 아닌 "company"값이 넘어온경우 기업회원가입으로 처리
			return "member/registerForm";
		}
		return "member/registerForm";
	}

	// ==============================로그인==============================

	// 로그인폼띄우기
	@RequestMapping("/loginForm")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/memberlogin") // 로그인 처리
	public String login(@RequestParam String userid, @RequestParam String passwd, HttpSession session, Model model) {
		if (dao.findPasswd(userid) != null) {// db에서 사용자가 입력한 userid를 조건으로 검색해서
												// passwd가 있다면
			if (dao.findPasswd(userid).equals(passwd)) {// db의 passwd와 사용자가 입력한
														// passwd를 비교해서 일치하면
				session.setAttribute("memberid", userid); // session에
															// "memberId"키값으로
															// userid값을 넘겨주고
				return "viewmain"; // 로그인성공하면 main페이지로 이동
			} else {
				model.addAttribute("status", "로그인실패");
				return "login/login"; // 로그인실패하면 login페이지로 이동
			}
		} else {
			model.addAttribute("status", "로그인실패");
			return "login/login";
		}
	}

	@RequestMapping("/logout") // 로그아웃 했을때
	public String logout(HttpSession session) {
		session.invalidate(); // 세션에 저장되있는값 삭제
		return "viewmain";
	}

	// ==============================ID.PW찾기================================
	@RequestMapping("/membersearch")
	public String membersearch() {
		return "member/memberSearch";
	}

	@RequestMapping("/findid") // id검색
	public String findid(HttpServletRequest request, @RequestParam String name, @RequestParam String email,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		dao.searchId(map);
		if (dao.searchId(map) == null) {
			writer.println("<script>alert('존재하는 아이디가 없습니다'); </script>");
			writer.flush();
			return "member/memberSearch";
		} else {
			writer.println(
					"<script>alert('" + "찾으신 아이디는 [" + dao.searchId(map) + "] 입니다.');" + "self.close();</script>");
			writer.flush();
			return "login/login";
		}
	}

	@RequestMapping("/findpw") // pw검색
	public String findpw(HttpServletRequest request, @RequestParam String userid, @RequestParam String pquestion,
			@RequestParam String panswer, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("pquestion", pquestion);
		map.put("panswer", panswer);
		dao.searchPw(map);
		if (dao.searchPw(map) == null) {
			writer.println("<script>alert('아이디,비밀번호질문,비밀번호답을 올바르게 입력해주세요..');</script>");
			writer.flush();
			return "member/memberSearch";
		} else {
			writer.println(
					"<script>alert('" + "찾으신 비밀번호는 [" + dao.searchPw(map) + "] 입니다.');" + "self.close();</script>");
			writer.flush();
			return "login/login";
		}
	}

	// ==============================회원정보수정===============================

	// 회원정보수정 비밀번호체크폼띄우기
	@RequestMapping("/member/mypage/pwcheck")
	public String pwcheck() {
		return "member/pwCheck";
	}

	// 회원정보수정 비밀번호체크폼처리
	@RequestMapping("/member/mypage/pwcheckaction")
	public String pwcheckaction(HttpSession session, @RequestParam String passwd, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String userid = session.getAttribute("memberid").toString();
		PrintWriter writer = response.getWriter();
		if (dao.findPasswd(userid) != null) {
			if (dao.findPasswd(userid).equals(passwd)) {
				/*
				 * writer.println(
				 * "<script>alert('비밀번호가 일치합니다.'); self.close();</script>");
				 * writer.flush();
				 */
				return "redirect:registerupdateform"; // 비밀번호인증성공 회원정보수정페이지로 이동
			} else {
				writer.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
				writer.flush();
				return "member/pwCheck"; // 비밀번호인증실패
			}
		} else {
			writer.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			writer.flush();
			return "member/pwCheck";
		}
	}

	// 회원정보수정 폼띄우기
	@RequestMapping("/member/mypage/registerupdateform")
	public String registerupdateform(HttpSession session, Model model) {
		String userid = session.getAttribute("memberid").toString();
		int usergrade = dao.searchGrade(userid);
		model.addAttribute("user", dao.select(userid));
		if (usergrade == 1) {
			return "member/registerupdateForm";
		} else if (usergrade == 2) {
			return "member/registerupdateForm";
		} else {
			return "member/registerupdateForm";
		}
	}

	// 회원정보수정처리
	@RequestMapping("/member/mypage/registerupdateformaction")
	public String registerupdateformaction(UserVO vo) throws SQLException {
		dao.update(vo);
		return "viewmain";
	}

	// 회원탈퇴
	@RequestMapping("/member/mypage/registerdelete")
	public String registerdelete(@RequestParam String userid) throws SQLException {
		dao.delete(userid);
		return "redirect:logout";
	}

	// -------------------------메시지---------------------------------//

	// 메시지 글쓰기폼

	@RequestMapping("/messageWrite")
	public String messageInputForm() {
		return "message/messageWrite";
	}

	// 메시지 글쓰기
	@RequestMapping("/messageWriteAction")
	public String messageinsert(HttpSession session, Model m, MessageVO mvo, HttpServletResponse response,
			HttpServletRequest request) throws SQLException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String userid = session.getAttribute("memberid").toString();
		String sender = dao.findNick(userid);
		mvo.setSender(sender);
		PrintWriter writer = response.getWriter();
		if (md.insert(mvo)) {
			return "redirect:messagelist";
		}
		return "redirect:messagelist";
	}

	// 메시지 받은 리스트
	@RequestMapping("/messagelist")
	public String messagelist(HttpSession session, Model model, HttpServletRequest request) {
		// session에 로그인된 id로 닉네임 찾아오기
		String userid = session.getAttribute("memberid").toString();
		String recipient = dao.findNick(userid);

		// 페이지 사이즈(한페이지에 보일글갯수), 페이지그룹(다음누를시 넘어가는 페이지)
		int pagesize = 5;
		int pagegroup = 10;

		// 현재 클릭 페이지
		String pageNumber = request.getParameter("pageNumber");
		int pageNum = 1;
		if (pageNumber != null)
			pageNum = Integer.parseInt(pageNumber);

		// 발신자가 사용자인 메시지 전체 갯수 초기화
		int totalCount = md.selectCount(recipient);
		// 페이지 갯수
		int totalPageCount = totalCount / pagesize;
		// 0으로 나눠떨어지지 않을경우 페이지 갯수를 +1한다.
		if (totalCount % pagesize != 0) {
			totalPageCount++;
		}
		// startPage or endPage
		int startPage = (pageNum - 1) / pagegroup * pagegroup + 1;
		int endPage = startPage + (pagegroup - 1);
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		// 마지막, 처음 rowNumber 선언 및 초기화
		int endRow = pagesize * pageNum;
		int startRow = endRow - pagesize + 1;

		RowNumVO rowNumVO = new RowNumVO();
		rowNumVO.setStartRow(startRow);
		rowNumVO.setEndRow(endRow);
		Map map = new HashMap();
		map.put("recipient", recipient);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<MessageVO> list = md.selectAll(map);
		model.addAttribute("messageCount", list.size());
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("messageList", list);
		return "message/messageList";
	}

	// 메시지 보낸리스트
	// 메시지 받은 리스트
	@RequestMapping("/messagesendlist")
	public String messagesendlist(HttpSession session, Model model, HttpServletRequest request) {
		// session에 로그인된 id로 닉네임 찾아오기
		String userid = session.getAttribute("memberid").toString();
		String sender = dao.findNick(userid);

		// 페이지 사이즈(한페이지에 보일글갯수), 페이지그룹(다음누를시 넘어가는 페이지)
		int pagesize = 5;
		int pagegroup = 10;

		// 현재 클릭 페이지
		String pageNumber = request.getParameter("pageNumber");
		int pageNum = 1;
		if (pageNumber != null)
			pageNum = Integer.parseInt(pageNumber);

		// 발신자가 사용자인 메시지 전체 갯수 초기화
		int totalCount = md.selectsendCount(sender);
		// 페이지 갯수
		int totalPageCount = totalCount / pagesize;
		// 0으로 나눠떨어지지 않을경우 페이지 갯수를 +1한다.
		if (totalCount % pagesize != 0) {
			totalPageCount++;
		}
		// startPage or endPage
		int startPage = (pageNum - 1) / pagegroup * pagegroup + 1;
		int endPage = startPage + (pagegroup - 1);
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		// 마지막, 처음 rowNumber 선언 및 초기화
		int endRow = pagesize * pageNum;
		int startRow = endRow - pagesize + 1;

		RowNumVO rowNumVO = new RowNumVO();
		rowNumVO.setStartRow(startRow);
		rowNumVO.setEndRow(endRow);
		Map map = new HashMap();
		map.put("sender", sender);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<MessageVO> list = md.selectsendAll(map);
		model.addAttribute("messageCount", list.size());
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("messageList", list);
		return "message/messagesendList";
	}

	// 받은메시지 상세보기
	@RequestMapping("/messagecontent")
	public String messagecontent(@RequestParam String messageno, Model model) {
		model.addAttribute("messageContent", md.select(Integer.parseInt(messageno)));
		md.update(Integer.parseInt(messageno));
		return "message/messageContent";
	}

	// 보낸메시지 상세보기
	@RequestMapping("/messagesendcontent")
	public String messagesendcontent(@RequestParam String messageno, Model model) {
		model.addAttribute("messagesendContent", md.select(Integer.parseInt(messageno)));
		return "message/messagesendContent";
	}

	// 메시지 삭제
	@RequestMapping("messagedelete")
	public String messagedeleteForm(@RequestParam String messageno) throws SQLException {
		if (md.delete(Integer.parseInt(messageno))) {
			return "redirect:messagelist";
		}
		return "redirect:messagelist";
	}
}
