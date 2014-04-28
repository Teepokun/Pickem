package com.example.pickem;


import android.app.Fragment;
import android.app.FragmentManager;
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
	}

	
	@Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
            super.onViewCreated(view, savedInstanceState);

	}


}
