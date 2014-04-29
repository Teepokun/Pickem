package com.example.pickem;

import android.app.Dialog;
import android.app.DialogFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.CheckBox;
import android.widget.Toast;

import com.example.pickem.data.SharedObjects;
import com.example.pickem.db.DBManager;
import com.example.pickem.db.TaskCompletedListener;

/**
 * Class that handles the creation and showing of the CreatePool Dialog box, 
 * contains a search item and will return to the user list of available pools to join as
 * well as allow the user to request access to them. The dialog launches from the pool fragment. 
 *
 */
public class CreatePoolDialog extends DialogFragment{
	
	/**
     * Empty constructor. This is required to be able to show the dialog from its parent fragment
     * 
     */
	public CreatePoolDialog(){
		
	}
	/**
     * Handles initial creation of dialog
     * @param savedInstanceState if the dialog was previously
     * created, its previous state will be passed in here, otherwise it's null
     */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
				
	}

	/**
     * Handles initial creation of dialog's user interface view. sets listeners
     * for buttons and checkboxes
     * @param inflater the LayoutInflater object that inflates views in the dialog
     * @param container the parent of the objects contained in the interface
     * @param savedInstanceStateif the dialog was previously created, its previous state 
     * will be passed in here, otherwise it's null
     */
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		
		View view = inflater.inflate(R.layout.create_pool_dialog, container, false);
		
		Dialog dialog = getDialog();
		dialog.setTitle("Create a Pool");
		
		

		
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
	
	/**
     * Handles actual creation of new pool
     * @param v the view
     */
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
		//CheckBox secBox = (CheckBox) v.findViewById(R.id.secCheckbox);
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
					//manager.addToPoolUsers(); //handled by trigger
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
	public static CreatePoolDialog newInstance() {
		CreatePoolDialog d = new CreatePoolDialog();
		    return d;
	}
}
