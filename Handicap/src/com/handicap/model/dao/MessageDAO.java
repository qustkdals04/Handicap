package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.MessageVO;

public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(MessageVO mvo) throws SQLException {
		// TODO Auto-generated method stub
		//메세지 입력 
		return false;
	}

	
	public boolean delete(int messageno) throws SQLException {
		// TODO Auto-generated method stub
		//메세지 삭제
		return false;
	}



	
	public MessageVO select(int messageno) {
		// TODO Auto-generated method stub
		//메세지 상세보기
		return null;
	}

	
	public List<MessageVO> selectAll(String recipient) {
		// TODO Auto-generated method stub
		//받은 메세지 list 형식으로 뿌림 
		return null;
	}
	
	
	
}
