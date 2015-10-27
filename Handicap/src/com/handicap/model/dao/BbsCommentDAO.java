package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;


import com.handicap.model.beans.BbsCommentVO;

public class BbsCommentDAO {
	public boolean insert(BbsCommentVO comment)throws SQLException{
		return false;
	}
    public boolean delete(int comno, int boardno, int no)throws SQLException{
    	return false;
    }
    public boolean update(BbsCommentVO comment)throws SQLException{
    	return false;
    }
    public BbsCommentVO select(int comno, int boardno, int no){//throws SQLException;
    	return null;
    }
    public List<BbsCommentVO> selectAll(){
    	return null;
    }
}
