package com.handicap.model.dao;

import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class IntergrationDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List search(String keyword){
		//사이트 전체적으로 검색
		//검색창에 입력한 값을 받아서 select문으로 작성후 list형식으로 뿌림 
		return null;
	}
	
	public boolean checkId(String id){
		//입력한 아이디가 DB에 있는지 체크(ID 중복체크)
		if(true){
			//id.equals();
			System.out.println("동일한 id가 존재합니다.");
		}else{
			System.out.println("사용가능한 아이디 입니다.");
		}
		return false;
	}
	
	public List zipCode(String area3){
		//우편번호 
		return null;
	}
	
	public List getContents(String id){
		//id로 검색후 내가 작성한 글을 가져옴 
		
		if(id.equals(id)){//뒤에id는 DB에 비교해야됨 
			//DB에서 select 문으로 가져와서 list 형식으로 뿌려짐 
		}else{
			System.out.println("작성 하신 글이 없습니다.");
		}
		return null;
	}
	
	public List getComments(String id){
		//id로 검색후 내가 작성한  댓글 가져옴 
		if(id.equals(id)){//뒤에id는 DB에 비교해야됨 
			//DB에서 select 문으로 가져와서 list 형식으로 뿌려짐 
		}else{
			System.out.println("작성 하신 글이 없습니다.");
		}
		
		return null;
	}
	
	public String findID(String name, String email){
		//아이디 찾기 
		//이름 이랑 이메일 을 받아서 db에 확인후 맞으면  새페이지 에 id기재
		String sql = "select email from member where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	       
	    try{
	    	
	    }catch(Exception e){
	    	try {
				conn.close();
				pstmt.close();
				rset.close();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
	    }
		return null;
	}
	
	public void isMatch(String id, String panswer){
		//check 일치하나체크하고 일치하면
		if(true){
			findPW(id);
		}
		else{
			//틀렷다
		}
	}
	public String findPW(String id){
		//pw찾기
		//id 입력후 db에 값과 동일할시 abc12**이런형태로 새페이지에 기재함
		String sql = "select id from member where id=?";
		return null;
	}
	
	public boolean login(String id, String pw){
		//id검색하고 pw일치하나확인하고  일치할시 홈페이지로 이동 
		//로그인 버튼이 로그아웃 버튼이로 바뀜
		String sql = "select id,pw from member where id=?";
		if(id.equals(sql)){
			
		}
		return false;
	}
}
