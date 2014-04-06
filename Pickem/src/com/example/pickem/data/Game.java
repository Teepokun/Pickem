package com.example.pickem.data;


public class Game {
	private Team home;
	private Team away;
	
	private double odds;

	public Team getHome() {
		return home;
	}

	public void setHome(Team home) {
		this.home = home;
	}

	public Team getAway() {
		return away;
	}

	public void setAway(Team away) {
		this.away = away;
	}

	public double getOdds() {
		return odds;
	}

	public void setOdds(double odds) {
		this.odds = odds;
	}
	
	
}
