package com.example.pickem.data;


public class Team {
	private String name;
	private Conference conference;
	private String record;
	private String image;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Conference getConference() {
		return conference;
	}
	public void setConference(Conference conference) {
		this.conference = conference;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
