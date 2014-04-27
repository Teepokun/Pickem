package com.example.pickem.data;

public class SharedObjects {
	public User user;
	
	
	
	protected static SharedObjects instance = null ;
	
	protected SharedObjects() {}
	
	public static SharedObjects getInstance() {
		if(instance == null) {
			instance = new SharedObjects();
		}
		return instance;
	}
}
