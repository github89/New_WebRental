package com.rental.model;

public class Content {
	
	private Integer firstContent;
	private Integer count;
	
	@Override
	public String toString() {
		return "Content [firstContent=" + firstContent + ", count=" + count
				+ "]";
	}
	
	public Integer getFirstContent() {
		return firstContent;
	}
	public void setFirstContent(Integer firstContent) {
		this.firstContent = firstContent;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}

	
}
