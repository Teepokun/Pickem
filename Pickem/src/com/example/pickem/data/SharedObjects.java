package com.example.pickem.data;

public class SharedObjects {
	public User currentUser;
	protected static SharedObjects instance = null ;
	
	protected SharedObjects() {}
	
	public SharedObjects getInstance() {
		if(instance == null) {
			instance = new SharedObjects();
		}
		return instance;
	}
}
