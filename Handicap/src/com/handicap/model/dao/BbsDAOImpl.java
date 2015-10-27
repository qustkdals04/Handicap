package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.handicap.model.beans.BbsVO;

public class BbsDAOImpl implements BbsDAO {

	@Override
	public boolean insert(BbsVO bbs) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int no, int boardno) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(BbsVO bbs) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BbsVO select(int no, int boardno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<BbsVO> selectAll(String region) {
		// TODO Auto-generated method stub
		//�씪�옄由ъ젙蹂� 吏��뿭蹂� 由ъ뒪�듃異쒕젰
		return null;
	}

}
