package com.example.pickem;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.app.DialogFragment;

/**
 * Class that handles the creation and showing of the JoinPool Dialog box, 
 * contains a search item and will return to the user list of available pools to join as
 * well as allow the user to request access to them. The dialog launches from the pool fragment. 
 * @author Sara Landset
 *
 */
public class JoinPoolDialog extends DialogFragment{
	
	/**
     * Empty constructor. This is required to be able to show the dialog from its parent fragment
     * 
     */
	public JoinPoolDialog(){
		
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
     * Handles initial creation of dialog's user interface view
     * @param inflater the LayoutInflater object that inflates views in the dialog
     * @param container the parent of the objects contained in the interface
     * @param savedInstanceStateif the dialog was previously created, its previous state 
     * will be passed in here, otherwise it's null
     */
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		
		
		return inflater.inflate(R.layout.join_pool_dialog,
                container, false);
		  
		
	}

}
