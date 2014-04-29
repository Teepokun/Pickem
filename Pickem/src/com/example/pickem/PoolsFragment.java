package com.example.pickem;


import java.util.List;

import com.example.pickem.data.SharedObjects;
import com.example.pickem.db.DBManager;
import com.example.pickem.db.TaskCompletedListener;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

public class PoolsFragment extends Fragment {
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setHasOptionsMenu(true);
		
		
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
       
		View view = inflater.inflate(R.layout.pools_fragment, container, false);

		Button joinButton = (Button)view.findViewById(R.id.join_pool_button);
		Button createButton = (Button) view.findViewById(R.id.create_pool_button);

		joinButton.setOnClickListener(new OnClickListener() {
            	public void onClick(final View v) {
            		FragmentManager fm = getFragmentManager();
                    JoinPoolDialog jp = new JoinPoolDialog();
                    jp.show(fm, "join_pool_dialog");
                
            }
        });
		
		createButton.setOnClickListener(new OnClickListener() {
        	public void onClick(final View v) {
        		FragmentManager fm = getFragmentManager();
                CreatePoolDialog cp = new CreatePoolDialog();
                cp.show(fm, "create_pool_dialog");
       }
    });
		return view;
	}
	
	@Override
	public void onCreateOptionsMenu(
			Menu menu, MenuInflater inflater) {
			inflater.inflate(R.menu.pools, menu);
			DBManager db = new DBManager();
			MenuItem item = menu.findItem(R.id.pools_spinner);
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

	
	@Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
            super.onViewCreated(view, savedInstanceState);

	}


}
