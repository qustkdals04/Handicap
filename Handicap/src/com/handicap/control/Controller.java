package com.handicap.control;

import java.sql.SQLException;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.BbsCommentVO;
import com.handicap.model.beans.MessageVO;
import com.handicap.model.dao.BbsCommentDAO;
import com.handicap.model.dao.BbsDAO;
import com.handicap.model.dao.MessageDAO;
import com.handicap.model.dao.UserDAO;

public class Controller {
	UserDAO dao;
	//�⑤벊??沅�?鍮�
	private BbsDAO bd;	
	private BbsCommentDAO bcd;
	
	//?�돳?�뜚�꽴??�졃
	
	@RequestMapping("/register") //?�돳?�뜚揶�??�뿯?�젟癰�? ?堉�?堉�?�궎疫�?
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
		//?��?�뒞?苑� 野�??沅�
		return false;
	}
	@RequestMapping("/login") //嚥≪뮄�젃?�뵥 筌ｌ꼶�봺
	public boolean login(@RequestParam String userid,
						 @RequestParam String passwd
												){
		
		return false;
	}
	@RequestMapping("/logout") //嚥≪뮄�젃?釉�?�뜍 ?六�?�뱽?釉�
	public boolean logout(){
		return false;
	}
	
	@RequestMapping("/idcheck") //餓λ쵎�궗?�넇?�뵥 (?釉�?�뵠?逾�)
	public boolean idcheck(@RequestParam String userid){
		//?�뿳?�뱽?釉� 1 ?毓�?�뱽?釉�0  List ?�굨?�뻼?�벥 癰�??�땾?肉� ?苑�?堉�?苑� ModelAndView ?�굨?源�嚥�? ?援�???源�
		return false;
	}
	@RequestMapping("/nickcheck") //餓λ쵎�궗?�넇?�뵥 (?�빏?苑�?�뿫)
	public boolean nickcheck(@RequestParam String nickname){
		//?�뿳?�뱽?釉� 1 ?毓�?�뱽?釉�0  List ?�굨?�뻼?�벥 癰�??�땾?肉� ?苑�?堉�?苑� ModelAndView ?�굨?源�嚥�? ?援�???源�
		return false;
	}
	
	@RequestMapping("/memberdelete") //?�돳?�뜚?源�?�닚
	public boolean memberdelete(@RequestParam String passwd){
		//�뜮袁�?甕곕뜇�깈揶�? ?�뵬燁살꼷�뻻 1 ??�뵳�됥늺0  
		return false;
	}
	
	@RequestMapping("/memberupdate") //?�돳?�뜚?�땾?�젟
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
	
	@RequestMapping("/mypage") //筌띾뜆�뵠?�읂?�뵠筌�?
	public boolean mypage(@RequestParam String nickname){
		//?�빏?苑�?�뿫?�몵嚥�? ?�넞?猷�?沅�?肉�?�뱽 揶�??議�?�궎?�뮉?�쑓 ?�뿳?�뱽?�뻻 鈺곌퀬�돳
		return false;
	}	
	
	//野껊슣�뻻?�솇�꽴??�졃	
	// �⑤벊??沅�?鍮�	
	// �⑤벊??沅�?鍮� Input_Form
	@RequestMapping("/noticeinputForm")
	public String noticenputForm() {
		return "noticeinput_form";
	}

	// �⑤벊??沅�?鍮� insert
	@RequestMapping("/noticeinsert")
	public String noticeinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", "�⑤벊??沅�?鍮� 野껊슣�뻻疫�??�뵠 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
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

	// ?�땾?�젟 ?琉�
	@RequestMapping("noticeupdateform")
	public String noticeupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "noticeupdate";
	}

	// ?�땾?�젟
	@RequestMapping("noticeupdate")
	public String noticeinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/noticelist";
		else
			return "noticeupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("noticedeleteform")
	public String noticedeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "noticedeleteform";
	}

	@RequestMapping("noticedelete")
	public String noticedelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/noticelist";
		else
			return "noticedeleteform";
	}

	// �⑤벊??沅�?鍮� ?嫄�

	// ?�뤀?�뮞

	// ?�뤀?�뮞 Input_Form

	@RequestMapping("/newsinputForm")
	public String newsinputForm() {
		return "newsinput_form";
	}

	// ?�뤀?�뮞 insert
	@RequestMapping("/newsinsert")
	public String newsinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "newsresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:newsinput";
	}

	// ?�뤀?�뮞 List
	@RequestMapping("newslist")
	public String newslist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("newslist", list);

		}
		return "newslist";
	}

	// ?�뤀?�뮞 ?�땾?�젟 ?琉�
	@RequestMapping("newsupdateform")
	public String newsupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "newsupdate";
	}

	// ?�땾?�젟
	@RequestMapping("newsupdate")
	public String newsinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/newslist";
		else
			return "newsupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("newsdeleteform")
	public String newsdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "newsdeleteform";
	}

	@RequestMapping("newsdelete")
	public String newsdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/newslist";
		else
			return "newsdeleteform";
	}

	// ?�뤀?�뮞 ?嫄�

	// ?�뵬?�쁽�뵳? ?�젟癰�?
	// Input_Form

	@RequestMapping("/jobinputForm")
	public String jobinputForm() {
		return "jobinput_form";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? insert
	@RequestMapping("/jobinsert")
	public String jobinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "jobresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jobinput";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? List
	@RequestMapping("joblist")
	public String joblist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("joblist", list);

		}
		return "joblist";
	}

	// ?�뤀?�뮞 ?�땾?�젟 ?琉�
	@RequestMapping("jobupdateform")
	public String jobupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "jobupdate";
	}

	// ?�땾?�젟
	@RequestMapping("jobupdate")
	public String jobinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/joblist";
		else
			return "jobupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("jobdeleteform")
	public String jobdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "jobdeleteform";
	}

	@RequestMapping("jobdelete")
	public String jobdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/joblist";
		else
			return "jobdeleteform";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? ?嫄�

	// ?�벥�뙴?-椰꾧퀡�삋
	// Input_Form

	@RequestMapping("/tradeinputForm")
	public String tradeinputForm() {
		return "tradeinput_form";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 insert
	@RequestMapping("/tradeinsert")
	public String tradeinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "traderesult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:tradeinput";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 List
	@RequestMapping("tradelist")
	public String tradelist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("tradelist", list);

		}
		return "tradelist";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 ?�땾?�젟 ?琉�
	@RequestMapping("tradeupdateform")
	public String tradeupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "tradeupdate";
	}

	// ?�땾?�젟
	@RequestMapping("tradeupdate")
	public String tradeinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/tradelist";
		else
			return "tradeupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("tradedeleteform")
	public String tradedeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "tradedeleteform";
	}

	@RequestMapping("tradedelete")
	public String tradedelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/tradelist";
		else
			return "tradedeleteform";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 ?嫄�

	// ?�벥�뙴?-筌욌뜄揆
	// Input_Form

	@RequestMapping("/questioninputForm")
	public String questioninputForm() {
		return "questioninput_form";
	}

	// ?�벥�뙴?-筌욌뜄揆 insert
	@RequestMapping("/questioninsert")
	public String questioninsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "questionresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:questioninput";
	}

	// ?�벥�뙴?-筌욌뜄揆 List
	@RequestMapping("questionlist")
	public String questionlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("questionlist", list);

		}
		return "questionlist";
	}

	// ?�벥�뙴?-筌욌뜄揆 ?�땾?�젟 ?琉�
	@RequestMapping("questionupdateform")
	public String questionupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "questionupdate";
	}

	// ?�땾?�젟
	@RequestMapping("questionupdate")
	public String questioninsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/questionlist";
		else
			return "questionupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("questiondeleteform")
	public String questiondeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "questiondeleteform";
	}

	@RequestMapping("questiondelete")
	public String questiondelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/questionlist";
		else
			return "questiondeleteform";
	}

	// ?�벥�뙴?-筌욌뜄揆 ?嫄�

	// ?�벥�뙴?-?�뜎疫�?
	// Input_Form

	@RequestMapping("/reviewinputForm")
	public String reviewinputForm() {
		return "reviewinput_form";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 insert
	@RequestMapping("/reviewinsert")
	public String reviewinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "reviewresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:reviewinput";
	}

	// ?�벥�뙴?-?�뜎疫�? List
	@RequestMapping("reviewlist")
	public String reviewlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("reviewlist", list);

		}
		return "reviewlist";
	}

	// ?�벥�뙴?-?�뜎疫�? ?�땾?�젟 ?琉�
	@RequestMapping("reviewupdateform")
	public String reviewupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "reviewupdate";
	}

	// ?�땾?�젟
	@RequestMapping("reviewupdate")
	public String reviewinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/reviewlist";
		else
			return "reviewupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("reviewdeleteform")
	public String reviewdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "reviewdeleteform";
	}

	@RequestMapping("reviewdelete")
	public String reviewdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/reviewlist";
		else
			return "reviewdeleteform";
	}

	// ?�벥�뙴?-?�뜎疫�? ?嫄�

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉�
	// Input_Form

	@RequestMapping("/bodyinputForm")
	public String bodyinputForm() {
		return "bodyinput_form";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� insert
	@RequestMapping("/bodyinsert")
	public String bodyinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "bodyresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bodyinput";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� List
	@RequestMapping("bodylist")
	public String bodylist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bodylist", list);

		}
		return "bodylist";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� ?�땾?�젟 ?琉�
	@RequestMapping("bodyupdateform")
	public String bodyupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bodyupdate";
	}

	// ?�땾?�젟
	@RequestMapping("bodyupdate")
	public String bodyinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bodylist";
		else
			return "bodyupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("bodydeleteform")
	public String bodydeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bodydeleteform";
	}

	@RequestMapping("bodydelete")
	public String bodydelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bodylist";
		else
			return "bodydeleteform";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� ?嫄�

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉�
	// Input_Form

	@RequestMapping("/mentalinputForm")
	public String mentalinputForm() {
		return "mentalinput_form";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� insert
	@RequestMapping("/mentalinsert")
	public String mentalinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "mentalresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:mentalinput";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� List
	@RequestMapping("mentallist")
	public String mentallist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("mentallist", list);

		}
		return "mentallist";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� ?�땾?�젟 ?琉�
	@RequestMapping("mentalupdateform")
	public String mentalupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "mentalupdate";
	}

	// ?�땾?�젟
	@RequestMapping("mentalupdate")
	public String mentalinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/mentallist";
		else
			return "mentalupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("mentaldeleteform")
	public String mentaldeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "mentaldeleteform";
	}

	@RequestMapping("mentaldelete")
	public String mentaldelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/mentallist";
		else
			return "mentaldeleteform";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� ?嫄�

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳
	// Input_Form

	@RequestMapping("/clubinputForm")
	public String clubinputForm() {
		return "clubinput_form";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 insert
	@RequestMapping("/clubinsert")
	public String clubinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "clubresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:clubinput";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 List
	@RequestMapping("clublist")
	public String clublist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("clublist", list);

		}
		return "clublist";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 ?�땾?�젟 ?琉�
	@RequestMapping("clubupdateform")
	public String clubupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "clubupdate";
	}

	// ?�땾?�젟
	@RequestMapping("clubupdate")
	public String clubinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/clublist";
		else
			return "clubupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("clubdeleteform")
	public String clubdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "clubdeleteform";
	}

	@RequestMapping("clubdelete")
	public String clubdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/clublist";
		else
			return "clubdeleteform";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 ?嫄�

	// 野껊슣�뻻?�솇-?肉�?六�
	// Input_Form

	@RequestMapping("/travelinputForm")
	public String travelinputForm() {
		return "travelinput_form";
	}

	// 野껊슣�뻻?�솇-?肉�?六� insert
	@RequestMapping("/travelinsert")
	public String travelinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "travelresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:travelinput";
	}

	// 野껊슣�뻻?�솇-?肉�?六� List
	@RequestMapping("travellist")
	public String travellist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("travellist", list);

		}
		return "travellist";
	}

	// 野껊슣�뻻?�솇-?肉�?六� ?�땾?�젟 ?琉�
	@RequestMapping("travelupdateform")
	public String travelupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "travelupdate";
	}

	// ?�땾?�젟
	@RequestMapping("travelupdate")
	public String travelinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/travellist";
		else
			return "travelupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("traveldeleteform")
	public String traveldeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "traveldeleteform";
	}

	@RequestMapping("traveldelete")
	public String traveldelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/travellist";
		else
			return "traveldeleteform";
	}

	// 野껊슣�뻻?�솇-?肉�?六� ?嫄�

	// �⑥쥒而�?苑�?苑�-Q&A
	// Input_Form

	@RequestMapping("/qnainputForm")
	public String qnainputForm() {
		return "qnainput_form";
	}

	// �⑥쥒而�?苑�?苑�-Q&A insert
	@RequestMapping("/qnainsert")
	public String qnainsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "qnaresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:qnainput";
	}

	// �⑥쥒而�?苑�?苑�-Q&A List
	@RequestMapping("qnalist")
	public String qnalist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("qnalist", list);

		}
		return "qnalist";
	}

	// �⑥쥒而�?苑�?苑�-Q&A ?�땾?�젟 ?琉�
	@RequestMapping("qnaupdateform")
	public String qnaupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "qnaupdate";
	}

	// ?�땾?�젟
	@RequestMapping("qnaupdate")
	public String qnainsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/qnalist";
		else
			return "qnaupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("qnadeleteform")
	public String qnadeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "qnadeleteform";
	}

	@RequestMapping("qnadelete")
	public String qnadelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/qnalist";
		else
			return "qnadeleteform";
	}

	// �⑥쥒而�?苑�?苑�-Q&A ?嫄�

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�?
	// Input_Form

	@RequestMapping("/bbsrequestinputForm")
	public String bbsrequestinputForm() {
		return "bbsrequestinput_form";
	}

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? insert
	@RequestMapping("/bbsrequestinsert")
	public String bbsrequestinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "bbsrequestresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bbsrequestinput";
	}

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? List
	@RequestMapping("bbsrequestlist")
	public String bbsrequestlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bbsrequestlist", list);

		}
		return "bbsrequestlist";
	}

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? ?�땾?�젟 ?琉�
	@RequestMapping("bbsrequestupdateform")
	public String bbsrequestupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bbsrequestupdate";
	}

	// ?�땾?�젟
	@RequestMapping("bbsrequestupdate")
	public String bbsrequestinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bbsrequestlist";
		else
			return "bbsrequestupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("bbsrequestdeleteform")
	public String bbsrequestdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bbsrequestdeleteform";
	}

	@RequestMapping("bbsrequestdelete")
	public String bbsrequestdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bbsrequestlist";
		else
			return "bbsrequestdeleteform";
	}
 // ------------------bbs end ------------------------------------------------
 // ---------------------------------- comment -------------------------------
	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? ?嫄�	
	// �⑤벊??沅�?鍮� �뵳�뗫탣

	// �⑤벊??沅�?鍮� �뵳�뗫탣 Input_Form
	
	
	@RequestMapping("/noticecommentinputForm")
	public String noticecommentnputForm() {
		return "noticecommentinput_form";
	}

	// �⑤벊??沅�?鍮� �뵳�뗫탣 insert
	@RequestMapping("/noticecommentinsert")
	public String noticecommentinsert(Model m, BbsCommentVO b) {

		try {
			if (bcd.insert(b)) {
				m.addAttribute("msg", "�⑤벊??沅�?鍮� �뵳�뗫탣 野껊슣�뻻疫�??�뵠 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
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
			List<BbsCommentVO> list = bcd.selectAll();
			model.addAttribute("noticecommentlist", list);

		}
		return "noticecommentlist";
	}

	// ?�땾?�젟 ?琉�
	@RequestMapping("noticecommentupdateform")
	public String noticecommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "noticecommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("noticecommentupdate")
	public String noticecommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/noticecommentlist";
		else
			return "noticecommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("noticecommentdeleteform")
	public String noticecommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "noticecommentdeleteform";
	}

	@RequestMapping("noticecommentdelete")
	public String noticecommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/noticecommentlist";
		else
			return "noticecommentdeleteform";
	}

	// �⑤벊??沅�?鍮� �뵳�뗫탣 ?嫄�

	// ?�뤀?�뮞 �뵳�뗫탣

	// ?�뤀?�뮞 �뵳�뗫탣 Input_Form

	@RequestMapping("/newscommentinputForm")
	public String newscommentinputForm() {
		return "newscommentinput_form";
	}

	// ?�뤀?�뮞 �뵳�뗫탣 insert
	@RequestMapping("/newscommentinsert")
	public String newscommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 �뵳�뗫탣 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "newscommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:newscommentinput";
	}

	// ?�뤀?�뮞 �뵳�뗫탣 List
	@RequestMapping("newscommentlist")
	public String newscommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("newscommentlist", list);

		}
		return "newscommentlist";
	}

	// ?�뤀?�뮞 �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("newscommentupdateform")
	public String newscommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "newscommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("newscommentupdate")
	public String newscommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/newscommentlist";
		else
			return "newscommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("newscommentdeleteform")
	public String newscommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "newscommentdeleteform";
	}

	@RequestMapping("newscommentdelete")
	public String newscommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/newscommentlist";
		else
			return "newscommentdeleteform";
	}

	// ?�뤀?�뮞 �뵳�뗫탣 ?嫄�

	// ?�뵬?�쁽�뵳? ?�젟癰�? �뵳�뗫탣
	// Input_Form

	@RequestMapping("/jobcommentinputForm")
	public String jobcommentinputForm() {
		return "jobcommentinput_form";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? insert
	@RequestMapping("/jobcommentinsert")
	public String jobcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "jobcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jobcommentinput";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? List
	@RequestMapping("jobcommentlist")
	public String jobcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("jobcommentlist", list);

		}
		return "jobcommentlist";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? ?�땾?�젟 ?琉�
	@RequestMapping("jobcommentupdateform")
	public String jobcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "jobcommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("jobcommentupdate")
	public String jobcommentinsert(BbsCommentVO bb) throws SQLException {
		if (bcd.update(bb))
			return "redirect:/jobcommentlist";
		else
			return "jobcommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("jobcommentdeleteform")
	public String jobcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "jobcommentdeleteform";
	}

	@RequestMapping("jobcommentdelete")
	public String jobcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/jobcommentlist";
		else
			return "jobcommentdeleteform";
	}

	// ?�뵬?�쁽�뵳�딆젟癰�? ?嫄�

	// ?�벥�뙴?-椰꾧퀡�삋 �뵳�뗫탣
	// Input_Form

	@RequestMapping("/tradecommentinputForm")
	public String tradecommentinputForm() {
		return "tradecommentinput_form";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 �뵳�뗫탣 insert
	@RequestMapping("/tradecommentinsert")
	public String tradecommentinsert(Model m, BbsCommentVO bcv) {

		try {
			if (bcd.insert(bcv)) {
				m.addAttribute("msg", "ok");
				return "tradecommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:tradecommentinput";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 �뵳�뗫탣 List
	@RequestMapping("tradecommentlist")
	public String tradecommentlist(@RequestParam int boardno, int no, Model model) {

		if () {
			List<BbsCommentVO> list = bcd.selectAll();
			model.addAttribute("tradecommentlist", list);
			
		}
		return "tradecommentlist";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("tradecommentupdateform")
	public String tradecommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "tradecommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("tradecommentupdate")
	public String tradecommentinsert(BbsCommentVO bvo) throws SQLException {
		if (bcd.update(bvo))
			return "redirect:/tradecommentlist";
		else
			return "tradecommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("tradecommentdeleteform")
	public String tradecommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "tradecommentdeleteform";
	}

	@RequestMapping("tradecommentdelete")
	public String tradecommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/tradecommentlist";
		else
			return "tradecommentdeleteform";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 �뵳�뗫탣 ?嫄�

	// ?�벥�뙴?-筌욌뜄揆�뵳�뗫탣
	// Input_Form

	@RequestMapping("/questioncommentinputForm")
	public String questioncommentinputForm() {
		return "questioncommentinput_form";
	}

	// ?�벥�뙴?-筌욌뜄揆�뵳�뗫탣 insert
	@RequestMapping("/questioncommentinsert")
	public String questioncommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "questioncommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:questioncommentinput";
	}

	// ?�벥�뙴?-筌욌뜄揆�뵳�뗫탣 List
	@RequestMapping("questioncommentlist")
	public String questioncommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("questioncommentlist", list);

		}
		return "questioncommentlist";
	}

	// ?�벥�뙴?-筌욌뜄揆�뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("questioncommentupdateform")
	public String questioncommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "questioncommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("questioncommentupdate")
	public String questioncommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/questioncommentlist";
		else
			return "questioncommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("questioncommentdeleteform")
	public String questioncommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "questioncommentdeleteform";
	}

	@RequestMapping("questioncommentdelete")
	public String questioncommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/questioncommentlist";
		else
			return "questioncommentdeleteform";
	}

	// ?�벥�뙴?-筌욌뜄揆�뵳�뗫탣 ?嫄�

	// ?�벥�뙴?-?�뜎疫�? �뵳�뗫탣
	// Input_Form

	@RequestMapping("/reviewcommentinputForm")
	public String reviewcommentinputForm() {
		return "reviewcommentinput_form";
	}

	// ?�벥�뙴?-椰꾧퀡�삋 insert
	@RequestMapping("/reviewcommentinsert")
	public String reviewcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "reviewcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:reviewcommentinput";
	}

	// ?�벥�뙴?-?�뜎疫�? �뵳�뗫탣 List
	@RequestMapping("reviewcommentlist")
	public String reviewcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("reviewcommentlist", list);

		}
		return "reviewcommentlist";
	}

	// ?�벥�뙴?-?�뜎疫�? �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("reviewcommentupdateform")
	public String reviewcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "reviewcommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("reviewcommentupdate")
	public String reviewcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/reviewcommentlist";
		else
			return "reviewcommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("reviewcommentdeleteform")
	public String reviewcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "reviewcommentdeleteform";
	}

	@RequestMapping("reviewcommentdelete")
	public String reviewcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/reviewcommentlist";
		else
			return "reviewcommentdeleteform";
	}

	// ?�벥�뙴?-?�뜎疫�? �뵳�뗫탣 ?嫄�

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� �뵳�뗫탣
	// Input_Form

	@RequestMapping("/bodycommentinputForm")
	public String bodycommentinputForm() {
		return "bodycommentinput_form";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� �뵳�뗫탣 insert
	@RequestMapping("/bodycommentinsert")
	public String bodycommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "bodycommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bodycommentinput";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� �뵳�뗫탣 List
	@RequestMapping("bodycommentlist")
	public String bodycommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("bodycommentlist", list);

		}
		return "bodycommentlist";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("bodycommentupdateform")
	public String bodycommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bodycommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("bodycommentupdate")
	public String bodycommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bodycommentlist";
		else
			return "bodycommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("bodycommentdeleteform")
	public String bodycommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bodycommentdeleteform";
	}

	@RequestMapping("bodycommentdelete")
	public String bodycommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bodycommentlist";
		else
			return "bodycommentdeleteform";
	}

	// 野껊슣�뻻?�솇-?�뻿筌ｋ똻�삢?釉� �뵳�뗫탣 ?嫄�

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� �뵳�뗫탣
	// Input_Form

	@RequestMapping("/headinputForm")
	public String headinputForm() {
		return "headinput_form";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� �뵳�뗫탣 insert
	@RequestMapping("/mentalcommentinsert")
	public String mentalcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "mentalcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:mentalcommentinput";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� �뵳�뗫탣 List
	@RequestMapping("mentalcommentlist")
	public String mentalcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("mentalcommentlist", list);

		}
		return "mentalcommentlist";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("mentalcommentupdateform")
	public String mentalcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "mentalcommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("mentalcommentupdate")
	public String mentalcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/mentalcommentlist";
		else
			return "mentalcommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("mentalcommentdeleteform")
	public String mentalcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "mentalcommentdeleteform";
	}

	@RequestMapping("mentalcommentdelete")
	public String mentalcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/mentalcommentlist";
		else
			return "mentalcommentdeleteform";
	}

	// 野껊슣�뻻?�솇-?�젟?�뻿?�삢?釉� �뵳�뗫탣 ?嫄�

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 �뵳�뗫탣
	// Input_Form

	@RequestMapping("/clubcommentinputForm")
	public String clubcommentinputForm() {
		return "clubcommentinput_form";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 �뵳�뗫탣 insert
	@RequestMapping("/clubcommentinsert")
	public String clubcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "clubcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:clubcommentinput";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 �뵳�뗫탣 List
	@RequestMapping("clubcommentlist")
	public String clubcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("clubcommentlist", list);

		}
		return "clubcommentlist";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("clubcommentupdateform")
	public String clubcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "clubcommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("clubcommentupdate")
	public String clubcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/clubcommentlist";
		else
			return "clubcommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("clubcommentdeleteform")
	public String clubcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "clubcommentdeleteform";
	}

	@RequestMapping("clubcommentdelete")
	public String clubcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/clubcommentlist";
		else
			return "clubcommentdeleteform";
	}

	// 野껊슣�뻻?�솇-?猷�?�깈?�돳 �뵳�뗫탣 ?嫄�

	// 野껊슣�뻻?�솇-?肉�?六� �뵳�뗫탣
	// Input_Form

	@RequestMapping("/travelcommentinputForm")
	public String travelcommentinputForm() {
		return "travelcommentinput_form";
	}

	// 野껊슣�뻻?�솇-?肉�?六� �뵳�뗫탣 insert
	@RequestMapping("/travelcommentinsert")
	public String travelcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "travelcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:travelcommentinput";
	}

	// 野껊슣�뻻?�솇-?肉�?六� �뵳�뗫탣 List
	@RequestMapping("travelcommentlist")
	public String travelcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("travelcommentlist", list);

		}
		return "travelcommentlist";
	}

	// 野껊슣�뻻?�솇-?肉�?六� �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("travelcommentupdateform")
	public String travelcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "travelcommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("travelcommentupdate")
	public String travelcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/travelcommentlist";
		else
			return "travelcommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("travelcommentdeleteform")
	public String travelcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "travelcommentdeleteform";
	}

	@RequestMapping("travelcommentdelete")
	public String travelcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/travelcommentlist";
		else
			return "travelcommentdeleteform";
	}

	// 野껊슣�뻻?�솇-?肉�?六� �뵳�뗫탣 ?嫄�

	// �⑥쥒而�?苑�?苑�-Q&A�뵳�뗫탣
	// Input_Form

	@RequestMapping("/qnacommentinputForm")
	public String qnacommentinputForm() {
		return "qnacommentinput_form";
	}

	// �⑥쥒而�?苑�?苑�-Q&A�뵳�뗫탣 insert
	@RequestMapping("/qnacommentinsert")
	public String qnacommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "qnacommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:qnacommentinput";
	}

	// �⑥쥒而�?苑�?苑�-Q&A�뵳�뗫탣 List
	@RequestMapping("qnacommentlist")
	public String qnacommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("qnacommentlist", list);

		}
		return "qnacommentlist";
	}

	// �⑥쥒而�?苑�?苑�-Q&A�뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("qnacommentupdateform")
	public String qnacommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "qnacommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("qnacommentupdate")
	public String qnacommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/qnacommentlist";
		else
			return "qnacommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("qnacommentdeleteform")
	public String qnacommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "qnacommentdeleteform";
	}

	@RequestMapping("qnacommentdelete")
	public String qnacommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/qnacommentlist";
		else
			return "qnacommentdeleteform";
	}

	// �⑥쥒而�?苑�?苑�-Q&A�뵳�뗫탣 ?嫄�

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? �뵳�뗫탣
	// Input_Form

	@RequestMapping("/bbsrequestcommentinputForm")
	public String bbsrequestcommentinputForm() {
		return "bbsrequestcommentinput_form";
	}

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? �뵳�뗫탣 insert
	@RequestMapping("/bbsrequestcommentinsert")
	public String bbsrequestcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?�뤀?�뮞 ?�궞?�뵬揶쏅뗄�뮸?�빍?�뼄.");
				return "bbsrequestcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bbsrequestcommentinput";
	}

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? �뵳�뗫탣 List
	@RequestMapping("bbsrequestcommentlist")
	public String bbsrequestcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("bbsrequestcommentlist", list);

		}
		return "bbsrequestcommentlist";
	}

	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? �뵳�뗫탣 ?�땾?�젟 ?琉�
	@RequestMapping("bbsrequestcommentupdateform")
	public String bbsrequestcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bbsrequestcommentupdate";
	}

	// ?�땾?�젟
	@RequestMapping("bbsrequestcommentupdate")
	public String bbsrequestcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bbsrequestcommentlist";
		else
			return "bbsrequestcommentupdateform";
	}
	// ?沅�?�젫

	@RequestMapping("bbsrequestcommentdeleteform")
	public String bbsrequestcommentdeleteForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bbsrequestcommentdeleteform";
	}

	@RequestMapping("bbsrequestcommentdelete")
	public String bbsrequestcommentdelete(int no, int boardno) throws SQLException {
		if (bd.delete(no, boardno))
			return "redirect:/bbsrequestcommentlist";
		else
			return "bbsrequestcommentdeleteform";
	}
  
	
	// �⑥쥒而�?苑�?苑�-野껊슣�뻻?�솇 ?�뒄筌�? �뵳�뗫탣 ?嫄�
	
	private MessageDAO mv;
	// 筌롫뗄�뻿??
	
	//筌롫뗄�뻿?? ?�삂?苑�
	
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
					m.addAttribute("msg", " ?�읈?�꽊 ?苑���?.");
					return "messageresult";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:messagetinput";
		}
		
	// 筌뤴뫖以�
		
		@RequestMapping("messagelist")
		public String messagelist(@RequestParam  String recipient, Model model) {

				
				List<MessageVO> list = mv.selectAll(recipient);
				model.addAttribute("messagelist", list);
				
			
			return "messagelist";
		}
	// ?沅�?�젫
		
		@RequestMapping("messagedeleteform")
		public String messagedeleteForm(@RequestParam int messageno, Model model) {
			model.addAttribute("messageVO", mv.select(messageno));
			return "messagedeleteform";
		}
		

	//Message ?嫄�
		

}