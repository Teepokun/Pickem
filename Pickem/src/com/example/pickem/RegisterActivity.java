package com.example.pickem;


import com.example.pickem.db.DBManager;
import com.example.pickem.db.TaskCompletedListener;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Class that handles user registration. Offers a sign-up form and links 
 * to the DB on successfull completion of registration. 
 * @author Sara Landset, David Lindemann
 *
 */
public class RegisterActivity extends Activity implements TaskCompletedListener{

	
	private String firstname;
	private String lastname;
	private String user;
	private String password;
	private String email;
	private Context savedContext;
	
	/**
     * Handles initial creation of activity and click listeners for the buttons
     * @param savedInstanceState if the activity was previously
     * created, its previous state will be passed in here, otherwise it's null
     */
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_register);
		
		savedContext = this.getApplicationContext();
		findViewById(R.id.RegisterActivity_Cancel_Button).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						Intent intent = new Intent(view.getContext(), LoginActivity.class);
						startActivity(intent);
					}
				});
		
		findViewById(R.id.RegisterActivity_Submit_Button).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						registerUserToDB();
					}
				});
		
		
	}

    /**
     * Handles initial creation of activity's menu if different from main. 
     * @param menu menu item
     * @return true if options menu was successfully created
     */
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.register, menu);
		return true;
	}
	
	/**
     * adding user to DB, checks all input for possible errors before registration is complete
     * 
     */
	private void registerUserToDB() {
		boolean cancel = false;
		firstname = ((EditText) findViewById(R.id.RegistrationActivity_FirstName_Entry)).getText().toString();
		lastname = ((EditText) findViewById(R.id.RegistrationActivity_LastName_Entry)).getText().toString();
		user = ((EditText) findViewById(R.id.RegistrationActivity_Username_Entry)).getText().toString();
		String password1 = ((EditText) findViewById(R.id.RegistrationActivity_Password_Entry)).getText().toString();
		String password2 = ((EditText) findViewById(R.id.RegistrationActivity_ConfirmPassword_Entry)).getText().toString();
		email = ((EditText) findViewById(R.id.RegistrationActivity_Email_Entry)).getText().toString();
		
		if(firstname == null || lastname == null || user == null || password1 == null || password2 == null || email == null) {
			cancel = true;
			Toast toast = Toast.makeText(this, "Please check your input", Toast.LENGTH_LONG);
			toast.show();
		}
		
		if(!cancel) {
			if(firstname.equals("") || lastname.equals("") || user.equals("")  || password1.equals("") || password2.equals("") || email.equals("")) {
				cancel = true;
				Toast toast = Toast.makeText(this, "Please check your input", Toast.LENGTH_LONG);
				toast.show();
			}
		}
		
		if(!cancel) {
			if(password1.equals(password2)) {
				password = password1;
			}
			else {
				cancel = true;
				Toast.makeText(this, "Passwords do not match", Toast.LENGTH_LONG).show();
			}
		}
		
		if(!cancel) {
			DBManager db = new DBManager();
			db.userExists(user, email, this);
		}

	}

	/**
     * Observer method which allows for the Asynchronous 
     * tasks to notify the caller when they are done executing
     */
	@Override
	public void onNotifyTaskCompleted(Object o) {
		String array[] = (String[]) o;
		if(array[0].equals("1") && array[1].equals("1")) {
			Toast.makeText(this, "User and Email already used", Toast.LENGTH_LONG).show();;
		}
		else if (array[0].equals("1")) {
			Toast.makeText(this, "Email already used", Toast.LENGTH_LONG).show();;
		}
		else if (array[1].equals("1")) {
			Toast.makeText(this, "User already used", Toast.LENGTH_LONG).show();
		}
		else {
			DBManager manager = new DBManager();
			manager.addUserAccount(firstname, lastname, user, password, email, new TaskCompletedListener() {

				@Override
				public void onNotifyTaskCompleted(Object o) {
					Intent i = new Intent(savedContext, LoginActivity.class);
					startActivity(i);
				}
				
			});
		}
		
	}
	
	

}
