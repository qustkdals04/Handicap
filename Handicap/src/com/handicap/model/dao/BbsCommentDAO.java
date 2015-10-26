package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.handicap.model.beans.BbsCommentBean;

public class BbsCommentDAO {
	public boolean insert(BbsCommentBean comment)throws SQLException{
		return false;
	}
    public boolean delete(int comno, int boardno, int no)throws SQLException{
    	return false;
    }
    public boolean update(BbsCommentBean comment)throws SQLException{
    	return false;
    }
    public BbsCommentBean select(int comno, int boardno, int no){//throws SQLException;
    	return null;
    }
    public List<BbsCommentBean> selectAll(){
    	return null;
    }
}
