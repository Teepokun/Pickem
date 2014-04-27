package com.example.pickem;

import com.example.pickem.data.SharedObjects;

import android.app.ActionBar;
import android.os.Bundle;
import android.app.ActionBar.Tab;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;


public class MainActivity extends Activity implements ActionBar.TabListener{
	private EditText userNameEditText;
	private EditText passwordEditText;
	private TextView userNameTextView;
	private TextView password;
	private Button loginButton;
	private Button registerButton;
	private Button helpButton;
	private Button aboutButton;
	private SharedObjects shared;
	
	private final String tab1Name = "Pools";
	private final String tab3Name = "My Picks";
	private final String tab4Name = "View Stats";
	
	Fragment tab1Fragment;
	Fragment tab3Fragment;
	Fragment tab4Fragment;

	
			
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActionBar actionBar = getActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
        
        CreateTab(actionBar, tab1Name);
        CreateTab(actionBar, tab3Name);
        CreateTab(actionBar, tab4Name);
        setContentView(R.layout.activity_main);
    }
    
    private void CreateTab(ActionBar actionBar, String displayName){
		ActionBar.Tab newTab = actionBar.newTab();
		newTab.setText(displayName);
		newTab.setTabListener(this);
		actionBar.addTab(newTab);
	}


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    
    /*public void onPoolsClick(MenuItem menuItem) {
    	Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    	PoolsFragment fragment = new PoolsFragment();
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("Pools");
    	
    	ft.replace(android.R.id.content, fragment);
    	ft.commit();
     }*/

    /*public void onPicksClick(MenuItem menuItem) {
    	Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    	PicksFragment fragment = new PicksFragment();
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("Picks");
    	
    	ft.replace(android.R.id.content, fragment);
    	ft.commit();
     }*/
    
    /*public void onUserStatsClick(MenuItem menuItem) {
    	Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    	UserStatsFragment fragment = new UserStatsFragment();
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("Stats");
    	
    	ft.replace(android.R.id.content, fragment);
    	ft.commit();
     }*/
  
    
    
    public void onAboutOptionClicked(MenuItem menuItem){
    	Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    	AboutUsFragment fragment = new AboutUsFragment();
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("About");
    	
    	ft.replace(android.R.id.content, fragment);
    	ft.commit();
    }

    
    public void onHelpOptionClicked(MenuItem menuItem){
    	Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    	HelpFragment fragment = new HelpFragment();
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("Help");
    	
    	ft.replace(android.R.id.content, fragment);
    	ft.commit();
    }

    @Override
	public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft){
		CharSequence displayName = tab.getText();
		if(displayName.equals(tab1Name)){
			if(tab1Fragment == null){
				tab1Fragment  = new PoolsFragment();
				ft.add(android.R.id.content, tab1Fragment);
			}
			else{
				ft.attach(tab1Fragment);
			}
		}
		
		else if(displayName.equals(tab3Name)){
			if(tab3Fragment == null){
				tab3Fragment  = new PicksFragment();
				ft.add(android.R.id.content, tab3Fragment);
			}
			else{
				ft.attach(tab3Fragment);
			}
		}
		else if(displayName.equals(tab4Name)){
			if(tab4Fragment == null){
				tab4Fragment  = new UserStatsFragment();
				ft.add(android.R.id.content, tab4Fragment);
			}
			else{
				ft.attach(tab4Fragment);
			}
		}
	}

  
  
	@Override
	public void onTabReselected(Tab tab, FragmentTransaction ft) {
		
	}

	@Override
	public void onTabUnselected(Tab tab, FragmentTransaction ft) {
		CharSequence displayName = tab.getText();

        if(displayName.equals(tab1Name)) {
            ft.detach(tab1Fragment);
        }
       
        else if (displayName.equals(tab3Name)) {
            ft.detach(tab3Fragment);
        }
        else if (displayName.equals(tab4Name)) {
            ft.detach(tab4Fragment);
        }
		
	}



    
}
