package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.handicap.model.beans.UserVO;

public interface UserDAO {
	public boolean insert(UserVO user) throws SQLException;// 일반회원가입

	public boolean delete(String nickname) throws SQLException;// 회원탈퇴

	public boolean update(UserVO user) throws SQLException;// 회원정보수정

	public UserVO select(String userid);

	public String findPasswd(String userid);// 아이디에 맞는 패스워드 찾아오기

	public List<UserVO> selectAllId();// 모든아이디가져오기(아이디중복체크)

	public List<UserVO> selectAllNick();// 모든닉네임가져오기(닉네임중복체크)

	public List<UserVO> selectAllNo();

	public String findNick(String userid);// 아이디에 맞는 닉네임가져오기

	public String searchId(Map map);// 아이디 찾기

	public String searchPw(Map map);// 패스워드 찾기

	public int searchGrade(String userid);// 아이디에 맞는 회원등급 가져오기
}
