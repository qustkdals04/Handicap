package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.BbsVO;

public class BbsDAO {

   @Autowired
   private SqlSession sqlSession;
   
   public boolean insert(BbsVO bbs) throws SQLException {
      int result;
      if (sqlSession.selectOne("bbs.bbsNo", bbs.getBoardno())!=null){
         result = sqlSession.selectOne("bbs.bbsNo", bbs.getBoardno());
         bbs.setNo(result+1);
      }
      else{
         bbs.setNo(1);
      }      
      result = sqlSession.insert("bbs.bbsWrite", bbs);
      if(result==1) return true;
      return false;
   }

   public boolean delete(Map map) throws SQLException {
	      // TODO Auto-generated method stub
	   	  try{
		      sqlSession.delete("bbs.bbsFileDelete", map);
		      sqlSession.delete("bbs.bbsEvalDelete", map);
		      sqlSession.delete("bbs.bbsCommentDelete", map);
	   	  }
	   	  catch (Exception e){
	   		  
	   	  }
	   	  finally{
	   		  sqlSession.delete("bbs.bbsDelete", map);
	   	  }
	      return true;
	   }

   public boolean update(BbsVO bbs) throws SQLException {      
      int t = sqlSession.update("bbs.bbsUpdate", bbs);
      if(t > 0) return true;
      return false;
   }

   public BbsVO select(Map map) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("bbs.bbsContent",map);
   }
   
   public List<BbsVO> selectAll(Map map) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("bbs.bbsList", map) ;
   }
   
   public int bbsListCount(int boardno) {
      return sqlSession.selectOne("bbs.bbsListCount", boardno);
   }
   
   public List<BbsVO> selectAll(String region) {
      // TODO Auto-generated method stub
      //�씪�옄由ъ젙蹂� 吏��뿭蹂� 由ъ뒪�듃異쒕젰
      return null;
   }

   public boolean hitsupdate(int no){
      // TODO Auto-generated method stub
      int hit = sqlSession.update("bbs.bbsHitPlus", no);
      
      return false;
   }
  
   public int writeno(int boardno) {
      int result;
      switch (boardno){
      case 10: result = sqlSession.selectOne("bbs.noticeno");break;
      case 40: result = sqlSession.selectOne("bbs.bodyno");break;
      case 42: result = sqlSession.selectOne("bbs.clubno");break;
      case 20: result = sqlSession.selectOne("bbs.jobno");break;
      case 41: result = sqlSession.selectOne("bbs.mentalno");break;
      case 11: result = sqlSession.selectOne("bbs.newsno");break;
      case 50: result = sqlSession.selectOne("bbs.no");break;
      case 30: result = sqlSession.selectOne("bbs.noticeno");break;
      case 32: result = sqlSession.selectOne("bbs.noticeno");break;
      case 31: result = sqlSession.selectOne("bbs.noticeno");break;
      case 51: result = sqlSession.selectOne("bbs.noticeno");break;
      default: result = sqlSession.selectOne("bbs.travelno");break;
      }
      return result;
   }
   
	public int goodupdate(Map map) {
		 

		return sqlSession.update("bbs.good", map);
	}

   public int badupdate(Map map){
        
       
       return sqlSession.update("bbs.bad", map);
    }   
 
 public boolean gblimit(BbsVO bv){
    
    int result;
       
    result = sqlSession.insert("bbs.gblimit", bv);
       
       return false;
 }
 public String gbsearch(BbsVO bv){
	
	 String result;
	 result = sqlSession.selectOne("bbs.gbsearch",bv);
	 return result;
	  
 }
 
 public int statusupdate(Map map){
	 
	 return sqlSession.update("bbs.bbsStatusUpdate",map);
 }
}