package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.BbsVO;

public class BbsDAOImpl implements BbsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(BbsVO bbs) throws SQLException {
		int t = sqlSession.insert("bbs.bbsNoticeWrite", bbs);
		if(t==1) return true;
		return false;
	}

	@Override
	public boolean delete(int no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.delete("bbs.bbsNoticeDelete", no);
		return false;
	}

	@Override
	public boolean update(BbsVO bbs) throws SQLException {		
		int t = sqlSession.update("bbs.bbsNoticeUpdate", bbs);
		if(t > 0) return true;
		return false;
	}

	@Override
	public BbsVO select(int no, int boardno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bbs.bbsNoticeContent",no);
	}
	
	

	@Override
	public List<BbsVO> selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bbs.bbsNoticeList") ;
	}
	
	public List<BbsVO> selectAll(String region) {
		// TODO Auto-generated method stub
		//�씪�옄由ъ젙蹂� 吏��뿭蹂� 由ъ뒪�듃異쒕젰
		return null;
	}

	@Override
	public boolean hitsupdate(int no){
		// TODO Auto-generated method stub
		int hit = sqlSession.update("bbs.bbsNoticeHitPlus", no);
		
		return false;
	}

	@Override
	public boolean goodupdate(int good){
		int t = sqlSession.update("bbs.goodupdate", good);
		
		return false;
	}	
	@Override
	public int noticeno() {
		return sqlSession.selectOne("bbs.noticeno");
	}

}
