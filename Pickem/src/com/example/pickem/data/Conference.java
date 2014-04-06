package com.example.pickem.data;

import java.util.Vector;


public class Conference {
	private Vector<Team> teams;
	
	public Conference() {
		this.teams = new Vector<Team>();
	}
	
	public Vector<Team> getTeams() {
		return teams;
	}
	
	public void addTeam(Team team) {
		teams.add(team);
	}
}
