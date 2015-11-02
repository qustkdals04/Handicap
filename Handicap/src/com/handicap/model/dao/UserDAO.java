package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.handicap.model.beans.UserVO;

public interface UserDAO {
	public boolean insert(UserVO user)throws SQLException;
    public boolean delete(String userid)throws SQLException;
    public boolean update(UserVO user)throws SQLException;
    public UserVO select(String userid);
    public String findPasswd(String userid);//throws SQLException;
    public List<UserVO> selectAllId();
    public List<UserVO> selectAllNick();
    public String selectNick(String userid);
    public String findNick(String userid);
    public String searchId(Map map);
    public String searchPw(Map map);
}
