package com.handicap.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.handicap.model.beans.UserBean;

public class UserDAOImpl implements UserDAO {

	@Override
	public boolean insert(UserBean user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String userid) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(UserBean user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserBean select(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserBean> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
