package com.example.pickem.data;

import java.util.Vector;


public class Pool implements Comparable<Object> {
	private Vector<User> members;
	private Vector<Conference> conferences;
	private Commissioner commissioner;
	
	
	@Override
	public int compareTo(Object arg0) {
		// TODO Auto-generated method stub
		return 0;
	}


	public Vector<User> getMembers() {
		return members;
	}


	public void setMembers(Vector<User> members) {
		this.members = members;
	}


	public Vector<Conference> getConferences() {
		return conferences;
	}


	public void addConference(Conference conference) {
		this.conferences.add(conference);
	}


	public Commissioner getCommissioner() {
		return commissioner;
	}


	public void setCommissioner(Commissioner commissioner) {
		this.commissioner = commissioner;
	}
	
}
