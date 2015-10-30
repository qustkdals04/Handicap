package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.UserVO;

public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insert(UserVO user) throws SQLException {
		int t = sqlSession.insert("user.insertuser", user);
		if(t==1) return true;
		return false;
	}

	@Override
	public boolean delete(String userid) throws SQLException {
		int t = sqlSession.delete("user.delete",userid);
		if(t>0) return true;//name�� primary key��� if(t==1)
		return false;
	}

	@Override
	public boolean update(UserVO user) throws SQLException {
		int t = sqlSession.update("user.update",user);
		if(t>0) return true;
		return false;
	}

	@Override
	public UserVO select(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.select", userid);
	}	
	@Override
	public String findPasswd(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.findPasswd", userid);
	}

	@Override
	public List<UserVO> selectAllNick() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.selectNick");
	}

	@Override
	public List<UserVO> selectAllId() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.selectId");
	}

	@Override
	public String selectNick(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.findNick", userid);
	}

	@Override
	public String findNick(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.findNick", userid);
	}
}
