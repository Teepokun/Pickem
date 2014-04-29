package com.example.pickem;



import android.app.ActionBar;
import android.os.Bundle;
import android.app.ActionBar.Tab;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Menu;
import android.view.MenuItem;



public class MainActivity extends Activity implements ActionBar.TabListener{

	private final String tab1Name = "Pools";
	private final String tab3Name = "My Picks";
	private final String tab4Name = "View Stats";
	
	Fragment tab1Fragment;
	Fragment tab3Fragment;
	Fragment tab4Fragment;
	
	AboutUsFragment aboutFragment = new AboutUsFragment();
	HelpFragment helpFragment = new HelpFragment();

	boolean isAboutAttached = false;
	boolean isHelpAttached = false;
	
			
	
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
    	
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("About");
    	
    	ft.replace(android.R.id.content, aboutFragment);
    	ft.commit();
    	
    }

    
    public void onHelpOptionClicked(MenuItem menuItem){
    	//Intent intent = new Intent(this, MainActivity.class);
        //startActivity(intent);
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("Help");
    	
    	ft.replace(android.R.id.content, helpFragment);
    	ft.commit();
    }

    @Override
	public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft){
    	if(helpFragment.isAdded()){
    		ft.hide(helpFragment);
    	}
    	
    	if(aboutFragment.isAdded()){
    		ft.hide(aboutFragment);
    	}
    	
		CharSequence displayName = tab.getText();
		if(displayName.equals(tab1Name)){
			if(tab1Fragment == null){
				tab1Fragment  = new PoolsFragment();
				ft.replace(android.R.id.content, tab1Fragment);
			}
			else{
				ft.attach(tab1Fragment);
				
			}
		}
		
		else if(displayName.equals(tab3Name)){
			if(tab3Fragment == null){
				tab3Fragment  = new PicksFragment();
				ft.replace(android.R.id.content, tab3Fragment);
			}
			else{
				ft.attach(tab3Fragment);
			}
		}
		else if(displayName.equals(tab4Name)){
			if(tab4Fragment == null){
				tab4Fragment  = new UserStatsFragment();
				ft.replace(android.R.id.content, tab4Fragment);
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
