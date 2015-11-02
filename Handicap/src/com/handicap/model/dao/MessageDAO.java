package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.handicap.model.beans.MessageVO;

public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insert(MessageVO mvo) throws SQLException {
		// TODO Auto-generated method stub
		//메세지 입력 
		int t = sqlSession.insert("user.messageinsert", mvo);
		if(t==1){
			return true;
		}
		else{
			return false;
		}
	}

	
	public boolean delete(int messageno) throws SQLException {
		// TODO Auto-generated method stub
		//메세지 삭제
		int t = sqlSession.delete("user.messagedelete", messageno);
		if(t==1) return true;
	    return false;
	}
	
	public boolean update(int messageno) {//메시지 읽으면 상태 읽음으로 변경
		int t = sqlSession.update("user.messageupdate", messageno);
		if(t==1) return true;
		return false;
	}

	public int selectCount(String recipient){		
		return sqlSession.selectOne("user.messagecount", recipient);
	}
	
	public MessageVO select(int messageno) {
		// TODO Auto-generated method stub
		//메세지 상세보기
		return sqlSession.selectOne("user.messagecontent",messageno);
	}

	
	public List<MessageVO> selectAll(Map map) {//메시지리스트뿌리기
		return sqlSession.selectList("user.messagelist", map);
	}
	
	
	
}
