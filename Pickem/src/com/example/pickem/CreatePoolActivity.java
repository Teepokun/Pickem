package com.example.pickem;

import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;

public class CreatePoolActivity extends Activity {
	private SharedObjects shared;
	 
	private TextView nameTextView;
	private EditText nameExitTextView;
	
	private DatePicker deadlineDatePicker;
	private TextView deadlineTextView;
	
	private CheckBox privateCheckBox;
	private TextView privateTextView;
	
	private TextView passwordTextView;
	private EditText passwordEditText;
	
	private Button saveButton;
	private Button cancelButton;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_create_pool);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.create_pool, menu);
		return true;
	}
	
	private void onClick() {}

	private void savePoolToDB() { }
	
}
