package com.ajax.entity;

import java.sql.Date;

public class Phim {
	private int id;
	private String title;
	private String category;
	private String img;
	private Date releaseDate;
	private String description;
	public Phim() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Phim(int id, String title, String category, String img, Date releaseDate, String description) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.img = img;
		this.releaseDate = releaseDate;
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Phim [id=" + id + ", title=" + title + ", category=" + category + ", img=" + img + ", releaseDate="
				+ releaseDate + ", description=" + description + "]";
	}
	
	
	
}
