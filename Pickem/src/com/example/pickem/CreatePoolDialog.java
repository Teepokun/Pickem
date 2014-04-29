package com.example.pickem;

import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.CheckBox;


import android.widget.RelativeLayout;

import com.example.pickem.*;

public class CreatePoolDialog extends DialogFragment{
	
	public CreatePoolDialog(){
		
	}
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
				
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		
		View view = inflater.inflate(R.layout.create_pool_dialog, container, false);
		
		CheckBox privatePoolCheckBox = (CheckBox)view.findViewById(R.id.privacyCheckbox);
		final EditText passwordBox = (EditText)view.findViewById(R.id.createPool_password);
		
		privatePoolCheckBox.setOnClickListener(new OnClickListener() {
				public void onClick(final View v){
					passwordBox.setVisibility(0);
		}
	});
		
						return view;
	}
	
	

}
