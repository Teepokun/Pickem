package com.example.pickem;

import com.example.pickem.adapaters.StandingAdapter;
import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.Button;
import android.widget.TextView;

public class PicksActivity extends Activity {

	private TextView name;
	private StandingAdapter standings;
	private Button makePicksButton;
	private SharedObjects shared;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_picks);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.picks, menu);
		return true;
	}
	
	private void navigateToMakePicks() {}
	
	private void onClick() {}
	
	private void getStandingsFromDB() {}

}
