package com.example.pickem.data;

public class Team {
	private final String name;
	private final String conference;
	private final String record;
	private final String logo;
	
	public Team(String name, String conference, String record, String logo) {
		this.name = name;
		this.conference = conference;
		this.record = record;
		this.logo = logo;
	}
	
	public String getName() {
		return name;
	}
	public String getConference() {
		return conference;
	}
	public String getRecord() {
		return record;
	}
	public String getLogo() {
		return logo;
	}
	
	public String toString() {
		String name = "Team name: " + this.name + "\n";
		String conference = "Conference: " + this.conference + "\n";
		String record = "Record: " + this.record + "\n";
		String logo = "Logo: " + this.logo + "\n";
		String spacer = "---------------";
		
		return name + conference + record + logo + spacer;
	}
}
