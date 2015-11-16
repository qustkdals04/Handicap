package com.handicap.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.handicap.model.beans.BbsCommentVO;
import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.FileVO;
import com.handicap.model.beans.RowNumVO;
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
     
   @RequestMapping("/bbsWrite")
   public String bbsWrite(BbsVO bv, FileVO fv, HttpServletRequest req) throws Exception {
      List<MultipartFile> files = fv.getFiles();
      Map map = new HashMap();
      if(bd.insert(bv)){
         if (null != files && files.size() > 0) {
            int i = 0;
            for (MultipartFile multipartFile : files) {
               i++;
               String fileName = multipartFile.getOriginalFilename();
            //   int fileid = 
               if (!"".equals(fileName)) {               
                  String uuid = UUID.randomUUID().toString().replace("-","");
                  String path = req.getSession().getServletContext().getRealPath("/img/" + uuid + fileName);
                  File f = new File(path);
                  multipartFile.transferTo(f);
                  fv.setFilename(fileName);
                  fv.setFileoriginal(uuid + fileName);
                  fd.insert(fv);
                  //uv.setFileid(fileid);
               }      
            }
         }
         //ModelAndView("main2");
         return "redirect:bbsList";//由ъ뒪�듃濡�
      }else{            
         //ModelAndView("bbsNoticeWriteForm");
         return "redirect:bbsNoticeWriteForm";
      }      
   }
   
   @RequestMapping("/bbsList")
   public String bbsList(HttpSession session, Model model, HttpServletRequest request) {       
	   if(request.getParameter("boardno")!=null){
    	   session.setAttribute("boardno", Integer.parseInt(request.getParameter("boardno")));
       }       
	   int boardno = (int) session.getAttribute("boardno");
         int pagesize = 10;
         int pagegroup = 10;
         String pageNumber = request.getParameter("pageNumber");
         int pageNum = 1;
         if (pageNumber != null){
            pageNum = Integer.parseInt(pageNumber);
         }
         int totalCount = bd.bbsListCount(boardno);
         int totalPageCount = totalCount / pagesize;
         if (totalCount % pagesize != 0){
            totalPageCount++;
         }
         int startPage = (pageNum - 1) / pagegroup * pagegroup + 1;
         int endPage = startPage + (pagegroup - 1);
         if (endPage > totalPageCount) {
            endPage = totalPageCount;
         }
         int endRow = pagesize * pageNum;
         int startRow = endRow - pagesize + 1;
         RowNumVO rowNumVO = new RowNumVO();
         rowNumVO.setStartRow(startRow);
         rowNumVO.setEndRow(endRow);
         Map map = new HashMap();
         map.put("boardno", boardno);
         map.put("startRow", startRow);
         map.put("endRow", endRow);
         List<BbsVO> list = bd.selectAll(map);
         model.addAttribute("messageCount", list.size());
         model.addAttribute("totalPageCount", totalPageCount);
         model.addAttribute("startPage", startPage);
         model.addAttribute("endPage", endPage);
         model.addAttribute("list", list);
         return "bbs/bbsNoticeList";
   }
   
   
   
   
   // 怨듭��궗�빆 �긽�꽭蹂닿린
   
   @RequestMapping("/bbsContent")
   public String bbscontent(@RequestParam int no,
                        @RequestParam int boardno,
                        HttpServletRequest request,
                        //@RequestParam int fileid,
                        //FileVO fv,                        
                        Model model, HttpSession session){
	   
	  session.setAttribute("boardno", request.getParameter("boardno"));
      Map map = new HashMap();
      map.put("no", no);
      map.put("boardno", boardno);
      List<FileVO> list = fd.bbsFileList(map);
      model.addAttribute("bbsFileName", list);
      model.addAttribute("bbsContent", bd.select(map));
      //fv.setFileid(fileid);
      bd.hitsupdate(no);
      //bd.goodupdate(no);
      int pagesize = 10;
      int pagegroup = 10;
      String pageNumber = request.getParameter("pageNumber");
      int pageNum = 1;
      if (pageNumber != null){
         pageNum = Integer.parseInt(pageNumber);
      }
      int totalCount = bcd.commentListCount(map);
      int totalPageCount = totalCount / pagesize;
      if (totalCount % pagesize != 0){
         totalPageCount++;
      }
      int startPage = (pageNum - 1) / pagegroup * pagegroup + 1;
      int endPage = startPage + (pagegroup - 1);
      if (endPage > totalPageCount) {
         endPage = totalPageCount;
      }
      int endRow = pagesize * pageNum;
      int startRow = endRow - pagesize + 1;
      RowNumVO rowNumVO = new RowNumVO();
      rowNumVO.setStartRow(startRow);
      rowNumVO.setEndRow(endRow);
      map.put("startRow", startRow);
      map.put("endRow", endRow);
      List<BbsCommentVO> commentlist = bcd.selectAll(map);
      model.addAttribute("messageCount", commentlist.size());
      model.addAttribute("totalPageCount", totalPageCount);
      model.addAttribute("startPage", startPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("list", commentlist);
      return "bbs/bbsNoticeContent";
   }
   
   @RequestMapping("/bbsDelete")
   public String bbsdelete(@RequestParam int no,
         @RequestParam int boardno) throws SQLException {
      Map map = new HashMap();
      map.put("no", no);
      map.put("boardno", boardno);
      bd.delete(map);
      return "redirect:bbsList";
   }
   
   @RequestMapping("/bbsUpdateForm")
    public String bbsNoticeUpdateForm(@RequestParam int no,
                               @RequestParam int boardno,
                               Model model){
	   Map map = new HashMap();	   
	   map.put("no", no);
	   map.put("boardno", boardno);
	   List<FileVO> list = fd.bbsFileList(map);
	   model.addAttribute("bbsFileName", list);
       model.addAttribute("bbsNoticeUpdateForm", bd.select(map));
       return "bbs/bbsNoticeUpdateForm";
    }   
    
    //공지사항게시판 글수정처리
    @RequestMapping("/bbsUpdate")
    public String bbsUpdate(BbsVO bv) throws SQLException {
       bd.update(bv);         
       return "redirect:bbsList";
    }
    
    @RequestMapping("/commentDelete")
    public String commentdelete(@RequestParam int commentno,
          @RequestParam int no,
            @RequestParam int boardno) throws SQLException {
       bcd.delete(commentno);
       return "redirect:bbsContent?no=" + no + "&boardno=" + boardno;
    }
    
    @RequestMapping("/commentWrite")
    public String commentWrite(BbsCommentVO bcv, HttpSession session) throws Exception {
       bcv.setAuthor(session.getAttribute("memberid").toString());
       bcd.insert(bcv);
       return "redirect:bbsContent?no=" + bcv.getNo() + "&boardno=" + bcv.getBoardno();
    }
    
    
    @RequestMapping("/bbsgood")
    public String bbsgood(@RequestParam int no,
            @RequestParam int boardno,
            BbsVO bv
            ) throws SQLException, IOException
    {
        Map map = new HashMap();
        map.put("no", no);
        map.put("boardno", boardno);
        bd.gblimit(bv);
        bd.goodupdate(map);
      return "redirect:bbsContent?no=" + no + "&boardno=" + boardno;
    }
     
     @RequestMapping("/bbsbad")
     public String bbsbad(@RequestParam int no,
             @RequestParam int boardno,           
             BbsVO bv) throws SQLException{                 
        Map map = new HashMap();
         map.put("no", no);
         map.put("boardno", boardno);        
                     
         bd.gblimit(bv);
         bd.badupdate(map);
        
       return "redirect:bbsContent?no=" + no + "&boardno=" + boardno;
       
     }
     
     @RequestMapping("/gbsearch")
     public String gbsearch(@RequestParam int no,
             @RequestParam int boardno, @RequestParam String userid, Model model){
        Map map = new HashMap();
        map.put("no", no);
         map.put("boardno", boardno);
         map.put("userid", userid);
         if (bd.gbsearch(map) == 1){
            model.addAttribute("isgb", true);
         }
         else if(bd.gbsearch(map) == 0){
            model.addAttribute("isgb", false);
         }       
        return "bbs/isgb";
     }
    
    @RequestMapping("/statusupdate")
    public String statusupdate(@RequestParam int no,
    							@RequestParam int boardno){
    	Map map = new HashMap();
   	 	map.put("no", no);
        map.put("boardno", boardno);
    	bd.statusupdate(map);
    	return "redirect:bbsContent?no=" + no + "&boardno=" + boardno;
    }
    
}