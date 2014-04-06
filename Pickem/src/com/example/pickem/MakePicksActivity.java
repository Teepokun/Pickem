package com.example.pickem;

import java.util.Vector;

import com.example.pickem.adapaters.PicksAdapter;
import com.example.pickem.data.Pick;
import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.Button;

public class MakePicksActivity extends Activity {

	private PicksAdapter picksAdapter;
	private Button saveButton;
	private Vector<Pick> picks;
	private SharedObjects shared;
	
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
	
	private void savePicksToDB() {}
	
	private void getPicksFromDB() {}
	
	private void savePickToDB() {	}
}
