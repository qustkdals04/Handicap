package com.handicap.model.dao;

import java.util.List;

public class IntergrationDAO {

	public List search(String keyword){
		return null;
	}
	public boolean checkId(String id){
		return false;
	}
	
	public List zipCode(String area3){
		return null;
	}
	
	public List getContents(String id){
		return null;
	}
	
	public List getComments(String id){
		return null;
	}
	
	public String findID(String name, String email){
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
		return null;
	}
	
	public boolean login(String id, String pw){
		//id검색하고 pw일치하나확인하고 
		return false;
	}
}
