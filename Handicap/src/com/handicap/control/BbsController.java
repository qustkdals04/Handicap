package com.handicap.control;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.FileVO;
import com.handicap.model.dao.BbsCommentDAO;
import com.handicap.model.dao.BbsDAO;
import com.handicap.model.dao.FileDAO;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO bd;
	@Autowired
	private BbsCommentDAO bcd;
	@Autowired
	private FileDAO fd;	
	private FileVO fv;
	
	@RequestMapping("/bbsNoticeWriteForm") 
	  public String bbsNoticeWrite() {
	  return "bbs/bbsNoticeWriteForm"; 
	  }
	  
	  // 공지사항 글쓰기
	@RequestMapping("/bbsNoticeWrite")
	public String bbsNoticeWrite(BbsVO bv, FileVO fv,HttpServletRequest req,@RequestParam String bbsflag) throws Exception {		
		
		// 먼저 파일 업로드, 폴더는 미리 만드세요
		// 스프링의 MultipartFile을 이용한 업로드
		List<MultipartFile> files = fv.getFiles();
		Map map = new HashMap();	
		
		//boardService.insertBoard(uploadForm);
		if(bbsflag.equals("bbsNoticeWrite")){					
				if(bd.insert(bv)){
					
					if (null != files && files.size() > 0) {
						int i = 0;
						for (MultipartFile multipartFile : files) {
							i++;
							String fileName = multipartFile.getOriginalFilename();
						//	int fileid = 
							if (!"".equals(fileName)) {					
								String uuid = UUID.randomUUID().toString().replace("-","");
								String path = req.getSession().getServletContext().getRealPath("/img/" + fileName +uuid);
								File f = new File(path);
								multipartFile.transferTo(f);
								fv.setFilename(fileName);
								fd.insert(fv);
								map.put("no", bd.noticeno());
								map.put("boardno", 10);
								map.put("fileid", fd.fileid());
								fd.fileupload(map);
								//uv.setFileid(fileid);
							}		
						}
					}
					//ModelAndView("main2");
					return "redirect:bbsNoticeList";//리스트로
				}else{				
					//ModelAndView("bbsNoticeWriteForm");
					return "redirect:bbsNoticeWriteForm";
				}			
		}else{
			//return ModelAndView("/bbsNoticeWriteForm");
			//ModelAndView("bbsNoticeWriteForm");
			//return ModelAndView("bbs/bbsNoticeWriteForm");
			//return ModelAndView("redirect:bbs/bbsNoticeWriteForm");
			return "redirect:bbsNoticeWriteForm";
		}
		/*return new ModelAndView("redirect:/bbsNoticeWriteForm");*/
		
	}
	
	@RequestMapping("/bbsNoticeList")
	public String noticelist( Model model) {
		
			List<BbsVO> list = bd.selectAll();
			model.addAttribute("list", list);
			return "bbs/bbsNoticeList";
	}
	
	
	
	
	// 공지사항 상세보기
	
	@RequestMapping("/bbsNoticeContent")
	public String noticecontent(@RequestParam int no,
								@RequestParam int boardno,
								
								//@RequestParam int fileid,
								//FileVO fv,								
								Model model){
		Map map = new HashMap();
		map.put("no", no);
		map.put("boardno", boardno);
		List<FileVO> list = fd.bbsfilename(map);
		model.addAttribute("bbsFileName", list);
		model.addAttribute("bbsNoticeContent", bd.select(no, boardno));
		//fv.setFileid(fileid);
		bd.hitsupdate(no);
		//bd.goodupdate(no);
		return "bbs/bbsNoticeContent";
	}
	
	
	
	@RequestMapping("/bbsNoticeDelete")
	public String noticedelete(@RequestParam int no 
							   ) throws SQLException {
		
		bd.delete(no);
			return "redirect:bbsNoticeList";
		
		/*return "bbs/bbsNoticeDelete";	*/
	}
}
