package com.example.pickem;

import java.util.List;
import java.util.Vector;

import org.json.JSONArray;
import org.json.JSONObject;

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
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.Spinner;

public class PicksFragment extends Fragment {
	private Vector<RadioButton> radioArray;
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		radioArray = new Vector<RadioButton>();
		
		
		
		setHasOptionsMenu(true);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View v = inflater.inflate(R.layout.picks_fragment, container, false);
		Button submitButton = (Button) v.findViewById(R.id.submit_picks_button);
		
		View p = v;
		RadioButton r1 = (RadioButton) p.findViewById(R.id.radioBtnAway1);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway13);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway3);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway4);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway5);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway6);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway7);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway8);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway9);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway10);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway11);
		radioArray.add(r1);
		r1 = (RadioButton) p.findViewById(R.id.radioBtnAway12);
		radioArray.add(r1);
		
		submitButton.setOnClickListener(new OnClickListener() {
			
			
			@Override
			public void onClick(View v) {
				JSONArray jsonArray = new JSONArray();
				JSONObject object = new JSONObject();
				for(RadioButton r : radioArray){
					String homeOrAway = null;
					if(r.isChecked()) {
						homeOrAway = "away";
					}
					else {
						homeOrAway = "home";
					}
					
					try {
						object.put("pick", homeOrAway );
						jsonArray.put(object);
					} catch(Exception e) {e.printStackTrace();}
					
				}
				String json = jsonArray.toString();
				DBManager db = new DBManager();
				db.savePick(json);
			}
			
		});
		
		Button cancelButton = (Button) v.findViewById(R.id.cancel_picks_button);

		return v;
	}
	
	public void onCreateOptionsMenu(
			Menu menu, MenuInflater inflater) {
			inflater.inflate(R.menu.picks, menu);
			DBManager db = new DBManager();
			MenuItem item = menu.findItem(R.id.picks_pools_spinner);
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
