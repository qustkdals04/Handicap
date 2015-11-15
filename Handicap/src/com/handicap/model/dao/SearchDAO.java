package com.handicap.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.BbsVO;

public class SearchDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BbsVO> searchTitle(String keyword){
		return sqlSession.selectList("user.searchtitle", "%"+keyword+"%");
	}
	public List<BbsVO> searchContents(String keyword){
		return sqlSession.selectList("user.searchcontents", "%"+keyword+"%");
	}
	public List<BbsVO> searchTotal(String keyword){
		return sqlSession.selectList("user.searchtotal", "%"+keyword+"%");		
	}
}
