package com.example.pickem.db;


import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;

import android.os.AsyncTask;

/**
 * Asynchronous tasks run in the background. This is necessary to not block the UI thread during execution
 * of such things as network requests. Otherwise if there was a slow/interrupted connection, the UI thread
 * might never get a chance to run. 
 * <p>
 * This particular AsyncTask is meant to handle all andoroid<->Database calls.
 * @author David Lindemann
 *
 */
public class DBAsyncTask extends AsyncTask<Void, Void, String> {
	/** Server address that houses php and database*/
	private static final String baseURL = "http://lamp.cse.fau.edu/~dlindem3/";
	
	/** Contains a list of key-values to pass to php scripts as POST data*/
	private final List<NameValuePair> nameValuePairs;
	
	/**Php script name to be called*/
	private final String script;
	
	/**Interface to call once AsyncTask is done executing*/
	private final TaskCompletedListener listener;
	
	/**
	 * Constructor for DBAsyncTask
	 * <p>
	 * Instantiates all required fields
	 * @param script - name of php script to call
	 * @param nameValuePairs - Contains all POST data to pass to php script
	 * @param listener - interface to call back once task is done executing
	 */
	public DBAsyncTask(String script, List<NameValuePair> nameValuePairs, TaskCompletedListener listener) {
		this.nameValuePairs = nameValuePairs;
		this.script = script;
		this.listener = listener;
	}
	
	@Override
	/**
	 * Code that runs in the background
	 * <p>
	 * Basically calls php script and waits for results
	 */
	protected String doInBackground(Void... params) {
		String result = null;
        try {
		     //http post
		     HttpClient httpclient = new DefaultHttpClient();
		     String url = baseURL + script;
		     HttpPost httppost = new HttpPost(url);
		     httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));  
		     HttpResponse response = httpclient.execute(httppost);
		     result = new BasicResponseHandler().handleResponse(response);
		     //Log.v("Pickem", result);
		} catch (Exception e) {e.printStackTrace();}
		return result;
	}
	
	@Override
	/**
	 * This code is called every time this asynchronous task is done executing. It notifies the interface
	 * with the appropriate data on completion.
	 */
	protected void onPostExecute(String result) {
		if(listener != null) {
			listener.onNotifyTaskCompleted(result);
		}
	}
	
}
