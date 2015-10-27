package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.BbsCommentVO;

public class BbsCommentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(BbsCommentVO comment)throws SQLException{
		return false;
	}
    public boolean delete(int commentno, int boardno, int no)throws SQLException{
    	return false;
    }
    public boolean update(BbsCommentVO comment)throws SQLException{
    	return false;
    }
    public BbsCommentVO select(int commentno, int boardno, int no){//throws SQLException;
    	return null;
    }
    public List<BbsCommentVO> selectAll(){
    	return null;
    }
}
