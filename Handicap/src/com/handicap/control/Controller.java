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
	//怨듭??궗?빆
	private BbsDAO bd;	
	private BbsCommentDAO bcd;
	
	//?쉶?썝愿??젴
	
	@RequestMapping("/register") //?쉶?썝媛??엯?젙蹂? ?뼸?뼱?삤湲?
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
		//?쑀?슚?꽦 寃??궗
		return false;
	}
	@RequestMapping("/login") //濡쒓렇?씤 泥섎━
	public boolean login(@RequestParam String userid,
						 @RequestParam String passwd
												){
		
		return false;
	}
	@RequestMapping("/logout") //濡쒓렇?븘?썐 ?뻽?쓣?븣
	public boolean logout(){
		return false;
	}
	
	@RequestMapping("/idcheck") //以묐났?솗?씤 (?븘?씠?뵒)
	public boolean idcheck(@RequestParam String userid){
		//?엳?쓣?븧 1 ?뾾?쓣?븧0  List ?삎?떇?쓽 蹂??닔?뿉 ?꽔?뼱?꽌 ModelAndView ?삎?깭濡? ?굹???깂
		return false;
	}
	@RequestMapping("/nickcheck") //以묐났?솗?씤 (?땳?꽕?엫)
	public boolean nickcheck(@RequestParam String nickname){
		//?엳?쓣?븧 1 ?뾾?쓣?븧0  List ?삎?떇?쓽 蹂??닔?뿉 ?꽔?뼱?꽌 ModelAndView ?삎?깭濡? ?굹???깂
		return false;
	}
	
	@RequestMapping("/memberdelete") //?쉶?썝?깉?눜
	public boolean memberdelete(@RequestParam String passwd){
		//鍮꾨?踰덊샇媛? ?씪移섏떆 1 ??由щ㈃0  
		return false;
	}
	
	@RequestMapping("/memberupdate") //?쉶?썝?닔?젙
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
	
	@RequestMapping("/mypage") //留덉씠?럹?씠吏?
	public boolean mypage(@RequestParam String nickname){
		//?땳?꽕?엫?쑝濡? ?솢?룞?궡?뿭?쓣 媛??졇?삤?뒗?뜲 ?엳?쓣?떆 議고쉶
		return false;
	}	
	
	//寃뚯떆?뙋愿??젴	
	// 怨듭??궗?빆	
	// 怨듭??궗?빆 Input_Form
	@RequestMapping("/noticeinputForm")
	public String noticenputForm() {
		return "noticeinput_form";
	}

	// 怨듭??궗?빆 insert
	@RequestMapping("/noticeinsert")
	public String noticeinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", "怨듭??궗?빆 寃뚯떆湲??씠 ?삱?씪媛붿뒿?땲?떎.");
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

	// ?닔?젙 ?뤌
	@RequestMapping("noticeupdateform")
	public String noticeupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "noticeupdate";
	}

	// ?닔?젙
	@RequestMapping("noticeupdate")
	public String noticeinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/noticelist";
		else
			return "noticeupdateform";
	}
	// ?궘?젣

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

	// 怨듭??궗?빆 ?걹

	// ?돱?뒪

	// ?돱?뒪 Input_Form

	@RequestMapping("/newsinputForm")
	public String newsinputForm() {
		return "newsinput_form";
	}

	// ?돱?뒪 insert
	@RequestMapping("/newsinsert")
	public String newsinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "newsresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:newsinput";
	}

	// ?돱?뒪 List
	@RequestMapping("newslist")
	public String newslist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("newslist", list);

		}
		return "newslist";
	}

	// ?돱?뒪 ?닔?젙 ?뤌
	@RequestMapping("newsupdateform")
	public String newsupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "newsupdate";
	}

	// ?닔?젙
	@RequestMapping("newsupdate")
	public String newsinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/newslist";
		else
			return "newsupdateform";
	}
	// ?궘?젣

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

	// ?돱?뒪 ?걹

	// ?씪?옄由? ?젙蹂?
	// Input_Form

	@RequestMapping("/jobinputForm")
	public String jobinputForm() {
		return "jobinput_form";
	}

	// ?씪?옄由ъ젙蹂? insert
	@RequestMapping("/jobinsert")
	public String jobinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "jobresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jobinput";
	}

	// ?씪?옄由ъ젙蹂? List
	@RequestMapping("joblist")
	public String joblist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("joblist", list);

		}
		return "joblist";
	}

	// ?돱?뒪 ?닔?젙 ?뤌
	@RequestMapping("jobupdateform")
	public String jobupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "jobupdate";
	}

	// ?닔?젙
	@RequestMapping("jobupdate")
	public String jobinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/joblist";
		else
			return "jobupdateform";
	}
	// ?궘?젣

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

	// ?씪?옄由ъ젙蹂? ?걹

	// ?쓽猷?-嫄곕옒
	// Input_Form

	@RequestMapping("/tradeinputForm")
	public String tradeinputForm() {
		return "tradeinput_form";
	}

	// ?쓽猷?-嫄곕옒 insert
	@RequestMapping("/tradeinsert")
	public String tradeinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "traderesult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:tradeinput";
	}

	// ?쓽猷?-嫄곕옒 List
	@RequestMapping("tradelist")
	public String tradelist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("tradelist", list);

		}
		return "tradelist";
	}

	// ?쓽猷?-嫄곕옒 ?닔?젙 ?뤌
	@RequestMapping("tradeupdateform")
	public String tradeupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "tradeupdate";
	}

	// ?닔?젙
	@RequestMapping("tradeupdate")
	public String tradeinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/tradelist";
		else
			return "tradeupdateform";
	}
	// ?궘?젣

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

	// ?쓽猷?-嫄곕옒 ?걹

	// ?쓽猷?-吏덈Ц
	// Input_Form

	@RequestMapping("/questioninputForm")
	public String questioninputForm() {
		return "questioninput_form";
	}

	// ?쓽猷?-吏덈Ц insert
	@RequestMapping("/questioninsert")
	public String questioninsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "questionresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:questioninput";
	}

	// ?쓽猷?-吏덈Ц List
	@RequestMapping("questionlist")
	public String questionlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("questionlist", list);

		}
		return "questionlist";
	}

	// ?쓽猷?-吏덈Ц ?닔?젙 ?뤌
	@RequestMapping("questionupdateform")
	public String questionupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "questionupdate";
	}

	// ?닔?젙
	@RequestMapping("questionupdate")
	public String questioninsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/questionlist";
		else
			return "questionupdateform";
	}
	// ?궘?젣

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

	// ?쓽猷?-吏덈Ц ?걹

	// ?쓽猷?-?썑湲?
	// Input_Form

	@RequestMapping("/reviewinputForm")
	public String reviewinputForm() {
		return "reviewinput_form";
	}

	// ?쓽猷?-嫄곕옒 insert
	@RequestMapping("/reviewinsert")
	public String reviewinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "reviewresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:reviewinput";
	}

	// ?쓽猷?-?썑湲? List
	@RequestMapping("reviewlist")
	public String reviewlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("reviewlist", list);

		}
		return "reviewlist";
	}

	// ?쓽猷?-?썑湲? ?닔?젙 ?뤌
	@RequestMapping("reviewupdateform")
	public String reviewupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "reviewupdate";
	}

	// ?닔?젙
	@RequestMapping("reviewupdate")
	public String reviewinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/reviewlist";
		else
			return "reviewupdateform";
	}
	// ?궘?젣

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

	// ?쓽猷?-?썑湲? ?걹

	// 寃뚯떆?뙋-?떊泥댁옣?븷
	// Input_Form

	@RequestMapping("/bodyinputForm")
	public String bodyinputForm() {
		return "bodyinput_form";
	}

	// 寃뚯떆?뙋-?떊泥댁옣?븷 insert
	@RequestMapping("/bodyinsert")
	public String bodyinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "bodyresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bodyinput";
	}

	// 寃뚯떆?뙋-?떊泥댁옣?븷 List
	@RequestMapping("bodylist")
	public String bodylist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bodylist", list);

		}
		return "bodylist";
	}

	// 寃뚯떆?뙋-?떊泥댁옣?븷 ?닔?젙 ?뤌
	@RequestMapping("bodyupdateform")
	public String bodyupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bodyupdate";
	}

	// ?닔?젙
	@RequestMapping("bodyupdate")
	public String bodyinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bodylist";
		else
			return "bodyupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?떊泥댁옣?븷 ?걹

	// 寃뚯떆?뙋-?젙?떊?옣?븷
	// Input_Form

	@RequestMapping("/mentalinputForm")
	public String mentalinputForm() {
		return "mentalinput_form";
	}

	// 寃뚯떆?뙋-?젙?떊?옣?븷 insert
	@RequestMapping("/mentalinsert")
	public String mentalinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "mentalresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:mentalinput";
	}

	// 寃뚯떆?뙋-?젙?떊?옣?븷 List
	@RequestMapping("mentallist")
	public String mentallist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("mentallist", list);

		}
		return "mentallist";
	}

	// 寃뚯떆?뙋-?젙?떊?옣?븷 ?닔?젙 ?뤌
	@RequestMapping("mentalupdateform")
	public String mentalupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "mentalupdate";
	}

	// ?닔?젙
	@RequestMapping("mentalupdate")
	public String mentalinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/mentallist";
		else
			return "mentalupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?젙?떊?옣?븷 ?걹

	// 寃뚯떆?뙋-?룞?샇?쉶
	// Input_Form

	@RequestMapping("/clubinputForm")
	public String clubinputForm() {
		return "clubinput_form";
	}

	// 寃뚯떆?뙋-?룞?샇?쉶 insert
	@RequestMapping("/clubinsert")
	public String clubinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "clubresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:clubinput";
	}

	// 寃뚯떆?뙋-?룞?샇?쉶 List
	@RequestMapping("clublist")
	public String clublist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("clublist", list);

		}
		return "clublist";
	}

	// 寃뚯떆?뙋-?룞?샇?쉶 ?닔?젙 ?뤌
	@RequestMapping("clubupdateform")
	public String clubupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "clubupdate";
	}

	// ?닔?젙
	@RequestMapping("clubupdate")
	public String clubinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/clublist";
		else
			return "clubupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?룞?샇?쉶 ?걹

	// 寃뚯떆?뙋-?뿬?뻾
	// Input_Form

	@RequestMapping("/travelinputForm")
	public String travelinputForm() {
		return "travelinput_form";
	}

	// 寃뚯떆?뙋-?뿬?뻾 insert
	@RequestMapping("/travelinsert")
	public String travelinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "travelresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:travelinput";
	}

	// 寃뚯떆?뙋-?뿬?뻾 List
	@RequestMapping("travellist")
	public String travellist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("travellist", list);

		}
		return "travellist";
	}

	// 寃뚯떆?뙋-?뿬?뻾 ?닔?젙 ?뤌
	@RequestMapping("travelupdateform")
	public String travelupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "travelupdate";
	}

	// ?닔?젙
	@RequestMapping("travelupdate")
	public String travelinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/travellist";
		else
			return "travelupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?뿬?뻾 ?걹

	// 怨좉컼?꽱?꽣-Q&A
	// Input_Form

	@RequestMapping("/qnainputForm")
	public String qnainputForm() {
		return "qnainput_form";
	}

	// 怨좉컼?꽱?꽣-Q&A insert
	@RequestMapping("/qnainsert")
	public String qnainsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "qnaresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:qnainput";
	}

	// 怨좉컼?꽱?꽣-Q&A List
	@RequestMapping("qnalist")
	public String qnalist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("qnalist", list);

		}
		return "qnalist";
	}

	// 怨좉컼?꽱?꽣-Q&A ?닔?젙 ?뤌
	@RequestMapping("qnaupdateform")
	public String qnaupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "qnaupdate";
	}

	// ?닔?젙
	@RequestMapping("qnaupdate")
	public String qnainsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/qnalist";
		else
			return "qnaupdateform";
	}
	// ?궘?젣

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

	// 怨좉컼?꽱?꽣-Q&A ?걹

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥?
	// Input_Form

	@RequestMapping("/bbsrequestinputForm")
	public String bbsrequestinputForm() {
		return "bbsrequestinput_form";
	}

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? insert
	@RequestMapping("/bbsrequestinsert")
	public String bbsrequestinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "bbsrequestresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bbsrequestinput";
	}

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? List
	@RequestMapping("bbsrequestlist")
	public String bbsrequestlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("bbsrequestlist", list);

		}
		return "bbsrequestlist";
	}

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? ?닔?젙 ?뤌
	@RequestMapping("bbsrequestupdateform")
	public String bbsrequestupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bbsrequestupdate";
	}

	// ?닔?젙
	@RequestMapping("bbsrequestupdate")
	public String bbsrequestinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bbsrequestlist";
		else
			return "bbsrequestupdateform";
	}
	// ?궘?젣

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
	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? ?걹	
	// 怨듭??궗?빆 由ы뵆

	// 怨듭??궗?빆 由ы뵆 Input_Form
	
	
	@RequestMapping("/noticecommentinputForm")
	public String noticecommentnputForm() {
		return "noticecommentinput_form";
	}

	// 怨듭??궗?빆 由ы뵆 insert
	@RequestMapping("/noticecommentinsert")
	public String noticecommentinsert(Model m, BbsCommentVO b) {

		try {
			if (bcd.insert(b)) {
				m.addAttribute("msg", "怨듭??궗?빆 由ы뵆 寃뚯떆湲??씠 ?삱?씪媛붿뒿?땲?떎.");
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

	// ?닔?젙 ?뤌
	@RequestMapping("noticecommentupdateform")
	public String noticecommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "noticecommentupdate";
	}

	// ?닔?젙
	@RequestMapping("noticecommentupdate")
	public String noticecommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/noticecommentlist";
		else
			return "noticecommentupdateform";
	}
	// ?궘?젣

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

	// 怨듭??궗?빆 由ы뵆 ?걹

	// ?돱?뒪 由ы뵆

	// ?돱?뒪 由ы뵆 Input_Form

	@RequestMapping("/newscommentinputForm")
	public String newscommentinputForm() {
		return "newscommentinput_form";
	}

	// ?돱?뒪 由ы뵆 insert
	@RequestMapping("/newscommentinsert")
	public String newscommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 由ы뵆 ?삱?씪媛붿뒿?땲?떎.");
				return "newscommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:newscommentinput";
	}

	// ?돱?뒪 由ы뵆 List
	@RequestMapping("newscommentlist")
	public String newscommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("newscommentlist", list);

		}
		return "newscommentlist";
	}

	// ?돱?뒪 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("newscommentupdateform")
	public String newscommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "newscommentupdate";
	}

	// ?닔?젙
	@RequestMapping("newscommentupdate")
	public String newscommentinsert(BbsVO bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/newscommentlist";
		else
			return "newscommentupdateform";
	}
	// ?궘?젣

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

	// ?돱?뒪 由ы뵆 ?걹

	// ?씪?옄由? ?젙蹂? 由ы뵆
	// Input_Form

	@RequestMapping("/jobcommentinputForm")
	public String jobcommentinputForm() {
		return "jobcommentinput_form";
	}

	// ?씪?옄由ъ젙蹂? insert
	@RequestMapping("/jobcommentinsert")
	public String jobcommentinsert(Model m, BbsVO b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "jobcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:jobcommentinput";
	}

	// ?씪?옄由ъ젙蹂? List
	@RequestMapping("jobcommentlist")
	public String jobcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("jobcommentlist", list);

		}
		return "jobcommentlist";
	}

	// ?씪?옄由ъ젙蹂? ?닔?젙 ?뤌
	@RequestMapping("jobcommentupdateform")
	public String jobcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "jobcommentupdate";
	}

	// ?닔?젙
	@RequestMapping("jobcommentupdate")
	public String jobcommentinsert(BbsCommentVO bb) throws SQLException {
		if (bcd.update(bb))
			return "redirect:/jobcommentlist";
		else
			return "jobcommentupdateform";
	}
	// ?궘?젣

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

	// ?씪?옄由ъ젙蹂? ?걹

	// ?쓽猷?-嫄곕옒 由ы뵆
	// Input_Form

	@RequestMapping("/tradecommentinputForm")
	public String tradecommentinputForm() {
		return "tradecommentinput_form";
	}

	// ?쓽猷?-嫄곕옒 由ы뵆 insert
	@RequestMapping("/tradecommentinsert")
	public String tradecommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "tradecommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:tradecommentinput";
	}

	// ?쓽猷?-嫄곕옒 由ы뵆 List
	@RequestMapping("tradecommentlist")
	public String tradecommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("tradecommentlist", list);

		}
		return "tradecommentlist";
	}

	// ?쓽猷?-嫄곕옒 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("tradecommentupdateform")
	public String tradecommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "tradecommentupdate";
	}

	// ?닔?젙
	@RequestMapping("tradecommentupdate")
	public String tradecommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/tradecommentlist";
		else
			return "tradecommentupdateform";
	}
	// ?궘?젣

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

	// ?쓽猷?-嫄곕옒 由ы뵆 ?걹

	// ?쓽猷?-吏덈Ц由ы뵆
	// Input_Form

	@RequestMapping("/questioncommentinputForm")
	public String questioncommentinputForm() {
		return "questioncommentinput_form";
	}

	// ?쓽猷?-吏덈Ц由ы뵆 insert
	@RequestMapping("/questioncommentinsert")
	public String questioncommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "questioncommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:questioncommentinput";
	}

	// ?쓽猷?-吏덈Ц由ы뵆 List
	@RequestMapping("questioncommentlist")
	public String questioncommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("questioncommentlist", list);

		}
		return "questioncommentlist";
	}

	// ?쓽猷?-吏덈Ц由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("questioncommentupdateform")
	public String questioncommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "questioncommentupdate";
	}

	// ?닔?젙
	@RequestMapping("questioncommentupdate")
	public String questioncommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/questioncommentlist";
		else
			return "questioncommentupdateform";
	}
	// ?궘?젣

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

	// ?쓽猷?-吏덈Ц由ы뵆 ?걹

	// ?쓽猷?-?썑湲? 由ы뵆
	// Input_Form

	@RequestMapping("/reviewcommentinputForm")
	public String reviewcommentinputForm() {
		return "reviewcommentinput_form";
	}

	// ?쓽猷?-嫄곕옒 insert
	@RequestMapping("/reviewcommentinsert")
	public String reviewcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "reviewcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:reviewcommentinput";
	}

	// ?쓽猷?-?썑湲? 由ы뵆 List
	@RequestMapping("reviewcommentlist")
	public String reviewcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("reviewcommentlist", list);

		}
		return "reviewcommentlist";
	}

	// ?쓽猷?-?썑湲? 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("reviewcommentupdateform")
	public String reviewcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "reviewcommentupdate";
	}

	// ?닔?젙
	@RequestMapping("reviewcommentupdate")
	public String reviewcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/reviewcommentlist";
		else
			return "reviewcommentupdateform";
	}
	// ?궘?젣

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

	// ?쓽猷?-?썑湲? 由ы뵆 ?걹

	// 寃뚯떆?뙋-?떊泥댁옣?븷 由ы뵆
	// Input_Form

	@RequestMapping("/bodycommentinputForm")
	public String bodycommentinputForm() {
		return "bodycommentinput_form";
	}

	// 寃뚯떆?뙋-?떊泥댁옣?븷 由ы뵆 insert
	@RequestMapping("/bodycommentinsert")
	public String bodycommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "bodycommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bodycommentinput";
	}

	// 寃뚯떆?뙋-?떊泥댁옣?븷 由ы뵆 List
	@RequestMapping("bodycommentlist")
	public String bodycommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("bodycommentlist", list);

		}
		return "bodycommentlist";
	}

	// 寃뚯떆?뙋-?떊泥댁옣?븷 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("bodycommentupdateform")
	public String bodycommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bodycommentupdate";
	}

	// ?닔?젙
	@RequestMapping("bodycommentupdate")
	public String bodycommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bodycommentlist";
		else
			return "bodycommentupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?떊泥댁옣?븷 由ы뵆 ?걹

	// 寃뚯떆?뙋-?젙?떊?옣?븷 由ы뵆
	// Input_Form

	@RequestMapping("/headinputForm")
	public String headinputForm() {
		return "headinput_form";
	}

	// 寃뚯떆?뙋-?젙?떊?옣?븷 由ы뵆 insert
	@RequestMapping("/mentalcommentinsert")
	public String mentalcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "mentalcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:mentalcommentinput";
	}

	// 寃뚯떆?뙋-?젙?떊?옣?븷 由ы뵆 List
	@RequestMapping("mentalcommentlist")
	public String mentalcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("mentalcommentlist", list);

		}
		return "mentalcommentlist";
	}

	// 寃뚯떆?뙋-?젙?떊?옣?븷 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("mentalcommentupdateform")
	public String mentalcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "mentalcommentupdate";
	}

	// ?닔?젙
	@RequestMapping("mentalcommentupdate")
	public String mentalcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/mentalcommentlist";
		else
			return "mentalcommentupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?젙?떊?옣?븷 由ы뵆 ?걹

	// 寃뚯떆?뙋-?룞?샇?쉶 由ы뵆
	// Input_Form

	@RequestMapping("/clubcommentinputForm")
	public String clubcommentinputForm() {
		return "clubcommentinput_form";
	}

	// 寃뚯떆?뙋-?룞?샇?쉶 由ы뵆 insert
	@RequestMapping("/clubcommentinsert")
	public String clubcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "clubcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:clubcommentinput";
	}

	// 寃뚯떆?뙋-?룞?샇?쉶 由ы뵆 List
	@RequestMapping("clubcommentlist")
	public String clubcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("clubcommentlist", list);

		}
		return "clubcommentlist";
	}

	// 寃뚯떆?뙋-?룞?샇?쉶 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("clubcommentupdateform")
	public String clubcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "clubcommentupdate";
	}

	// ?닔?젙
	@RequestMapping("clubcommentupdate")
	public String clubcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/clubcommentlist";
		else
			return "clubcommentupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?룞?샇?쉶 由ы뵆 ?걹

	// 寃뚯떆?뙋-?뿬?뻾 由ы뵆
	// Input_Form

	@RequestMapping("/travelcommentinputForm")
	public String travelcommentinputForm() {
		return "travelcommentinput_form";
	}

	// 寃뚯떆?뙋-?뿬?뻾 由ы뵆 insert
	@RequestMapping("/travelcommentinsert")
	public String travelcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "travelcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:travelcommentinput";
	}

	// 寃뚯떆?뙋-?뿬?뻾 由ы뵆 List
	@RequestMapping("travelcommentlist")
	public String travelcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("travelcommentlist", list);

		}
		return "travelcommentlist";
	}

	// 寃뚯떆?뙋-?뿬?뻾 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("travelcommentupdateform")
	public String travelcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "travelcommentupdate";
	}

	// ?닔?젙
	@RequestMapping("travelcommentupdate")
	public String travelcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/travelcommentlist";
		else
			return "travelcommentupdateform";
	}
	// ?궘?젣

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

	// 寃뚯떆?뙋-?뿬?뻾 由ы뵆 ?걹

	// 怨좉컼?꽱?꽣-Q&A由ы뵆
	// Input_Form

	@RequestMapping("/qnacommentinputForm")
	public String qnacommentinputForm() {
		return "qnacommentinput_form";
	}

	// 怨좉컼?꽱?꽣-Q&A由ы뵆 insert
	@RequestMapping("/qnacommentinsert")
	public String qnacommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "qnacommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:qnacommentinput";
	}

	// 怨좉컼?꽱?꽣-Q&A由ы뵆 List
	@RequestMapping("qnacommentlist")
	public String qnacommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("qnacommentlist", list);

		}
		return "qnacommentlist";
	}

	// 怨좉컼?꽱?꽣-Q&A由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("qnacommentupdateform")
	public String qnacommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "qnacommentupdate";
	}

	// ?닔?젙
	@RequestMapping("qnacommentupdate")
	public String qnacommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/qnacommentlist";
		else
			return "qnacommentupdateform";
	}
	// ?궘?젣

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

	// 怨좉컼?꽱?꽣-Q&A由ы뵆 ?걹

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? 由ы뵆
	// Input_Form

	@RequestMapping("/bbsrequestcommentinputForm")
	public String bbsrequestcommentinputForm() {
		return "bbsrequestcommentinput_form";
	}

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? 由ы뵆 insert
	@RequestMapping("/bbsrequestcommentinsert")
	public String bbsrequestcommentinsert(Model m, BbsBean b) {

		try {
			if (bd.insert(b)) {
				m.addAttribute("msg", " ?돱?뒪 ?삱?씪媛붿뒿?땲?떎.");
				return "bbsrequestcommentresult";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:bbsrequestcommentinput";
	}

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? 由ы뵆 List
	@RequestMapping("bbsrequestcommentlist")
	public String bbsrequestcommentlist(@RequestParam int no, int boardno, Model model) {

		if (boardno == 12) {
			List<BbsBean> list = bd.selectAll();
			model.addAttribute("bbsrequestcommentlist", list);

		}
		return "bbsrequestcommentlist";
	}

	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? 由ы뵆 ?닔?젙 ?뤌
	@RequestMapping("bbsrequestcommentupdateform")
	public String bbsrequestcommentupdateForm(@RequestParam int no, int boardno, Model model) {
		model.addAttribute("bbsBean", bd.select(no, boardno));
		return "bbsrequestcommentupdate";
	}

	// ?닔?젙
	@RequestMapping("bbsrequestcommentupdate")
	public String bbsrequestcommentinsert(BbsBean bb) throws SQLException {
		if (bd.update(bb))
			return "redirect:/bbsrequestcommentlist";
		else
			return "bbsrequestcommentupdateform";
	}
	// ?궘?젣

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
  
	
	// 怨좉컼?꽱?꽣-寃뚯떆?뙋 ?슂泥? 由ы뵆 ?걹
	
	private MessageDAO mv;
	// 硫붿떊??
	
	//硫붿떊?? ?옉?꽦
	
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
					m.addAttribute("msg", " ?쟾?넚 ?꽦怨?.");
					return "messageresult";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:messagetinput";
		}
		
	// 紐⑸줉
		
		@RequestMapping("messagelist")
		public String messagelist(@RequestParam  String recipient, Model model) {

				
				List<MessageVO> list = mv.selectAll(recipient);
				model.addAttribute("messagelist", list);
				
			
			return "messagelist";
		}
	// ?궘?젣
		
		@RequestMapping("messagedeleteform")
		public String messagedeleteForm(@RequestParam int messageno, Model model) {
			model.addAttribute("messageVO", mv.select(messageno));
			return "messagedeleteform";
		}
		

	//Message ?걹
		

}