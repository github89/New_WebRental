package com.rental.dao;

import java.util.List;

import javax.sql.DataSource;

import com.rental.model.Board;
import com.rental.model.Content;

public interface BoardDao {

	public void setDataSource(DataSource ds);
	
	public List<Board> getBoardInfo(Content content);
	
	public Integer getBoardCount();
	
	public Board getContentInfo(Integer idx);
	
	public void deleteContent(Integer idx);
	
	public void insertContent(Board board);
	
	public void addCount(Board board);
	
}
