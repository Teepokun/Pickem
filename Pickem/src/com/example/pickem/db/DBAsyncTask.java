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

public class DBAsyncTask extends AsyncTask<Void, Void, String> {
	private static final String baseURL = "http://lamp.cse.fau.edu/~dlindem3/";
	//private static final String baseURL = "http://192.168.1.9/scripts/"; 
	private final List<NameValuePair> nameValuePairs;
	private final String script;
	private final TaskCompletedListener listener;
	
	public DBAsyncTask(String script, List<NameValuePair> nameValuePairs, TaskCompletedListener listener) {
		this.nameValuePairs = nameValuePairs;
		this.script = script;
		this.listener = listener;
	}
	
	@Override
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
	protected void onPostExecute(String result) {
		if(listener != null) {
			listener.onNotifyTaskCompleted(result);
		}
	}
	
}
