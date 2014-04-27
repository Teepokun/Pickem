package com.example.pickem;

import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class RegisterActivity extends Activity {

	private SharedObjects shared;
	
	private EditText emailEditText;
	private TextView emailTextView;
	
	private EditText userEditText;
	private TextView userTextView;
	
	private EditText passwordEditText;
	private TextView passwordTextView;
	
	private Button registerButton;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_register);
		
		findViewById(R.id.RegisterActivity_Cancel_Button).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						Intent intent = new Intent(view.getContext(), LoginActivity.class);
						startActivity(intent);
					}
				});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.register, menu);
		return true;
	}
	
	private void registerUserToDB() {
		
	}
	
	private boolean validateUniqueUser() { return true;}

}
