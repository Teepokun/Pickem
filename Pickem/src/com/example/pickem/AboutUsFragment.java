package com.example.pickem;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/**
 * Class that handles the creation and showing of the AboutUsFragment, which allows 
 * users to see information about the app and developers. This fragment attaches to the 
 * main activity to show this information. 
 * @author Sara Landset
 *
 */
public class AboutUsFragment extends Fragment{
	
	 /**
     * Handles initial creation of fragment
     * @param savedInstanceState if the fragment was previously
     * created, its previous state will be passed in here, otherwise it's null
     */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

	}
	

	/**
     * Handles initial creation of fragment's user interface view
     * @param inflater the LayoutInflater object that inflates views in the fragment
     * @param container the parent of the objects contained in the interface
     * @param savedInstanceStateif the fragment was previously created, its previous state 
     * will be passed in here, otherwise it's null
     */

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		return inflater.inflate(R.layout.about_fragment, container, false);
	}

}
