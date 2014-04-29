package com.example.pickem;

import java.util.List;

import com.example.pickem.data.SharedObjects;
import com.example.pickem.db.DBManager;
import com.example.pickem.db.TaskCompletedListener;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

/**
 * Class that handles the creation and database linking of user's stats allowing them to be keep up to date in real time. 
 * This fragment attaches to the main activity to show this information. 
 * @author Sara Landset
 *
 */
public class UserStatsFragment extends Fragment{
	
	/**
     * Handles initial creation of fragment
     * @param savedInstanceState if the fragment was previously
     * created, its previous state will be passed in here, otherwise it's null
     */
	 @Override
	    public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);

	        setHasOptionsMenu(true);
	    }
	
	/**
	*Handles initial creation of fragment's user interface view
     * @param inflater the LayoutInflater object that inflates views in the fragment
     * @param container the parent of the objects contained in the interface
     * @param savedInstanceStateif the fragment was previously created, its previous state 
     * will be passed in here, otherwise it's null
     * @return any views associated with this layout
	*/
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.stats_fragment, container, false);
    }
	
	/**
	* gets any additional menu items associated with this fragment
     * handles creation of pool spinner in action car
     * @param inflater the LayoutInflater object that inflates views in the fragment
     * */
	
	@Override
	public void onCreateOptionsMenu(
			Menu menu, MenuInflater inflater) {
			inflater.inflate(R.menu.stats, menu);
			DBManager db = new DBManager();
			MenuItem item = menu.findItem(R.id.stats_pools_spinner);
			final Spinner spinner = (Spinner) item.getActionView();
			SharedObjects objects = SharedObjects.getInstance();
			final Activity activityPtr = this.getActivity();
			db.getAllUserPools(objects.user.getUser(), new TaskCompletedListener() {

				@Override
				public void onNotifyTaskCompleted(Object o) {
					@SuppressWarnings("unchecked")
					List<String> list = (List<String>) o;
					ArrayAdapter<String> adapter = new ArrayAdapter<String>(activityPtr, android.R.layout.simple_spinner_item, list);
					spinner.setAdapter(adapter);
				}
				
			});
			
	}


}
