package com.example.pickem;

import com.example.pickem.data.SharedObjects;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {
	private EditText userNameEditText;
	private EditText passwordEditText;
	private TextView userNameTextView;
	private TextView password;
	private Button loginButton;
	private Button registerButton;
	private Button helpButton;
	private Button aboutButton;
	private SharedObjects shared;
	
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    public void onAboutOptionClicked(MenuItem menuItem){}
    
    public void onHelpOptionClicked(MenuItem menuItem){}
    
    
    private void navigateToRegister() {}
    
    private void navigateToAbout() {}
    
    private void navigateToHelp() {}
    
    private void onClick(View v) {
    	
    	
    }
    
}
