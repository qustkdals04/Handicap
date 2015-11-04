package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.ZipcodeVO;

import com.handicap.model.beans.MessageVO;

public class ZipcodeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ZipcodeVO> findAddress(String dong) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.findAddress", "%"+dong+"%");
	}
}