package com.example.pickem.data;


public class Game {
	private final String home;
	private final String away;
	private final String date;
	private final String odds;
	
	public Game(String home, String away, String date, String odds) {
		this.home = home;
		this.away = away;
		this.date = date;
		this.odds = odds;
	}
	
	public String getHome() {
		return home;
	}
	public String getAway() {
		return away;
	}
	public String getDate() {
		return date;
	}
	public String getOdds() {
		return odds;
	}
	
}
