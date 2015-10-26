package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.handicap.model.beans.BbsBean;

public interface BbsDAO {
	public boolean insert(BbsBean bbs)throws SQLException;
    public boolean delete(int no, int boardno)throws SQLException;
    public boolean update(BbsBean bbs)throws SQLException;
    public BbsBean select(int no, int boardno);//throws SQLException;
    public List<BbsBean> selectAll();
}
