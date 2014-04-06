package com.example.pickem;

import java.util.Vector;

import com.example.pickem.adapaters.PoolAdapter;
import com.example.pickem.data.Pool;
import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.Button;

public class JoinPoolActivity extends Activity {

	private PoolAdapter availablePools;
	private Button doneButton;
	private Vector<Pool> pools;
	private SharedObjects shared;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_join_pool);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.join_pool, menu);
		return true;
	}
	
	private void savePoolSelectionsToDB() {}
	
	private void getPoolSelectionsFromDB() {}

}
