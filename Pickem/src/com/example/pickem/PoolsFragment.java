package com.example.pickem;

import android.app.ActionBar;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;

public class PoolsFragment extends Fragment {
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setHasOptionsMenu(true);
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		return inflater.inflate(R.layout.pools_fragment, container, false);

	}
	
	@Override
	public void onCreateOptionsMenu(
			Menu menu, MenuInflater inflater) {
			inflater.inflate(R.menu.pools, menu);
	}

	
	@Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
            super.onViewCreated(view, savedInstanceState);
                            
            view.findViewById(R.id.join_pool_button).setOnClickListener(new OnClickListener() {                       
                    @Override
                    public void onClick(View v) {
                    	Intent intent = new Intent(v.getContext(), MainActivity.class);
                        startActivity(intent);
                    	JoinPoolFragment fragment = new JoinPoolFragment();
                    	FragmentManager fm = getFragmentManager();
                    	FragmentTransaction ft = fm.beginTransaction();
                    	ft.addToBackStack("Join Pool");
                    	
                    	ft.replace(android.R.id.content, fragment);
                    	ft.commit();
                    }
            });
	}


}
