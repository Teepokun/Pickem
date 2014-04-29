package com.example.pickem;



import android.app.ActionBar;
import android.os.Bundle;
import android.app.ActionBar.Tab;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.view.Menu;
import android.view.MenuItem;


/**
 * Class that handles the Main Activity - the heart of the User Interface. 
 * Nearly all views in the app are linked with this. 
 */

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
	
			
	
	/**
     * Handles initial creation of activity and click listeners for the buttons
     * @param savedInstanceState if the activity was previously
     * created, its previous state will be passed in here, otherwise it's null
     */
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
    
    /**
     * creates tabs and places them on the action bar for app-wide navigation.
     * @param actionBar the action bar
     * @param displayName the name on the tab
     * 
     */
    private void CreateTab(ActionBar actionBar, String displayName){
		ActionBar.Tab newTab = actionBar.newTab();
		newTab.setText(displayName);
		newTab.setTabListener(this);
		actionBar.addTab(newTab);
	}


    /**
     * Handles initial creation of activity's menu if different from main. 
     * @param menu menu item
     * @return true if options menu was successfully created
     */
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
     
    /**
     * Click listener for the about button on the action bar. 
     * @param menuItem 
     * 
     */
    public void onAboutOptionClicked(MenuItem menuItem){
    	
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("About");
    	
    	ft.replace(android.R.id.content, aboutFragment);
    	ft.commit();
    	
    }

    /**
     * Click listener for the help button on the action bar. 
     * @param menuItem 
     * 
     */
    public void onHelpOptionClicked(MenuItem menuItem){
    	//Intent intent = new Intent(this, MainActivity.class);
        //startActivity(intent);
    	FragmentManager fm = getFragmentManager();
    	FragmentTransaction ft = fm.beginTransaction();
    	ft.addToBackStack("Help");
    	
    	ft.replace(android.R.id.content, helpFragment);
    	ft.commit();
    }

    /**
     * Handles logic for when various tabs are selected - attaches or detaches fragments as necessary.
     * @param tab the tab selected
     * @param ft the fragment transaction which handles the attaching and detaching
     * 
     */
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

  
    /**
     * Handles logic for when tabs are clicked on when they are already selected - they do nothing
     * @param tab the tab selected
     * @param ft the fragment transaction which handles the attaching and detaching
     * 
     */
	@Override
	public void onTabReselected(Tab tab, FragmentTransaction ft) {
		
	}

	/**
     * Handles detaches the current fragment when a new tab is selected.
     * @param tab the tab selected
     * @param ft the fragment transaction which handles the attaching and detaching
     * 
     */
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
