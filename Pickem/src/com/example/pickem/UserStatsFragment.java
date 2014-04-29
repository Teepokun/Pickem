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

public class UserStatsFragment extends Fragment{
	
    /**
     * Handles initial creation of fragment
     */
	 @Override
	    public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);

	        setHasOptionsMenu(true);
	    }
	
	/**
	* creates and returns the views associated with this fragment
	*/
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.stats_fragment, container, false);
    }
	
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
