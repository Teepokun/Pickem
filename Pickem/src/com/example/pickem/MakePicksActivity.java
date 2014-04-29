package com.example.pickem;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class MakePicksActivity extends Activity {

	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_make_picks);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.make_picks, menu);
		return true;
	}
	
}
