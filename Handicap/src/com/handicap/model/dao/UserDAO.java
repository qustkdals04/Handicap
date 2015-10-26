package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.handicap.model.beans.UserBean;

public interface UserDAO {
	public boolean insert(UserBean user)throws SQLException;
    public boolean delete(String userid)throws SQLException;
    public boolean update(UserBean user)throws SQLException;
    public UserBean select(String userid);//throws SQLException;
    public List<UserBean> selectAll();
}
