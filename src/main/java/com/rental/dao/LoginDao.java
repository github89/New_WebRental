package com.rental.dao;

import javax.sql.DataSource;

import com.rental.model.User;

public interface LoginDao {

	public void setDataSource(DataSource ds);
	
	public User getUserInfo(String userId);	
	
}
