package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.BbsCommentVO;

public class BbsCommentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(BbsCommentVO comment)throws SQLException{
	      sqlSession.insert("bbs.commentInsert", comment);
	      return true;
	   }

	public boolean delete(int commentno) throws SQLException {
		sqlSession.delete("bbs.commentDelete", commentno);
		return true;
	}

	public boolean update(BbsCommentVO comment)throws SQLException{
    	return false;
    }
    public BbsCommentVO select(int commentno, int boardno, int no){//throws SQLException;
    	return null;
    }
    public List<BbsCommentVO> selectAll(Map map){
        return sqlSession.selectList("bbs.commentList", map) ;
     }
    
    public int commentListCount(Map map) {
        return sqlSession.selectOne("bbs.commentListCount", map);
     }
}
