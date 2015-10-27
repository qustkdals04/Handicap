package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;


import com.handicap.model.beans.BbsVO;

public interface BbsDAO {
	public boolean insert(BbsVO bbs)throws SQLException;
    public boolean delete(int no, int boardno)throws SQLException;
    public boolean update(BbsVO bbs)throws SQLException;
    public BbsVO select(int no, int boardno);//throws SQLException;
    public List<BbsVO> selectAll();
}
