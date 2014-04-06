package com.example.pickem;

import com.example.pickem.adapaters.PoolAdapter;
import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.Button;

public class UserHomeActivity extends Activity {
	private PoolAdapter poolListAdapter;
	private SharedObjects shared;
	private Button joinButton;
	private Button createButton;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_user_home);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.user_home, menu);
		return true;
	}
	
	private void navigateToViewPool() {}
	
	private void navigateToCreatePool() {}
	
	private void navigateToJoinPool() {}
	
	private void onClick(View v) {}
	
	

}
