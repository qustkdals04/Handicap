package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.BbsVO;
import com.handicap.model.beans.UserVO;

public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insert(UserVO user) throws SQLException {
		int t = sqlSession.insert("user.insert", user);
		if (t == 1)
			return true;
		return false;
	}

	@Override
	public boolean delete(String userid) throws SQLException {
		int t = sqlSession.delete("user.memberdelete", userid);
		if (t > 0)
			return true;// name�� primary key��� if(t==1)
		return false;
	}

	@Override
	public boolean update(UserVO user) throws SQLException {
		int t = sqlSession.update("user.memberupdate", user);
		if (t > 0)
			return true;
		return false;
	}

	@Override
	public UserVO select(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.selectmember", userid);
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
	public List<UserVO> selectAllNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.selectNo");
	}

	@Override
	public String findNick(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.findNick", userid);
	}

	@Override
	public String searchId(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.searchId", map);
	}

	@Override
	public String searchPw(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.searchPw", map);
	}

	@Override
	public int searchGrade(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.searchGrade", userid);
	}

	@Override
	public String findId(String nickname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.findId", nickname);
	}

	@Override
	public UserVO mypage(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.myprofile", userid);
	}

	@Override
	public boolean profileupdate(Map map) {
		// TODO Auto-generated method stub
		int t = sqlSession.update("user.profileupdate", map);
		if (t > 0) return true;
		return false;
	}

	@Override
	public String profile(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.getprofile", userid);
	}

	@Override
	public List<BbsVO> mybbs(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.mybbs",userid);
	}
}
