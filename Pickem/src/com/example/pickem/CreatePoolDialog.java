package com.example.pickem;

import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.CheckBox;


import android.widget.RelativeLayout;
import android.widget.Toast;

import com.example.pickem.*;
import com.example.pickem.data.SharedObjects;
import com.example.pickem.db.DBManager;
import com.example.pickem.db.TaskCompletedListener;

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
		
		CheckBox accBox = (CheckBox) view.findViewById(R.id.accCheckbox);
		CheckBox secBox = (CheckBox) view.findViewById(R.id.secCheckbox);
		final CheckBox fsecBox = secBox;
		final CheckBox faccBox = accBox;
		accBox.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				faccBox.setChecked(false);
			}
		});
		
		faccBox.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				fsecBox.setChecked(false);
				
			}
			
		});
		
		CheckBox privatePoolCheckBox = (CheckBox)view.findViewById(R.id.privacyCheckbox);
		final EditText passwordBox = (EditText)view.findViewById(R.id.createPool_password);
		
		privatePoolCheckBox.setOnClickListener(new OnClickListener() {
				public void onClick(final View v){
					passwordBox.setVisibility(0);
		}
	});

		Button createPoolButton = (Button) view.findViewById(R.id.createPool_submit_btn);
		createPoolButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				createPool((View) v.getParent());
				
			}
			
		});
		
						return view;
	}
	
	private void createPool(View v) {
		EditText poolName = (EditText) v.findViewById(R.id.create_pool_name_entry);
		final String name = poolName.getText().toString();
		
		CheckBox check = (CheckBox) v.findViewById(R.id.privacyCheckbox);
		boolean usePass = check.isChecked();
		final String pass;
		if(usePass) {
			EditText passEdit = (EditText) v.findViewById(R.id.createPool_password);
			pass = passEdit.getText().toString();
		}
		else {
			pass = "";
		}
		
		CheckBox accBox = (CheckBox) v.findViewById(R.id.accCheckbox);
		CheckBox secBox = (CheckBox) v.findViewById(R.id.secCheckbox);
		final String conference;
		if(accBox.isChecked()) {
			conference = "ACC";
		}
		else {
			conference = "SEC";
		}
		final View toastParent = (View) v.getParent();
		final CreatePoolDialog thisPtr = this;
		 DBManager manager = new DBManager();
		final SharedObjects objects = SharedObjects.getInstance();
		manager.doesPoolExist(name, new TaskCompletedListener() {
		
			@Override
			public void onNotifyTaskCompleted(Object o) {
				boolean cancel = (Boolean) o;
				if(cancel) {
					Toast.makeText(toastParent.getContext(), "Pool already exists", Toast.LENGTH_LONG).show();
				}
				else {
					DBManager manager = new DBManager();
					manager.createPool(name, conference, objects.user.getUser(), pass, "blah", new TaskCompletedListener() {

						@Override
						public void onNotifyTaskCompleted(Object o) {
							thisPtr.dismiss();
						}
						
					});
				}
				
			}
			
		});
		
	}
}
