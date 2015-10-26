package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.handicap.model.beans.BbsBean;

public class BbsDAOImpl implements BbsDAO {

	@Override
	public boolean insert(BbsBean bbs) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int no, int boardno) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(BbsBean bbs) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BbsBean select(int no, int boardno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsBean> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<BbsBean> selectAll(String region) {
		// TODO Auto-generated method stub
		//일자리정보 지역별 리스트출력
		return null;
	}

}
