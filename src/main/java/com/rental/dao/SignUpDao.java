package com.rental.dao;

import javax.sql.DataSource;

import com.rental.model.User;

public interface SignUpDao {

	public void setDataSource(DataSource ds);
	
	public void insertUserInfo(User user);	
	
}
