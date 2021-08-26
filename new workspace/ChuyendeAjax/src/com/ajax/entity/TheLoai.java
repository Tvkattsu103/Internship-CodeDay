package com.ajax.entity;

public class TheLoai {
	private int cid;
	private String categoryName;
	public TheLoai() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TheLoai(int cid, String categoryName) {
		super();
		this.cid = cid;
		this.categoryName = categoryName;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "TheLoai [cid=" + cid + ", categoryName=" + categoryName + "]";
	}
	
	
}
